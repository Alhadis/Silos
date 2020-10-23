/////////////////////////////////////////
// SETTINGS SWITCHES
/////////////////////////////////////////
const int MDRN_DEBUG = FALSE;
const int INFAMOUS_THRESHOLD = 40;
        //Faction below this considers the PC Reputation "Infamous"

//////////////////////////////////////
// CHARACTER CONSTANTS
//////////////////////////////////////
const string PCSKIN = "_mdrn_pc_skin";
const string PCFIST = "_mdrn_pc_fist";

/////////////////////////////////////////
// CLASS LISTINGS
/////////////////////////////////////////
const int CLASS_TYPE_TOUGH          = 0;
const int CLASS_TYPE_CHARISMATIC    = 1;
const int CLASS_TYPE_ACOLYTE        = 2;
const int CLASS_TYPE_DEDICATED      = 3;
const int CLASS_TYPE_STRONG         = 4;
const int CLASS_TYPE_SMART          = 5;
const int CLASS_TYPE_FAST           = 8;
const int CLASS_TYPE_MAGE           = 10;
const int CLASS_TYPE_SOLDIER        = 39;
const int CLASS_TYPE_MARTIAL_ARTIST = 49;
const int CLASS_TYPE_GUNSLINGER     = 41;
const int CLASS_TYPE_INFILTRATOR    = 42;
const int CLASS_TYPE_DAREDEVIL      = 43;
const int CLASS_TYPE_BODYGUARD      = 44;
const int CLASS_TYPE_FIELDSCIENTIST = 45;
const int CLASS_TYPE_FIELDMEDIC     = 46;
const int CLASS_TYPE_PERSONALITY    = 47;
const int CLASS_TYPE_NEGOTIATOR     = 48;
const int CLASS_TYPE_TECHIE         = 50;
const int CLASS_TYPE_INVESTIGATOR   = 51;
const int CLASS_TYPE_TELEPATH       = 52;
const int CLASS_TYPE_BATTLE_MIND    = 53;
const int CLASS_TYPE_SHADOW_SLAYER  = 54;
const int CLASS_TYPE_OCCULTIST      = 55;

/////////////////////////////////////////////////////
// FEAT LISTING
/////////////////////////////////////////////////////
const int FEAT_DOUBLE_TAP                     = 30;
const int FEAT_AIRCRAFTOP_HELICOPTER          = 2201;
const int FEAT_ANIMALAFFINITY                 = 2202;
const int FEAT_ATHLETIC                       = 2203;
const int FEAT_ATTENTIVE                      = 2204;
const int FEAT_AUTOFIRE                       = 2205;
const int FEAT_BRAWL                          = 100;
const int FEAT_BUILDER_CHEMICAL               = 2207;
const int FEAT_BUILDER_ELECTRONIC             = 2208;
const int FEAT_BUILDER_MECHANICAL             = 2209;
const int FEAT_BUILDER_STRUCTURAL             = 2210;
const int FEAT_BURST_FIRE                     = 2211;
const int FEAT_CAUTIOUS                       = 2212;
const int FEAT_ACROBATIC                      = 2213;
const int FEAT_CONFIDENT                      = 2214;
const int FEAT_DEAD_AIM                       = 2215;
const int FEAT_DECEPTIVE                      = 2216;
const int FEAT_EDUCATED                       = 2217;
const int FEAT_ENDURANCE                      = 2218;
const int FEAT_FARSHOT                        = 2219;
const int FEAT_FOCUSED                        = 2220;
const int FEAT_FRIGHTFUL_PRESENCE             = 2221;
const int FEAT_GEARHEAD                       = 2222;
const int FEAT_GUIDE                          = 2223;
const int FEAT_IMPROVED_BRAWL                 = 630;
const int FEAT_IMPROVED_DAMAGE_THRESHOLD      = 2225;
const int FEAT_LOW_PROFILE                    = 2226;
const int FEAT_MEDICAL_EXPERT                 = 2227;
const int FEAT_METICULOUS                     = 2228;
const int FEAT_NIMBLE                         = 2229;
const int FEAT_PERSONAL_FIREARMS_PROFICIENCY  = 2230;
const int FEAT_RENOWN                         = 2231;
const int FEAT_RUN                            = 2232;
const int FEAT_RELOAD                         = 2233;
const int FEAT_CREATIVE                       = 2234;
const int FEAT_STREET_FIGHTING                = 425;
const int FEAT_STUDIOUS                       = 2236;
const int FEAT_SURFACE_VEHICLE_OP_HEAVY       = 2237;
const int FEAT_SURFACE_VEHICLE_OP_BOAT        = 2238;
const int FEAT_SURFACE_VEHICLE_OP_SHIP        = 2239;
const int FEAT_SURFACE_VEHICLE_OP_TRACKED     = 2240;
const int FEAT_TRACK                          = 2241;
const int FEAT_TRUSTWORTHY                    = 2242;
const int FEAT_VEHICLE_EXPERT                 = 2243;
const int FEAT_WINDFALL                       = 2244;
const int FEAT_ADVANCED_FIREARMS_PROFICIENCY  = 2245;
const int FEAT_EXOTIC_FIREARMS_PROFICIENCY    = 2246;
const int FEAT_AIRCRAFTOP_JET                 = 2247;
const int FEAT_QUICK_RELOAD                   = 2248;
const int FEAT_WEAPON_PROFICIENCY_ARCHAIC     = 2250;
const int FEAT_EXTREMEEFFORT                  = 2251;
const int FEAT_IMPROVEDEXTREMEEFFORT          = 2252;

