/*
 * Copyright (c) 2013-2014 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

/*
 * This file is used to rename functions and classes for C# and Java, whose
 * main naming convention is CamelCase/lowerCamelCase.
 */

%include "std_pair.i"

/*
 * pkmn/bag.hpp
 */
%rename(Bag) pkmn::bag;
%rename(getGame) pkmn::bag::get_game;
%rename(getGeneration) pkmn::bag::get_generation;
%rename(addItem) pkmn::bag::add_item;
%rename(removeItem) pkmn::bag::remove_item;
%rename(getItemAmount) pkmn::bag::get_item_amount;
%rename(getPocket) pkmn::bag::get_pocket;
%rename(getPockets) pkmn::bag::get_pockets;
%rename(getGameID) pkmn::bag::get_game_id;

/*
 * pkmn/base_pokemon.hpp
 */
%rename(BasePokemon) pkmn::base_pokemon;
%rename(getGame) pkmn::base_pokemon::get_game;
%rename(getGeneration) pkmn::base_pokemon::get_generation;
%rename(getName) pkmn::base_pokemon::get_name;
%rename(getSpecies) pkmn::base_pokemon::get_species;
%rename(getPokedexNum) pkmn::base_pokemon::get_pokedex_num;
%rename(getTypes) pkmn::base_pokemon::get_types;
%rename(getHeight) pkmn::base_pokemon::get_height;
%rename(getWeight) pkmn::base_pokemon::get_weight;
%rename(getEggGroups) pkmn::base_pokemon::get_egg_groups;
%rename(hasGenderDifferences) pkmn::base_pokemon::has_gender_differences;
%rename(getEvolutions) pkmn::base_pokemon::get_evolutions;
%rename(isFullyEvolved) pkmn::base_pokemon::is_fully_evolved;
%rename(getChanceMale) pkmn::base_pokemon::get_chance_male;
%rename(getChanceFemale) pkmn::base_pokemon::get_chance_female;
%rename(getAbilities) pkmn::base_pokemon::get_abilities;
%rename(getHiddenAbility) pkmn::base_pokemon::get_hidden_ability;
%rename(getBaseStats) pkmn::base_pokemon::get_base_stats;
%rename(getEVYields) pkmn::base_pokemon::get_ev_yields;
%rename(getExpYield) pkmn::base_pokemon::get_exp_yield;
%rename(getForm) pkmn::base_pokemon::get_form;
%rename(setForm) pkmn::base_pokemon::set_form;
%rename(getIconPath) pkmn::base_pokemon::get_icon_path;
%rename(getSpritePath) pkmn::base_pokemon::get_sprite_path;
%rename(getPokemonID) pkmn::base_pokemon::get_pokemon_id;
%rename(getSpeciesID) pkmn::base_pokemon::get_species_id;
%rename(getGameID) pkmn::base_pokemon::get_game_id;
%rename(getFormID) pkmn::base_pokemon::get_form_id;
%rename(getEggGroupIDs) pkmn::base_pokemon::get_egg_group_ids;

/*
 * pkmn/build_info.hpp
 */
%rename(getSQLiteVersion) pkmn::get_sqlite_version;
%rename(getSQLiteCppVersion) pkmn::get_sqlitecpp_version;
%rename(getBoostVersion) pkmn::get_boost_version;
%rename(getQt4Version) pkmn::get_qt4_version;
%rename(getLibPKMNCommit) pkmn::get_libpkmn_commit;
%rename(getRPokesavCommit) pkmn::get_rpokesav_commit;
%rename(getPokeLibNCCommit) pkmn::get_pokelib_nc_commit;
%rename(getPKMDSCommit) pkmn::get_pkmds_commit;

/*
 * pkmn/calculations.hpp
 */
%rename(getAbilityNum) pkmn::calculations::get_ability_num;
%rename(getGen2Gender) pkmn::calculations::get_gen2_gender;
%rename(getModernGender) pkmn::calculations::get_modern_gender;
%rename(getHiddenPower) pkmn::calculations::get_hidden_power;
%rename(getNature) pkmn::calculations::get_nature;
%rename(getGen2Shiny) pkmn::calculations::get_gen2_shiny;
%rename(getModernShiny) pkmn::calculations::get_modern_shiny;
%rename(getGen2UnownForm) pkmn::calculations::get_gen2_unown_form;
%rename(getGen3UnownForm) pkmn::calculations::get_gen3_unown_form;
%rename(getWurmpleEvolution) pkmn::calculations::get_wurmple_evolution;
%rename(getTypeDamageMod) pkmn::calculations::get_type_damage_mod;
%rename(getBaseDamage) pkmn::calculations::get_base_damage;
%rename(getDamageRange) pkmn::calculations::get_damage_range;
%rename(getMinPossibleStat) pkmn::calculations::get_min_possible_stat;
%rename(getMaxPossibleStat) pkmn::calculations::get_max_possible_stat;
%rename(isStatPossible) pkmn::calculations::is_stat_possible;
%rename(getStatRange) pkmn::calculations::get_stat_range;

