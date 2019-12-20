import	"core:fmt.odin";
import "core:utf8.odin";


startsWith :: proc(str, s: string) -> bool {
	if len(s) > len(str) {
		return false;
	}

	if str == s {
		return true;
	}

	found := true;
	for i1, i2, size1, size2 := 0, 0, 0, 0; i1 < len(str); {
		if i1 == len(s) {
			break;
		}
		rstr, rs: rune;
		rstr, size1 = utf8.decode_rune(str[i1..]);
		rs, size2 = utf8.decode_rune(s[i2..]);
		if rstr != rs {
			found = false;
		}

		i1 += size1;
		i2 += size2;
	}

	return found;
}

startsWith :: proc(str: string, s: rune) -> bool {
	r, size := utf8.decode_rune(str); //decode rune takes the first rune in a string
	return r == s;
}

startsWith :: proc(str: string, s: u8) -> bool {
	return startsWith(str, rune(s));
}


indexOf :: proc(str: string, s: rune) -> int {
	for b, i in str {
		if b == s {
			return i;
		}
	}
	return -1;
}

indexOf :: proc(str: string, s: u8) -> int {
	return indexOf(str, rune(s));;
}

indexOf :: proc(str, pattern: string) -> int {
	index := -1;
	firstRuneInPattern, _ := utf8.decode_rune(pattern);
	outer: for i, size := 0, 0; i < len(str)-len(pattern)+1; i += size {
		r: rune;
		r, size = utf8.decode_rune(str[i..]);
		if r == firstRuneInPattern {
			index = i;
			//fmt.printf("First match at %d\n", i);
			inner: for j, size2 := 0, 0; j < len(pattern); j += size2 {
				if j == len(pattern) {
					//fmt.printf("j == len(pattern)-1 j: %d, len(pattern): %d\n", j, len(pattern));
					index = i;
					break outer;
				}

				t: rune;
				r, size = utf8.decode_rune(str[i+j..]);
				t, size2 = utf8.decode_rune(pattern[j..]);

				//fmt.printf("r: %d, t: %d\n", r, t);
				if r != t {
					index = -1;
					break inner;
				}
			}
		}
	}
	
	return index;
}

lastIndexOf :: proc(str: string, s: rune) -> int {
	for i, size := len(str)-1, 0; i >= 0; i -= size {
		r: rune;
		r, size = utf8.decode_rune(str[i..]);
		if r == s {
			return i;
		}
	}
	return -1;
}

lastIndexOf :: proc(str: string, s: u8) -> int {
	return lastIndexOf(str, rune(s));
}

lastIndexOf :: proc(str, pattern: string) -> int {
	index := -1;
	firstRuneInPattern, _ := utf8.decode_rune(pattern);
	outer: for i, size := len(str)-1, 0; i >= 0; i -= size {
		r: rune;
		r, size = utf8.decode_rune(str[i..]);
		if r == firstRuneInPattern {
			index = i;
			//fmt.printf("First match at %d\n", i);
			inner: for j, size2 := 0, 0; j < len(pattern); j += size2 {
				if j == len(pattern) {
					//fmt.printf("j == len(pattern)-1 j: %d, len(pattern): %d\n", j, len(pattern));
					index = i;
					break outer;
				}

				t: rune;
				r, size = utf8.decode_rune(str[i+j..]);
				t, size2 = utf8.decode_rune(pattern[j..]);

				//fmt.printf("r: %d, t: %d\n", r, t);
				if r != t {
					index = -1;
					break inner;
				}
			}
		}
	}
	
	return index;
}


join :: proc(list: []string, d: string) -> string {
	if len(list) == 0 {
		return "";
	}
	newLen := 0;
	for s in list {
		newLen = newLen + len(s);
	}
	newLen += (len(list) - 1) * len(d);

	newStr := make([]u8, 0, newLen);
	for s, i in list {
		append(&newStr, ...cast([]u8)s);
		append(&newStr, ...cast([]u8)d);
	}
	return string(newStr);

}

join :: proc(list: []string, d: u8) -> string { 
	return join(list, string([]u8{d}));
}

join :: proc(list: []string, d: rune) -> string {
	str, size := utf8.encode_rune(d);
	return join(list, string(str[..]));
}

split :: proc(input: string, d: rune) -> []string {
	delCount := 1;
	inputLen := len(input);
	for b in input {
		if b == d {
			delCount += 1;
		}
	}

	lines := make([]string, delCount);
	foundLines := 0;
	for offset, i, size := 0, 0, 0; i < inputLen; i += size {
		r: rune;
		r, size = utf8.decode_rune(input[i..]);

		if r == d {
			lines[foundLines] = string(input[offset..i]);
			

			foundLines += 1;
			//i += 1;
			offset = i + 1;
		}

		eof := i >= inputLen-1;
		if eof {
			lines[foundLines] = string(input[offset..inputLen]);
			break;
		}	
	}

	return lines;
}

