// The main D20 include file.  Include this in any script that needs the skill or feat indices.
// Creature appearance type constants added for 2.0
// New feats and skills for 2.1


// DO NOT CHANGE ANYTHING BELOW THIS LINE

//set Feat & Skill constants for clarity in scripts
int FEAT_ACROBATIC = 2213;
int FEAT_AGILERIPOST = 2200;
int FEAT_AIRCRAFTOP_HELICOPTER = 2201;
int FEAT_ANIMALAFFINITY = 2202;
int FEAT_ATHLETIC = 2203;
int FEAT_ATTENTIVE = 2204;
int FEAT_BRAWL = 100;
int FEAT_BUILDER_CHEMICAL = 2207;
int FEAT_BUILDER_ELECTRONIC = 2208;
int FEAT_BUILDER_MECHANICAL = 2209;
int FEAT_BUILDER_STRUCTURAL = 2210;
int FEAT_CAUTIOUS = 2212;
int FEAT_CONFIDENT = 2214;
int FEAT_DEADAIM = 2215;
int FEAT_DECEPTIVE = 2216;
int FEAT_EDUCATED = 2217;
int FEAT_ENDURANCE = 2218;
int FEAT_FARSHOT = 2219;
int FEAT_FOCUSED = 2220;
int FEAT_FRIGHTFUL_PRESENCE = 2221;
int FEAT_GEARHEAD = 2222;
int FEAT_GUIDE = 2223;
int FEAT_IMPROVEDBRAWL = 630;
int FEAT_LOWPROFILE = 2226;
int FEAT_MEDICAL_EXPERT = 2227;
int FEAT_METICULOUS = 2228;
int FEAT_NIMBLE = 2229;
int FEAT_PERSONAL_FIREARMS_PROFICIENCY = 2230;
int FEAT_RENOWN = 2231;
int FEAT_RUN = 2232;
int FEAT_RELOAD = 2233;
int FEAT_STRAFE = 2314;
int FEAT_STREET_FIGHTING = 2235;
int FEAT_STUDIOUS = 2236;
int FEAT_SURFACE_VEHICLEOP_HEAVY = 2237;
int FEAT_SURFACE_VEHICLE_OP_BOAT = 2238;
int FEAT_SURFACE_VEHICLEOP_SHIP = 2239;
int FEAT_SURFACE_VEHICLEOP_TRACKED = 2240;
int FEAT_TRACK = 2241;
int FEAT_TRUSTWORTHY = 2242;
int FEAT_VEHICLE_EXPERT = 2243;
int FEAT_WINDFALL = 2244;
int FEAT_ADVANCED_FIREARMS_PROFICIENCY = 2245;
int FEAT_EXOTIC_FIREARMS_PROFICIENCY = 2246;
int FEAT_AIRCRAFTOP_JET = 2247;
int FEAT_QUICK_RELOAD = 2248;
int FEAT_WEAPON_PROFICIENCY_ARCHAIC = 2250;
int FEAT_EXTREMEEFFORT= 2251;
int FEAT_IMPROVEDEXTREMEEFFORT = 2252;
int FEAT_ADVANCEDEXTREMEEFFORT = 2253;
int FEAT_IGNOREHARDNESS = 2254;
int FEAT_IMPROVEDIGNOREHARDNESS = 2255;
int FEAT_ADVANCEDIGNOREHARDNESS = 2256;
int FEAT_MELEESMASH = 2257;
int FEAT_IMPROVEDMELEESMASH = 2258;
int FEAT_ADVANCEDMELEESMASH = 2259;
int FEAT_D20EVASION = 2260;
int FEAT_D20UNCANNYDODGE1 = 2261;
int FEAT_D20UNCANNYDODGE2 = 2262;
int FEAT_D20DEFENSIVEROLL = 2263;
int FEAT_OPPORTUNIST1 = 2264;
int FEAT_INCREASEDSPEED = 2265;
int FEAT_IMPROVEDINCREASEDSPEED = 2266;
int FEAT_ADVANCEDINCREASEDSPEED = 2267;
int FEAT_DAMAGEREDUCTION1 = 2268;
int FEAT_DAMAGEREDUCTION2 = 2269;
int FEAT_DAMAGEREDUCTION3 = 2270;
int FEAT_ACIDRESISTANCE = 2271;
int FEAT_COLDRESISTANCE = 2272;
int FEAT_ELECTRICITYRESISTANCE = 2273;
int FEAT_FIRERESISTANCE = 2274;
int FEAT_SONICCONCUSSIONRESISTANCE = 2275;
int FEAT_REMAINCONSCIOUS = 2276;
int FEAT_ROBUST = 2277;
int FEAT_SECONDWIND = 2278;
int FEAT_STAMINA = 2279;
int FEAT_SAVANT = 2280;
int FEAT_LINGUIST = 2281;
int FEAT_EXPLOITWEAKNESS = 2282;
int FEAT_PLAN = 2283;
int FEAT_TRICK = 2284;
int FEAT_EMPATHY = 2285;
int FEAT_IMPROVEDAIDANOTHER = 2286;
int FEAT_INTUITION = 2287;
int FEAT_HEALINGKNACK = 2288;
int FEAT_HEALINGTOUCH1 = 2289;
int FEAT_HEALINGTOUCH2 = 2290;
int FEAT_SKILLEMPHASIS = 2291;
int FEAT_AWARE = 2292;
int FEAT_FAITH = 2293;
int FEAT_COOLUNDERPRESSURE = 2294;
int FEAT_CHARM = 2295;
int FEAT_FAVOR = 2296;
int FEAT_CAPTIVATE  = 2297;
int FEAT_FASTTALK  = 2298;
int FEAT_DAZZLE  = 2299;
int FEAT_TAUNT  = 2300;
int FEAT_COORDINATE  = 2301;
int FEAT_INSPIRATION = 2302;
int FEAT_GREATERINSPIRATION = 2303;
int FEAT_SHARPSHOOTING = 2310;
int FEAT_QUICKDRAW = 2312;
int FEAT_SHOTONTHERUN = 2313;
int FEAT_SWEEP = 2315;
int FEAT_IMPROVISEDIMPLEMENTS = 2316;
int FEAT_IMPROVISEDWEAPONDAMAGE = 2317;
int FEAT_IMPROVEDSWEEP = 2318;
int FEAT_WITHOUTTRACE = 2319;
int FEAT_SKILLMASTERY1 = 2320;
int FEAT_DAMAGETHRESHOLD = 2325;
int FEAT_NIPUP = 2326;
int FEAT_IMPROVEDCHARGE = 2331;
int FEAT_DEFENSIVESTRIKE = 2332;
int FEAT_MEDICALSPECIALIST1 = 2334;
int FEAT_EXPERTHEALER = 2335;
int FEAT_MEDICALMASTERY = 2336;
int FEAT_MEDICALSPECIALIST2 = 2337;
int FEAT_MEDICALSPECIALIST3 = 2339;
int FEAT_SMARTDEFENSE = 2341;
int FEAT_SKILLMASTERY2 = 2343;
int FEAT_MINORBREAKTHROUGH = 2344;
int FEAT_SMARTWEAPON = 2346;
int FEAT_MAJORBREAKTHROUGH = 2347;
int FEAT_UNLIMITEDACCESS = 2348;
int FEAT_BONUSCLASSSKILL1 = 2349;
int FEAT_ROYALTY1 = 2350;
int FEAT_BONUSCLASSSKILL2 = 2352;
int FEAT_ROYALTY2 = 2354;
int FEAT_CONCEALMOTIVE = 2355;
int FEAT_ACADEMIC = 2362;
int FEAT_ADVENTURER = 2363;
int FEAT_ATHLETE = 2364;
int FEAT_BLUECOLLAR = 2365;
int FEAT_CELEBRITY = 2366;
int FEAT_CREATIVE = 2367;
int FEAT_CRIMINAL = 2368;
int FEAT_DILETTANTE = 2369;
int FEAT_DOCTOR = 2370;
int FEAT_EMERGENCYSERVICES = 2371;
int FEAT_ENTREPRENEUR = 2372;
int FEAT_INVESTIGATIVE = 2373;
int FEAT_LAWENFORCEMENT = 2374;
int FEAT_MILITARY = 2375;
int FEAT_RELIGIOUS = 2376;
int FEAT_RURAL = 2377;
int FEAT_STUDENT = 2378;
int FEAT_TECHNICIAN = 2379;
int FEAT_WHITECOLLAR = 2380;
int FEAT_SURGERY = 2381;
int FEAT_LIVINGWEAPON = 2382;
int FEAT_FLYINGKICK = 2383;
int FEAT_JURYRIG = 2386;


