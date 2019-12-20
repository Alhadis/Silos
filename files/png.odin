/*
uPNG -- derived from LodePNG version 20100808

Copyright (c) 2005-2010 Lode Vandevenne
Copyright (c) 2010 Sean Middleditch
Copyright (c) 2017 Zachary Pierson

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

		1. The origin of this software must not be misrepresented; you must not
		claim that you wrote the original software. If you use this software
		in a product, an acknowledgment in the product documentation would be
		appreciated but is not required.

		2. Altered source versions must be plainly marked as such, and must not be
		misrepresented as being the original software.

		3. This notice may not be removed or altered from any source
		distribution.
*/

using import "core:c.odin";
import "core:mem.odin";
import "core:os.odin";
import "core:bits.odin";

Upng_Error :: enum {
	OK            = 0, // success (no error)
	NOMEM         = 1, // memory allocation failed
	NOTFOUND      = 2, // resource not found (file missing)
	NOTPNG        = 3, // image data does not have a PNG header
	MALFORMED     = 4, // image data is not a valid PNG image
	UNSUPPORTED   = 5, // critical PNG chunk type is not supported
	UNINTERLACED  = 6, // image interlacing is not supported
	UNFORMAT      = 7, // image color format is not supported
	PARAM         = 8  // invalid parameter to method call
}

Upng_Format :: enum {
	BADFORMAT,
	RGB8,
	RGB16,
	RGBA8,
	RGBA16,
	LUMINANCE1,
	LUMINANCE2,
	LUMINANCE4,
	LUMINANCE8,
	LUMINANCE_ALPHA1,
	LUMINANCE_ALPHA2,
	LUMINANCE_ALPHA4,
	LUMINANCE_ALPHA8
}

_make_dword :: proc(a,b,c,d: u8) -> u32 #inline {
	return (u32(a) << 24) | (u32(b) << 16) | (u32(c) << 8) | u32(d);
}
_make_dword_ptr :: proc(p: ^u8) -> u32 #inline {
	return _make_dword(p^, (p+1)^, (p+2)^, (p+3)^);
}

_CHUNK_IHDR := _make_dword('I','H','D','R');
_CHUNK_IDAT := _make_dword('I','D','A','T');
_CHUNK_IEND := _make_dword('I','E','N','D');

_FIRST_LENGTH_CODE_INDEX  :: 257;
_LAST_LENGTH_CODE_INDEX   :: 285;

_NUM_DEFLATE_CODE_SYMBOLS :: 288; // 256 literals, the end code, some length codes, and 2 unused codes
_NUM_DISTANCE_SYMBOLS     :: 32;  // the distance codes have their own symbols, 30 used, 2 unused
_NUM_CODE_LENGTH_CODES    :: 19;  // the code length codes. 0-15: code lengths, 16: copy previous 3-6 times, 17: 3-10 zeros, 18: 11-138 zeros
_MAX_SYMBOLS              :: 288; // largest number of symbols used by any tree type

_DEFLATE_CODE_BITLEN :: 15;
_DISTANCE_BITLEN     :: 15;
_CODE_LENGTH_BITLEN  :: 7;
_MAX_BIT_LENGTH      :: 15; // largest bitlen used by any tree type

DEFLATE_CODE_BUFFER_SIZE :: (_NUM_DEFLATE_CODE_SYMBOLS * 2);
DISTANCE_BUFFER_SIZE     :: (_NUM_DISTANCE_SYMBOLS * 2);
CODE_LENGTH_BUFFER_SIZE  :: (_NUM_DISTANCE_SYMBOLS * 2);

_SET_ERROR :: proc(upng: ^Upng, code: Upng_Error, location := #caller_location) #inline {
	upng.error = code;
	upng.error_line = cast(type_of(upng.error_line))location.line;
}

_upng_chunk_length   :: proc(chunk: ^u8) -> u32 #inline { return _make_dword_ptr(chunk); }
_upng_chunk_type     :: proc(chunk: ^u8) -> u32 #inline { return _make_dword_ptr(chunk + 4); }
_upng_chunk_critical :: proc(chunk: ^u8) -> bool #inline { return ((chunk+4)^ & 32) == 0; }

_Upng_State :: enum {
	ERROR   = -1,
	DECODED =  0,
	HEADER  =  1,
	NEW     =  2
}

Upng_Color :: enum {
	LUM  = 0,
	RGB  = 2,
	LUMA = 4,
	RGBA = 6
}

_Upng_Source :: struct {
	buffer : ^u8,
	size   : c_ulong,
	owning : i8,
}

Upng :: struct {
	width:        u32,
	height:       u32,

	color_type:   Upng_Color,
	color_depth:  u32,
	format:       Upng_Format,

	buffer:       ^u8,
	size:         c_ulong,

	error:        Upng_Error,
	error_line:   u32,

	state:        _Upng_State,
	source:       _Upng_Source,
};

Huffman_Tree :: struct {
	tree2d:    ^u32,
	maxbitlen: u32,  // maximum number of bits a single code can get
	numcodes:  u32,  // number of symbols in the alphabet = number of codes
};

LENGTH_BASE := [29]u32 {      /* the base lengths represented by codes 257-285 */
	3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31, 35, 43, 51, 59,
	67, 83, 99, 115, 131, 163, 195, 227, 258
};

LENGTH_EXTRA := [29]u32 {     /* the extra bits used by codes 257-285 (added to base length) */
	0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5,
	5, 5, 5, 0
};

DISTANCE_BASE := [30]u32 {    /* the base backwards distances (the bits of distance codes appear
                                 after length codes and use their own huffman tree) */
	1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193, 257, 385, 513,
	769, 1025, 1537, 2049, 3073, 4097, 6145, 8193, 12289, 16385, 24577
};

DISTANCE_EXTRA := [30]u32 {   /* the extra bits of backwards distances (added to base) */
	0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10,
	11, 11, 12, 12, 13, 13
};

CLCL := [_NUM_CODE_LENGTH_CODES]u32 { /* the order in which "code length alphabet code lengths"
                                           are stored, out of this the huffman tree of the dynamic
                                           huffman tree lengths is generated */
	16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15
};

