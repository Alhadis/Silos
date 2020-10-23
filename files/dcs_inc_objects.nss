// Item Materials
const int dcsMaterialUnknown     = 0;
const int dcsMaterialAdamantit   = 1;
const int dcsMaterialBrass       = 2;  // Messing
const int dcsMaterialBronze      = 3;
const int dcsMaterialCopper      = 6;
const int dcsMaterialGold        = 8;
const int dcsMaterialDarksteel   = 7;
const int dcsMaterialEisen       = 9;
const int dcsMaterialLead        = 10; //Blei
const int dcsMaterialMithral     = 11;
const int dcsMaterialPlatin      = 12;
const int dcsMaterialSilber      = 13;
const int dcsMaterialStahl       = 15;
const int dcsMaterialBone        = 16;// Knochen
const int dcsMaterialHide        = 17;// Tierhaut
const int dcsMaterialLeather     = 31;// Leder
const int dcsMaterialScale       = 32;// Schuppe
const int dcsMaterialCloth       = 33;// Tuch
const int dcsMaterialCotton      = 34;// Baumwolle
const int dcsMaterialSilk        = 35;// Seide
const int dcsMaterialWool        = 36;// Wolle
const int dcsMaterialWood        = 37;
const int dcsMaterialZalantar    = 40;// Schwarzholz, Zalantar
const int dcsMaterialEsche       = 41;
const int dcsMaterialEibe        = 42;
const int dcsMaterialEiche       = 43;
const int dcsMaterialKiefer      = 44;
const int dcsMaterialZeder       = 45;
const int dcsMaterialGlas        = 78;
const int dcsMaterialCrystalGlas = 79;
const int dcsMaterialBlaustahl   = 80;
const int dcsMaterialWeissgold   = 92;

// Item Qualities
const int dcsQualityUnknown      = 0;
const int dcsQualityDestroyed    = 1;
const int dcsQualityRuined       = 2;
const int dcsQualityVeryPoor     = 3;  // 80%
const int dcsQualityPoor         = 4;  // 75%
const int dcsQualityBelowAverage = 5;  // 60%
const int dcsQualityAverage      = 6;  // 55%
const int dcsQualityAboveAverage = 7;  // 50%
const int dcsQualityGood         = 8;  // 40%
const int dcsQualityVeryGood     = 9;  // 30%
const int dcsQualityExcellent    = 10; // 20%
const int dcsQualityMasterwork   = 11; // 15%
const int dcsQualityGodlike      = 12; // 5%

const int dcsQualityRaw          = 13;
const int dcsQualityCut          = 14;
const int dcsQualityPolished     = 15;

// Waffen
string dcsDagger         = "dcs_wpn_dagger";
string dcsDiremace       = "dcs_wpn_dmace";
string dcsDoubleaxe      = "dcs_wpn_dbleaxe";
string dcsGreataxe       = "dcs_wpn_2haxe";
string dcsGreatsword     = "dcs_wpn_2hsword";
string dcsHandaxe        = "dcs_wpn_handaxe";
string dcsLongsword      = "dcs_wpn_lsword";
string dcsMace           = "dcs_wpn_mace";
string dcsShortsword     = "dcs_wpn_ssword";
string dcsTwobladedsword = "dcs_wpn_dualbld";
string dcsKama           = "dcs_wpn_kama";
string dcsKukri          = "dcs_wpn_kukri";
string dcsKatana         = "dcs_wpn_katana";
string dcsClub           = "dcs_wpn_club";
string dcsWhip           = "dcs_wpn_whip";
string dcsSickle         = "dcs_wpn_sickle";
string dcsScimitar       = "dcs_wpn_scimit";
string dcsHalberd        = "dcs_wpn_halberd";
string dcsBattleaxe      = "dcs_wpn_batlaxe";
string dcsLighthammer    = "dcs_wpn_hamme_l";
string dcsWarhammer      = "dcs_wpn_hamme_h";
string dcsStaff          = "dcs_wpn_staff";
string dcsDwarvenwaraxe  = "dcs_wpn_dwaraxe";
string dcsLightflail     = "dcs_wpn_flail_l";
string dcsHeavyflail     = "dcs_wpn_flail_h";
string dcsMorningstar    = "dcs_wpn_morstar";
string dcsSpear          = "dcs_wpn_spear";
string dcsScythe         = "dcs_wpn_scythe";
string dcsBastardsword   = "dcs_wpn_bastswr";
string dcsRapier         = "dcs_wpn_rapier";
string dcsShortbow       = "dcs_wpn_shrtbow";
string dcsLongbow        = "dcs_wpn_longbow";
string dcsSlingshot      = "dcs_wpn_sling";
string dcsLightcrossbow  = "dcs_wpn_xbow_l";
string dcsHeavycrossbow  = "dcs_wpn_xbow_h";
string dcsZauberstecken  = "dcs_spellstaff";

// Munition
string dcsAmmoBullet     = "dcs_ammo_bullet";

// crafting gloves: special items
string dcsCraftingGlovesB  = "dcs_craftglv_b";
string dcsCraftingGlovesM  = "dcs_craftglv_m";
string dcsCraftingGlovesG  = "dcs_craftglv_g";

// Recipe initializer
string dcsRecipeInit       = "dcs_recipe_init";

string dcsEmpty            = "-";

/******************************************************************************/
/*                                SCHMIED                                     */
/******************************************************************************/

// Munition
string dcsAmmoBolt       = "dcs_ammo_bolt";
string dcsAmmoShuriken   = "dcs_wpn_shuriken";
string dcsAmmoThrowAxe   = "dcs_wpn_wbeil";

// Ruestungen
string dcsKettenruestung = "nw_aarcl003";
string dcsSchuppenpanzer = "nw_aarcl004";
string dcsBrustplatte    = "nw_aarcl011";
string dcsRitterruestung = "nw_aarcl007";

//Schmiedeholz
string dcsForgeWood        = "dcs_forge_wood";
string dcsHolzkohle        = "dcs_bar_coal_01";
string dcsEisenkohle       = "dcs_bar_coal_02";
string dcsCyrilkohle       = "dcs_bar_coal_03";
string dcsSchleifstein     = "dcs_misc_whetst";

// Klingen
string dcsKlingeBronzeS    = "dcs_bld_bron_s";
string dcsKlingeBronzeL    = "dcs_bld_bron_l";
string dcsKlingeStahlS     = "dcs_bld_steel_s";
string dcsKlingeStahlL     = "dcs_bld_steel_l";
string dcsKlingeBlaustahlS = "dcs_bld_bsthl_s";
string dcsKlingeBlaustahlL = "dcs_bld_bsthl_l";
string dcsKlingeAdamantitS = "dcs_bld_adam_s";
string dcsKlingeAdamantitL = "dcs_bld_adam_l";
string dcsKlingePlatinS    = "dcs_bld_plat_s";
string dcsKlingePlatinL    = "dcs_bld_plat_l";
string dcsKlingeMithralS   = "dcs_bld_mith_s";
string dcsKlingeMithralL   = "dcs_bld_mith_l";

// Axtkoepfe
string dcsAxtkopfBronze       = "dcs_axehd_bron";
string dcsAxtkopfStahl        = "dcs_axehd_steel";
string dcsAxtkopfBlaustahl    = "dcs_axehd_bstl";
string dcsAxtkopfAdamantit    = "dcs_axehd_adam";
string dcsAxtkopfPlatin       = "dcs_axehd_plat";
string dcsAxtkopfMithral      = "dcs_axehd_mith";

// Hammerkoepfe
string dcsHammerkopfBronze    = "dcs_hamhd_bron";
string dcsHammerkopfStahl     = "dcs_hamhd_steel";
string dcsHammerkopfBlaustahl = "dcs_hamhd_bstl";
string dcsHammerkopfAdamantit = "dcs_hamhd_adam";
string dcsHammerkopfPlatin    = "dcs_hamhd_plat";
string dcsHammerkopfMithral   = "dcs_hamhd_mith";

// Metallplatten
string dcsPlatteBronze      = "dcs_plate_bron";
string dcsPlatteStahl       = "dcs_plate_steel";
string dcsPlatteBlaustahl   = "dcs_plate_bstl";
string dcsPlatteAdamantit   = "dcs_plate_adam";
string dcsPlattePlatin      = "dcs_plate_plat";
string dcsPlatteMithral     = "dcs_plate_mith";

// Schulterplatten
string dcsSchulterplatteBronze     = "dcs_pauld_bron";
string dcsSchulterplatteStahl      = "dcs_pauld_steel";
string dcsSchulterplatteBlaustahl  = "dcs_pauld_bstl";
string dcsSchulterplatteAdamantit  = "dcs_pauld_adam";
string dcsSchulterplattePlatin     = "dcs_pauld_plat";
string dcsSchulterplatteMithral    = "dcs_pauld_mith";

// Kettenpanzer
string dcsKettenpanzerBronze      = "dcs_chapa_bron";
string dcsKettenpanzerStahl       = "dcs_chapa_steel";
string dcsKettenpanzerBlaustahl   = "dcs_chapa_bstl";
string dcsKettenpanzerAdamantit   = "dcs_chapa_adam";
string dcsKettenpanzerPlatin      = "dcs_chapa_plat";
string dcsKettenpanzerMithral     = "dcs_chapa_mith";

// Brustpanzer
string dcsBrustpanzerBronze      = "dcs_brepa_bron";
string dcsBrustpanzerStahl       = "dcs_brepa_steel";
string dcsBrustpanzerBlaustahl   = "dcs_brepa_bstl";
string dcsBrustpanzerAdamantit   = "dcs_brepa_adam";
string dcsBrustpanzerPlatin      = "dcs_brepa_plat";
string dcsBrustpanzerMithral     = "dcs_brepa_mith";

// Verhaerteder Brustpanzer
string dcsHBrustpanzerBronze      = "dcs_brepa2_bron";
string dcsHBrustpanzerStahl       = "dcs_brepa2_steel";
string dcsHBrustpanzerBlaustahl   = "dcs_brepa2_bstl";
string dcsHBrustpanzerAdamantit   = "dcs_brepa2_adam";
string dcsHBrustpanzerPlatin      = "dcs_brepa2_plat";
string dcsHBrustpanzerMithral     = "dcs_brepa2_mith";

