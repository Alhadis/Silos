import(
	"os.odin";
	"mem.odin";
	"math.odin";
	"sys/windows.odin";
);

import(
	"poke.odin";
	"nds.odin";
	"buffer.odin";
	"crc.odin";
);

type Rom struct {
	data: []u8, // Heap!
	header: Header,
	banner: Banner,
	fat: FAT,
	root_folder: Folder
}

proc dispose(rom: Rom) {
	free(rom.data);
}

proc read_rom(path: string) -> (Rom, bool) {
	var result = Rom{};

	var data, success = os.read_entire_file(path);

	if success {
		result.data = data;
		result.header = read_header(data);
		result.banner = read_banner(data, result.header.banner_offset);
		result.fat = read_fat(data, result.header.fat_offset, result.header.fat_size);
		result.root_folder = read_files(data, result.header.fnt_offset, result.fat);
	}

	return result, success;
}

type Header struct {
	game_title: [12]u8,
	game_code: [4]u8,
	maker_code: [2]u8,
	unit_code, encryption_seed: u8,
	tamano: u32, // ??
	reserved: [9]u8,
	rom_version, internal_flags: u8,
	arm9_rom_offset, arm9_entry_address, arm9_ram_address, amr9_size: u32,
	arm7_rom_offset, arm7_entry_address, arm7_ram_address, arm7_size: u32,
	fnt_offset, fnt_size: u32,
	fat_offset, fat_size: u32,
	arm9_overlay_offset, arm9_overlay_size: u32,
	arm7_overlay_offset, arm7_overlay_size: u32,
	flags_read, flags_init: u32,
	banner_offset: u32,
	secure_crc16: u16,
	rom_timeout: u16,
	arm9_autoload: u32,
	arm7_autoload: u32,
	secure_disable: u64,
	rom_size: u32,
	header_size: u32,
	reserved2: [56]u8,
	logo: [156]u8,
	logo_crc16, header_crc16: u16,
	secure_crc, logo_crc, header_crc: bool,
	debug_rom_offset, debug_size, debug_ram_address: u32,
	reserved3: u32,
	// reserved4: [0x90]u8
}

proc read_header(rom: []u8) -> Header {
	var reader = buffer.Buffer_Reader{ data = rom, offset = 0 };
	var result = Header{};

	{
		using result;

		buffer.read(&reader, game_title[..]);
		buffer.read(&reader, game_code[..]);
		buffer.read(&reader, maker_code[..]);

		unit_code 		= buffer.read_u8(&reader);
		encryption_seed = buffer.read_u8(&reader);
		tamano 			= u32(math.pow(2, f64(17 + buffer.read_u8(&reader))));

		buffer.read(&reader, reserved[..]);

		rom_version     = buffer.read_u8(&reader);
		internal_flags  = buffer.read_u8(&reader);

		arm9_rom_offset = buffer.read_u32(&reader);
		arm9_entry_address = buffer.read_u32(&reader);
		arm9_ram_address = buffer.read_u32(&reader);
		amr9_size = buffer.read_u32(&reader);

		arm7_rom_offset = buffer.read_u32(&reader);
		arm7_entry_address = buffer.read_u32(&reader);
		arm7_ram_address = buffer.read_u32(&reader);
		arm7_size = buffer.read_u32(&reader);

		fnt_offset = buffer.read_u32(&reader);
		fnt_size = buffer.read_u32(&reader);

		fat_offset = buffer.read_u32(&reader);
		fat_size = buffer.read_u32(&reader);

		arm9_overlay_offset = buffer.read_u32(&reader);
		arm9_overlay_size = buffer.read_u32(&reader);

		arm7_overlay_offset = buffer.read_u32(&reader);
		arm7_overlay_size = buffer.read_u32(&reader);

		flags_read = buffer.read_u32(&reader);
		flags_init = buffer.read_u32(&reader);

		banner_offset = buffer.read_u32(&reader);

		secure_crc16 = buffer.read_u16(&reader);
		rom_timeout = buffer.read_u16(&reader);

		arm9_autoload = buffer.read_u32(&reader);
		arm7_autoload = buffer.read_u32(&reader);

		secure_disable = buffer.read_u64(&reader);

		rom_size = buffer.read_u32(&reader);

		header_size = buffer.read_u32(&reader);

		buffer.read(&reader, reserved2[..]);
		buffer.read(&reader, logo[..]);

		logo_crc16 = buffer.read_u16(&reader);
		header_crc16 = buffer.read_u16(&reader);

		debug_rom_offset = buffer.read_u32(&reader);
		debug_size = buffer.read_u32(&reader);
		debug_ram_address = buffer.read_u32(&reader);
		reserved3 = buffer.read_u32(&reader);

		{
			var secure_crc_data: [0x4000]u8;
			reader.offset = 0x4000;
			buffer.read(&reader, secure_crc_data[..]);
			secure_crc = crc.calculate16(secure_crc_data[..]) == u32(secure_crc16);
		}
		{
			var logo_crc_data: [156]u8;
			reader.offset = 0xC0;
			buffer.read(&reader, logo_crc_data[..]);
			logo_crc = crc.calculate16(logo_crc_data[..]) == u32(logo_crc16);
		}
		{
			var header_crc_data: [0x15E]u8;
			reader.offset = 0x0;
			buffer.read(&reader, header_crc_data[..]);
			header_crc = crc.calculate16(header_crc_data[..]) == u32(header_crc16);
		}

	}

	return result;
}