const int FEAT_MELEESMASH                     = 2257;
const int FEAT_IMPROVEDMELEESMASH             = 2258;
const int FEAT_ADVANCEDMELEESMASH             = 2259;

const int FEAT_INCREASEDSPEED                 = 2265;

const int FEAT_DAMAGEREDUCTION1               = 2268;
const int FEAT_DAMAGEREDUCTION2               = 2269;
const int FEAT_DAMAGEREDUCTION3               = 2270;

const int FEAT_SAVANT                         = 2280;

const int FEAT_HEALINGKNACK                   = 2288;

const int FEAT_SKILLEMPHASIS                  = 2291;
const int FEAT_AWARE                          = 2292;

const int FEAT_CHARM                          = 2295;

const int FEAT_FASTTALK                       = 2298;

const int FEAT_SHARPSHOOTING                  = 2310;

const int FEAT_QUICKDRAW                      = 2312;
const int FEAT_SHOTONTHERUN                   = 2313;
const int FEAT_STRAFE                         = 2314;
const int FEAT_SWEEP                          = 2315;
const int FEAT_IMPROVISEDIMPLEMENTS           = 2316;
const int FEAT_IMPROVISEDWEAPONDAMAGE         = 2317;
const int FEAT_IMPROVEDSWEEP                  = 2318;
const int FEAT_WITHOUTTRACE                   = 2319;
const int FEAT_SKILLMASTERY1                  = 2320;

const int FEAT_NIPUP                          = 2326;

const int FEAT_IMPROVEDCHARGE                 = 2331;
const int FEAT_DEFENSIVESTRIKE                = 2332;

const int FEAT_MEDICALSPECIALIST1             = 2334;

const int FEAT_MEDICALMASTERY                 = 2336;
const int FEAT_MEDICALSPECIALIST2             = 2337;

const int FEAT_MEDICALSPECIALIST3             = 2339;

const int FEAT_SMARTDEFENSE                   = 2341;
const int FEAT_SKILLMASTERY2                  = 2343;
const int FEAT_MINORBREAKTHROUGH              = 2344;

const int FEAT_MAJORBREAKTHROUGH              = 2347;
const int FEAT_UNLIMITEDACCESS                = 2348;
const int FEAT_BONUSCLASSSKILL1               = 2349;
const int FEAT_ROYALTY1                       = 2350;