FIXED_DEFLATE_CODE_TREE := [_NUM_DEFLATE_CODE_SYMBOLS * 2]u32 {
	289, 370, 290, 307, 546, 291, 561, 292, 293, 300, 294, 297, 295, 296, 0, 1,
	2, 3, 298, 299, 4, 5, 6, 7, 301, 304, 302, 303, 8, 9, 10, 11, 305, 306, 12,
	13, 14, 15, 308, 339, 309, 324, 310, 317, 311, 314, 312, 313, 16, 17, 18,
	19, 315, 316, 20, 21, 22, 23, 318, 321, 319, 320, 24, 25, 26, 27, 322, 323,
	28, 29, 30, 31, 325, 332, 326, 329, 327, 328, 32, 33, 34, 35, 330, 331, 36,
	37, 38, 39, 333, 336, 334, 335, 40, 41, 42, 43, 337, 338, 44, 45, 46, 47,
	340, 355, 341, 348, 342, 345, 343, 344, 48, 49, 50, 51, 346, 347, 52, 53,
	54, 55, 349, 352, 350, 351, 56, 57, 58, 59, 353, 354, 60, 61, 62, 63, 356,
	363, 357, 360, 358, 359, 64, 65, 66, 67, 361, 362, 68, 69, 70, 71, 364,
	367, 365, 366, 72, 73, 74, 75, 368, 369, 76, 77, 78, 79, 371, 434, 372,
	403, 373, 388, 374, 381, 375, 378, 376, 377, 80, 81, 82, 83, 379, 380, 84,
	85, 86, 87, 382, 385, 383, 384, 88, 89, 90, 91, 386, 387, 92, 93, 94, 95,
	389, 396, 390, 393, 391, 392, 96, 97, 98, 99, 394, 395, 100, 101, 102, 103,
	397, 400, 398, 399, 104, 105, 106, 107, 401, 402, 108, 109, 110, 111, 404,
	419, 405, 412, 406, 409, 407, 408, 112, 113, 114, 115, 410, 411, 116, 117,
	118, 119, 413, 416, 414, 415, 120, 121, 122, 123, 417, 418, 124, 125, 126,
	127, 420, 427, 421, 424, 422, 423, 128, 129, 130, 131, 425, 426, 132, 133,
	134, 135, 428, 431, 429, 430, 136, 137, 138, 139, 432, 433, 140, 141, 142,
	143, 435, 483, 436, 452, 568, 437, 438, 445, 439, 442, 440, 441, 144, 145,
	146, 147, 443, 444, 148, 149, 150, 151, 446, 449, 447, 448, 152, 153, 154,
	155, 450, 451, 156, 157, 158, 159, 453, 468, 454, 461, 455, 458, 456, 457,
	160, 161, 162, 163, 459, 460, 164, 165, 166, 167, 462, 465, 463, 464, 168,
	169, 170, 171, 466, 467, 172, 173, 174, 175, 469, 476, 470, 473, 471, 472,
	176, 177, 178, 179, 474, 475, 180, 181, 182, 183, 477, 480, 478, 479, 184,
	185, 186, 187, 481, 482, 188, 189, 190, 191, 484, 515, 485, 500, 486, 493,
	487, 490, 488, 489, 192, 193, 194, 195, 491, 492, 196, 197, 198, 199, 494,
	497, 495, 496, 200, 201, 202, 203, 498, 499, 204, 205, 206, 207, 501, 508,
	502, 505, 503, 504, 208, 209, 210, 211, 506, 507, 212, 213, 214, 215, 509,
	512, 510, 511, 216, 217, 218, 219, 513, 514, 220, 221, 222, 223, 516, 531,
	517, 524, 518, 521, 519, 520, 224, 225, 226, 227, 522, 523, 228, 229, 230,
	231, 525, 528, 526, 527, 232, 233, 234, 235, 529, 530, 236, 237, 238, 239,
	532, 539, 533, 536, 534, 535, 240, 241, 242, 243, 537, 538, 244, 245, 246,
	247, 540, 543, 541, 542, 248, 249, 250, 251, 544, 545, 252, 253, 254, 255,
	547, 554, 548, 551, 549, 550, 256, 257, 258, 259, 552, 553, 260, 261, 262,
	263, 555, 558, 556, 557, 264, 265, 266, 267, 559, 560, 268, 269, 270, 271,
	562, 565, 563, 564, 272, 273, 274, 275, 566, 567, 276, 277, 278, 279, 569,
	572, 570, 571, 280, 281, 282, 283, 573, 574, 284, 285, 286, 287, 0, 0
};

FIXED_DISTANCE_TREE := [_NUM_DISTANCE_SYMBOLS * 2]u32 {
	33, 48, 34, 41, 35, 38, 36, 37, 0, 1, 2, 3, 39, 40, 4, 5, 6, 7, 42, 45, 43,
	44, 8, 9, 10, 11, 46, 47, 12, 13, 14, 15, 49, 56, 50, 53, 51, 52, 16, 17,
	18, 19, 54, 55, 20, 21, 22, 23, 57, 60, 58, 59, 24, 25, 26, 27, 61, 62, 28,
	29, 30, 31, 0, 0
};

_read_bit :: proc(bitpointer: ^c_ulong, bitstream: ^u8) -> u8 {
	result := cast(u8)(((bitstream+((bitpointer^) >> 3))^ >> ((bitpointer^) & 0x7)) & 1);
	(bitpointer^)+=1;
	return result;
}

_read_bits :: proc(bitpointer: ^c_ulong, bitstream: ^u8, nbits: c_ulong) -> u32 {
	result: u32 = 0;
	for i: c_ulong = 0; i < nbits; i+=1 {
		result |= (cast(u32)_read_bit(bitpointer, bitstream)) << i;
	}
	return result;
}

// the buffer must be numcodes*2 in size!
_huffman_tree_init :: proc(tree: ^Huffman_Tree, buffer: ^u32, numcodes: u32, maxbitlen: u32) {
	tree.tree2d = buffer;

	tree.numcodes = numcodes;
	tree.maxbitlen = maxbitlen;
}