/*
 * pkmn/game_save.hpp
 */
%rename(GameSave) pkmn::game_save;
%rename(getGameID) pkmn::game_save::get_game_id;
%rename(getTrainer) pkmn::game_save::get_trainer;
%rename(getTrainerParty) pkmn::game_save::get_trainer_party;
%rename(setTrainerParty) pkmn::game_save::set_trainer_party;
%rename(getTrainerName) pkmn::game_save::get_trainer_name;
%rename(setTrainerName) pkmn::game_save::set_trainer_name;

/*
 * pkmn/io.hpp
 */
%rename(exportTo3GPKM) pkmn::io::export_to_3gpkm;
%rename(importFrom3GPKM) pkmn::io::import_from_3gpkm;
%rename(exportToPKM) pkmn::io::export_to_pkm;
%rename(importFromPKM) pkmn::io::import_from_pkm;
%rename(exportToPKX) pkmn::io::export_to_pkx;
%rename(importFromPKX) pkmn::io::import_from_pkx;
%rename(exportToPKSQL) pkmn::io::export_to_pksql;
%rename(importFromPKSQL) pkmn::io::import_from_pksql;

/*
 * pkmn/item.hpp
 */
%rename(Item) pkmn::item;
%rename(getGame) pkmn::item::get_game;
%rename(getGeneration) pkmn::item::get_generation;
%rename(getName) pkmn::item::get_name;
%rename(getDescription) pkmn::item::get_description;
%rename(getCategory) pkmn::item::get_category;
%rename(getGameIndex) pkmn::item::get_game_index;
%rename(getItemID) pkmn::item::get_item_id;
%rename(getCategoryID) pkmn::item::get_category_id;
%rename(getGameID) pkmn::item::get_game_id;

/*
 * pkmn/lists.hpp
 */
%rename(getGameList) pkmn::get_game_list;
%rename(getGameGroupList) pkmn::get_game_group_list;
%rename(getItemList) pkmn::get_item_list;
%rename(getPokemonList) pkmn::get_pokemon_list;
%rename(getTypeList) pkmn::get_type_list;
%rename(getAbilityList) pkmn::get_ability_list;
%rename(getNatureList) pkmn::get_nature_list;
%rename(getPokemonOfType) pkmn::get_pokemon_of_type;

/*
 * pkmn/move.hpp
 */
%rename(Move) pkmn::move;
%rename(getGame) pkmn::move::get_game;
%rename(getGeneration) pkmn::move::get_generation;
%rename(getName) pkmn::move::get_name;
%rename(getDescription) pkmn::move::get_description;
%rename(getType) pkmn::move::get_type;
%rename(getBasePower) pkmn::move::get_base_power;
%rename(getBasePP) pkmn::move::get_base_pp;
%rename(getMoveDamageClass) pkmn::move::get_move_damage_class;
%rename(getBaseAccuracy) pkmn::move::get_base_accuracy;
%rename(getEffect) pkmn::move::get_effect;
%rename(getEffectChance) pkmn::move::get_effect_chance;
%rename(getPriority) pkmn::move::get_priority;
%rename(getTarget) pkmn::move::get_target;
%rename(getMoveID) pkmn::move::get_move_id;
%rename(getTargetID) pkmn::move::get_target_id;
%rename(getGameID) pkmn::move::get_game_id;
%rename(getMoveDamageClassID) pkmn::move::get_move_damage_class_id;
%rename(getEffectID) pkmn::move::get_effect_id;

/*
 * pkmn/nature.hpp
 */
%rename(Nature) pkmn::nature;
%rename(getName) pkmn::nature::get_name;
%rename(getNatureID) pkmn::nature::get_nature_id;

/*
 * pkmn/paths.hpp
 */
%rename(GetAppdataPath) pkmn::get_appdata_path;
%rename(getDatabasePath) pkmn::get_database_path;
%rename(getImagesDir) pkmn::get_images_dir;
%rename(getTmpDir) pkmn::get_tmp_dir;

/*
 * pkmn/pocket.hpp
 */