int IP_CONST_FEAT_ACADEMIC = 42;
int IP_CONST_FEAT_ADVENTURER = 43;
int IP_CONST_FEAT_ATHLETE = 44;
int IP_CONST_FEAT_BLUECOLLAR = 45;
int IP_CONST_FEAT_CELEBRITY = 46;
int IP_CONST_FEAT_CREATIVE = 47;
int IP_CONST_FEAT_CRIMINAL = 48;
int IP_CONST_FEAT_DILETTANTE = 49;
int IP_CONST_FEAT_DOCTOR = 50;
int IP_CONST_FEAT_EMERGENCYSERVICES = 51;
int IP_CONST_FEAT_ENTREPRENEUR = 52;
int IP_CONST_FEAT_INVESTIGATIVE = 53;
int IP_CONST_FEAT_LAWENFORCEMENT = 54;
int IP_CONST_FEAT_MILITARY = 55;
int IP_CONST_FEAT_RELIGIOUS = 56;
int IP_CONST_FEAT_RURAL = 57;
int IP_CONST_FEAT_STUDENT = 58;
int IP_CONST_FEAT_TECHNICIAN = 59;
int IP_CONST_FEAT_WHITECOLLAR = 60;
int IP_CONST_FEAT_PERSONALFIREARMSPROFICIENCY = 61;
int IP_CONST_FEAT_IMPROVEDSTRIKE = 62;
int IP_CONST_FEAT_FARSHOT = 63;
int IP_CONST_FEAT_DARKVISION = 64;