type Banner struct {
	version, crc16: u16,
	check_crc: bool,
	reserved: [28]u8,
	tile_data: [512]u8,
	palette: [32]u8,
	japanese_title, english_title, french_title: [256]u8, 
	german_title, italian_title, spanish_title: [256]u8,
}

proc read_banner(rom: []u8, offset: u32) -> Banner {
	var reader = buffer.Buffer_Reader{ data = rom, offset = u64(offset) };
	var result = Banner{};

	{
		using result;

		version = buffer.read_u16(&reader);
		crc16 = buffer.read_u16(&reader);

		buffer.read(&reader, reserved[..]);
		buffer.read(&reader, tile_data[..]);
		buffer.read(&reader, palette[..]);
		buffer.read(&reader, japanese_title[..]);
		buffer.read(&reader, english_title[..]);
		buffer.read(&reader, french_title[..]);
		buffer.read(&reader, german_title[..]);
		buffer.read(&reader, italian_title[..]);
		buffer.read(&reader, spanish_title[..]);

		var check_crc_data: [0x820]u8;
		reader.offset = u64(offset) + 0x20;
		buffer.read(&reader, check_crc_data[..]);
		check_crc = crc.calculate16(check_crc_data[..]) == u32(crc16);
	}

	return result;
}


type File_Allocation struct {
	size, offset: u32
}

type FAT struct {
	files: []File_Allocation // Heap!
}

proc read_fat(rom: []u8, offset, size: u32) -> FAT {
	var reader = buffer.Buffer_Reader{ data = rom, offset = u64(offset) };
	var fat = FAT{ files = make([]File_Allocation, size / 0x08) };

	{
		using fat;
		for i in 0..<len(files) {
			files[i].offset = buffer.read_u32(&reader);
			files[i].size = buffer.read_u32(&reader) - files[i].offset;
		}
	}

	return fat;
}

type File struct {
	data: []u8,
	offset, size: u32,
	name: string, // Heap!
	id: u16
}

proc dispose(file: File) {
	free(file.name);
}

type Folder struct {
	files: [dynamic]File, // Heap!
	folders: [dynamic]Folder, // Heap!
	name: string, // Heap!
	id: u16
}

proc dispose(folder: Folder) {
	for file in folder.files { dispose(file); }
	for fold in folder.folders { dispose(fold); }
	free(folder.name);
}