%rename(Pocket) pkmn::pocket;
%rename(getGame) pkmn::pocket::get_game;
%rename(getGeneration) pkmn::pocket::get_generation;
%rename(getName) pkmn::pocket::get_name;
%rename(getSize) pkmn::pocket::get_size;
%rename(addItem) pkmn::pocket::add_item;
%rename(removeItem) pkmn::pocket::remove_item;
%rename(getItemAmount) pkmn::pocket::get_item_amount;
%rename(getItem) pkmn::pocket::get_item;
%rename(removeItem) pkmn::pocket::remove_item;
%rename(setItem) pkmn::pocket::set_item;
%rename(setAmount) pkmn::pocket::set_amount;
%rename(getGameID) pkmn::pocket::get_game_id;

/*
 * pkmn/team_pokemon.hpp
 */
%rename(TeamPokemon) pkmn::team_pokemon;
%rename(getGame) pkmn::team_pokemon::get_game;
%rename(getGeneration) pkmn::team_pokemon::get_generation;
%rename(getBasePokemon) pkmn::team_pokemon::get_base_pokemon;
%rename(getSpeciesName) pkmn::team_pokemon::get_species_name;
%rename(getNickname) pkmn::team_pokemon::get_nickname;
%rename(getTypes) pkmn::team_pokemon::get_types;
%rename(getBaseStats) pkmn::team_pokemon::get_base_stats;
%rename(setNickname) pkmn::team_pokemon::set_nickname;
%rename(getTrainerName) pkmn::team_pokemon::get_trainer_name;
%rename(getTrainerGender) pkmn::team_pokemon::get_trainer_gender;
%rename(getTrainerID) pkmn::team_pokemon::get_trainer_id;
%rename(getTrainerPublicID) pkmn::team_pokemon::get_trainer_public_id;
%rename(getTrainerSecretID) pkmn::team_pokemon::get_trainer_secret_id;
%rename(getBall) pkmn::team_pokemon::get_ball;
%rename(getMetLevel) pkmn::team_pokemon::get_met_level;
%rename(setTrainerName) pkmn::team_pokemon::set_trainer_name;
%rename(setTrainerGender) pkmn::team_pokemon::set_trainer_gender;
%rename(setTrainerID) pkmn::team_pokemon::set_trainer_id;
%rename(setTrainerPublicID) pkmn::team_pokemon::set_trainer_public_id;
%rename(setTrainerSecretID) pkmn::team_pokemon::set_trainer_secret_id;
%rename(setBall) pkmn::team_pokemon::set_ball;
%rename(setMetLevel) pkmn::team_pokemon::set_met_level;
%rename(getPersonality) pkmn::team_pokemon::get_personality;
%rename(getLevel) pkmn::team_pokemon::get_level;
%rename(getGender) pkmn::team_pokemon::get_gender;
%rename(getNature) pkmn::team_pokemon::get_nature;
%rename(getAbility) pkmn::team_pokemon::get_ability;
%rename(usingHiddenAbility) pkmn::team_pokemon::using_hidden_ability;
%rename(isShiny) pkmn::team_pokemon::is_shiny;
%rename(getStats) pkmn::team_pokemon::get_stats;
%rename(getEVs) pkmn::team_pokemon::get_EVs;
%rename(getIVs) pkmn::team_pokemon::get_IVs;
%rename(setPersonality) pkmn::team_pokemon::set_personality;
%rename(setLevel) pkmn::team_pokemon::set_level;
%rename(setNature) pkmn::team_pokemon::set_nature;
%rename(setAbility) pkmn::team_pokemon::set_ability;
%rename(setUsingHiddenAbility) pkmn::team_pokemon::set_using_hidden_ability;
%rename(setEV) pkmn::team_pokemon::set_EV;
%rename(setIV) pkmn::team_pokemon::set_IV;
%rename(getStatus) pkmn::team_pokemon::get_status;
%rename(getHeldItem) pkmn::team_pokemon::get_held_item;
%rename(setStatus) pkmn::team_pokemon::set_status;
%rename(setHeldItem) pkmn::team_pokemon::set_held_item;
%rename(getMove) pkmn::team_pokemon::get_move;
%rename(getMoves) pkmn::team_pokemon::get_moves;
%rename(getMovePP) pkmn::team_pokemon::get_move_PP;
%rename(getMovePPs) pkmn::team_pokemon::get_move_PPs;
%rename(setMove) pkmn::team_pokemon::set_move;
%rename(setMovePP) pkmn::team_pokemon::set_move_PP;
%rename(getAttribute) pkmn::team_pokemon::get_attribute;
%rename(getAttributes) pkmn::team_pokemon::get_attributes;
%rename(hasAttribute) pkmn::team_pokemon::has_attribute;
%rename(setAttribute) pkmn::team_pokemon::set_attribute;
%rename(getIconPath) pkmn::team_pokemon::get_icon_path;
%rename(getSpritePath) pkmn::team_pokemon::get_sprite_path;
%rename(setForm) pkmn::team_pokemon::set_form;
%rename(getFormID) pkmn::team_pokemon::get_form_id;
%rename(getGameID) pkmn::team_pokemon::get_game_id;
%rename(getPokemonID) pkmn::team_pokemon::get_pokemon_id;
%rename(getSpeciesID) pkmn::team_pokemon::get_species_id;
%rename(getAbtilityID) pkmn::team_pokemon::get_ability_id;
%rename(getItemID) pkmn::team_pokemon::get_item_id;
%rename(getNatureID) pkmn::team_pokemon::get_nature_id;