_whitespaceChars := []rune {
	0x0020, 0x1680, 0x2000, 0x2001,
	0x2002, 0x2003, 0x2004, 0x2005,
	0x2006, 0x2007, 0x2008, 0x2009,
	0x200A, 0x202F, 0x205F, 0x3000,
	0x2028, 0x2029, 0x0009, 0x000A,
	0x000B, 0x000C, 0x000D, 0x0085,
	0x00A0 };

_isOneOf :: proc(r: rune, a: []rune) -> bool {
	for ru in a {
		if r == ru {
			return true;
		}
	}
	return false;
}

trimStart :: proc(input: string) -> string {
	index := 0;
	for i, size := 0, 0; i < len(input); i += size {
		r: rune;
		r, size = utf8.decode_rune(input[i..]);
		if _isOneOf(r, _whitespaceChars) {
			index = i + 1;
		}
		else {
			break;
		}

	}

	//fmt.println(index);
	return input[index..];
}

trimEnd :: proc(input: string) -> string {
	index := len(input) - 1;
	for i, size := index, 0; i >= 0; i -= size {
		//fmt.printf("%d\n", i);
		r: rune;
		r, size = utf8.decode_rune(input[i..]);
		if _isOneOf(r, _whitespaceChars) {
			//fmt.printf("%r is whitespace at index %d\n", r, i);
			index = i - 1;
		}
		else {
			//fmt.printf("%r is NOT whitespace at index %d\n", r, i);
			break;
		}
	}

	//fmt.println(index);
	//fmt.println(len(input));
	return input[0..index];
}

trim :: proc(input: string) -> string {
	return trimStart(trimEnd(input));
}

main :: proc() {
	
	/*
	fmt.printf("%v\n", indexOf("😇abcd", '😇'));
	fmt.printf("%v\n", indexOf("😇abcd", "😇"));
	fmt.printf("%v\n", indexOf("ab", "😇"));
	fmt.printf("%v\n", indexOf("ab😇abcd", "😇ab"));
	

	fmt.printf("'ugknbfddgicrmopn'.indexOf(\"cd\") = %v\n\n", indexOf("ugknbfddgicrmopn", "cd"));
	fmt.printf("'ugknbfddgicrmopn'.indexOf(\"cr\") = %v\n\n", indexOf("ugknbfddgicrmopn", "cr"));
	
	
	fmt.printf("['a', 'b', 'c'].join(\"😇\") = %v\n", join([]string{"a","b","c"}, '😇'));
	fmt.printf("['a', 'b', 'c'].join(\" 😇 \") = %v\n", join([]string{"a","b","c"}, " 😇 "));
	fmt.printf("['a', 'b', 'c'].join(\",\") = %v\n\n", join([]string{"a","b","c"}, u8(',')));
	*/

	fmt.printf("%v\n", lastIndexOf("😇abcd", '😇'));
	fmt.printf("%v\n", lastIndexOf("abc😇d", '😇'));
	fmt.printf("%v\n", lastIndexOf("abcd😇", '😇'));
	fmt.printf("%v\n", lastIndexOf("abcd", '😇'));
	/*
	fmt.printf("'crmopn'.lastIndexOf(\"op\") = %v\n\n", lastIndexOf("crmopn", "op"));
	fmt.printf("'crmopn'.lastIndexOf(\"pn\") = %v\n\n", lastIndexOf("crmopn", "pn"));
	fmt.printf("'crmopn'.lastIndexOf(\"kr\") = %v\n\n", lastIndexOf("crmopn", "kr"));
	fmt.printf("'crmopn'.lastIndexOf(\"kr\") = %v\n\n", lastIndexOf("crmopn", "cr"));
	*/

	/*
	fmt.printf("'abc' = '%s'\n", trimStart("abc"));
	fmt.printf("' 	abc' = '%s'\n", trimStart(" 	abc"));

	fmt.printf("'abc' = '%s'\n", trimEnd("abc"));
	fmt.printf("'abc 	' = '%s'\n", trimEnd("abc 	"));
	fmt.printf("'abc    	' = '%s'\n", trimEnd("abc    	"));

	fmt.printf("'abc' = '%s'\n", trim("abc"));
	fmt.printf("' 	abc' = '%s'\n", trim(" 	abc"));
	fmt.printf("'abc' = '%s'\n", trim("abc"));
	fmt.printf("'abc 	' = '%s'\n", trim("abc 	"));
*/	
}

