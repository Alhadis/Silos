

type Trainer_Pokemon union {
	ability, ai_level: ^u8,
	level, pokemon: ^u16,

	Normal { },
	Has_Moves {
		moves: []u16
	},
	Has_Held {
		held_item: ^u16
	},
	Has_Both {
		held_item: ^u16,
		moves: []u16
	}
}

type Trainer union {
	trainer_class: ^u8,
	pokemons: []Trainer_Pokemon // Heap!
}

proc dispose(trainer: Trainer) {

}

proc dispose(trainers: []Trainer) {

}

type Pokemon struct {
	id: u16,
	hp, attack, defense, speed, sp_attack, sp_defense: ^u8,
	type1, type2: ^u8,
	catch_rate: ^u8,
	common_held, rare_held, dark_grass_held: ^u16,
	exp_curve: ^u8,
	ability1, ability2, ability3: ^u8,
}

proc total_stats(pokemon: ^Pokemon) -> u16 {
	using pokemon;
	return u16(hp^) + u16(attack^) + u16(defense^) + u16(speed^) + u16(sp_attack^) + u16(sp_defense^);
}

proc is_type(pokemon: ^Pokemon, pokemon_type: u8) -> bool {
	return pokemon.type1^ == pokemon_type || pokemon.type2^ == pokemon_type;
}