int CLASS_TYPE_TOUGH = 0;
int CLASS_TYPE_CHARISMATIC = 1;
int CLASS_TYPE_ACOLYTE = 2;
int CLASS_TYPE_DEDICATED = 3;
int CLASS_TYPE_STRONG = 4;
int CLASS_TYPE_SMART = 6;
int CLASS_TYPE_FAST = 8;
int CLASS_TYPE_MAGE =10;
int CLASS_TYPE_SOLDIER =39;
int CLASS_TYPE_MARTIAL_ARTIST = 49;
int CLASS_TYPE_GUNSLINGER = 41;
int CLASS_TYPE_INFILTRATOR = 42;
int CLASS_TYPE_DAREDEVIL = 43;
int CLASS_TYPE_BODYGUARD = 44;
int CLASS_TYPE_FIELDSCIENTIST = 45;
int CLASS_TYPE_FIELDMEDIC = 46;
int CLASS_TYPE_PERSONALITY = 47;
int CLASS_TYPE_NEGOTIATOR = 48;
int CLASS_TYPE_TECHIE = 50;
int CLASS_TYPE_INVESTIGATOR = 51;
int CLASS_TYPE_TELEPATH = 52;
int CLASS_TYPE_BATTLE_MIND = 53;
int CLASS_TYPE_SHADOW_SLAYER = 54;
int CLASS_TYPE_OCCULTIST = 55;

int SKILL_BALANCE = 27;
int SKILL_CLIMB = 28;
int SKILL_COMPUTER_USE = 29;
int SKILL_CRAFT_CHEMICAL = 30;
int SKILL_CRAFT_ELECTRONIC = 31;
int SKILL_CRAFT_MECHANICAL = 32;
int SKILL_CRAFT_PHARMACEUTICAL = 33;
int SKILL_CRAFT_STRUCTURAL = 34;
int SKILL_CRAFT_VISUAL_ART = 35;
int SKILL_CRAFT_WRITING = 36;
int SKILL_DECIPHER_SCRIPT = 37;
int SKILL_DEMOLITIONS = 38;
int SKILL_DISABLE_DEVICE = 39;
int SKILL_DISGUISE = 40;
int SKILL_DRIVE = 41;
int SKILL_ESCAPE_ARTIST = 42;
int SKILL_FORGERY = 43;
int SKILL_GAMBLE = 44;
int SKILL_GATHER_INFORMATION = 45;
int SKILL_INVESTIGATE = 46;
int SKILL_JUMP = 47;
int SKILL_KNOWLEDGE_ARCANE_LORE = 48;
int SKILL_KNOWLEDGE_ART = 49;
int SKILL_KNOWLEDGE_BEHAVIORAL = 50;
int SKILL_KNOWLEDGE_BUSINESS = 51;
int SKILL_KNOWLEDGE_CIVICS = 52;
int SKILL_KNOWLEDGE_CURRENT = 53;
int SKILL_KNOWLEDGE_EARTH_SCIENCES = 54;
int SKILL_KNOWLEDGE_HISTORY = 55;
int SKILL_KNOWLEDGE_PHYSICAL_SCIENCES = 56;
int SKILL_KNOWLEDGE_POPULAR = 57;
int SKILL_KNOWLEDGE_STREETWISE = 58;
int SKILL_KNOWLEDGE_TACTICS = 59;
int SKILL_KNOWLEDGE_TECHNOLOGY = 60;
int SKILL_KNOWLEDGE_THEOLOGY = 61;
int SKILL_NAVIGATE = 62;
int SKILL_PILOT = 63;
int SKILL_REPAIR = 64;
int SKILL_RESEARCH = 65;
int SKILL_SENSE_MOTIVE = 66;
int SKILL_SLEIGHT_OF_HAND = 67;
int SKILL_SURVIVAL = 68;
int SKILL_PROFESSION = 69;
int SKILL_HANDLE_ANIMAL = 70;
int SKILL_RIDED20 = 71;
int SKILL_PSICRAFT = 72;
int SKILL_AUTOHYPNOSIS = 73;