// given the code lengths (as stored in the PNG file), generate the tree as defined by Deflate. maxbitlen is the maximum bits that a code in the tree can have. return value is error.
huffman_tree_create_lengths :: proc(upng: ^Upng, tree: ^Huffman_Tree, bitlen: ^u32) {
	tree1d:   [_MAX_SYMBOLS]      u32;
	blcount:  [_MAX_BIT_LENGTH]   u32;
	nextcode: [_MAX_BIT_LENGTH+1] u32;
	bits, n, i: u32;
	nodefilled: u32 = 0;   /* up to which node it is filled */
	treepos: u32 = 0;      /* position in the tree (1 of the numcodes columns) */

	// initialize local vectors
	// memset(blcount, 0, sizeof(blcount));
	// memset(nextcode, 0, sizeof(nextcode));

	/*step 1: count number of instances of each code length */
	for bits = 0; bits < tree.numcodes; bits+=1 {
		blcount[(bitlen+bits)^]+=1;
	}

	/*step 2: generate the nextcode values */
	for bits = 1; bits <= tree.maxbitlen; bits+=1 {
		nextcode[bits] = (nextcode[bits - 1] + blcount[bits - 1]) << 1;
	}

	/*step 3: generate all the codes */
	for n = 0; n < tree.numcodes; n+=1 {
		if ((bitlen+n)^ != 0) {
			tree1d[n] = nextcode[(bitlen+n)^];
			nextcode[(bitlen+n)^]+=1;
		}
	}

	/* convert tree1d[] to tree2d[][]. In the 2D array, a value of 32767 means uninited, a value >= numcodes is an address to another bit, a value < numcodes is a code. The 2 rows are the 2 possible bit values (0 or 1), there are as many columns as codes - 1
	   a good huffmann tree has N * 2 - 1 nodes, of which N - 1 are internal nodes. Here, the internal nodes are stored (what their 0 and 1 option point to). There is only memory for such good tree currently, if there are more nodes (due to too long length codes), error 55 will happen */
	for n = 0; n < tree.numcodes * 2; n+=1 {
		(tree.tree2d + (n))^ = 32767;	// 32767 here means the tree2d isn't filled there yet
	}

	for n = 0; n < tree.numcodes; n+=1 {	// the codes
		for i = 0; i < (bitlen+n)^; i+=1 {	// the bits for this code
			bit: u32 = cast(u32)((tree1d[n] >> ((bitlen+n)^ - i - 1)) & 1);
			// check if oversubscribed
			if (treepos > tree.numcodes - 2) {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				return;
			}

			if ((tree.tree2d + (2 * treepos + bit))^ == 32767) { // not yet filled in
				if (i + 1 == (bitlen+n)^) { // last bit
					(tree.tree2d + (2 * treepos + bit))^ = n; // put the current code in it
					treepos = 0;
				} else { // put address of the next step in here, first that address has to be found of course (it's just nodefilled + 1)...
					nodefilled+=1;
					(tree.tree2d + (2 * treepos + bit))^ = nodefilled + tree.numcodes; // addresses encoded with numcodes added to it
					treepos = nodefilled;
				}
			} else {
				treepos = (tree.tree2d + (2 * treepos + bit))^ - tree.numcodes;
			}
		}
	}

	for n = 0; n < tree.numcodes * 2; n+=1	 {
		if ((tree.tree2d + (n))^ == 32767) {
			(tree.tree2d + (n))^ = 0;	// remove possible remaining 32767's
		}
	}
}

huffman_decode_symbol :: proc(upng: ^Upng, input: ^u8, bp: ^c_ulong, codetree: ^Huffman_Tree, inlength: c_ulong) -> u32 {
	
	treepos: u32 = 0;
	ct: u32;
	bit: u8;

	for true {
		// error: end of input memory reached without endcode
		if (((bp^) & 0x07) == 0 && ((bp^) >> 3) > inlength) {
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			return 0;
		}

		bit = _read_bit(bp, input);

		ct = (codetree.tree2d + ((treepos << 1) | u32(bit)))^;
		if (ct < codetree.numcodes) {
			return ct;
		}

		treepos = ct - codetree.numcodes;
		if (treepos >= codetree.numcodes) {
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			return 0;
		}
	}
	return 0;
}