const int FEAT_BONUSCLASSSKILL2               = 2352;
const int FEAT_ROYALTY2                       = 2354;
const int FEAT_CONCEALMOTIVE                  = 2355;

const int FEAT_LIVINGWEAPON                   = 2382;

const int FEAT_FLYINGKICK                     = 2383;
const int FEAT_JURYRIG                        = 2386;
const int FEAT_IMPROVEDJURYRIG                = 2387;

/////////////////////////////////////////////////////
// OCCUPATION LISTING
/////////////////////////////////////////////////////
const int OCCU_ACADEMIC                       = 2362;
const int OCCU_ADVENTURER                     = 2363;
const int OCCU_ATHLETE                        = 2364;
const int OCCU_BLUECOLLAR                     = 2365;
const int OCCU_CELEBRITY                      = 2366;
const int OCCU_CREATIVE                       = 2367;
const int OCCU_CRIMINAL                       = 2368;
const int OCCU_DILETTANTE                     = 2369;
const int OCCU_DOCTOR                         = 2370;
const int OCCU_EMERGENCYSERVICES              = 2371;
const int OCCU_ENTREPRENEUR                   = 2372;
const int OCCU_INVESTIGATIVE                  = 2373;
const int OCCU_LAWENFORCEMENT                 = 2374;
const int OCCU_MILITARY                       = 2375;
const int OCCU_RELIGIOUS                      = 2376;
const int OCCU_RURAL                          = 2377;
const int OCCU_STUDENT                        = 2378;
const int OCCU_TECHNICIAN                     = 2379;
const int OCCU_WHITECOLLAR                    = 2380;

/////////////////////////////////////////////////////////
// PSYCHIC POWER FEAT LISTING
/////////////////////////////////////////////////////////
const int SKILL_WT_BURST                          = 2415;
const int SKILL_WT_DAZE                           = 2416;
const int SKILL_WT_DETECTPSIONICS                 = 2417;
const int SKILL_WT_DISTRACT                       = 2418;
const int SKILL_WT_FARHAND                        = 2419;
const int SKILL_WT_FARPUNCH                       = 2420;
const int SKILL_WT_FINGEROFFIRE                   = 2421;
const int SKILL_WT_MISSIVE                        = 2422;
const int SKILL_WT_VALOR                          = 2423;
const int SKILL_WT_VERVE                          = 2424;