// Pfeilspitzen
string dcsPfeilspitzenBronze       = "dcs_arrbld_bron";
string dcsPfeilspitzenStahl        = "dcs_arrbld_steel";
string dcsPfeilspitzenBlaustahl    = "dcs_arrbld_bsthl";
string dcsPfeilspitzenAdamantit    = "dcs_arrbld_adam";
string dcsPfeilspitzenPlatin       = "dcs_arrbld_plat";
string dcsPfeilspitzenMithral      = "dcs_arrbld_mith";


/******************************************************************************/
/*                                SCHREINER                                   */
/******************************************************************************/

// Munition
string dcsAmmoArrow      = "dcs_ammo_arrow";

// Schilde
string dcsSmallShield    = "dcs_shld_small";
string dcsLargeShield    = "dcs_shld_large";
string dcsTowerShield    = "dcs_shld_tower";

// Ueberreste
string dcsRemainsEsche     = "dcs_remains_esch";
string dcsRemainsEibe      = "dcs_remains_eibe";
string dcsRemainsEiche     = "dcs_remains_eich";
string dcsRemainsKiefer    = "dcs_remains_kief";
string dcsRemainsZeder     = "dcs_remains_zede";
string dcsRemainsZalantar  = "dcs_remains_zala";

// Rinde
string dcsRindeEsche       = "dcs_bark_esch";
string dcsRindeEibe        = "dcs_bark_eibe";
string dcsRindeEiche       = "dcs_bark_eich";
string dcsRindeKiefer      = "dcs_bark_kief";
string dcsRindeZeder       = "dcs_bark_zede";
string dcsRindeZalantar    = "dcs_bark_zala";

// Holz
string dcsWoodEsche       = "dcs_wood_esche";
string dcsWoodEibe        = "dcs_wood_eibe";
string dcsWoodEiche       = "dcs_wood_eiche";
string dcsWoodKiefer      = "dcs_wood_kiefer";
string dcsWoodZeder       = "dcs_wood_zeder";
string dcsWoodZalantar    = "dcs_wood_zalan";

// Balken
string dcsBrettEsche     = "dcs_bar_esche";
string dcsBrettEibe      = "dcs_bar_eibe";
string dcsBrettEiche     = "dcs_bar_eiche";
string dcsBrettKiefer    = "dcs_bar_kief";
string dcsBrettZeder     = "dcs_bar_zeder";
string dcsBrettZalantar  = "dcs_bar_zalan";

// Griffe
string dcsHiltEsche       = "dcs_hilt_esche";
string dcsHiltEiche       = "dcs_hilt_eiche";
string dcsHiltEibe        = "dcs_hilt_eibe";
string dcsHiltKiefer      = "dcs_hilt_kief";
string dcsHiltZeder       = "dcs_hilt_zeder";
string dcsHiltZalantar    = "dcs_hilt_zalan";

// Schaefte
string dcsHandleEsche     = "dcs_handle_esch";
string dcsHandleEiche     = "dcs_handle_eich";
string dcsHandleEibe      = "dcs_handle_eibe";
string dcsHandleKiefer    = "dcs_handle_kief";
string dcsHandleZeder     = "dcs_handle_zeder";
string dcsHandleZalantar  = "dcs_handle_zalan";

// Staebe
string dcsStaffEsche      = "dcs_staff_esche";
string dcsStaffEiche      = "dcs_staff_eiche";
string dcsStaffEibe       = "dcs_staff_eibe";
string dcsStaffKiefer     = "dcs_staff_kiefer";
string dcsStaffZeder      = "dcs_staff_zeder";
string dcsStaffZalantar   = "dcs_staff_zalan";

// Bogenschaefte
string dcsBowhiltEsche    = "dcs_bhlt_esch";
string dcsBowhiltEiche    = "dcs_bhlt_eich";
string dcsBowhiltEibe     = "dcs_bhlt_eibe";
string dcsBowhiltKiefer   = "dcs_bhlt_kief";
string dcsBowhiltZeder    = "dcs_bhlt_zeder";
string dcsBowhiltZalantar = "dcs_bhlt_zalan";

// Armbruststoecke
string dcsXBowhiltEsche    = "dcs_xblt_esch";
string dcsXBowhiltEiche    = "dcs_xblt_eich";
string dcsXBowhiltEibe     = "dcs_xblt_eibe";
string dcsXBowhiltKiefer   = "dcs_xblt_kief";
string dcsXBowhiltZeder    = "dcs_xblt_zeder";
string dcsXBowhiltZalantar = "dcs_xblt_zalan";

// Sehnen
string dcsStringWeak       = "dcs_string_weak";
string dcsStringNormal     = "dcs_string_norm";
string dcsStringStrong     = "dcs_string_strk";

// Schildkoerper
string dcsSchildbasisEsche    = "dcs_shbod_esche";
string dcsSchildbasisEiche    = "dcs_shbod_eiche";
string dcsSchildbasisEibe     = "dcs_shbod_eibe";
string dcsSchildbasisKiefer   = "dcs_shbod_kiefer";
string dcsSchildbasisZeder    = "dcs_shbod_zeder";
string dcsSchildbasisZalantar = "dcs_shbod_zalan";

// Pfeilstaebe
string dcsPfeilstaebeEsche        = "dcs_arrstf_esch";
string dcsPfeilstaebeEibe         = "dcs_arrstf_eibe";
string dcsPfeilstaebeEiche        = "dcs_arrstf_eich";
string dcsPfeilstaebeKiefer       = "dcs_arrstf_kief";
string dcsPfeilstaebeZeder        = "dcs_arrstf_zede";
string dcsPfeilstaebeZalantar     = "dcs_arrstf_zala";

/******************************************************************************/
/*                               SCHMELZER                                    */
/******************************************************************************/

// Ueberreste
string dcsRemainsBronze    = "dcs_remains_bron";
string dcsRemainsStahl     = "dcs_remains_stel";
string dcsRemainsBlaustahl = "dcs_remains_bstl";
string dcsRemainsAdamantit = "dcs_remains_adam";
string dcsRemainsPlatin    = "dcs_remains_plat";
string dcsRemainsMithral   = "dcs_remains_mith";
string dcsRemainsSilber    = "dcs_remains_silv";
string dcsRemainsGold      = "dcs_remains_gold";
string dcsRemainsWeissgold = "dcs_remains_wgol";

// Erze
string dcsErzZinn         = "dcs_ore_tin";
string dcsErzKupfer       = "dcs_ore_copper";
string dcsErzEisen        = "dcs_ore_iron";
string dcsErzBlaueisen    = "dcs_ore_bsteel";
string dcsErzAdamantit    = "dcs_ore_adamand";
string dcsErzPlatin       = "dcs_ore_platin";
string dcsErzMithral      = "dcs_ore_mithral";
string dcsErzSilber       = "dcs_ore_silver";
string dcsErzGold         = "dcs_ore_gold";

// Barren
string dcsBarrenEisen        = "dcs_bar_iron";
string dcsBarrenBronze       = "dcs_bar_bron";
string dcsBarrenStahl        = "dcs_bar_steel";
string dcsBarrenBlaustahl    = "dcs_bar_bsteel";
string dcsBarrenAdamantit    = "dcs_bar_adamand";
string dcsBarrenPlatin       = "dcs_bar_platin";
string dcsBarrenMithral      = "dcs_bar_mithral";
string dcsBarrenSilber       = "dcs_bar_silver";
string dcsBarrenGold         = "dcs_bar_gold";
string dcsBarrenWeissgold    = "dcs_bar_wgold";

// Gussformen
string dcsGussformBronze    = "dcs_gussform_01";
string dcsGussformStahl     = "dcs_gussform_02";
string dcsGussformBlaustahl = "dcs_gussform_03";
string dcsGussformAdamantit = "dcs_gussform_04";
string dcsGussformPlatin    = "dcs_gussform_05";
string dcsGussformMithral   = "dcs_gussform_06";
string dcsGussformSilber    = "dcs_gussform_07";
string dcsGussformGold      = "dcs_gussform_08";
string dcsGussformWeissgold = "dcs_gussform_09";

// Kleine Klingenrohlinge
string dcsRohlingSBronze    = "dcs_bblds_bron";
string dcsRohlingSStahl     = "dcs_bblds_steel";
string dcsRohlingSBlaustahl = "dcs_bblds_bstl";
string dcsRohlingSAdamantit = "dcs_bblds_adam";
string dcsRohlingSPlatin    = "dcs_bblds_plat";
string dcsRohlingSMithral   = "dcs_bblds_mith";

// Grosse Klingenrohlinge
string dcsRohlingLBronze    = "dcs_bbldl_bron";
string dcsRohlingLStahl     = "dcs_bbldl_steel";
string dcsRohlingLBlaustahl = "dcs_bbldl_bstl";
string dcsRohlingLAdamantit = "dcs_bbldl_adam";
string dcsRohlingLPlatin    = "dcs_bbldl_plat";
string dcsRohlingLMithral   = "dcs_bbldl_mith";

// Axtkopfrohlinge
string dcsBlankAxeHeadBronze    = "dcs_baxhd_bron";
string dcsBlankAxeHeadStahl     = "dcs_baxhd_steel";
string dcsBlankAxeHeadBlaustahl = "dcs_baxhd_bsthl";
string dcsBlankAxeHeadAdamantit = "dcs_baxhd_adam";
string dcsBlankAxeHeadPlatin    = "dcs_baxhd_plat";
string dcsBlankAxeHeadMithral   = "dcs_baxhd_mith";

// Kugeln
string dcsKugelBronze     = "dcs_bowl_bron";
string dcsKugelStahl      = "dcs_bowl_steel";
string dcsKugelBlaustahl  = "dcs_bowl_bsteel";
string dcsKugelAdamantit  = "dcs_bowl_adam";
string dcsKugelPlatin     = "dcs_bowl_plat";
string dcsKugelMithral    = "dcs_bowl_mith";