/* get the tree of a deflated block with dynamic tree, the tree itself is also Huffman compressed with a known tree*/
get_tree_inflate_dynamic :: proc(upng: ^Upng, codetree: ^Huffman_Tree, codetreeD: ^Huffman_Tree, codelengthcodetree: ^Huffman_Tree, input: ^u8, bp: ^c_ulong, inlength: c_ulong) {

	codelengthcode: [_NUM_CODE_LENGTH_CODES]u32;
	bitlen:         [_NUM_DEFLATE_CODE_SYMBOLS]u32;
	bitlenD:        [_NUM_DISTANCE_SYMBOLS]u32;
	
	n, hlit, hdist, hclen, i: u32;

	/*make sure that length values that aren't filled in will be 0, or a wrong tree will be generated */
	/*C-code note: use no "return" between ctor and dtor of an uivector! */
	if ((bp^) >> 3 >= inlength - 2) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return;
	}

	// clear bitlen arrays
	// memset(bitlen, 0, sizeof(bitlen));
	// memset(bitlenD, 0, sizeof(bitlenD));

	// the bit pointer is or will go past the memory
	hlit  = _read_bits(bp, input, 5) + 257; // number of literal/length codes + 257. Unlike the spec, the value 257 is added to it here already
	hdist = _read_bits(bp, input, 5) + 1;   // number of distance codes. Unlike the spec, the value 1 is added to it here already
	hclen = _read_bits(bp, input, 4) + 4;   // number of code length codes. Unlike the spec, the value 4 is added to it here already

	for i = 0; i < _NUM_CODE_LENGTH_CODES; i+=1 {
		if (i < hclen) {
			codelengthcode[CLCL[i]] = _read_bits(bp, input, 3);
		} else {
			codelengthcode[CLCL[i]] = 0;    // if not, it must stay 0
		}
	}

	huffman_tree_create_lengths(upng, codelengthcodetree, &codelengthcode[0]);

	// bail now if we encountered an error earlier
	if upng.error != Upng_Error.OK {
		return;
	}

	// now we can use this tree to read the lengths for the tree that this function will return
	i = 0;
	for i < hlit + hdist { // i is the current symbol we're reading in the part that contains the code lengths of lit/len codes and dist codes
		code := huffman_decode_symbol(upng, input, bp, codelengthcodetree, inlength);
		if (upng.error != Upng_Error.OK) {
			break;
		}

		if (code <= 15) {	// a length code
			if (i < hlit) {
				bitlen[i] = code;
			} else {
				bitlenD[i - hlit] = code;
			}
			i+=1;
		} else if (code == 16) {  // repeat previous
			replength: u32 = 3;  // read in the 2 bits that indicate repeat length (3-6)
			value: u32;         // set value to the previous code

			if ((bp^) >> 3 >= inlength) {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				break;
			}
			/*error, bit pointer jumps past memory */
			replength += _read_bits(bp, input, 2);

			if (i - 1) < hlit {
				value = bitlen[i - 1];
			} else {
				value = bitlenD[i - hlit - 1];
			}

			/*repeat this value in the next lengths */
			for n = 0; n < replength; n+=1 {
				/* i is larger than the amount of codes */
				if (i >= hlit + hdist) {
					_SET_ERROR(upng, Upng_Error.MALFORMED);
					break;
				}

				if (i < hlit) {
					bitlen[i] = value;
				} else {
					bitlenD[i - hlit] = value;
				}
				i+=1;
			}
		} else if (code == 17) { // repeat "0" 3-10 times
			replength: u32 = 3; // read in the bits that indicate repeat length
			if (bp^) >> 3 >= inlength {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				break;
			}

			// error, bit pointer jumps past memory
			replength += _read_bits(bp, input, 3);

			// repeat this value in the next lengths
			for n = 0; n < replength; n+=1 {
				// error: i is larger than the amount of codes
				if i >= hlit + hdist {
					_SET_ERROR(upng, Upng_Error.MALFORMED);
					break;
				}

				if i < hlit {
					bitlen[i] = 0;
				} else {
					bitlenD[i - hlit] = 0;
				}
				i+=1;
			}
		} else if (code == 18) { // repeat "0" 11-138 times
			replength: u32 = 11; // read in the bits that indicate repeat length
			// error, bit pointer jumps past memory
			if (bp^) >> 3 >= inlength {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				break;
			}

			replength += _read_bits(bp, input, 7);

			// repeat this value in the next lengths
			for n = 0; n < replength; n+=1 {
				// i is larger than the amount of codes
				if (i >= hlit + hdist) {
					_SET_ERROR(upng, Upng_Error.MALFORMED);
					break;
				}
				if (i < hlit) {
					bitlen[i] = 0;
				} else {
					bitlenD[i - hlit] = 0;
				}
				i+=1;
			}
		} else {
			/* somehow an unexisting code appeared. This can never happen. */
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			break;
		}
	}

	if (upng.error == Upng_Error.OK && bitlen[256] == 0) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
	}

	// the length of the end code 256 must be larger than 0
	// now we've finally got hlit and hdist, so generate the code trees, and the function is done
	if (upng.error == Upng_Error.OK) {
		huffman_tree_create_lengths(upng, codetree, &bitlen[0]);
	}
	if (upng.error == Upng_Error.OK) {
		huffman_tree_create_lengths(upng, codetreeD, &bitlenD[0]);
	}
}


// inflate a block with dynamic of fixed Huffman tree
inflate_huffman :: proc(upng: ^Upng, out: ^u8, outsize: c_ulong, input: ^u8, bp, pos: ^c_ulong, inlength: c_ulong, btype: u32) {
	codetree_buffer:  [DEFLATE_CODE_BUFFER_SIZE]u32;
	codetreeD_buffer: [DISTANCE_BUFFER_SIZE]u32;
	done: u32 = 0;

	codetree: Huffman_Tree;
	codetreeD: Huffman_Tree;

	if btype == 1 {
		/* fixed trees */
		_huffman_tree_init(&codetree,  &FIXED_DEFLATE_CODE_TREE[0], _NUM_DEFLATE_CODE_SYMBOLS, _DEFLATE_CODE_BITLEN);
		_huffman_tree_init(&codetreeD, &FIXED_DISTANCE_TREE[0], _NUM_DISTANCE_SYMBOLS, _DISTANCE_BITLEN);
	} else if (btype == 2) {
		/* dynamic trees */
		codelengthcodetree_buffer: [CODE_LENGTH_BUFFER_SIZE]u32;
		codelengthcodetree: Huffman_Tree;

		_huffman_tree_init(&codetree, &codetree_buffer[0], _NUM_DEFLATE_CODE_SYMBOLS, _DEFLATE_CODE_BITLEN);
		_huffman_tree_init(&codetreeD, &codetreeD_buffer[0], _NUM_DISTANCE_SYMBOLS, _DISTANCE_BITLEN);
		_huffman_tree_init(&codelengthcodetree, &codelengthcodetree_buffer[0], _NUM_CODE_LENGTH_CODES, _CODE_LENGTH_BITLEN);
		get_tree_inflate_dynamic(upng, &codetree, &codetreeD, &codelengthcodetree, input, bp, inlength);
	}

	for done == 0 {
		code: u32 = huffman_decode_symbol(upng, input, bp, &codetree, inlength);
		if upng.error != Upng_Error.OK {
			return;
		}

		if code == 256 {
			// end code
			done = 1;
		} else if code <= 255 {
			// literal symbol
			if (pos^) >= outsize {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				return;
			}

			// store output
			(out + pos^)^ = u8(code);
			pos^ += 1;
		} else if (code >= _FIRST_LENGTH_CODE_INDEX && code <= _LAST_LENGTH_CODE_INDEX) { // length code
			// part 1: get length base
			length := LENGTH_BASE[code - _FIRST_LENGTH_CODE_INDEX];
			codeD, distance, numextrabitsD: u32;
			start, forward, backward, numextrabits: c_ulong;

			// part 2: get extra bits and add the value of that to length
			numextrabits = c_ulong(LENGTH_EXTRA[code - _FIRST_LENGTH_CODE_INDEX]);

			// error, bit pointer will jump past memory
			if ((bp^) >> 3) >= inlength {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				return;
			}

			length += _read_bits(bp, input, numextrabits);

			// part 3: get distance code
			codeD = huffman_decode_symbol(upng, input, bp, &codetreeD, inlength);
			if upng.error != Upng_Error.OK {
				return;
			}

			// invalid distance code (30-31 are never used)
			if (codeD > 29) {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				return;
			}

			distance = DISTANCE_BASE[codeD];

			// part 4: get extra bits from distance
			numextrabitsD = DISTANCE_EXTRA[codeD];

			// error, bit pointer will jump past memory
			if ((bp^) >> 3) >= inlength {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				return;
			}

			distance += _read_bits(bp, input, c_ulong(numextrabitsD));

			// part 5: fill in all the out[n] values based on the length and dist
			start = c_ulong(pos^);
			backward = start - c_ulong(distance);

			if (pos^) + c_ulong(length) >= outsize {
				_SET_ERROR(upng, Upng_Error.MALFORMED);
				return;
			}

			for forward = 0; forward < c_ulong(length); forward+=1 {
				(out + pos^)^ = (out + backward)^;
				pos^ += 1;
				backward += 1;

				if (backward >= c_ulong(start)) {
					backward = c_ulong(start) - c_ulong(distance);
				}
			}
		}
	}
}

