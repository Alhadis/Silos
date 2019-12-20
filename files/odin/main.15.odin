import(
	"bits.odin";
	"os.odin";
	"fmt.odin";
);

import(
	"poke.odin";
	"random.odin";
	"nds.odin";
	"buffer.odin";
);


proc print_data_as_str(arr: []u8) {
	for c in arr { fmt.print(rune(c)); }
}

proc print_indent(i: int) {
	for p in 0..<i*2 {
		fmt.print(" ");
	}
}

proc print_folder(folder: nds.Folder, i: int = 0) {
	print_indent(i); fmt.println("{");
	i++;
	print_indent(i); fmt.println("folder");
	print_indent(i); fmt.println("id =", folder.id);
	print_indent(i); fmt.println("name =", folder.name);

	if len(folder.files) > 0 {
		print_indent(i); fmt.println("files = [");
		i++;

		for f in folder.files {
			print_indent(i); fmt.println("{");
			i++;

			print_indent(i); fmt.println("file");
			print_indent(i); fmt.println("id =", f.id);
			print_indent(i); fmt.println("size =", f.size);
			print_indent(i); fmt.println("offset =", f.offset);
			print_indent(i); fmt.println("name =", f.name); 

			i--;
			print_indent(i); fmt.println("}");
		}

		i--;
		print_indent(i); fmt.println("]");
	}

	if len(folder.folders) > 0 {
		print_indent(i); fmt.println("folders = [");
		i++;

		for f in folder.folders {
			print_folder(f, i);
		}

		i--;
		print_indent(i); fmt.println("]");
	}
	
	i--;
	print_indent(i); fmt.println("}");
}

proc print_pokemon(pokemon: poke.Pokemon) {
	fmt.println("Pokemon {");
	fmt.println("  hp =", pokemon.hp^);
	fmt.println("  attack =", pokemon.attack^);
	fmt.println("  defense =", pokemon.defense^);
	fmt.println("  speed =", pokemon.speed^);
	fmt.println("  sp_attack =", pokemon.sp_attack^);
	fmt.println("  sp_defense =", pokemon.sp_defense^);
	fmt.println("  type1 =", pokemon.type1^);
	fmt.println("  type2 =", pokemon.type2^);
	fmt.println("  catch_rate =", pokemon.catch_rate^);
	fmt.println("  common_held =", pokemon.common_held^);
	fmt.println("  rare_held =", pokemon.rare_held^);
	fmt.println("  dark_grass_held =", pokemon.dark_grass_held^);
	fmt.println("  exp_curve =", pokemon.exp_curve^);
	fmt.println("  ability1 =", pokemon.ability1^);
	fmt.println("  ability2 =", pokemon.ability2^);
	fmt.println("  ability3 =", pokemon.ability3^);
	fmt.println("}");
}

proc print_trainer(trainer: poke.Trainer) {
	fmt.println("Trainer {");
	fmt.println("  trainer_class =", trainer.trainer_class^);

	fmt.println("  pokemons = [");

	proc print_base(base: poke.Trainer_Pokemon) {
		fmt.println("      ability =", base.ability^);
		fmt.println("      ai_level =", base.ai_level^);
		fmt.println("      level =", base.level^);
		fmt.println("      pokemon =", base.pokemon^);
	}

	for pokemon in trainer.pokemons {
		fmt.println("    {");
		print_base(pokemon);

		match p in pokemon {
			case poke.Trainer_Pokemon.Has_Moves:
					fmt.println("      moves =", p.moves);

			case poke.Trainer_Pokemon.Has_Held:
					fmt.println("      held_item = ", p.held_item^);

			case poke.Trainer_Pokemon.Has_Both:
					fmt.println("      held_item = ", p.held_item^);
					fmt.println("      moves =", p.moves);
		}

		fmt.println("    }");
	}

	fmt.println("  ]");

	fmt.println("}");
}