// Nägel
string dcsNagelBronze     = "dcs_spik_bron";
string dcsNagelStahl      = "dcs_spik_steel";
string dcsNagelBlaustahl  = "dcs_spik_bsteel";
string dcsNagelAdamantit  = "dcs_spik_adam";
string dcsNagelPlatin     = "dcs_spik_plat";
string dcsNagelMithral    = "dcs_spik_mith";

// Kettenringe
string dcsRingBronze      = "dcs_ring_bron";
string dcsRingStahl       = "dcs_ring_steel";
string dcsRingBlaustahl   = "dcs_ring_bsthl";
string dcsRingAdamantit   = "dcs_ring_adam";
string dcsRingPlatin      = "dcs_ring_plat";
string dcsRingMithral     = "dcs_ring_mith";

// Metallverzierungen
string dcsVerzierungBronze        = "dcs_deko_bron";
string dcsVerzierungStahl         = "dcs_deko_steel";
string dcsVerzierungBlaustahl     = "dcs_deko_bsthl";
string dcsVerzierungAdamantit     = "dcs_deko_adam";
string dcsVerzierungPlatin        = "dcs_deko_plat";
string dcsVerzierungMithral       = "dcs_deko_mith";

// Draht
string dcsDrahtSilber             = "dcs_wire_silv";
string dcsDrahtGold               = "dcs_wire_gold";
string dcsDrahtWeissgold          = "dcs_wire_wgol";
string dcsDrahtPlatin             = "dcs_wire_plat";
string dcsDrahtMithral            = "dcs_wire_mith";

// Ringrohling
string dcsRingrohlingSilber    = "dcs_rring_silv";
string dcsRingrohlingGold      = "dcs_rring_gold";
string dcsRingrohlingWeissgold = "dcs_rring_wgol";
string dcsRingrohlingPlatin    = "dcs_rring_plat";
string dcsRingrohlingMithral   = "dcs_rring_mith";

/******************************************************************************/
/*                               ALCHEMIST                                    */
/******************************************************************************/

// Flaschen
string dcsBottleGlas       = "dcs_bottle_low";
string dcsBottleCrystal    = "dcs_bottle_high";

// Tränke / Elixiere
string dcsPotMightBarkskin      = "dcs_pot_mbark";
string dcsPotHarm               = "dcs_pot_harm";
string dcsPotEasyTradeskill     = "dcs_pot_trade_ea";
string dcsPotAverageTradeskill  = "dcs_pot_trade_av";
string dcsPotAbsoluteTradeskill = "dcs_pot_trade_bs";
string dcsHerzDestillat         = "dcs_pot_destil";

string dcsElixHaste             = "dcs_elx_haste";
string dcsElixMightHaste        = "dcs_elx_mhaste";
string dcsElixPerfectChance     = "dcs_elx_pchance";

// Edelsteinpolituren
string dcsEdelsteinpoliturA     = "dcs_pot_polish";
string dcsEdelsteinpoliturB     = "dcs_pot_polish_b";

// Kraeuter 1
string dcsLabelie          = "dcs_herb_label";
string dcsSensengras       = "dcs_herb_sens";
string dcsKleeNormal       = "dcs_herb_kleen";
string dcsRedBluster       = "dcs_mush_redblus";
string dcsIntarakraut      = "dcs_herb_intara";
string dcsKaloskraut       = "dcs_herb_kalos";
string dcsFingerhut        = "dcs_herb_fhat";
string dcsLunasipflanze    = "dcs_herb_hlplant";

// Kraeuter 2
string dcsUkaWurzel        = "dcs_root_uka";
string dcsYelBluster       = "dcs_mush_yelblus";
string dcsSchuemling       = "dcs_mush_schuem";
string dcsHasenfarn        = "dcs_herb_hasfarn";
string dcsSichelwurzel     = "dcs_root_sickle";
string dcsEtalaspflanze    = "dcs_herb_hlkraut";

// Kraeuter 3
string dcsPaleBluster      = "dcs_mush_blcblus";
string dcsKleeVier         = "dcs_herb_kleev";
string dcsAntiras          = "dcs_herb_antir";
string dcsZezloughWurzel   = "dcs_root_zezl";
string dcsRusariaWurzel    = "dcs_herb_hlroot";
string dcsTsandersol       = "dcs_herb_tsan";

// Misc
string dcsHerzWDrache       = "dcs_misc_wdrgh";
string dcsHerzTroco         = "dcs_misc_trocoh";
string dcsHerzSala          = "dcs_misc_salahea";
string dcsHerzFeuerele      = "dcs_misc_feures";
string dcsHerzChaggrin      = "dcs_misc_chagher";
string dcsHerzOsyluth       = "dcs_misc_erdess";
string dcsHerzEisele        = "dcs_misc_iceess";
string dcsHerzBodak         = "dcs_misc_airess";
string dcsHerzMisthu        = "dcs_misc_mihshea";
string dcsBlutRiesen        = "dcs_bld_giant";
string dcsBlutSchlangen     = "dcs_bld_snake";
string dcsBlutAsabi         = "dcs_bld_asabi";
string dcsHornMino          = "dcs_misc_minhorn";
string dcsHornTrelon        = "dcs_misc_garhorn";
string dcsMumienbinde       = "dcs_misc_muband";
string dcsMumienhand        = "dcs_misc_mumhnd";
string dcsTailSchaedrat     = "dcs_misc_sratta";
string dcsKnochenmehl       = "dcs_misc_bonmeal";
string dcsHirnDuergar       = "dcs_misc_durhirn";
string dcsHirnwasserDuergar = "dcs_misc_duehwas";
string dcsKnochenVorlan     = "dcs_misc_vorbone";
string dcsFluegelVarg       = "dcs_misc_varwing";
string dcsFluegelMuecke     = "dcs_misc_mckwing";
string dcsSpinnenbein       = "dcs_misc_spidleg";
string dcsNekroplasma       = "dcs_misc_nekplas";
string dcsSchuppeSumpf      = "dcs_misc_sumechs";
string dcsSchuppeSahuagin   = "dcs_misc_trocshp";
string dcsSchuppeYuanTi     = "dcs_misc_yutishp";
string dcsSchuppeBlauDrache = "dcs_misc_bdrgshp";
string dcsAugeSphinx        = "dcs_misc_spheye";
string dcsAugeMechanus      = "dcs_misc_mecheye";
string dcsAugeBetrachter    = "dcs_misc_behdeye";
string dcsFellEisschrat     = "dcs_misc_esrhaut";
string dcsFellSchakal       = "dcs_misc_schkfel";
string dcsEssenzWundensuch  = "dcs_misc_esswsek";
string dcsEssenzLavagolem   = "dcs_misc_lavess";
string dcsZungeYagnoloth    = "dcs_misc_yagnton";
string dcsStachelSkorpion   = "dcs_misc_stsonns";
string dcsSplitterGolem     = "dcs_misc_golsplt";
string dcsWeihwasser        = "dcs_misc_weih";
string dcsHautSchlange      = "dcs_misc_snkskin";
string dcsHautFluegelGDrach = "dcs_misc_skf_gdr";
string dcsIllithTentakel    = "dcs_misc_illtent";
string dcsChitinTiefen      = "dcs_misc_chit_tu";
/******************************************************************************/
/*                               VERZAUBERER                                  */
/******************************************************************************/

string dcsKoecher               = "koecher";

// Stabilisierungskristalle
string dcsStabilKristallSmall   = "dcs_encrys_small";
string dcsStabilKristallLarge   = "dcs_encrys_large";

// Verzauberungspulver
string dcsVerzPulverA           = "dcs_ench_pulv_a";
string dcsVerzPulverB           = "dcs_ench_pulv_b";
string dcsVerzPulverC           = "dcs_ench_pulv_c";

// Verzauberungsessenzen
string dcsVerzEssenzA           = "dcs_ench_ess_a";
string dcsVerzEssenzB           = "dcs_ench_ess_b";
string dcsVerzEssenzC           = "dcs_ench_ess_c";

// Elementaressenzen
string dcsEssenzSchallM         = "dcs_mess_schall";
string dcsEssenzEisM            = "dcs_mess_eis";
string dcsEssenzFeuerM          = "dcs_mess_feuer";
string dcsEssenzBlitzM          = "dcs_mess_blitz";
string dcsEssenzSaeureM         = "dcs_mess_saeure";

// Munitionscontainer
string dcsContArrow             = "dcs_amc_quiver";
string dcsContBolt              = "dcs_amc_bquiver";
string dcsContBullet            = "dcs_amc_bbox";
string dcsContShuriken          = "dcs_amc_shuriken";
string dcsContThrowaxe          = "dcs_amc_throwaxe";

/******************************************************************************/
/*                              GOLDSCHMIED                                   */
/******************************************************************************/

// Rohedelsteine
string dcsEdelsteinBernsteinRaw    = "dcs_gem_bern_1";
string dcsEdelsteinMorganitRaw     = "dcs_gem_morg_1";
string dcsEdelsteinOpalRaw         = "dcs_gem_opal_1";
string dcsEdelsteinRosenquarzRaw   = "dcs_gem_rosq_1";
string dcsEdelsteinAventurinRaw    = "dcs_gem_aven_1";
string dcsEdelsteinTansanitRaw     = "dcs_gem_tans_1";
string dcsEdelsteinLapislazuliRaw  = "dcs_gem_lapi_1";
string dcsEdelsteinAchatRaw        = "dcs_gem_acha_1";
string dcsEdelsteinMalachitRaw     = "dcs_gem_mala_1";
string dcsEdelsteinTopasRaw        = "dcs_gem_topa_1";
string dcsEdelsteinCitrinRaw       = "dcs_gem_citr_1";
string dcsEdelsteinOnyxRaw         = "dcs_gem_schw_1";
string dcsEdelsteinHimmelssteinRaw = "dcs_gem_himm_1";