inflate_uncompressed :: proc(upng: ^Upng, out: ^u8, outsize: c_ulong, input: ^u8, bp, pos: ^c_ulong, inlength: c_ulong) {
	p: c_ulong;
	len, nlen, n: u32;

	// go to first boundary of byte
	for ((bp^) & 0x7) != 0 {
		(bp^)+=1;
	}
	p = (bp^) / 8; // byte position

	// read len (2 bytes) and nlen (2 bytes)
	if p >= inlength - 4 {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return;
	}

	len = u32((input + p)^) + 256 * u32((input + p + 1)^);
	p += 2;
	nlen = u32((input + p)^) + 256 * u32((input + p + 1)^);
	p += 2;

	// check if 16-bit nlen is really the one's complement of len
	if len + nlen != 65535 {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return;
	}

	if (pos^) + c_ulong(len) >= outsize {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return;
	}

	// read the literal data: len bytes are now stored in the out buffer
	if p + c_ulong(len) > inlength {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return;
	}

	for n = 0; n < len; n+=1 {
		(out + pos^)^ = (input + p)^;
		pos^ += 1;
		p += 1;
	}

	(bp^) = p * 8;
}

// inflate the deflated data (cfr. deflate spec); return value is the error
uz_inflate_data :: proc(upng: ^Upng, out: ^u8, outsize: c_ulong, input: ^u8, insize, inpos: c_ulong) -> Upng_Error {
	bp:  c_ulong = 0; // bit pointer in the "input" data, current byte is bp >> 3, current bit is bp & 0x7 (from lsb to msb of the byte)
	pos: c_ulong = 0; // byte position in the out buffer

	done: u32 = 0;

	for done == 0 {
		btype: u32;

		// ensure next bit doesn't point past the end of the buffer
		if (bp >> 3) >= insize {
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			return upng.error;
		}

		// read block control bits
		done = cast(type_of(done))_read_bit(&bp, input+inpos);
		btype = cast(type_of(btype))(_read_bit(&bp, input+inpos) | (_read_bit(&bp, input+inpos) << 1));

		// process control type appropriately
		if btype == 3 {
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			return upng.error;
		} else if btype == 0 {
			inflate_uncompressed(upng, out, outsize, input+inpos, &bp, &pos, insize); // no compression
		} else {
			inflate_huffman(upng, out, outsize, input+inpos, &bp, &pos, insize, btype); // compression, btype 01 or 10
		}

		// stop if an error has occured
		if upng.error != Upng_Error.OK {
			return upng.error;
		}
	}

	return upng.error;
}

uz_inflate :: proc(upng: ^Upng, out: ^u8, outsize: c_ulong, input: ^u8, insize: c_ulong) -> Upng_Error {
	// we require two bytes for the zlib data header
	if insize < 2 {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return upng.error;
	}

	// 256 * input[0] + input[1] must be a multiple of 31, the FCHECK value is supposed to be made that way
	if ((c_ulong(input^) * 256 + c_ulong((input+1)^)) % 31 != 0) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return upng.error;
	}

	//error: only compression method 8: inflate with sliding window of 32k is supported by the PNG spec
	if ((input^ & 15) != 8 || ((input^ >> 4) & 15) > 7) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return upng.error;
	}

	// the specification of PNG says about the zlib stream: "The additional flags shall not specify a preset dictionary."
	if ((((input+1)^ >> 5) & 1) != 0) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return upng.error;
	}

	// create output buffer
	uz_inflate_data(upng, out, outsize, input, insize, 2);

	return upng.error;
}

// Paeth predicter, used by PNG filter type 4
paeth_predictor :: proc(a, b, c: i32) -> i32 {
	p: i32 = a + b - c;
	pa: i32 = p > a ? p - a : a - p;
	pb: i32 = p > b ? p - b : b - p;
	pc: i32 = p > c ? p - c : c - p;

	if (pa <= pb && pa <= pc) {
		return a;
	} else if (pb <= pc) {
		return b;
	} else {
		return c;
	}
}

unfilter_scanline :: proc(upng: ^Upng, recon, scanline, precon: ^u8, bytewidth: c_ulong, filterType: u8, length: c_ulong) {
	/*
		For PNG filter method 0
		unfilter a PNG image scanline by scanline. when the pixels are smaller than 1 byte, the filter works byte per byte (bytewidth = 1)
		precon is the previous unfiltered scanline, recon the result, scanline the current one
		the incoming scanlines do NOT include the filtertype byte, that one is given in the parameter filterType instead
		recon and scanline MAY be the same memory address! precon must be disjoint.
	*/
	i: c_ulong;
	switch (filterType) {
	case 0:
		for i = 0; i < length; i+=1 {
			(recon + (i))^ = (scanline + (i))^;
		}
	case 1:
		for i = 0; i < bytewidth; i+=1 {
			(recon + (i))^ = (scanline + (i))^;
		}
		for i = bytewidth; i < length; i+=1 {
			(recon + (i))^ = (scanline + (i))^ + (recon + (i - bytewidth))^;
		}
	case 2:
		if precon != nil {
			for i = 0; i < length; i+=1 {
				(recon + (i))^ = (scanline + (i))^ + (precon + (i))^;
			}
		} else {
			for i = 0; i < length; i+=1 {
				(recon + (i))^ = (scanline + (i))^;
			}
		}
	case 3:
		if precon != nil {
			for i = 0; i < bytewidth; i+=1 {
				(recon + (i))^ = (scanline + (i))^ + (precon + (i))^ / 2;
			}
			for i = bytewidth; i < length; i+=1 {
				(recon + (i))^ = (scanline + (i))^ + (((recon + (i - bytewidth))^ + (precon + (i))^) / 2);
			}
		} else {
			for i = 0; i < bytewidth; i+=1 {
				(recon + (i))^ = (scanline + (i))^;
			}
			for i = bytewidth; i < length; i+=1 {
				(recon + (i))^ = (scanline + (i))^ + (recon + (i - bytewidth))^ / 2;
			}
		}
	case 4:
		if precon != nil {
			for i = 0; i < bytewidth; i+=1 {
				(recon + (i))^ = cast(u8)(i32((scanline + (i))^) + paeth_predictor(0, i32((precon + (i))^), 0));
			}
			for i = bytewidth; i < length; i+=1 {
				(recon + (i))^ = cast(u8)(i32((scanline + (i))^) + paeth_predictor(i32((recon + (i - bytewidth))^), i32((precon + (i))^), i32((precon + (i - bytewidth))^)));
			}
		} else {
			for i = 0; i < bytewidth; i+=1 {
				(recon + (i))^ = (scanline + (i))^;
			}
			for i = bytewidth; i < length; i+=1 {
				(recon + (i))^ = cast(u8)(i32((scanline + (i))^) + paeth_predictor(i32((recon + (i - bytewidth))^), 0, 0));
			}
		}
		break;
	case:
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		break;
	}
}