proc read_files(rom: []u8, fnt_offset: u32, fat: FAT) -> Folder {
	type MainFNT struct {
		offset: u32,
		first_file_id: u16,
		parent_id: u16,
		sub_table: Folder
	}

	proc build_folder(mains: []MainFNT, id: u16, name: string) -> Folder {
		var main = mains[id & 0xFFF];
		var folder = Folder{};
		folder.name = name;
		folder.id = id;
		folder.files = main.sub_table.files;

		for f in main.sub_table.folders {
			append(&folder.folders, build_folder(mains, f.id, f.name));
		}

		return folder;
	}

	var reader = buffer.Buffer_Reader{ data = rom, offset = u64(fnt_offset) };
	var mains = [dynamic]MainFNT;

	reader.offset += 6;
	var folder_count = buffer.read_u16(&reader);
	reader.offset = u64(fnt_offset);

	for i in 0..<folder_count {
		var main = MainFNT{
			offset = buffer.read_u32(&reader),
			first_file_id = buffer.read_u16(&reader),
			parent_id = buffer.read_u16(&reader)
		};

		var current_offset = reader.offset;
		reader.offset = u64(fnt_offset) + u64(main.offset);

		var id = buffer.read_u8(&reader);
		var next_id = main.first_file_id;

		for id != 0x0 {
			if id < 0x80 {
				var file = File{};

				file.name = string(make([]u8, id));
				buffer.read(&reader, file.name);

				file.id = next_id;
				next_id++;

				var file_allocation = fat.files[file.id];
				file.size = file_allocation.size;
				file.offset = file_allocation.offset;
				file.data = rom[file.offset..file.offset + file.size];

				append(&main.sub_table.files, file);
			} else if id > 0x80 {
				var folder = Folder{};

				folder.name = string(make([]u8, id - 0x80));
				buffer.read(&reader, folder.name);
				folder.id = buffer.read_u16(&reader);

				append(&main.sub_table.folders, folder);
			}

			id = buffer.read_u8(&reader);
		}

		append(&mains, main);
		reader.offset = current_offset;
	}

	var root = build_folder(mains[..], 0, "root");
	root.id = folder_count;

	return root;
}


proc get_file(folder: Folder, path: string) -> (File, bool) {
	proc index_of(array: []u8, item: u8) -> int {
		for it, index in array {
			if item == it { return index; }
		}

		return -1;
	}

	var index = index_of([]u8(path), 47 /* '/'. #rune don't work? */);
	
	if index >= 0 {
		var folder_name = path[0..index - 1];

		for f in folder.folders {
			if f.name == folder_name { return get_file(f, path[index + 1..len(path)-1]); }
		}

	} else {
		for f in folder.files {
			if f.name == path { return f, true; }
		}
	}

	return File{}, false;
}

type Narc_Archive struct {
	files: [][]u8 // Heap!
}

proc dispose(narc: Narc_Archive) {
	free(narc.files);
}

proc get_narc_archive(data: []u8) -> (Narc_Archive, bool) {
	proc read_nitro_frames(data: []u8) -> map[string][]u8 {
		var frame_count = buffer.read_u16(data, 0x0E);
		var offset: u32 = 0x10;
		var frames: map[string][]u8;

		for i in 0..<frame_count {
			var magic_string = string(make([]u8, 4));
			magic_string[0] = data[offset + 3];
			magic_string[1] = data[offset + 2];
			magic_string[2] = data[offset + 1];
			magic_string[3] = data[offset];

			var frame_size = buffer.read_u32(data, u64(offset + 4));

			if u32(i) == frame_size - 1 && offset + frame_size < u32(len(data)) {
				frame_size = u32(len(data)) - offset;
			}

			var frame_offset = offset + 8;
			frames[magic_string] = data[frame_offset..frame_offset + (frame_size - 8)];
			offset += frame_size;
		}

		return frames;
	}

	var result = Narc_Archive{};
	var frames = read_nitro_frames(data);
	defer {
		for value, key in frames { free(key); }
		free(frames);
	}

	var fatb, contains_fatb = frames["FATB"];
	var fntb, contains_fntb = frames["FNTB"];
	var fimg, contains_fimg = frames["FIMG"];

	if !contains_fatb || !contains_fntb || !contains_fimg { return result, false; }

	var file_count = buffer.read_u32(fatb, 0);
	result.files = make([][]u8, file_count);

	for i in 0..<file_count {

		var start_offset = buffer.read_u32(fatb, u64((i * 8) + 4));
		var end_offset = buffer.read_u32(fatb, u64((i * 8) + 8));

		result.files[i] = fimg[start_offset..end_offset];
	}

	return result, true;
}