//Geschliffene Edelsteine
string dcsEdelsteinBernsteinCut    = "dcs_gem_bern_2a";
string dcsEdelsteinMorganitCut     = "dcs_gem_morg_2a";
string dcsEdelsteinOpalCut         = "dcs_gem_opal_2a";
string dcsEdelsteinRosenquarzCut   = "dcs_gem_rosq_2a";
string dcsEdelsteinAventurinCut    = "dcs_gem_aven_2a";
string dcsEdelsteinTansanitCut     = "dcs_gem_tans_2a";
string dcsEdelsteinLapislazuliCut  = "dcs_gem_lapi_2a";
string dcsEdelsteinAchatCut        = "dcs_gem_acha_2a";
string dcsEdelsteinMalachitCut     = "dcs_gem_mala_2a";
string dcsEdelsteinTopasCut        = "dcs_gem_topa_2a";
string dcsEdelsteinCitrinCut       = "dcs_gem_citr_2a";
string dcsEdelsteinOnyxCut         = "dcs_gem_schw_2a";
string dcsEdelsteinHimmelssteinCut = "dcs_gem_himm_2a";

//Ausgezeichnete Geschliffene Edelsteine
string dcsEdelsteinBernsteinCutAv    = "dcs_gem_bern_2b";
string dcsEdelsteinMorganitCutAv     = "dcs_gem_morg_2b";
string dcsEdelsteinOpalCutAv         = "dcs_gem_opal_2b";
string dcsEdelsteinRosenquarzCutAv   = "dcs_gem_rosq_2b";
string dcsEdelsteinAventurinCutAv    = "dcs_gem_aven_2b";
string dcsEdelsteinTansanitCutAv     = "dcs_gem_tans_2b";
string dcsEdelsteinLapislazuliCutAv  = "dcs_gem_lapi_2b";
string dcsEdelsteinAchatCutAv        = "dcs_gem_acha_2b";
string dcsEdelsteinMalachitCutAv     = "dcs_gem_mala_2b";
string dcsEdelsteinTopasCutAv        = "dcs_gem_topa_2b";
string dcsEdelsteinCitrinCutAv       = "dcs_gem_citr_2b";
string dcsEdelsteinOnyxCutAv         = "dcs_gem_schw_2b";
string dcsEdelsteinHimmelssteinCutAv = "dcs_gem_himm_2b";

// Edelsteine
string dcsEdelsteinBernstein         = "dcs_gem_bern_3a";
string dcsEdelsteinMorganit          = "dcs_gem_morg_3a";
string dcsEdelsteinOpal              = "dcs_gem_opal_3a";
string dcsEdelsteinRosenquarz        = "dcs_gem_rosq_3a";
string dcsEdelsteinAventurin         = "dcs_gem_aven_3a";
string dcsEdelsteinTansanit          = "dcs_gem_tans_3a";
string dcsEdelsteinLapislazuli       = "dcs_gem_lapi_3a";
string dcsEdelsteinAchat             = "dcs_gem_acha_3a";
string dcsEdelsteinMalachit          = "dcs_gem_mala_3a";
string dcsEdelsteinTopas             = "dcs_gem_topa_3a";
string dcsEdelsteinCitrin            = "dcs_gem_citr_3a";
string dcsEdelsteinOnyx              = "dcs_gem_schw_3a";
string dcsEdelsteinHimmelsstein      = "dcs_gem_himm_3a";

//Ausgezeichnete Edelsteine
string dcsEdelsteinBernsteinAv       = "dcs_gem_bern_3b";
string dcsEdelsteinMorganitAv        = "dcs_gem_morg_3b";
string dcsEdelsteinOpalAv            = "dcs_gem_opal_3b";
string dcsEdelsteinRosenquarzAv      = "dcs_gem_rosq_3b";
string dcsEdelsteinAventurinAv       = "dcs_gem_aven_3b";
string dcsEdelsteinTansanitAv        = "dcs_gem_tans_3b";
string dcsEdelsteinLapislazuliAv     = "dcs_gem_lapi_3b";
string dcsEdelsteinAchatAv           = "dcs_gem_acha_3b";
string dcsEdelsteinMalachitAv        = "dcs_gem_mala_3b";
string dcsEdelsteinTopasAv           = "dcs_gem_topa_3b";
string dcsEdelsteinCitrinAv          = "dcs_gem_citr_3b";
string dcsEdelsteinOnyxAv            = "dcs_gem_schw_3b";
string dcsEdelsteinHimmelssteinAv    = "dcs_gem_himm_3b";

// Kettenglied
string dcsKettengliedSilber    = "dcs_cgl_silv";
string dcsKettengliedGold      = "dcs_cgl_gold";
string dcsKettengliedWeissgold = "dcs_cgl_wgol";
string dcsKettengliedPlatin    = "dcs_cgl_plat";
string dcsKettengliedMithral   = "dcs_cgl_mith";

// Verschluss
string dcsVerschlussSilber    = "dcs_sht_silv";
string dcsVerschlussGold      = "dcs_sht_gold";
string dcsVerschlussWeissgold = "dcs_sht_wgol";
string dcsVerschlussPlatin    = "dcs_sht_plat";
string dcsVerschlussMithral   = "dcs_sht_mith";

// Anhaenger
string dcsAnhaengerSilber    = "dcs_pdt_silv";
string dcsAnhaengerGold      = "dcs_pdt_gold";
string dcsAnhaengerWeissgold = "dcs_pdt_wgol";
string dcsAnhaengerPlatin    = "dcs_pdt_plat";
string dcsAnhaengerMithral   = "dcs_pdt_mith";

// Ringe
string dcsERingSilber     = "dcs_ering_silv";
string dcsERingGold       = "dcs_ering_gold";
string dcsERingWeissgold  = "dcs_ering_wgol";
string dcsERingPlatin     = "dcs_ering_plat";
string dcsERingMithral    = "dcs_ering_mith";

// Amulette
string dcsEAmulettSilber     = "dcs_eamu_silv";
string dcsEAmulettGold       = "dcs_eamu_gold";
string dcsEAmulettWeissgold  = "dcs_eamu_wgol";
string dcsEAmulettPlatin     = "dcs_eamu_plat";
string dcsEAmulettMithral    = "dcs_eamu_mith";

/******************************************************************************/
/*                               ANDERES                                      */
/******************************************************************************/
// Animationsobjekte
string dcsAnimBottleA           = "dcs_bottle_anim1";
string dcsAnimBottleB           = "dcs_bottle_anim2";

string dcsRandomAll             = "dcs_rall";
string dcsRandomArmor           = "dcs_rar";
string dcsRandomArmorShield     = "dcs_rarsd";
string dcsRandomArmorWeapon     = "dcs_rarwp";
string dcsRandomContainer       = "dcs_rbox";
string dcsRandomEquip           = "dcs_req";
string dcsRandomMelee           = "dcs_rme";
string dcsRandomMiscItem        = "dcs_rit";
string dcsRandomRanged          = "dcs_rran";
string dcsRandomWeapon          = "dcs_rwpn";
string dcsRandomSocketJew       = "dcs_rsjw";
string dcsRandomGem             = "dcs_rgm";

/******************************************************************************/
/*                              GENERAL FUNCTIONS                             */
/******************************************************************************/

// * Stores a local float on oTarget
void SetInternFloat(string sSwitch, float fValue, object oTarget=OBJECT_SELF);
void SetInternFloat(string sSwitch, float fValue, object oTarget=OBJECT_SELF)
{
    SetLocalFloat(oTarget, sSwitch, fValue);
}

// * Stores a local string on oTarget
void SetInternString(string sSwitch, string sValue, object oTarget=OBJECT_SELF);
void SetInternString(string sSwitch, string sValue, object oTarget=OBJECT_SELF)
{
    SetLocalString(oTarget, sSwitch, sValue);
}

// * Returns a local float from oTarget
float GetInternFloat(string sSwitch, object oTarget=OBJECT_SELF);
float GetInternFloat(string sSwitch, object oTarget=OBJECT_SELF)
{
    return GetLocalFloat(oTarget, sSwitch);
}