unfilter :: proc(upng: ^Upng, out, input: ^u8, w, h, bpp: u32) {
	/*
		For PNG filter method 0
		this function unfilters a single image (e.g. without interlacing this is called once, with Adam7 it's called 7 times)
		out must have enough bytes allocated already, input must have the scanlines + 1 filtertype byte per scanline
		w and h are image dimensions or dimensions of reduced image, bpp is bpp per pixel
		input and out are allowed to be the same memory address!
	*/

	y: u32;
	prevline: ^u8 = nil;

	bytewidth: c_ulong = c_ulong((bpp + 7) / 8); // bytewidth is used for filtering, is 1 when bpp < 8, number of bytes per pixel otherwise
	linebytes: c_ulong = c_ulong((w * bpp + 7) / 8);

	for y = 0; y < h; y+=1 {
		outindex: c_ulong = linebytes * c_ulong(y);
		inindex: c_ulong = (1 + linebytes) * c_ulong(y); // the extra filterbyte added to each row
		filterType: u8 = (input + inindex)^;

		unfilter_scanline(upng, out + outindex, input + inindex + 1, prevline, bytewidth, filterType, linebytes);
		if (upng.error != Upng_Error.OK) {
			return;
		}

		prevline = out + outindex;
	}
}

remove_padding_bits :: proc(out, input: ^u8, olinebits, ilinebits: c_ulong, h: u32) {
	/*
		After filtering there are still padding bpp if scanlines have non multiple of 8 bit amounts. They need to be removed (except at last scanline of (Adam7-reduced) image) before working with pure image buffers for the Adam7 code, the color convert code and the output to the user.
		input and out are allowed to be the same buffer, input may also be higher but still overlapping; input must have >= ilinebits*h bpp, out must have >= olinebits*h bpp, olinebits must be <= ilinebits
		also used to move bpp after earlier such operations happened, e.g. in a sequence of reduced images from Adam7
		only useful if (ilinebits - olinebits) is a value in the range 1..7
	*/
	y: u32;
	diff: c_ulong = ilinebits - olinebits;
	obp, ibp: c_ulong; // bit pointers
	for y = 0; y < h; y+=1 {
		x: c_ulong;
		for x = 0; x < olinebits; x+=1 {
			bit := cast(u8)(((input + ((ibp) >> 3))^ >> (7 - ((ibp) & 0x7))) & 1);
			ibp+=1;

			if bit == 0 {
				(out + ((obp) >> 3))^ &= cast(u8)(~(1 << (7 - ((obp) & 0x7))));
			} else {
				(out + ((obp) >> 3))^ |= (1 << (7 - ((obp) & 0x7)));
			}
			obp+=1;
		}
		ibp += diff;
	}
}

// out must be buffer big enough to contain full image, and in must contain the full decompressed data from the IDAT chunks
post_process_scanlines :: proc(upng: ^Upng, out, input: ^u8, info_png: ^Upng) {
	bpp: u32 = upng_get_bpp(info_png);
	w: u32 = info_png.width;
	h: u32 = info_png.height;

	if bpp == 0 {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return;
	}

	if (bpp < 8 && w * bpp != ((w * bpp + 7) / 8) * 8) {
		unfilter(upng, input, input, w, h, bpp);
		if upng.error != Upng_Error.OK {
			return;
		}
		remove_padding_bits(out, input, c_ulong(w * bpp), c_ulong((w * bpp + 7) / 8) * 8, h);
	} else {
		unfilter(upng, out, input, w, h, bpp); // we can immediatly filter into the out buffer, no other steps needed
	}
}

determine_format :: proc(upng: ^Upng) -> Upng_Format {
	switch upng.color_type {
		case Upng_Color.LUM:
			switch (upng.color_depth) {
				case 1:
					return Upng_Format.LUMINANCE1;
				case 2:
					return Upng_Format.LUMINANCE2;
				case 4:
					return Upng_Format.LUMINANCE4;
				case 8:
					return Upng_Format.LUMINANCE8;
				case:
					return Upng_Format.BADFORMAT;
			}
		case Upng_Color.RGB:
			switch upng.color_depth {
				case 8:
					return Upng_Format.RGB8;
				case 16:
					return Upng_Format.RGB16;
				case:
					return Upng_Format.BADFORMAT;
			}
		case Upng_Color.LUMA:
			switch upng.color_depth {
				case 1:
					return Upng_Format.LUMINANCE_ALPHA1;
				case 2:
					return Upng_Format.LUMINANCE_ALPHA2;
				case 4:
					return Upng_Format.LUMINANCE_ALPHA4;
				case 8:
					return Upng_Format.LUMINANCE_ALPHA8;
				case:
					return Upng_Format.BADFORMAT;
			}
		case Upng_Color.RGBA:
			switch upng.color_depth {
				case 8:
					return Upng_Format.RGBA8;
				case 16:
					return Upng_Format.RGBA16;
				case:
					return Upng_Format.BADFORMAT;
			}
		case:
			return Upng_Format.BADFORMAT;
	}
}