//Set appearance type constants for polymorphing scripts
/*
869       "[mdrn]Tiefighter"                                    ****           ****                          tiefighter           default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.0          1.0             1          1.1         3.1              H                ****             10             ****        ****        po_mi_x_sh05       5                9                  0                -1               1             60             30             impact              0            1
870       "[mdrn]Tiefightersm"                                  ****           ****                          tiefightersm         default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_mi_x_sh05       3                9                  0                -1               1             60             30             impact              0            1
871       "[mdrn]Impshuttle"                                    ****           ****                          impshuttle           default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.0          1.0             1          1.1         3.1              H                ****             10             ****        ****        po_mi_x_sh16       5                9                  0                -1               1             60             30             impact              0            1
872       "[mdrn]Impshuttlesm"                                  ****           ****                          impshuttlesm         default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_mi_x_sh16       3                9                  0                -1               1             60             30             impact              0            1
873       "[mdrn]Diskdroid"                                     ****           Bat                           diskdroid            ****               N             S             ****            1                   1                  1                  FAST         2.25         4.5         0.2          0.2             1          0.2         1.6              H                1                21             1           1           po_WillOWisp       2                9                  -1               17               0             60             30             ****                0            1
874       "[mdrn]Mousedroid"                                    ****           Rat                           mousedroid           ****               N             S             ****            1                   1                  1                  FAST         0.77         1.2         0.3          0.3             1          0.3         2                L                0                2              1           1           po_Rat             1                9                  -1               2                1             60             30             Rat_head            0            1
875       "[mdrn]Jawadroid"                                     ****           Rat                           jawadroid            ****               N             S             ****            1                   1                  1                  FAST         0.77         1.2         0.3          0.3             1          0.3         2                L                0                2              1           1           po_Rat             1                9                  -1               2                1             60             30             Rat_head            0            1
876       "[mdrn]Dracoterminator                                ****           Dragon_Term                   c_drgterm            default            G             S             ****            1                   1                  1                  FAST         3.33         6           1.1          2               1          1.1         3.1              H                1                5              1           1           po_DrgWhite        5                10                 2                22               0             60             30             Dragon_head         3            1
877       "[mdrn]Mechanon, Spiker"                              ****           spiker                        c_spiker             ****               N             S             ****            1                   1                  1                  VFAST        2.45         2.25        0.6          1               1          1           2.3              L                0                23             1           1           po_spiker          3                9                  3                2                1             60             30             Head_g              0            1
878       "[mdrn]Mechanon, Spider"                              ****           mspider                       c_mspider            ****               N             S             ****            1                   1                  1                  vFAST        2.45         2.25        0.6          1               1          1           2.3              L                0                23             1           1           po_spider          3                9                  3                2                1             60             30             ****                0            1
879       "[mdrn]Mechanon, Cutter"                              ****           mwasp                         c_mwasp              ****               N             S             ****            1                   1                  1                  vFAST        2.45         2.25        0.6          1               1          1           2.3              L                0                23             1           1           po_wasp            3                9                  3                2                1             60             30             ****                0            1
880       "[mdrn]Tank_01"                                       ****           Tank_01                       tank_01              ****               W             s             ****            ****                ****               ****               FAST         3.33         6           1.0          1.0             1          0.9         2                H                0                4              0           0           po_mi_x_ve01       4                9                  50               47               0             60             30             IroGolem_head       3            1
881       "[mdrn]Tank_02"                                       ****           Tank_02                       tank_02              ****               W             s             ****            ****                ****               ****               FAST         3.33         6           1.0          1.0             1          0.9         2                H                0                4              0           0           po_mi_x_ve01       4                9                  50               47               0             60             30             IroGolem_head       3            1
882       "[mdrn]Tank_03"                                       ****           Tank_03                       tank_03              ****               W             s             ****            ****                ****               ****               FAST         3.33         6           1.0          1.0             1          0.9         2                H                0                4              0           0           po_mi_x_ve01       4                9                  50               47               0             60             30             IroGolem_head       3            1
883       "[mdrn]Helicopter"                                    ****           invsguy                       c_heli               default            N             L             1               1                   1.05               0.85               VFAST        1.6          3.2         0.3          0.5             1          0.3         1.7              H                1                11             1           1           po_mi_x_ve06       3                9                  51               49               ****          ****           ****           ****                6            0
884       "[mdrn]Humvee 1"                                      ****           Humvee                        c_humvee1            ****               N             S             ****            1                   1                  1                  FAST         3.33         6           1.0          1.0             1          1.1         3.3              H                1                5              1           1           po_mi_x_ve01       4                10                 50               47               0             60             30             head_g              3            1
885       "[mdrn]Humvee 2"                                      ****           Humvee                        c_humvee2            ****               N             S             ****            1                   1                  1                  FAST         3.33         6           1.0          1.0             1          1.1         3.3              H                1                5              1           1           ****               4                10                 50               47               0             60             30             head_g              3            1
886       "[mdrn]LargeFirefly"                                  ****           ****                          fireflylg            default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.01         2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
887       "[mdrn]LargeShuttle3"                                 ****           ****                          ffshuttle3lg         default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
888       "[mdrn]LargeShuttle4"                                 ****           ****                          ffshuttle4lg         default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
889       "[mdrn]LargeFighter1"                                 ****           ****                          fffighter1lg         default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
890       "[mdrn]LargeFighter2"                                 ****           ****                          fffighter2lg         default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
891       "[mdrn]LargeFighter3"                                 ****           ****                          fffighter3lg         default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
*/
int APPEARANCE_TYPE_MDRN_FIREFLYSHUTTLE = 892;
/*
893       "[mdrn]SmallCargoShip"                                ****           ****                          ffcargoship          default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
894       "[mdrn]SmallCargoShip2"                               ****           ****                          ffcargo2             default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
895       "[mdrn]SmallShuttle3"                                 ****           ****                          ffshuttle3sm         default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_DeerWhite       3                9                  0                ****             1             60             30             impact              0            1
896       "[mdrn]SmallShuttle4"                                 ****           ****                          ffshuttle4sm         default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_DeerWhite       3                9                  0                ****             1             60             30             impact              0            1
897       "[mdrn]SmallFighter1"                                 ****           ****                          fffighter1sm         default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_DeerWhite       3                9                  0                ****             1             60             30             impact              0            1
898       "[mdrn]SmallFighter2"                                 ****           ****                          fffighter2sm         default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_DeerWhite       3                9                  0                ****             1             60             30             impact              0            1
899       "[mdrn]SmallFighter3"                                 ****           ****                          fffighter3sm         default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_DeerWhite       3                9                  0                ****             1             60             30             impact              0            1
900       "[mdrn]Chevrolet"                                     ****           plc_car_chev                  plc_car_chev         ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve09       5                9                  50               48               1             60             30             head_g              3            1
901       "[mdrn]Tank, Camo"                                    ****           tankcamo                      tankcamo             ****               N             F             0.2             ****                ****               ****               VSLOW        9.0          9.0         1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve02       5                9                  50               47               1             ****           ****           head_g              7            1
902       "[mdrn]SUV"                                           ****           mod_suv                       mod_suv              ****               N             L             0.2             ****                ****               ****               FAST         9.0          9.0         1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve09       5                9                  50               47               1             ****           ****           head_g              7            1
903       "[mdrn]Old Luxury"                                    ****           car1                          car1                 ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve09       5                9                  50               47               1             60             30             head_g              3            1
904       "[mdrn]Black"                                         ****           car2                          car2                 ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve09       5                9                  50               47               1             60             30             head_g              3            1
905       "[mdrn]Bulldozer"                                     ****           plc_bulldozer                 plc_bulldozer        ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve01       5                9                  50               47               1             60             30             head_g              3            1
906       "[mdrn]Red Sportscar"                                 ****           car4                          car4                 ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve09       5                9                  50               48               1             60             30             head_g              3            1
907       "[mdrn]Bike"                                          ****           bike                          bike                 ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve08       5                9                  50               47               1             60             30             head_g              3            1
908       "[mdrn]Green Sportscar"                               ****           car6                          car6                 ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve09       5                9                  50               48               1             60             30             head_g              3            1
909       "[mdrn]Black Caddy"                                   ****           blackcar                      blackcar             ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.0          1.0             1          2.5         2.5              L                1                4              1           1           po_mi_x_ve09       5                9                  50               48               1             60             30             head_g              3            1
910       "[mdrn]Attack bot A"                                  ****           Attack_bota                   bota                 ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
911       "[mdrn]Attack bot B"                                  ****           Attack_botb                   botb                 ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
912       "[mdrn]Attack bot C"                                  ****           Attack_botc                   botc                 ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
913       "[mdrn]Attack Bot D"                                  ****           Attack_botd                   botd                 ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
914       "[mdrn]Attack Bot E"                                  ****           Attack_bote                   bote                 ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
915       "[mdrn]Armored Aribeth A"                             ****           A_AribethA                    c_hybridA            default            R             F             1               1                   1                  1                  NORM         1.44         2.42        0.25         0.4             1          0.25        1.4              H                1                7              1           1           ****               3                9                  0                0                1             60             30             ****                6            1
916       "[mdrn]Armored Aribeth B"                             ****           A_AribethB                    c_hybridB            default            R             F             1               1                   1                  1                  NORM         1.44         2.42        0.25         0.4             1          0.25        1.4              H                1                7              1           1           ****               3                9                  0                0                1             60             30             ****                6            1
917       "[mdrn]Armored Aribeth C"                             ****           A_AribethC                    c_hybridC            default            R             F             1               1                   1                  1                  NORM         1.44         2.42        0.25         0.4             1          0.25        1.4              H                1                7              1           1           ****               3                9                  0                0                1             60             30             ****                6            1
918       "[mdrn]Modern Minotaur A"                             ****           MMinotaurA                    mintb                default            R             L             1.95            ****                ****               ****               NORM         2.67         3           0.4          1.1             1          0.4         1.2              H                1                12             1           1           po_Minotaur        4                9                  5                1                1             60             30             head_g              6            1
919       "[mdrn]Modern Minotaur B"                             ****           MMinotaurB                    mintR                default            R             L             1.95            ****                ****               ****               NORM         2.67         3           0.4          1.1             1          0.4         1.2              H                1                12             1           1           po_Minotaur        4                9                  5                1                1             60             30             head_g              6            1
920       "[mdrn]Modern Minotaur C"                             ****           MMinotaurC                    mintG                default            R             L             1.95            ****                ****               ****               NORM         2.67         3           0.4          1.1             1          0.4         1.2              H                1                12             1           1           po_Minotaur        4                9                  5                1                1             60             30             head_g              6            1
921       "[mdrn]Modern Minotaur D"                             ****           MMinotaurD                    mintM                default            R             L             1.95            ****                ****               ****               NORM         2.67         3           0.4          1.1             1          0.4         1.2              H                1                12             1           1           po_Minotaur        4                9                  5                1                1             60             30             head_g              6            1
922       "[mdrn]Modern Minotaur E"                             ****           MMinotaurE                    mintN                default            R             L             1.95            ****                ****               ****               NORM         2.67         3           0.4          1.1             1          0.4         1.2              H                1                12             1           1           po_Minotaur        4                9                  5                1                1             60             30             head_g              6            1
923       "[mdrn]Modern Female A"                               ****           Mod_femaleA                   girlb                default            R             F             1               1                   1.05               0.85               NORM         1.6          2.7         0.25         0.4             1          0.25        1.6              H                1                11             1           1           po_hu_f_99         3                9                  0                0                1             60             30             head_g              6            1
924       "[mdrn]Modern Female B"                               ****           Mod_femaleB                   girlr                default            R             F             1               1                   1.05               0.85               NORM         1.6          2.7         0.25         0.4             1          0.25        1.6              H                1                11             1           1           po_hu_f_99         3                9                  0                0                1             60             30             head_g              6            1
925       "[mdrn]Modern Female C"                               ****           Mod_femaleC                   girlg                default            R             F             1               1                   1.05               0.85               NORM         1.6          2.7         0.25         0.4             1          0.25        1.6              H                1                11             1           1           po_hu_f_99         3                9                  0                0                1             60             30             head_g              6            1
926       "[mdrn]Modern Female D"                               ****           Mod_femaleD                   girlk                default            R             F             1               1                   1.05               0.85               NORM         1.6          2.7         0.25         0.4             1          0.25        1.6              H                1                11             1           1           po_hu_f_99         3                9                  0                0                1             60             30             head_g              6            1
927       "[mdrn]Modern Female E"                               ****           Mod_femaleE                   girlt                default            R             F             1               1                   1.05               0.85               NORM         1.6          2.7         0.25         0.4             1          0.25        1.6              H                1                11             1           1           po_hu_f_99         3                9                  0                0                1             60             30             head_g              6            1
928       "[mdrn]Power Armor"                                   ****           Powerarmor                    powersuit            default            R             F             1               1                   1.05               0.85               NORM         1.6          2.7         0.25         0.4             1          0.25        1.6              H                1                11             1           1           po_hu_m_99         3                9                  0                0                1             60             30             head_g              6            1
929       "[mdrn]Deathclaw, brass"                              ****           DeathclawBrass                c_deathclawbrass     ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
930       "[mdrn]Deathclaw, bronze"                             ****           DeathclawBronze               c_deathclawbronze    ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
931       "[mdrn]Deathclaw, red"                                ****           Deathclawred                  c_deathclawred       ****               R             S             1               1                   1                  1                  FAST         2.43         5           0.75         1.5             1          1           2.5              H                1                17             1           1           po_GreyRend        4                9                  1                1                1             60             30             gnthill_head_g      0            1
932       "[mdrn]Cow, Two headed"                               ****           Cow_2head                     c_cow_2head          ****               R             S             ****            1                   1                  1                  SLOW         1.52         1.92        0.6          1.3             1          1.3         2.9              H                1                2              1           1           po_Cow             3                9                  4                2                0             60             30             Ox_head             0            1
933       "[mdrn]Terminator, Big"                               ****           c_skel_term                   c_skel_term          default            W             F             1.3             1                   1                  1                  NORM         2.7          3.5         0.3          0.7             1          0.3         1.8              H                1                14             1           1           po_GnollWiz        3                9                  0                0                1             60             30             head_g              6            1
934       "[mdrn]Terminator, Small"                             ****           term_sml                      term_sml             default            W             F             1.3             1                   1                  1                  NORM         2.7          3.5         0.3          0.7             1          0.3         1.8              H                1                14             1           1           po_GnollWiz        3                9                  0                0                1             60             30             head_g              6            1
935       "[mdrn]Shield Guard Metal"                            ****           Shield_Gaurd_Metal            c_sh_blue            ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
936       "[mdrn]Shield Guard Vuong"                            ****           Shield_Gaurd_Vuong            c_sh_vuong           ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
937       "[mdrn]Shield Guard Wood"                             ****           Shield_Gaurd_Wood             c_sh_wood            ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
938       "[mdrn]Shield Guard Chrome"                           ****           Shield_Gaurd_Chrome           c_sh_chrome          ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
939       "[mdrn]Shield Guard Veins"                            ****           Shield_Gaurd_Veins            c_sh_veins           ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
940       "[mdrn]Shield Guard Tinge"                            ****           Shield_Gaurd_Tinge            c_sh_tinge           ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
941       "[mdrn]Shield Guard Gold"                             ****           Shield_Gaurd_Gold             c_sh_gold            ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
942       "[mdrn]Shield Guard Fatal"                            ****           Shield_Gaurd_Fatal            c_sh_fatal           ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
943       "[mdrn]Shield Guard Black"                            ****           Shield_Gaurd_Black            c_sh_black           ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
944       "[mdrn]Shield Guard Clan"                             ****           Shield_Gaurd_Clan             c_sh_clan            ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
945       "[mdrn]Shield Guard Mage"                             ****           Shield_Gaurd_Mage             c_sh_mage            ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
946       "[mdrn]Shield Guard Knight"                           ****           Shield_Gaurd_Knight           c_sh_knight          ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
947       "[mdrn]Shield Guard Mortar"                           ****           Shield_Gaurd_Mortar           c_sh_mortar          ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
948       "[mdrn]Shield Guard Bizarro"                          ****           Shield_Gaurd_Bizarro          c_sh_bizarro         ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
949       "[mdrn]Shield Guard Rust"                             ****           Shield_Gaurd_Rust             c_sh_rust            ****               W             L             2.1             1                   1                  1                  FAST         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_ShGuard         4                9                  1                9                1             60             30             IroGolem_head       3            1
950       "[mdrn]Golem Flesh Wrap"                              ****           Golem_Flesh_Wrap              c_flesh_wrap         ****               R             S             ****            1                   1                  1                  NORM         2.33         3.2         0.3          0.5             1          0.3         1.9              H                1                4              1           1           po_GolFlesh        4                9                  0                2                1             60             30             head_g              5            1
951       "[mdrn]Vehicle - Semi Truck (Removed for now)"        ****           plc_bulldozer                 plc_bulldozer        ****               N             F             0.2             ****                ****               ****               FAST         9.0          9.0         1.0          7.0             1          5.5         3.0              H                ****             4              0           1           ****               4                10                 0                ****             0             ****           ****           head_g              7            1
952     ****                                                  ****           ****                          ****                 ****               ****          ****          ****            ****                ****               ****               ****         ****         ****        ****         ****            ****       ****        ****             ****             ****             ****           ****        ****        ****               ****             ****               ****             ****             ****          ****           ****           ****                ****         ****
953       "[mdrn]Vehicle - Attack Heli"                         ****           c_helicopter                  c_helicopter         ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        0.1          1.6             1          1           1.9              H                1                4              1           1           po_mi_x_ve05       5                9                  51               49               1             60             30             head_g              0            1
954       "[mdrn]Biker"                                         ****           c_biker                       c_biker              ****               R             L             1               1                   1                  1                  NORM         1.6          2.7         0.2          0.4             1          0.2         1.7              H                1                11             1           1           ****               3                9                  0                0                1             60             30             head_g              6            1
955       "[mdrn]Diver"                                         ****           c_frogman                     c_frogman            ****               R             L             1               1                   1                  1                  SLOW         1.6          2.7         0.2          0.4             1          0.2         1.7              H                1                11             1           1           po_diver           3                9                  0                0                1             60             30             head_g              6            1
956       "[mdrn]Terminator, Normal"                            ****           c_termnorm                    c_termnorm           default            W             F             1               1                   1                  1                  NORM         1.6          2.7         0.2          0.4             1          0.2         1.7              H                1                23             1           1           po_Sk_War01        3                9                  8                13               1             60             30             head_g              5            1
957       "[mdrn]Net Golem"                                     ****           net_Golem                     net_Golem            ****               W             L             2.1             1                   1                  1                  SLOW         2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_GolIron         4                9                  1                9                1             60             30             IroGolem_head       3            1
958       "[mdrn]Vehicle - Attack Heli (untargetable)"          ****           c_helicopter                  c_helicopter         ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        0.6          1.6             1          1           1.9              H                1                4              1           1           po_mi_x_ve05       5                9                  51               49               1             60             30             head_g              0            0
*/
int APPEARANCE_TYPE_MDRN_XWING = 959;
int APPEARANCE_TYPE_MDRN_AWING = 960;
int APPEARANCE_TYPE_MDRN_BWING = 961;
int APPEARANCE_TYPE_MDRN_FREIGHTER = 962;
int APPEARANCE_TYPE_MDRN_CORVETTE = 963;
int APPEARANCE_TYPE_MDRN_XWING_SMALL = 964;
int APPEARANCE_TYPE_MDRN_AWING_SMALL = 965;
int APPEARANCE_TYPE_MDRN_BWING_SMALL = 966;
int APPEARANCE_TYPE_MDRN_FREIGHTER_SMALL = 967;
int APPEARANCE_TYPE_MDRN_CORVETTE_SMALL = 968;
/*
969       "[mdrn]SmallScoutship"                                ****           ****                          ffscout              default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
970       "[mdrn]LargeScoutship"                                ****           ****                          ffscoutlg            default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
971       "[mdrn]LargeCargoship"                                ****           ****                          ffcargoshiplg        default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
972       "[mdrn]LargeCargoship2"                               ****           ****                          ffcargo2lg           default            N             s             ****            ****                ****               ****               FAST         ****         ****        1.1          2               1          1.1         3.1              H                ****             10             ****        ****        po_DeerWhite       5                9                  0                ****             1             60             30             impact              0            1
973       "[mdrn]SmallFirefly"                                  ****           ****                          fireflysm            default            N             s             ****            ****                ****               ****               FAST         ****         ****        0.3          0.5             1          0.3         1.7              H                ****             10             ****        ****        po_DeerWhite       3                9                  0                ****             1             60             30             impact              0            1
2000      "[mdrn]ATST"                                          ****           v_ATST                        c_atst               ****               N             F             ****            1                   1                  1                  NORM         5.33         8           1.1          2               1          1.1         3.3              H                1                28             0           0           po_DrgBlack        5                10                 2                9                1             60             30             head_g              3            1
2001      "[mdrn]awing"                                         ****           v_awing                       v_awing              default            N             F             ****            ****                ****               ****               NORM         20           25          0.2          0.3             1          0.2         1.7              H                1                10             1           1           po_BtlFire         2                9                  ****             0                0             60             30             head_g              6            1
2002      "[mdrn]lambda"                                        ****           v_lambda                      v_lambda             default            N             F             ****            ****                ****               ****               NORM         20           25          0.2          0.3             1          0.2         1.7              H                1                10             1           1           po_BtlFire         2                9                  ****             0                0             60             30             head_g              6            1
*/
int APPEARANCE_TYPE_MDRN_EWING_SMALL = 2003;
/*
2004      "[mdrn]skyhopper"                                     ****           v_skyhopper                   v_skyhopper          default            N             F             ****            ****                ****               ****               NORM         20           25          0.2          0.3             1          0.2         1.7              H                1                10             1           1           po_BtlFire         2                9                  ****             0                0             60             30             head_g              6            1
2005      "[mdrn]ywing"                                         ****           v_ywing                       v_ywing              default            N             F             ****            ****                ****               ****               NORM         20           8           0.4          0.6             1          0.2         1.5              H                1                10             1           1           po_BtlFire         2                9                  ****             0                0             60             30             head_g              6            1
2006      "[mdrn]tie_interceptor"                               ****           v_tieinterceptor              v_tieinterceptor     default            N             F             ****            ****                ****               ****               NORM         20           8           0.3          0.5             1          0.2         1.5              H                1                10             1           1           po_BtlFire         2                9                  ****             0                0             60             30             head_g              6            1
2007      "[mdrn]tie_bomber"                                    ****           v_tie_bomber                  tiebomber01          default            N             F             ****            ****                ****               ****               NORM         20           25          0.2          0.3             1          0.2         1.7              H                1                10             1           1           po_BtlFire         2                9                  ****             0                1             60             30             head_g              6            1
2008      "[mdrn]tie_advanced"                                  ****           v_tie_advanced                tieadvenced01        default            N             F             ****            ****                ****               ****               NORM         20           25          0.2          0.3             1          0.2         1.7              H                1                10             1           1           po_BtlFire         2                9                  ****             0                1             60             30             head_g              6            1
2009      "[mdrn]hover1"                                        ****           v001                           v001                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2010      "[mdrn]hover2"                                        ****           v002                           v002                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2011      "[mdrn]hover3"                                        ****           v003                           v003                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2012      "[mdrn]hover4"                                        ****           v004                           v004                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2013      "[mdrn]hover5"                                        ****           v005                           v005                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2014      "[mdrn]hover6"                                        ****           v006                           v006                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2015      "[mdrn]hover7"                                        ****           v007                           v007                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2016      "[mdrn]hover8"                                        ****           v008                           v008                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2017      "[mdrn]hover9"                                        ****           v009                           v009                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2018      "[mdrn]hover10"                                       ****           v010                           v010                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2019      "[mdrn]hover11"                                       ****           v011                           v011                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2020      "[mdrn]hover12"                                       ****           v012                           v012                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2021      "[mdrn]hover13"                                       ****           v013                           v013                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2022      "[mdrn]hover14"                                       ****           v014                           v014                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2023      "[mdrn]hover15"                                       ****           v015                           v015                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2024      "[mdrn]hover16"                                       ****           v016                           v016                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
2025      "[mdrn]hover17"                                       ****           v017                           v017                ****               W             L             2.1             1                   1                  1                  VFAST        2.58         3.66        1.1          2.0             1          1           1.9              H                1                4              1           1           ****               5                9                  -1               52               1             60             30             head_g              0            1
*/