// * Returns a local string from oTarget
string GetInternString(string sSwitch, object oTarget=OBJECT_SELF);
string GetInternString(string sSwitch, object oTarget=OBJECT_SELF)
{
    return GetLocalString(oTarget, sSwitch);
}

   /*
    SetItemName(dcsForgeWood,      "Feuerholz");
    SetItemName(dcsHolzkohle,      "Holzkohle");
    SetItemName(dcsEisenkohle,     "Eisenkohle");
    SetItemName(dcsCyrilkohle,     "Cyrilkohle");
    SetItemName(dcsSchleifstein,   "Schleifstein");

    SetItemName(dcsBarrenBronze,    "Bronzebarren");
    SetItemName(dcsBarrenStahl,     "Stahlbarren");
    SetItemName(dcsBarrenBlaustahl, "Blaustahlbarren");
    SetItemName(dcsBarrenAdamantit, "Adamantitbarren");
    SetItemName(dcsBarrenPlatin,    "Platinbarren", "<cþþ>");
    SetItemName(dcsBarrenMithral,   "Mithralbarren", "<cýöp>");
    SetItemName(dcsBarrenSilber,    "Silberbarren");
    SetItemName(dcsBarrenGold,      "Goldbarren");
    SetItemName(dcsBarrenWeissgold, "Weissgoldbarren");

    SetItemName(dcsHiltEsche,     "Eschenholzgriff");
    SetItemName(dcsHiltEibe,      "Eibenholzgriff");
    SetItemName(dcsHiltEiche,     "Eichenholzgriff");
    SetItemName(dcsHiltKiefer,    "Kieferholzgriff");
    SetItemName(dcsHiltZeder,     "Zederholzgriff", "<cþþ>");
    SetItemName(dcsHiltZalantar,  "Zalantarholzgriff", "<cýöp>");

    SetItemName(dcsHandleEsche,   "Eschenholzschaft");
    SetItemName(dcsHandleEibe,    "Eibenholzschaft");
    SetItemName(dcsHandleEiche,   "Eichenholzschaft");
    SetItemName(dcsHandleKiefer,  "Kieferholzschaft");
    SetItemName(dcsHandleZeder,   "Zederholzschaft", "<cþþ>");
    SetItemName(dcsHandleZalantar,"Zalantarholzschaft", "<cýöp>");

    SetItemName(dcsStaffEsche,    "Eschenholzstab");
    SetItemName(dcsStaffEibe,     "Eibenholzstab");
    SetItemName(dcsStaffEiche,    "Eichenholzstab");
    SetItemName(dcsStaffKiefer,   "Kieferholzstab");
    SetItemName(dcsStaffZeder,    "Zederholzstab", "<cþþ>");
    SetItemName(dcsStaffZalantar, "Zalantarholzstab", "<cýöp>");

    SetItemName(dcsBowhiltEsche,    "Eschenbogenschaft");
    SetItemName(dcsBowhiltEibe,     "Eibenbogenschaft");
    SetItemName(dcsBowhiltEiche,    "Eichenbogenschaft");
    SetItemName(dcsBowhiltKiefer,   "Kieferbogenschaft");
    SetItemName(dcsBowhiltZeder,    "Zederbogenschaft", "<cþþ>");
    SetItemName(dcsBowhiltZalantar, "Zalantarbogenschaft", "<cýöp>");

    SetItemName(dcsXBowhiltEsche,    "Eschenarmbruststock");
    SetItemName(dcsXBowhiltEibe,     "Eibenarmbruststock");
    SetItemName(dcsXBowhiltEiche,    "Eichenarmbruststock");
    SetItemName(dcsXBowhiltKiefer,   "Kieferarmbruststock");
    SetItemName(dcsXBowhiltZeder,    "Zederarmbruststock", "<cþþ>");
    SetItemName(dcsXBowhiltZalantar, "Zalantararmbruststock", "<cýöp>");

    SetItemName(dcsStringWeak,    "Schwache Sehne");
    SetItemName(dcsStringNormal,  "Normale Sehne");
    SetItemName(dcsStringStrong,  "Starke Sehne");

    SetItemName(dcsWoodEsche,     "Eschenrohholz");
    SetItemName(dcsWoodEibe,      "Eibenrohholz");
    SetItemName(dcsWoodEiche,     "Eichenrohholz");
    SetItemName(dcsWoodKiefer,    "Kieferrohholz");
    SetItemName(dcsWoodZeder,     "Zederrohholz", "<cþþ>");
    SetItemName(dcsWoodZalantar,  "Zalantarrohholz", "<cýöp>");

    SetItemName(dcsRindeEsche,     "Eschenrinde");
    SetItemName(dcsRindeEibe,      "Eibenrinde");
    SetItemName(dcsRindeEiche,     "Eichenrinde");
    SetItemName(dcsRindeKiefer,    "Kieferrinde");
    SetItemName(dcsRindeZeder,     "Zederrinde", "<cþþ>");
    SetItemName(dcsRindeZalantar,  "Zalantarrinde", "<cýöp>");

    SetItemName(dcsBrettEsche,      "Eschenholzbrett");
    SetItemName(dcsBrettEibe,       "Eibenholzbrett");
    SetItemName(dcsBrettEiche,      "Eichenholzbrett");
    SetItemName(dcsBrettKiefer,     "Kieferholzbrett");
    SetItemName(dcsBrettZeder,      "Zederholzbrett", "<cþþ>");
    SetItemName(dcsBrettZalantar,   "Zalantarholzbrett", "<cýöp>");

    SetItemName(dcsRemainsEsche,      "Eschenholzreste");
    SetItemName(dcsRemainsEibe,       "Eibenholzreste");
    SetItemName(dcsRemainsEiche,      "Eichenholzreste");
    SetItemName(dcsRemainsKiefer,     "Kieferholzreste");
    SetItemName(dcsRemainsZeder,      "Zederholzreste", "<cþþ>");
    SetItemName(dcsRemainsZalantar,   "Zalantarholzreste", "<cýöp>");

    SetItemName(dcsErzZinn,       "Zinnerz");
    SetItemName(dcsErzKupfer,     "Kupfererz");
    SetItemName(dcsErzEisen,      "Eisenerz");
    SetItemName(dcsErzBlaueisen,  "Blaueisenerz");
    SetItemName(dcsErzAdamantit,  "Adamantiterz");
    SetItemName(dcsErzPlatin,     "Platinerz", "<cþþ>");
    SetItemName(dcsErzMithral,    "Mithralerz", "<cýöp>");
    SetItemName(dcsErzSilber,     "Silbernugget");
    SetItemName(dcsErzGold,       "Goldnugget");

    SetItemName(dcsKlingeBronzeS,    "Kleine Bronzeklinge");
    SetItemName(dcsKlingeStahlS,     "Kleine Stahlklinge");
    SetItemName(dcsKlingeBlaustahlS, "Kleine Blaustahlklinge");
    SetItemName(dcsKlingeAdamantitS, "Kleine Adamantitklinge");
    SetItemName(dcsKlingePlatinS,    "Kleine Platinklinge", "<cþþ>");
    SetItemName(dcsKlingeMithralS,   "Kleine Mithralklinge", "<cýöp>");

    SetItemName(dcsKlingeBronzeL,    "Große Bronzeklinge");
    SetItemName(dcsKlingeStahlL,     "Große Stahlklinge");
    SetItemName(dcsKlingeBlaustahlL, "Große Blaustahlklinge");
    SetItemName(dcsKlingeAdamantitL, "Große Adamantitklinge");
    SetItemName(dcsKlingePlatinL,    "Große Platinklinge", "<cþþ>");
    SetItemName(dcsKlingeMithralL,   "Große Mithralklinge", "<cýöp>");

    SetItemName(dcsKugelBronze,    "Bronzekugel");
    SetItemName(dcsKugelStahl,     "Stahlkugel");
    SetItemName(dcsKugelBlaustahl, "Blaustahlkugel");
    SetItemName(dcsKugelAdamantit, "Adamantitkugel");
    SetItemName(dcsKugelPlatin,    "Platinkugel", "<cþþ>");
    SetItemName(dcsKugelMithral,   "Mithralkugel", "<cýöp>");

    SetItemName(dcsRingBronze,    "Bronzekettenring");
    SetItemName(dcsRingStahl,     "Stahlkettenring");
    SetItemName(dcsRingBlaustahl, "Blaustahlkettenring");
    SetItemName(dcsRingAdamantit, "Adamantitkettenring");
    SetItemName(dcsRingPlatin,    "Platinkettenring", "<cþþ>");
    SetItemName(dcsRingMithral,   "Mithralkettenring", "<cýöp>");

    SetItemName(dcsAxtkopfBronze,    "Bronzeaxtkopf");
    SetItemName(dcsAxtkopfStahl,     "Stahlaxtkopf");
    SetItemName(dcsAxtkopfBlaustahl, "Blaustahlaxtkopf");
    SetItemName(dcsAxtkopfAdamantit, "Adamantitaxtkopf");
    SetItemName(dcsAxtkopfPlatin,    "Platinaxtkopf", "<cþþ>");
    SetItemName(dcsAxtkopfMithral,   "Mithralaxtkopf", "<cýöp>");

    SetItemName(dcsHammerkopfBronze,    "Bronzehammerkopf");
    SetItemName(dcsHammerkopfStahl,     "Stahlhammerkopf");
    SetItemName(dcsHammerkopfBlaustahl, "Blaustahlhammerkopf");
    SetItemName(dcsHammerkopfAdamantit, "Adamantithammerkopf");
    SetItemName(dcsHammerkopfPlatin,    "Platinhammerkopf", "<cþþ>");
    SetItemName(dcsHammerkopfMithral,   "Mithralhammerkopf", "<cýöp>");

    SetItemName(dcsNagelBronze,         "Bronzenagel");
    SetItemName(dcsNagelStahl,          "Stahlnagel");
    SetItemName(dcsNagelBlaustahl,      "Blaustahlnagel");
    SetItemName(dcsNagelAdamantit,      "Adamantitnagel");
    SetItemName(dcsNagelPlatin,         "Platinnagel", "<cþþ>");
    SetItemName(dcsNagelMithral,        "Mithralnagel", "<cýöp>");

    SetItemName(dcsGussformBronze,    "Bronzegussform");
    SetItemName(dcsGussformStahl,     "Stahlgussform");
    SetItemName(dcsGussformBlaustahl, "Blaustahlgussform");
    SetItemName(dcsGussformAdamantit, "Adamantitgussform");
    SetItemName(dcsGussformPlatin,    "Platingussform");
    SetItemName(dcsGussformMithral,   "Mithralgussform");
    SetItemName(dcsGussformSilber,    "Silbergussform");
    SetItemName(dcsGussformGold,      "Goldgussform");
    SetItemName(dcsGussformWeissgold, "Weißgoldgussform");

    SetItemName(dcsRohlingSBronze,    "Kleiner Bronzeklingenrohling");
    SetItemName(dcsRohlingSStahl,     "Kleiner Stahlklingenrohling");
    SetItemName(dcsRohlingSBlaustahl, "Kleiner Blaustahlklingenrohling");
    SetItemName(dcsRohlingSAdamantit, "Kleiner Adamantitklingenrohling");
    SetItemName(dcsRohlingSPlatin,    "Kleiner Platinklingenrohling", "<cþþ>");
    SetItemName(dcsRohlingSMithral,   "Kleiner Mithralklingenrohling", "<cýöp>");

    SetItemName(dcsRohlingLBronze,    "Großer Bronzeklingenrohling");
    SetItemName(dcsRohlingLStahl,     "Großer Stahlklingenrohling");
    SetItemName(dcsRohlingLBlaustahl, "Großer Blaustahlklingenrohling");
    SetItemName(dcsRohlingLAdamantit, "Großer Adamantitklingenrohling");
    SetItemName(dcsRohlingLPlatin,    "Großer Platinklingenrohling", "<cþþ>");
    SetItemName(dcsRohlingLMithral,   "Großer Mithralklingenrohling", "<cýöp>");

    SetItemName(dcsBlankAxeHeadBronze,    "Bronzeaxtkopfrohling");
    SetItemName(dcsBlankAxeHeadStahl,     "Stahlaxtkopfrohling");
    SetItemName(dcsBlankAxeHeadBlaustahl, "Blaustahlaxtkopfrohling");
    SetItemName(dcsBlankAxeHeadAdamantit, "Adamantitaxtkopfrohling");
    SetItemName(dcsBlankAxeHeadPlatin,    "Platinaxtkopfrohling", "<cþþ>");
    SetItemName(dcsBlankAxeHeadMithral,   "Mithralaxtkopfrohling", "<cýöp>");

    SetItemName(dcsRemainsBronze,    "Bronzesplitter");
    SetItemName(dcsRemainsStahl,     "Stahlsplitter");
    SetItemName(dcsRemainsBlaustahl, "Blaustahlsplitter");
    SetItemName(dcsRemainsAdamantit, "Adamantitsplitter");
    SetItemName(dcsRemainsPlatin,    "Platinsplitter", "<cþþ>");
    SetItemName(dcsRemainsMithral,   "Mithralsplitter", "<cýöp>");
    SetItemName(dcsRemainsSilber,    "Silbersplitter");
    SetItemName(dcsRemainsGold,      "Goldsplitter");
    SetItemName(dcsRemainsWeissgold, "Weißgoldsplitter");
// Metallplatten
    SetItemName(dcsPlatteBronze,    "Bronzeplatte");
    SetItemName(dcsPlatteStahl,     "Stahlplatte");
    SetItemName(dcsPlatteBlaustahl, "Blaustahlplatte");
    SetItemName(dcsPlatteAdamantit, "Adamantitplatte");
    SetItemName(dcsPlattePlatin,    "Platinplatte", "<cþþ>");
    SetItemName(dcsPlatteMithral,   "Mithralplatte", "<cýöp>");

// Schulterplatten
    SetItemName(dcsSchulterplatteBronze,    "Bronzeschulterplatte");
    SetItemName(dcsSchulterplatteStahl,     "Stahlschulterplatte");
    SetItemName(dcsSchulterplatteBlaustahl, "Blaustahlschulterplatte");
    SetItemName(dcsSchulterplatteAdamantit, "Adamantitschulterplatte");
    SetItemName(dcsSchulterplattePlatin,    "Platinschulterplatte", "<cþþ>");
    SetItemName(dcsSchulterplatteMithral,   "Mithralschulterplatte", "<cýöp>");

// Kettenpanzer
    SetItemName(dcsKettenpanzerBronze,    "Bronzekettenpanzer");
    SetItemName(dcsKettenpanzerStahl,     "Stahlkettenpanzer");
    SetItemName(dcsKettenpanzerBlaustahl, "Blaustahlkettenpanzer");
    SetItemName(dcsKettenpanzerAdamantit, "Adamantitkettenpanzer");
    SetItemName(dcsKettenpanzerPlatin,    "Platinkettenpanzer", "<cþþ>");
    SetItemName(dcsKettenpanzerMithral,   "Mithralkettenpanzer", "<cýöp>");

// Brustpanzer
    SetItemName(dcsBrustpanzerBronze,    "Bronzebrustpanzer");
    SetItemName(dcsBrustpanzerStahl,     "Stahlbrustpanzer");
    SetItemName(dcsBrustpanzerBlaustahl, "Blaustahlbrustpanzer");
    SetItemName(dcsBrustpanzerAdamantit, "Adamantitbrustpanzer");
    SetItemName(dcsBrustpanzerPlatin ,   "Platinbrustpanzer", "<cþþ>");
    SetItemName(dcsBrustpanzerMithral,   "Mithralbrustpanzer", "<cýöp>");

// Verhaerteder Brustpanzer
    SetItemName(dcsHBrustpanzerBronze,    "Gehärteter Bronzebrustpanzer");
    SetItemName(dcsHBrustpanzerStahl,     "Gehärteter Stahlbrustpanzer");
    SetItemName(dcsHBrustpanzerBlaustahl, "Gehärteter Blaustahlbrustpanzer");
    SetItemName(dcsHBrustpanzerAdamantit, "Gehärteter Adamantitbrustpanzer");
    SetItemName(dcsHBrustpanzerPlatin,    "Gehärteter Platinbrustpanzer", "<cþþ>");
    SetItemName(dcsHBrustpanzerMithral,   "Gehärteter Mithralbrustpanzer", "<cýöp>");

    SetItemName(dcsPfeilspitzenBronze,    "Bronzepfeilspitzen");
    SetItemName(dcsPfeilspitzenStahl,     "Stahlpfeilspitzen");
    SetItemName(dcsPfeilspitzenBlaustahl, "Blaustahlpfeilspitzen");
    SetItemName(dcsPfeilspitzenAdamantit, "Adamantitpfeilspitzen");
    SetItemName(dcsPfeilspitzenPlatin,    "Platinpfeilspitzen", "<cþþ>");
    SetItemName(dcsPfeilspitzenMithral,   "Mithralpfeilspitzen", "<cýöp>");

    SetItemName(dcsPfeilstaebeEsche,    "Eschenpfeilschäfte");
    SetItemName(dcsPfeilstaebeEibe,     "Eibenpfeilschäfte");
    SetItemName(dcsPfeilstaebeEiche,    "Eichenpfeilschäfte");
    SetItemName(dcsPfeilstaebeKiefer,   "Kieferpfeilschäfte");
    SetItemName(dcsPfeilstaebeZeder,    "Zederpfeilschäfte", "<cþþ>");
    SetItemName(dcsPfeilstaebeZalantar, "Zalantarpfeilschäfte", "<cýöp>");

// Metallverzierungen
    SetItemName(dcsVerzierungBronze,    "Bronzeverzierung");
    SetItemName(dcsVerzierungStahl,     "Stahlverzierung");
    SetItemName(dcsVerzierungBlaustahl, "Blaustahlverzierung");
    SetItemName(dcsVerzierungAdamantit, "Adamantitverzierung");
    SetItemName(dcsVerzierungPlatin,    "Platinverzierung", "<cþþ>");
    SetItemName(dcsVerzierungMithral,   "Mithralverzierung", "<cýöp>");

// Schildkörper
    SetItemName(dcsSchildbasisEsche,   "Eschenschildkörper");
    SetItemName(dcsSchildbasisEibe,    "Eibenschildkörper");
    SetItemName(dcsSchildbasisEiche,   "Eichenschildkörper");
    SetItemName(dcsSchildbasisKiefer,  "Kieferschildkörper");
    SetItemName(dcsSchildbasisZeder,   "Zederschildkörper", "<cþþ>");
    SetItemName(dcsSchildbasisZalantar,"Zalantarschildkörper", "<cýöp>");

    SetItemName(dcsBottleGlas,      "Glasflasche");
    SetItemName(dcsBottleCrystal,   "Kristallglasflasche");

    SetItemName(dcsLabelie,         "Labelie");
    SetItemName(dcsSensengras,      "Sensengras");
    SetItemName(dcsKleeNormal,      "Kleeblatt");
    SetItemName(dcsRedBluster,      "Roter Bluster");
    SetItemName(dcsIntarakraut,     "Intarakraut");
    SetItemName(dcsKaloskraut,      "Kaloskraut");
    SetItemName(dcsFingerhut,       "Fingerhut");
    SetItemName(dcsLunasipflanze,   "Lunasipflanze");

    SetItemName(dcsUkaWurzel,       "Uka-Wurzel");
    SetItemName(dcsYelBluster,      "Gelber Bluster");
    SetItemName(dcsSchuemling,      "Schümling");
    SetItemName(dcsHasenfarn,       "Hasenfarn");
    SetItemName(dcsSichelwurzel,    "Sichelwurzel");
    SetItemName(dcsEtalaspflanze,   "Etalaspflanze");

    SetItemName(dcsPaleBluster,     "Bleicher Bluster");
    SetItemName(dcsKleeVier,        "Vierblättriges Kleeblatt");
    SetItemName(dcsAntiras,         "Antiras");
    SetItemName(dcsZezloughWurzel,  "Zezlough-Wurzel");
    SetItemName(dcsRusariaWurzel,   "Rusaria-Wurzel");
    SetItemName(dcsTsandersol,      "Tsandersol");

    SetItemName(dcsHerzTroco,       "Herz eines Trocopotacas");
    SetItemName(dcsHerzSala,        "Herz eines Salamanders");
    SetItemName(dcsHerzFeuerele,    "Herz eines Feuerelementars");
    SetItemName(dcsHerzChaggrin,    "Herz eines Chaggrin");
    SetItemName(dcsHerzEisele,      "Herz eines Eiselementars");
    SetItemName(dcsHerzBodak,       "Herz eines Bodak");
    SetItemName(dcsHerzOsyluth,     "Herz eines Osyluthen");
    SetItemName(dcsHerzMisthu,      "Herz eines Misthu");

    SetItemName(dcsHornMino,        "Horn eines Minotauren");
    SetItemName(dcsHornTrelon,      "Horn eines Trelon");

    SetItemName(dcsAugeSphinx,       "Auge einer Sphinx");
    SetItemName(dcsAugeMechanus,     "Mechanus-Auge");
    SetItemName(dcsAugeBetrachter,   "Betrachterauge");

    SetItemName(dcsFluegelVarg,      "Vargouillenflügel");
    SetItemName(dcsFluegelMuecke,    "Mückenflügel");
    SetItemName(dcsFellEisschrat,    "Eisschratfell");
    SetItemName(dcsFellSchakal,      "Schakalfell");

    SetItemName(dcsBlutRiesen,       "Blut eines Riesen");
    SetItemName(dcsBlutSchlangen,    "Schlangenblut");
    SetItemName(dcsBlutAsabi,        "Asabiblut");

    SetItemName(dcsEssenzWundensuch,  "Essenz eines Wundensuchers");
    SetItemName(dcsEssenzLavagolem,   "Essenz eines Lavagolems");
    SetItemName(dcsWeihwasser,        "Weihwasser");
    SetItemName(dcsTailSchaedrat,     "Schädelrattenschwanz");
    SetItemName(dcsMumienbinde,       "Mumienbinde");
    SetItemName(dcsMumienhand,        "Mumienhand");
    SetItemName(dcsHirnDuergar,       "Hirn eines Duergar");
    SetItemName(dcsHirnwasserDuergar, "Gehirnwasser eines Duergars");
    SetItemName(dcsKnochenVorlan,     "Vorlanknochen");
    SetItemName(dcsKnochenmehl,       "Knochenmehl");
    SetItemName(dcsSpinnenbein,       "Spinnenbein");
    SetItemName(dcsNekroplasma,       "Nekroplasma");
    SetItemName(dcsZungeYagnoloth,    "Yagnolothzunge");
    SetItemName(dcsStachelSkorpion,   "Sonnenskorpionstachel");
    SetItemName(dcsSplitterGolem,     "Splitter eines Golems");
    SetItemName(dcsHautSchlange,      "Schlangehaut");

    SetItemName(dcsSchuppeSumpf,      "Sumpfechsenschuppe");
    SetItemName(dcsSchuppeSahuagin,   "Sahuagin-Schuppe");
    SetItemName(dcsSchuppeYuanTi,     "Yuan-Ti-Schuppe");
    SetItemName(dcsSchuppeBlauDrache, "Blaue Drachenschuppe");

    SetItemName(dcsPotMightBarkskin,     "Trank: Mächtige Rindenhaut");
    SetItemName(dcsPotHarm,              "Trank: Leid");
    SetItemName(dcsPotEasyTradeskill,    "Trank: Einfaches Handwerk");
    SetItemName(dcsPotAverageTradeskill, "Trank: Verbessertes Handwerk");
    SetItemName(dcsPotAbsoluteTradeskill,"Trank: Absolutes Handwerk");

    SetItemName(dcsElixHaste,            "Elixier: Hast");
    SetItemName(dcsElixMightHaste,       "Elixier: Mächtige Hast");
    SetItemName(dcsElixPerfectChance,    "Elixier: Perfekte Chance");

    SetItemName(dcsEdelsteinpoliturA,    "Gewöhnliche Edelsteinpolitur");
    SetItemName(dcsEdelsteinpoliturB,    "Teure Edelsteinpolitur");

    SetItemName(dcsRandomAll,         "Gegenstand");
    SetItemName(dcsRandomArmor,       "Rüstung");
    SetItemName(dcsRandomArmorWeapon, "Waffe oder Rüstung");
    SetItemName(dcsRandomEquip,       "Ausrüstungsgegenstand");
    SetItemName(dcsRandomMiscItem,    "Gegenstand (Sonstiges)");
    SetItemName(dcsRandomMelee,       "Nahkampfwaffe");
    SetItemName(dcsRandomRanged,      "Fernkampfwaffe");
    SetItemName(dcsRandomWeapon,      "Nah- oder Fernkampfwaffe");
    SetItemName(dcsRandomContainer,   "Behälter");
    SetItemName(dcsRandomSocketJew,   "Schmuckgegenstand mit Fassung(en)");

    SetItemName(dcsStabilKristallSmall, "Schwacher Stabilisierungskristall");
    SetItemName(dcsStabilKristallLarge, "Mächtiger Stabilisierungskristall");

    SetItemName(dcsVerzPulverA, "Gewöhnliches Verzauberungspulver");
    SetItemName(dcsVerzPulverB, "Gutes Verzauberungspulver");
    SetItemName(dcsVerzPulverC, "Exzellentes Verzauberungspulver");

    SetItemName(dcsVerzEssenzA, "Gewöhnliche Verzauberungsessenz");
    SetItemName(dcsVerzEssenzB, "Sehr Gute Verzauberungsessenz");
    SetItemName(dcsVerzEssenzC, "Meisterhafte Verzauberungsessenz");


    SetItemName(dcsEssenzSchallM, "Mächtige Schallessenz", "<cýöp>");
    SetItemName(dcsEssenzEisM,    "Mächtige Eisessenz", "<cýöp>");
    SetItemName(dcsEssenzFeuerM,  "Mächtige Feueressenz", "<cýöp>");
    SetItemName(dcsEssenzBlitzM,  "Mächtige Blitzessenz", "<cýöp>");
    SetItemName(dcsEssenzSaeureM, "Mächtige Säureessenz", "<cýöp>");

// Rohedelsteine
    SetItemName(dcsEdelsteinBernsteinRaw   , "Unbearbeiteter Bernstein");
    SetItemName(dcsEdelsteinMorganitRaw    , "Unbearbeiteter Morganit");
    SetItemName(dcsEdelsteinOpalRaw        , "Unbearbeiteter Opal");
    SetItemName(dcsEdelsteinRosenquarzRaw  , "Unbearbeiteter Rosenquarz");
    SetItemName(dcsEdelsteinAventurinRaw   , "Unbearbeiteter Aventurin");
    SetItemName(dcsEdelsteinTansanitRaw    , "Unbearbeiteter Tansanit");
    SetItemName(dcsEdelsteinLapislazuliRaw , "Unbearbeiteter Lapislazuli");
    SetItemName(dcsEdelsteinAchatRaw       , "Unbearbeiteter Achat");
    SetItemName(dcsEdelsteinMalachitRaw    , "Unbearbeiteter Malachit");
    SetItemName(dcsEdelsteinTopasRaw       , "Unbearbeiteter Topas");
    SetItemName(dcsEdelsteinCitrinRaw      , "Unbearbeiteter Citrin");
    SetItemName(dcsEdelsteinOnyxRaw        , "Unbearbeiteter magischer Onyx");
    SetItemName(dcsEdelsteinHimmelssteinRaw, "Unbearbeitete magische Himmelsstein");

//Geschliffene Edelsteine
    SetItemName(dcsEdelsteinBernsteinCut   , "Geschliffener Bernstein");
    SetItemName(dcsEdelsteinMorganitCut    , "Geschliffener Morganit");
    SetItemName(dcsEdelsteinOpalCut        , "Geschliffener Opal");
    SetItemName(dcsEdelsteinRosenquarzCut  , "Geschliffener Rosenquarz");
    SetItemName(dcsEdelsteinAventurinCut   , "Geschliffener Aventurin");
    SetItemName(dcsEdelsteinTansanitCut    , "Geschliffener Tansanit");
    SetItemName(dcsEdelsteinLapislazuliCut , "Geschliffener Lapislazuli");
    SetItemName(dcsEdelsteinAchatCut       , "Geschliffener Achat");
    SetItemName(dcsEdelsteinMalachitCut    , "Geschliffener Malachit");
    SetItemName(dcsEdelsteinTopasCut       , "Geschliffener Topas");
    SetItemName(dcsEdelsteinCitrinCut      , "Geschliffener Citrin");
    SetItemName(dcsEdelsteinOnyxCut        , "Geschliffener magischer Onyx");
    SetItemName(dcsEdelsteinHimmelssteinCut, "Geschliffene magische Himmelsstein");

//Ausgezeichnete Geschliffene Edelsteine
    SetItemName(dcsEdelsteinBernsteinCutAv   , "Ausgezeichneter geschliffener Bernstein");
    SetItemName(dcsEdelsteinMorganitCutAv    , "Ausgezeichneter geschliffener Morganit");
    SetItemName(dcsEdelsteinOpalCutAv        , "Ausgezeichneter geschliffener Opal");
    SetItemName(dcsEdelsteinRosenquarzCutAv  , "Ausgezeichneter geschliffener Rosenquarz");
    SetItemName(dcsEdelsteinAventurinCutAv   , "Ausgezeichneter geschliffener Aventurin");
    SetItemName(dcsEdelsteinTansanitCutAv    , "Ausgezeichneter geschliffener Tansanit");
    SetItemName(dcsEdelsteinLapislazuliCutAv , "Ausgezeichneter geschliffener Lapislazuli");
    SetItemName(dcsEdelsteinAchatCutAv       , "Ausgezeichneter geschliffener Achat");
    SetItemName(dcsEdelsteinMalachitCutAv    , "Ausgezeichneter geschliffener Malachit");
    SetItemName(dcsEdelsteinTopasCutAv       , "Ausgezeichneter geschliffener Topas");
    SetItemName(dcsEdelsteinCitrinCutAv      , "Ausgezeichneter geschliffener Citrin");
    SetItemName(dcsEdelsteinOnyxCutAv        , "Ausgezeichneter geschliffener magischer Onyx");
    SetItemName(dcsEdelsteinHimmelssteinCutAv, "Ausgezeichneter geschliffener magischer Himmelsstein");

// Edelsteine
    SetItemName(dcsEdelsteinBernstein   , "Polierter Bernstein");
    SetItemName(dcsEdelsteinMorganit    , "Polierter Morganit");
    SetItemName(dcsEdelsteinOpal        , "Polierter Opal");
    SetItemName(dcsEdelsteinRosenquarz  , "Polierter Rosenquarz");
    SetItemName(dcsEdelsteinAventurin   , "Polierter Aventurin");
    SetItemName(dcsEdelsteinTansanit    , "Polierter Tansanit");
    SetItemName(dcsEdelsteinLapislazuli , "Polierter Lapislazuli");
    SetItemName(dcsEdelsteinAchat       , "Polierter Achat");
    SetItemName(dcsEdelsteinMalachit    , "Polierter Malachit");
    SetItemName(dcsEdelsteinTopas       , "Polierter Topas");
    SetItemName(dcsEdelsteinCitrin      , "Polierter Citrin");
    SetItemName(dcsEdelsteinOnyx        , "Polierter magischer Onyx");
    SetItemName(dcsEdelsteinHimmelsstein, "Polierter magischer Himmelsstein");

//Ausgezeichnete Edelsteine
    SetItemName(dcsEdelsteinBernsteinAv   , "Ausgezeichneter polierter Bernstein");
    SetItemName(dcsEdelsteinMorganitAv    , "Ausgezeichneter polierter Morganit");
    SetItemName(dcsEdelsteinOpalAv        , "Ausgezeichneter polierter Opal");
    SetItemName(dcsEdelsteinRosenquarzAv  , "Ausgezeichneter polierter Rosenquarz");
    SetItemName(dcsEdelsteinAventurinAv   , "Ausgezeichneter polierter Aventurin");
    SetItemName(dcsEdelsteinTansanitAv    , "Ausgezeichneter polierter Tansanit");
    SetItemName(dcsEdelsteinLapislazuliAv , "Ausgezeichneter polierter Lapislazuli");
    SetItemName(dcsEdelsteinAchatAv       , "Ausgezeichneter polierter Achat");
    SetItemName(dcsEdelsteinMalachitAv    , "Ausgezeichneter polierter Malachit");
    SetItemName(dcsEdelsteinTopasAv       , "Ausgezeichneter polierter Topas");
    SetItemName(dcsEdelsteinCitrinAv      , "Ausgezeichneter polierter Citrin");
    SetItemName(dcsEdelsteinOnyxAv        , "Ausgezeichneter polierter magischer Onyx");
    SetItemName(dcsEdelsteinHimmelssteinAv, "Ausgezeichneter polierter magischer Himmelsstein");

// Draht
    SetItemName(dcsDrahtSilber   , "Silberdraht");
    SetItemName(dcsDrahtGold     , "Golddraht");
    SetItemName(dcsDrahtWeissgold, "Weißgolddraht");
    SetItemName(dcsDrahtPlatin   , "Platindraht");
    SetItemName(dcsDrahtMithral  , "Mithraldraht");

// Kettenglied
    SetItemName(dcsKettengliedSilber   , "Silberkettenglied");
    SetItemName(dcsKettengliedGold     , "Goldkettenglied");
    SetItemName(dcsKettengliedWeissgold, "Weißgoldkettenglied");
    SetItemName(dcsKettengliedPlatin   , "Platinkettenglied");
    SetItemName(dcsKettengliedMithral  , "Mithralkettenglied");

// Verschluss
    SetItemName(dcsVerschlussSilber   , "Silberverschluss");
    SetItemName(dcsVerschlussGold     , "Goldverschluss");
    SetItemName(dcsVerschlussWeissgold, "Weißgoldverschluss");
    SetItemName(dcsVerschlussPlatin   , "Platinverschluss");
    SetItemName(dcsVerschlussMithral  , "Mithralverschluss");

// Anhaenger
    SetItemName(dcsAnhaengerSilber    , "Silberanhänger");
    SetItemName(dcsAnhaengerGold      , "Goldanhänger");
    SetItemName(dcsAnhaengerWeissgold , "Weißgoldanhänger");
    SetItemName(dcsAnhaengerPlatin    , "Platinanhänger");
    SetItemName(dcsAnhaengerMithral   , "Mithralanhänger");

    SetItemName(dcsERingSilber     , "Silberring");
    SetItemName(dcsERingGold       , "Goldring");
    SetItemName(dcsERingWeissgold  , "Weißgoldring");
    SetItemName(dcsERingPlatin     , "Platinring");
    SetItemName(dcsERingMithral    , "Mithralring");

    SetItemName(dcsEAmulettSilber     , "Silberamulett");
    SetItemName(dcsEAmulettGold       , "Goldamulett");
    SetItemName(dcsEAmulettWeissgold  , "Weißgoldamulett");
    SetItemName(dcsEAmulettPlatin     , "Platinamulett");
    SetItemName(dcsEAmulettMithral    , "Mithralamulett");

    SetItemName(dcsRingrohlingSilber    , "Silberringrohling");
    SetItemName(dcsRingrohlingGold      , "Goldringrohling");
    SetItemName(dcsRingrohlingWeissgold , "Weißgoldringrohling");
    SetItemName(dcsRingrohlingPlatin    , "Platinringrohling");
    SetItemName(dcsRingrohlingMithral   , "Mithralringrohling");
*/