upng_free_source :: proc(upng: ^Upng) {
	if upng.source.owning != 0 {
		free(upng.source.buffer);
	}

	upng.source.buffer = nil;
	upng.source.size = 0;
	upng.source.owning = 0;
}

// read the information from the header and store it in the upng_Info. return value is error
upng_header :: proc(upng: ^Upng) -> Upng_Error {
	// if we have an error state, bail now
	if upng.error != Upng_Error.OK {
		return upng.error;
	}

	// if the state is not NEW (meaning we are ready to parse the header), stop now
	if upng.state != _Upng_State.NEW {
		return upng.error;
	}

	/* minimum length of a valid PNG file is 29 bytes
	   FIXME: verify this against the specification, or
	   better against the actual code below */
	if upng.source.size < 29 {
		_SET_ERROR(upng, Upng_Error.NOTPNG);
		return upng.error;
	}

	// check that PNG header matches expected value
	if ((upng.source.buffer + 0)^ != 137 || (upng.source.buffer + 1)^ != 80 || (upng.source.buffer + 2)^ != 78 || (upng.source.buffer + 3)^ != 71 || (upng.source.buffer + 4)^ != 13 || (upng.source.buffer + 5)^ != 10 || (upng.source.buffer + 6)^ != 26 || (upng.source.buffer + 7)^ != 10) {
		_SET_ERROR(upng, Upng_Error.NOTPNG);
		return upng.error;
	}

	// check that the first chunk is the IHDR chunk
	if (_make_dword_ptr(upng.source.buffer + 12) != _CHUNK_IHDR) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return upng.error;
	}

	// read the values given in the header
	upng.width = _make_dword_ptr(upng.source.buffer + 16);
	upng.height = _make_dword_ptr(upng.source.buffer + 20);
	upng.color_depth = cast(u32)(upng.source.buffer + 24)^;
	upng.color_type = Upng_Color((upng.source.buffer + 25)^);

	// determine our color format
	upng.format = determine_format(upng);
	if (upng.format == Upng_Format.BADFORMAT) {
		_SET_ERROR(upng, Upng_Error.UNFORMAT);
		return upng.error;
	}

	// check that the compression method (byte 27) is 0 (only allowed value in spec)
	if ((upng.source.buffer + 26)^ != 0) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return upng.error;
	}

	// check that the compression method (byte 27) is 0 (only allowed value in spec)
	if ((upng.source.buffer + 27)^ != 0) {
		_SET_ERROR(upng, Upng_Error.MALFORMED);
		return upng.error;
	}

	// check that the compression method (byte 27) is 0 (spec allows 1, but uPNG does not support it)
	if ((upng.source.buffer + 28)^ != 0) {
		_SET_ERROR(upng, Upng_Error.UNINTERLACED);
		return upng.error;
	}

	upng.state = _Upng_State.HEADER;
	return upng.error;
}

// read a PNG, the result will be in the same color type as the PNG (hence "generic")
upng_decode :: proc(upng: ^Upng) -> Upng_Error {
	chunk: ^u8;
	compressed: ^u8;
	inflated: ^u8;
	compressed_size, compressed_index: c_ulong;
	inflated_size: c_ulong;
	error: Upng_Error;

	// if we have an error state, bail now
	if upng.error != Upng_Error.OK {
		return upng.error;
	}

	// parse the main header, if necessary
	upng_header(upng);
	if upng.error != Upng_Error.OK {
		return upng.error;
	}

	// if the state is not HEADER (meaning we are ready to decode the image), stop now
	if upng.state != _Upng_State.HEADER {
		return upng.error;
	}

	// release old result, if any
	if upng.buffer != nil {
		free(upng.buffer);
		upng.buffer = nil;
		upng.size = 0;
	}

	// first byte of the first chunk after the header
	chunk = upng.source.buffer + 33;

	/* scan through the chunks, finding the size of all IDAT chunks, and also
	 * verify general well-formed-ness */
	for chunk < upng.source.buffer + upng.source.size {
		length: c_ulong;
		data: ^u8; // the data in the chunk

		// make sure chunk header is not larger than the total compressed
		if c_ulong(chunk - upng.source.buffer + 12) > upng.source.size {
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			return upng.error;
		}

		// get length; sanity check it
		length = c_ulong(_upng_chunk_length(chunk));
		// NOTE(zachary): This is what they chose, so I trust this makes sense somehow...
		if length > c_ulong(bits.I32_MAX) {
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			return upng.error;
		}

		// make sure chunk header+paylaod is not larger than the total compressed
		if c_ulong(chunk - upng.source.buffer) + length + 12 > c_ulong(upng.source.size) {
			_SET_ERROR(upng, Upng_Error.MALFORMED);
			return upng.error;
		}

		// get pointer to payload
		data = chunk + 8;

		// parse chunks
		if _upng_chunk_type(chunk) == _CHUNK_IDAT {
			compressed_size += length;
		} else if _upng_chunk_type(chunk) == _CHUNK_IEND {
			break;
		} else if _upng_chunk_critical(chunk) {
			_SET_ERROR(upng, Upng_Error.UNSUPPORTED);
			return upng.error;
		}

		chunk += _upng_chunk_length(chunk) + 12;
	}

	// allocate enough space for the (compressed and filtered) image data
	compressed = cast(^u8)alloc(int(compressed_size));
	if compressed == nil {
		_SET_ERROR(upng, Upng_Error.NOMEM);
		return upng.error;
	}

	/* scan through the chunks again, this time copying the values into
	 * our compressed buffer.  there's no reason to validate anything a second time. */
	chunk = upng.source.buffer + 33;
	for chunk < upng.source.buffer + upng.source.size {
		length: c_ulong;
		data: ^u8; // the data in the chunk

		length = c_ulong(_upng_chunk_length(chunk));
		data = chunk + 8;

		// parse chunks
		if _upng_chunk_type(chunk) == _CHUNK_IDAT {
			mem.copy(compressed + compressed_index, data, int(length));
			compressed_index += length;
		} else if _upng_chunk_type(chunk) == _CHUNK_IEND {
			break;
		}

		chunk += _upng_chunk_length(chunk) + 12;
	}

	// allocate space to store inflated (but still filtered) data 
	inflated_size = c_ulong(((upng.width * (upng.height * upng_get_bpp(upng) + 7)) / 8) + upng.height);
	inflated = cast(^u8)alloc(int(inflated_size));
	if inflated == nil {
		free(compressed);
		_SET_ERROR(upng, Upng_Error.NOMEM);
		return upng.error;
	}

	// decompress image data
	error = uz_inflate(upng, inflated, inflated_size, compressed, compressed_size);
	if error != Upng_Error.OK {
		free(compressed);
		free(inflated);
		return upng.error;
	}

	// free the compressed compressed data
	free(compressed);

	// allocate final image buffer
	upng.size = c_ulong(upng.height * upng.width * upng_get_bpp(upng) + 7) / 8;
	upng.buffer = cast(^u8)alloc(int(upng.size));
	if upng.buffer == nil {
		free(inflated);
		upng.size = 0;
		_SET_ERROR(upng, Upng_Error.NOMEM);
		return upng.error;
	}

	// unfilter scanlines
	post_process_scanlines(upng, upng.buffer, inflated, upng);
	free(inflated);

	if upng.error != Upng_Error.OK {
		free(upng.buffer);
		upng.buffer = nil;
		upng.size = 0;
	} else {
		upng.state = _Upng_State.DECODED;
	}

	// we are done with our input buffer; free it if we own it
	upng_free_source(upng);

	return upng.error;
}