/*
 * pkmn/trainer.hpp
 */
%rename(Trainer) pkmn::trainer;
%rename(getGame) pkmn::trainer::get_game;
%rename(getGeneration) pkmn::trainer::get_generation;
%rename(getName) pkmn::trainer::get_name;
%rename(getMoney) pkmn::trainer::get_money;
%rename(getGender) pkmn::trainer::get_gender;
%rename(getID) pkmn::trainer::get_id;
%rename(getPublicID) pkmn::trainer::get_public_id;
%rename(getSecretID) pkmn::trainer::get_secret_id;
%rename(setName) pkmn::trainer::set_name;
%rename(setMoney) pkmn::trainer::set_money;
%rename(setGender) pkmn::trainer::set_gender;
%rename(setID) pkmn::trainer::set_id;
%rename(setPublicID) pkmn::trainer::set_public_id;
%rename(setSecretID) pkmn::trainer::set_secret_id;
%rename(getPokemon) pkmn::trainer::get_pokemon;
%rename(setPokemon) pkmn::trainer::set_pokemon;
%rename(removePokemon) pkmn::trainer::remove_pokemon;
%rename(getParty) pkmn::trainer::get_party;
%rename(setParty) pkmn::trainer::set_party;
%rename(getBag) pkmn::trainer::get_bag;
%rename(getGameID) pkmn::trainer::get_game_id;

/*
 * pkmn/database/lists.hpp
 */
%rename(getTableList) pkmn::database::get_table_list;
%rename(getColumnList) pkmn::database::get_column_list;

/*
 * pkmn/database/queries.hpp
 */
%rename(toDatabaseFormat) pkmn::database::to_database_format;
%rename(getAbilityID) pkmn::database::get_ability_id;
%rename(getAbilityName) pkmn::database::get_ability_name;
%rename(getDamageClass) pkmn::database::get_damage_class;
%rename(getEggGroupID) pkmn::database::get_egg_group_id;
%rename(getEggGroupName) pkmn::database::get_egg_group_name;
%rename(getGameID) pkmn::database::get_game_id;
%rename(getGameName) pkmn::database::get_game_name;
%rename(getGeneration) pkmn::database::get_generation;
%rename(getItemIndex) pkmn::database::get_item_index;
%rename(getItemDescription) pkmn::database::get_item_description;
%rename(getItemID) pkmn::database::get_item_id;
%rename(getItemName) pkmn::database::get_item_name;
%rename(getItemCategory) pkmn::database::get_item_category;
%rename(getMoveDescription) pkmn::database::get_move_description;
%rename(getMoveID) pkmn::database::get_move_id;
%rename(getMoveName) pkmn::database::get_move_name;
%rename(getNatureStatEffect) pkmn::database::get_nature_stat_effect;
%rename(getNatureID) pkmn::database::get_nature_id;
%rename(getNatureName) pkmn::database::get_nature_name;
%rename(getPokedexEntry) pkmn::database::get_pokedex_entry;
%rename(getPokemonID) pkmn::database::get_pokemon_id;
%rename(getMovePP) pkmn::database::get_move_pp;
%rename(getSpeciesID) pkmn::database::get_species_id;
%rename(getSpeciesIndex) pkmn::database::get_species_index;
%rename(getSpeciesName) pkmn::database::get_species_name;
%rename(getTypeID) pkmn::database::get_type_id;
%rename(getTypeName) pkmn::database::get_type_name;
%rename(getVersionGroup) pkmn::database::get_version_group;

/*
 * pkmn/types/pokemon_text.hpp
 */
%rename(PokemonText) pkmn::pokemon_text;

/*
 * pkmn/types/prng.hpp
 */
%rename(PRNG) pkmn::prng;
%rename(LCRNG) pkmn::prng::lcrng;
%rename(ARNG) pkmn::prng::arng;
%rename(MTRNG) pkmn::prng::mtrng;