/******************************************************************************/

// *  Returns the name of sConstant
string DCS_GetResourceName(string sConstant);
string DCS_GetResourceName(string sConstant)
{
    string sReturn = GetInternString(sConstant, GetModule());

    if(sReturn == "")
    return GetName(GetObjectByTag(sConstant));

    return sReturn;
}

/******************************************************************************/

// * Returns TRUE, if sConstant belongs to a weapon
int DCS_GetIsResourceWeapon(string sConstant);
int DCS_GetIsResourceWeapon(string sConstant)
{
    return sConstant == dcsBastardsword ||
           sConstant == dcsBattleaxe ||
           sConstant == dcsClub ||
           sConstant == dcsDagger ||
           sConstant == dcsDiremace ||
           sConstant == dcsDoubleaxe ||
           sConstant == dcsDwarvenwaraxe ||
           sConstant == dcsGreataxe ||
           sConstant == dcsGreatsword ||
           sConstant == dcsHalberd ||
           sConstant == dcsHandaxe ||
           sConstant == dcsHeavycrossbow ||
           sConstant == dcsHeavyflail ||
           sConstant == dcsKama ||
           sConstant == dcsKatana ||
           sConstant == dcsKukri ||
           sConstant == dcsLightcrossbow ||
           sConstant == dcsLightflail ||
           sConstant == dcsLighthammer ||
           sConstant == dcsLongbow ||
           sConstant == dcsLongsword ||
           sConstant == dcsMace ||
           sConstant == dcsMorningstar ||
           sConstant == dcsRapier ||
           sConstant == dcsScimitar ||
           sConstant == dcsShortbow ||
           sConstant == dcsShortsword ||
           sConstant == dcsSickle ||
           sConstant == dcsSlingshot        ||
           sConstant == dcsSpear            ||
           sConstant == dcsStaff            ||
           sConstant == dcsTwobladedsword   ||
           sConstant == dcsWarhammer        ||
           sConstant == dcsWhip;
}