upng_new :: proc() -> ^Upng {

	upng := new(Upng);

	if upng == nil {
		return nil;
	}

	upng.buffer = nil;
	upng.size = 0;

	upng.width = 0;
	upng.height = 0;

	upng.color_type = Upng_Color.RGBA;
	upng.color_depth = 8;
	upng.format = Upng_Format.RGBA8;

	upng.state = _Upng_State.NEW;

	upng.error = Upng_Error.OK;
	upng.error_line = 0;

	upng.source.buffer = nil;
	upng.source.size = 0;
	upng.source.owning = 0;

	return upng;
}

upng_new_from_bytes :: proc(buffer: []u8) -> ^Upng {
	return upng_new_from_bytes(&buffer[0], c_ulong(len(buffer)));
}

upng_new_from_bytes :: proc(buffer: ^u8, size: c_ulong) -> ^Upng {

	upng := upng_new();
	if upng == nil {
		return nil;
	}

	upng.source.buffer = buffer;
	upng.source.size = size;
	upng.source.owning = 0;

	return upng;
}

upng_new_from_file :: proc(filename: string) -> ^Upng {
	
	upng := upng_new();
	if upng == nil do return nil;

	data, ok := os.read_entire_file(filename);
	if !ok {
		_SET_ERROR(upng, Upng_Error.NOTFOUND);
		return upng;
	}

	upng.source.buffer = &data[0];
	upng.source.size = c_ulong(len(data));
	upng.source.owning = 1;

	return upng;
}
/*
upng_t* upng_new_from_file(const char *filename)
{
	upng_t* upng;
	unsigned char *buffer;
	FILE *file;
	long size;

	upng = upng_new();
	if (upng == NULL) {
		return NULL;
	}

	file = fopen(filename, "rb");
	if (file == NULL) {
		_SET_ERROR(upng, Upng_Error.NOTFOUND);
		return upng;
	}

	/* get filesize */
	fseek(file, 0, SEEK_END);
	size = ftell(file);
	rewind(file);

	/* read contents of the file into the vector */
	buffer = (unsigned char *)malloc((unsigned long)size);
	if (buffer == NULL) {
		fclose(file);
		_SET_ERROR(upng, Upng_Error.NOMEM);
		return upng;
	}
	fread(buffer, 1, (unsigned long)size, file);
	fclose(file);

	/* set the read buffer as our source buffer, with owning flag set */
	upng.source.buffer = buffer;
	upng.source.size = size;
	upng.source.owning = 1;

	return upng;
}
*/

upng_free :: proc(upng: ^Upng) {
	// deallocate image buffer
	if upng.buffer != nil do free(upng.buffer);

	// deallocate source buffer, if necessary
	upng_free_source(upng);

	// deallocate struct itself
	free(upng);
}

upng_get_error :: proc(upng: ^Upng) -> Upng_Error #inline {
	return upng.error;
}

upng_get_error_line :: proc(upng: ^Upng) -> u32 #inline {
	return upng.error_line;
}

upng_get_width :: proc(upng: ^Upng) -> u32 #inline {
	return upng.width;
}

upng_get_height :: proc(upng: ^Upng) -> u32 #inline {
	return upng.height;
}

upng_get_bpp :: proc(upng: ^Upng) -> u32 #inline {
	return upng_get_bitdepth(upng) * upng_get_components(upng);
}

upng_get_components :: proc(upng: ^Upng) -> u32 {
	switch (upng.color_type) {
	case Upng_Color.LUM:
		return 1;
	case Upng_Color.RGB:
		return 3;
	case Upng_Color.LUMA:
		return 2;
	case Upng_Color.RGBA:
		return 4;
	case:
		return 0;
	}
}

upng_get_bitdepth :: proc(upng: ^Upng) -> u32 #inline {
	return upng.color_depth;
}

upng_get_pixelsize :: proc(upng: ^Upng) -> u32 {
	bits: u32 = upng_get_bitdepth(upng) * upng_get_components(upng);
	bits += bits % 8;
	return bits;
}

upng_get_format :: proc(upng: ^Upng) -> Upng_Format #inline {
	return upng.format;
}

upng_get_buffer :: proc(upng: ^Upng) -> ^u8 #inline {
	return upng.buffer;
}

upng_get_size :: proc(upng: ^Upng) -> c_ulong #inline {
	return upng.size;
}

load_from_file :: proc(path: string) -> ^Upng {
	
	upng := upng_new_from_file(path);
	if upng == nil do return nil;

	upng_decode(upng);
	if upng.error != Upng_Error.OK {
		upng_free(upng);
		return nil;
	}

	return upng;
}

load_from_buffer :: proc(buf: []u8) -> ^Upng {
	
	upng := upng_new_from_bytes(buf);
	if upng == nil do return nil;

	upng_decode(upng);
	if upng.error != Upng_Error.OK {
		upng_free(upng);
		return nil;
	}

	return upng;
}

// This is essentially an alias because it fits in more with my API style, but
// I don't want to alienate people used to the normal uPNG api.
free_png :: proc(upng: ^Upng) #inline do upng_free(upng);