proc get_pokemons(rom: Rom) -> []poke.Pokemon {
	const bw2_pokemon_stats_path = "a/0/1/6";

	// TODO: Handle errors
	var pokemon_file, _ = get_file(rom.root_folder, bw2_pokemon_stats_path);
	var pokemon_narc, _ = get_narc_archive(pokemon_file.data);
	defer dispose(pokemon_narc);

	var pokemons = make([]poke.Pokemon, len(pokemon_narc.files));

	for file, index in pokemon_narc.files {
		var pokemon_data = file; // NOTE: We can't take a pointer to inside "file" for some reason, but reassigning does the trick.

		pokemons[index] = poke.Pokemon{
			id 				= u16(index),
			hp 				= &pokemon_data[0],
			attack 			= &pokemon_data[1],
			defense 		= &pokemon_data[2],
			speed 			= &pokemon_data[3],
			sp_attack 		= &pokemon_data[4],
			sp_defense 		= &pokemon_data[5],
			type1 			= &pokemon_data[6],
			type2 			= &pokemon_data[7],
			catch_rate 		= &pokemon_data[8],
			common_held 	= ^u16(&pokemon_data[12]),
			rare_held 		= ^u16(&pokemon_data[14]),
			dark_grass_held = ^u16(&pokemon_data[16]),
			exp_curve 		= &pokemon_data[21],
			ability1 		= &pokemon_data[24],
			ability2 		= &pokemon_data[25],
			ability3 		= &pokemon_data[26],
		};
	}

	return pokemons;
}

proc get_trainers(rom: Rom) -> []poke.Trainer {
	const bw2_trainer_data_path = "a/0/9/1";
	const bw2_trainer_pokemon_path = "a/0/9/2";

	// TODO: Handle errors
	var trainer_file, _ 		= get_file(rom.root_folder, bw2_trainer_data_path);
	var trainer_pokemon_file, _ = get_file(rom.root_folder, bw2_trainer_pokemon_path);
	var trainer_narc, _ 		= get_narc_archive(trainer_file.data);
	var trainer_pokemon_narc, _ = get_narc_archive(trainer_pokemon_file.data);
	var trainers = make([]poke.Trainer, len(trainer_narc.files));

	for i in 0..<len(trainers) {
		var trainer_file 		 = trainer_narc.files[i];
		var trainer_pokemon_file = trainer_pokemon_narc.files[i];

		var trainer_type = trainer_file[0];
		var pokemon_count = trainer_file[3];

		var reader = buffer.Buffer_Reader {
			data = trainer_pokemon_file,
			offset = 0
		};

		proc get_base(reader: ^buffer.Buffer_Reader) -> poke.Trainer_Pokemon {
			var result = poke.Trainer_Pokemon{};

			result.ai_level = buffer.read_ptr8(reader);
			result.ability = buffer.read_ptr8(reader); // secondbyte
			result.level = buffer.read_ptr16(reader);
			result.pokemon = buffer.read_ptr16(reader);
			buffer.read_ptr16(reader); // formnum

			return result;
		}

		var pokemons = make([]poke.Trainer_Pokemon, pokemon_count);

		for j in 0..<len(pokemons) {
			var ai_level = buffer.read_ptr8(&reader);
			var ability = buffer.read_ptr8(&reader); // secondbyte
			var level = buffer.read_ptr16(&reader);
			var pokemon = buffer.read_ptr16(&reader);
			var formnum = buffer.read_ptr16(&reader);

			if (trainer_type & 2) == 2 && (trainer_type & 1) == 1 {
				pokemons[j] = poke.Trainer_Pokemon.Has_Both {
					ai_level = ai_level,
					ability = ability,
					level = level,
					pokemon = pokemon,
					held_item = buffer.read_ptr16(&reader),
					moves = slice_ptr(^u16(&reader.data[reader.offset]), 4)
				};

				reader.offset += 8;
				
			} else if (trainer_type & 2) == 2 {
				pokemons[j] = poke.Trainer_Pokemon.Has_Held {
					ai_level = ai_level,
					ability = ability,
					level = level,
					pokemon = pokemon,
					held_item = buffer.read_ptr16(&reader)
				};
			} else if (trainer_type & 1) == 1 {
				pokemons[j] = poke.Trainer_Pokemon.Has_Moves {
					ai_level = ai_level,
					ability = ability,
					level = level,
					pokemon = pokemon,
					moves = slice_ptr(^u16(&reader.data[reader.offset]), 4)
				};

				reader.offset += 8;
			} else {
				pokemons[j] = poke.Trainer_Pokemon.Normal {
					ai_level = ai_level,
					ability = ability,
					level = level,
					pokemon = pokemon
				};
			}
		}

		trainers[i] = poke.Trainer {
			trainer_class = &trainer_file[1],
			pokemons = pokemons
		};
	}

	return trainers;
}