/******************************************************************************/

// *  Returns the default ammunation container object resref for iRangedBaseType
string DCS_GetAmmoContainer(int iRangedBaseType);
string DCS_GetAmmoContainer(int iRangedBaseType)
{
    switch(iRangedBaseType)
    {
        case BASE_ITEM_ARROW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LONGBOW:       return dcsContArrow;break;
        case BASE_ITEM_BOLT:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_LIGHTCROSSBOW: return dcsContBolt;break;
        case BASE_ITEM_BULLET:
        case BASE_ITEM_SLING:         return dcsContBullet;break;
        case BASE_ITEM_SHURIKEN:      return dcsContShuriken;break;
        case BASE_ITEM_THROWINGAXE:   return dcsContThrowaxe;break;
    }
    return "";
}

/******************************************************************************/

// *  Returns the default ammunation object resref for iBaseAmmoType
string DCS_GetAmmoByBaseType(int iBaseAmmoType);
string DCS_GetAmmoByBaseType(int iBaseAmmoType)
{
    switch (iBaseAmmoType)
    {
        case BASE_ITEM_ARROW:       return dcsAmmoArrow;break;
        case BASE_ITEM_BOLT:        return dcsAmmoBolt;break;
        case BASE_ITEM_BULLET:      return dcsAmmoBullet;break;
        case BASE_ITEM_SHURIKEN:    return dcsAmmoShuriken;break;
        case BASE_ITEM_THROWINGAXE: return dcsAmmoThrowAxe;break;
    }

    return "";
}