type Type_Replacement_Method enum {
	Trainer_Type_Themed,
	Keep_Original_Pokemons_Type,
	Random
}

proc randomize_trainer_pokemons(
	randomizer: ^random.Randomizer_64bit, trainers: []poke.Trainer, pokemons: []poke.Pokemon,
	simular_stats: bool,
	replacement_method: Type_Replacement_Method) {


	proc get_replament(randomizer: ^random.Randomizer_64bit, current_pokemon: ^poke.Pokemon, pokemons: []poke.Pokemon, simular_stats: bool, types: []u8) -> u16 {
		// TODO: Move out
		proc contains(arr: []u8, element: u8) -> bool {
			for item in arr {
				if item == element { return true; }
			}

			return false;
		}

		if !simular_stats {
			for {
				var choice = random.x_or_shift_64_star(randomizer) % u64(len(pokemons));
				var pokemon = &pokemons[choice];

				if len(types) > 0 && !contains(types, pokemon.type1^) && !contains(types, pokemon.type2^) { continue; }

				return pokemon.id;
			}
		}

		var current_total = poke.total_stats(current_pokemon);
		var min = current_total - 10;
		var max = current_total + 10;
		var picked: [dynamic]^poke.Pokemon;
		defer free(picked);

		for len(picked) < 5 {
			for i in 0..<len(pokemons) {
				var pokemon = &pokemons[i];
				if len(types) > 0 && !contains(types, pokemon.type1^) && !contains(types, pokemon.type2^) { continue; }

				var total = poke.total_stats(pokemon);
				if total < min || max < total { continue; }

				append(&picked, pokemon);
			}
		}

		return picked[random.x_or_shift_64_star(randomizer) % u64(len(picked))].id;
	}

	const type_count = 17;

	for trainer in trainers {
		var trainer_theme = u8(random.x_or_shift_64_star(randomizer) % u64(type_count));

		for trainer_pokemon in trainer.pokemons {
			var pokemon_ptr = trainer_pokemon.pokemon;
			var pokemon = &pokemons[pokemon_ptr^];

			using Type_Replacement_Method;
			match replacement_method {
				case Trainer_Type_Themed:
					pokemon_ptr^ = get_replament(randomizer, pokemon, pokemons, simular_stats, []u8{ trainer_theme });
				case Keep_Original_Pokemons_Type:
					pokemon_ptr^ = get_replament(randomizer, pokemon, pokemons, simular_stats, []u8{ pokemon.type1^, pokemon.type2^ });
				case Random:
					pokemon_ptr^ = get_replament(randomizer, pokemon, pokemons, simular_stats, []u8{});
			}

		}
	}
}

import_load (
	"os_windows.odin" when ODIN_OS == "windows";
	"os_x.odin"       when ODIN_OS == "osx";
	"os_linux.odin"   when ODIN_OS == "linux";
)

import "sys/windows.odin";

proc main() {
	var rom, success = nds.read_rom("D:\\Mega\\ProgramDataDump\\RandomizerSettings\\PokemonBlack2.nds");
	defer nds.dispose(rom);

	if success {
		var pokemons = nds.get_pokemons(rom);
		var trainers = nds.get_trainers(rom);

		//print_trainer(trainers[1]);

		var randomizer = random.Randomizer_64bit{ seed = u64(windows.time_get_time()) };
		randomize_trainer_pokemons(&randomizer, trainers, pokemons, true, Type_Replacement_Method.Random);



		proc write_entire_file(name: string, data: []u8) -> bool {
			var fd, err = open(name, O_CREAT, 0);
			if err != 0 {
				fmt.println("Failed to open");
				return false;
			}
			defer close(fd);

			var bytes_written, write_err = write(fd, data);
			if write_err == 0 { fmt.println("Failed to write"); }
			return write_err != 0;
		}

		fmt.println(write_entire_file("D:\\Downloads\\Stench.nds", rom.data));
	}
}