/////////////////////////////////////////////////////////
// SKILL LISTING
/////////////////////////////////////////////////////////
const int SKILL_BALANCE                             = 27;
const int SKILL_CLIMB                               = 28;
const int SKILL_COMPUTER_USE                        = 29;
const int SKILL_CRAFT_CHEMICAL                      = 30;
const int SKILL_CRAFT_ELECTRONIC                    = 31;
const int SKILL_CRAFT_MECHANICAL                    = 32;
const int SKILL_CRAFT_PHARMACEUTICAL                = 33;
const int SKILL_CRAFT_STRUCTURAL                    = 34;
const int SKILL_CRAFT_VISUAL_ART                    = 35;
const int SKILL_CRAFT_WRITING                       = 36;
const int SKILL_DECIPHER_SCRIPT                     = 37;
const int SKILL_DEMOLITIONS                         = 38;
const int SKILL_DISABLE_DEVICE                      = 39;
const int SKILL_DISGUISE                            = 40;
const int SKILL_DRIVE                               = 41;
const int SKILL_ESCAPE_ARTIST                       = 42;
const int SKILL_FORGERY                             = 43;
const int SKILL_GAMBLE                              = 44;
const int SKILL_GATHER_INFORMATION                  = 45;
const int SKILL_INVESTIGATE                         = 46;
const int SKILL_JUMP                                = 47;
const int SKILL_KNOWLEDGE_ARCANE_LORE               = 48;
const int SKILL_KNOWLEDGE_ART                       = 49;
const int SKILL_KNOWLEDGE_BEHAVIORAL_SCIENCES       = 50;
const int SKILL_KNOWLEDGE_BUSINESS                  = 51;
const int SKILL_KNOWLEDGE_CIVICS                    = 52;
const int SKILL_KNOWLEDGE_CURRENT_EVENTS            = 53;
const int SKILL_KNOWLEDGE_EARTH_SCIENCES            = 54;
const int SKILL_KNOWLEDGE_HISTORY                   = 55;
const int SKILL_KNOWLEDGE_PHYSICAL_SCIENCES         = 56;
const int SKILL_KNOWLEDGE_POPULAR_CULTURE           = 57;
const int SKILL_KNOWLEDGE_STREETWISE                = 58;
const int SKILL_KNOWLEDGE_TACTICS                   = 59;
const int SKILL_KNOWLEDGE_TECHNOLOGY                = 60;
const int SKILL_KNOWLEDGE_THEOLOGY_AND_PHILOSOPHY   = 61;
const int SKILL_NAVIGATE                            = 62;
const int SKILL_PILOT                               = 63;
const int SKILL_REPAIR                              = 64;
const int SKILL_RESEARCH                            = 65;
const int SKILL_SENSE_MOTIVE                        = 66;
const int SKILL_SLEIGHT_OF_HAND                     = 67;
const int SKILL_SURVIVAL                            = 68;
const int SKILL_PROFESSION                          = 69;
const int SKILL_HANDLE_ANIMAL                       = 70;
const int SKILL_RIDED20                             = 71;
const int SKILL_PSICRAFT                            = 72;
const int SKILL_AUTOHYPNOSIS                        = 73;

/////////////////////////////////////////////////
// RATE/RULES OF FIRE CONSTANTS
/////////////////////////////////////////////////
const int ITEM_PROPERTY_MAGAZINE           = 151;
const int ITEM_PROPERTY_MAG_BOX            = 0;
const int ITEM_PROPERTY_MAG_CYLINDER       = 1;
const int ITEM_PROPERTY_MAG_INTERNAL       = 2;
const int ITEM_PROPERTY_MAG_LINKED         = 3;

const int ITEM_PROPERTY_RATE_OF_FIRE  = 152;
const int IP_CONST_ROF_SINGLESHOT     = 0;
const int IP_CONST_ROF_SEMI_AUTOMATIC = 1;
const int IP_CONST_ROF_AUTOMATIC      = 2;

/////////////////////////////////////////
// BASE ITEM TYPES LISTINGS
/////////////////////////////////////////
const int BASE_ITEM_HEAVYARM_D12 = 6;
const int BASE_ITEM_HEAVYARM_D10 = 7;
const int BASE_ITEM_SMALLARM_D8  = 8;
const int BASE_ITEM_SMALLARM_D6  = 11;
const int BASE_ITEM_HEAVY_WEAPON = 201;

const int BASE_ITEM_AMMO_ROUNDS = 202;
const int BASE_ITEM_AMMO_SMALL = 20;
const int BASE_ITEM_AMMO_HEAVY = 25;
const int BASE_ITEM_AMMO_SLING = 27;

/////////////////////////////////////////
// INVENTORY SLOT LISTINGS
/////////////////////////////////////////
const int INVENTORY_SLOT_AMMO_SMALL = INVENTORY_SLOT_ARROWS;
const int INVENTORY_SLOT_AMMO_HEAVY = INVENTORY_SLOT_BOLTS;

////////////////////////////////////
// REPUTATION LISTINGS
////////////////////////////////////
const int REPUTATION_RECOGNIZED = 1;
const int REPUTATION_IGNORED    = 0;
const int ATTITUDE_FAMOUS       = 1;
const int ATTITUDE_INFAMOUS     = 0;

/////////////////////////////////////////
// DAMAGE TYPES
/////////////////////////////////////////
const int DAMAGE_TYPE_BALLISTIC = 14;
const int DAMAGE_TYPE_ENERGY = 15;