/******************************************************************************/

string DCS_GetDefaultAmmoName(object oAmmo)
{
    switch (GetBaseItemType(oAmmo))
    {
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LONGBOW:       return "Magischer Pfeil";break;
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_LIGHTCROSSBOW: return "Magischer Bolzen";break;
        case BASE_ITEM_SLING:         return "Magische Kugel";break;
        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        case BASE_ITEM_SHURIKEN:
        case BASE_ITEM_THROWINGAXE:   return GetName(oAmmo);break;
    }

    return "";
}

/******************************************************************************/

string DCS_GetQualityName(int iQuality);
string DCS_GetQualityName(int iQuality)
{
    switch(iQuality)
    {
        case dcsQualityUnknown: return "Unbekannt";break;
        case dcsQualityDestroyed: return "Zerstört";break;
        case dcsQualityRuined: return "Ruiniert";break;
        case dcsQualityVeryPoor: return "Sehr schlecht";break;
        case dcsQualityPoor: return "Schlecht";break;
        case dcsQualityBelowAverage: return "Unterdurchschnittlich";break;
        case dcsQualityAverage: "Durchschnittlich";break;
        case dcsQualityAboveAverage: return "Überdurchschnittlich";break;
        case dcsQualityGood: return "Gut";break;
        case dcsQualityVeryGood: return "Sehr gut";break;
        case dcsQualityExcellent: return "Exzellent";break;
        case dcsQualityMasterwork: return "Meisterwerk";break;
        case dcsQualityGodlike: return "Göttlich";break;

        case dcsQualityRaw: return "Unbearbeitet";break;
        case dcsQualityCut: return "Bearbeitet";break;
        case dcsQualityPolished: return "Geschliffen & Poliert";break;
    }

    return "";
}

/******************************************************************************/

// *  Returns TRUE, if sResource is an exception for a random item
int DCS_GetIsRandomItemException(string sResource);
int DCS_GetIsRandomItemException(string sResource)
{
    return sResource == dcsVerzEssenzA ||
           sResource == dcsVerzEssenzB ||
           sResource == dcsVerzEssenzC ||
           sResource == dcsVerzPulverA ||
           sResource == dcsVerzPulverB ||
           sResource == dcsVerzPulverC ||
           sResource == dcsStabilKristallSmall ||
           sResource == dcsStabilKristallLarge;
}

/******************************************************************************/

// *  Returns TRUE, if sResource is a random resource (dcsRandom**)
int DCS_GetIsRandomResource(string sResource);
int DCS_GetIsRandomResource(string sResource)
{
    return sResource == dcsRandomAll ||
           sResource == dcsRandomArmor ||
           sResource == dcsRandomArmorShield ||
           sResource == dcsRandomArmorWeapon ||
           sResource == dcsRandomContainer ||
           sResource == dcsRandomEquip ||
           sResource == dcsRandomGem ||
           sResource == dcsRandomSocketJew ||
           sResource == dcsRandomMelee ||
           sResource == dcsRandomMiscItem ||
           sResource == dcsRandomRanged ||
           sResource == dcsRandomWeapon;
}

// *  Returns the gem ordered ID for sResRef, if the ResRef belongs to dcs_gem_**** family
// *  NOTE: Index start at 0
// *  On Error Return: -1
int DCS_GetGemOrderedID(string sResRef);
int DCS_GetGemOrderedID(string sResRef)
{
    string sIndex = "dcs_gem_aven"+"dcs_gem_topa"+"dcs_gem_opal"+"dcs_gem_acha"+"dcs_gem_morg"+"dcs_gem_mala"+
                    "dcs_gem_tans"+"dcs_gem_rosq"+"dcs_gem_bern"+"dcs_gem_lapi"+"dcs_gem_citr"+"dcs_gem_schw"+"dcs_gem_himm";
    int iFind = FindSubString(sIndex, GetStringLeft(sResRef, 12));

    if(iFind == -1)
    return -1;

    return iFind / 12;
}

