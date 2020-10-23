
void TemplateAbility(object oSkin, int n = -1)
{
if(n == -1) n = d6();
switch(Random(174))
{
case 10: SetLocalInt(OBJECT_SELF,"bAURA_BLINDING",n); break;
case 11: SetLocalInt(OBJECT_SELF,"bAURA_COLD",n); break;
case 12: SetLocalInt(OBJECT_SELF,"bAURA_ELECTRICITY",n); break;
case 13: SetLocalInt(OBJECT_SELF,"bAURA_FEAR",n); break;
case 14: SetLocalInt(OBJECT_SELF,"bAURA_FIRE",n); break;
case 15: SetLocalInt(OBJECT_SELF,"bAURA_HORRIFICAPPEARANCE",n); break;
case 16: SetLocalInt(OBJECT_SELF,"bAURA_MENACE",n); break;
case 17: SetLocalInt(OBJECT_SELF,"bAURA_OF_COURAGE",n); break;
case 18: SetLocalInt(OBJECT_SELF,"bAURA_PROTECTION",n); break;
case 19: SetLocalInt(OBJECT_SELF,"bAURA_STUN",n); break;
case 20: SetLocalInt(OBJECT_SELF,"bAURA_UNEARTHLY_VISAGE",n); break;
case 21: SetLocalInt(OBJECT_SELF,"bAURA_UNNATURAL",n); break;

/*
// Not sure yet
case 22: SetLocalInt(OBJECT_SELF,"bBARBARIAN_RAGE",n); break;
case 23: SetLocalInt(OBJECT_SELF,"bBATTLE_MASTERY",n); break;
*/

case 30: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_CHARISMA",n); break;
case 31: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_CONSTITUTION",n); break;
case 32: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_DEXTERITY",n); break;
case 33: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_INTELLIGENCE",n); break;
case 34: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_STRENGTH",n); break;
case 35: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_WISDOM",n); break;
case 36: SetLocalInt(OBJECT_SELF,"bBOLT_ACID",n); break;
case 37: SetLocalInt(OBJECT_SELF,"bBOLT_CHARM",n); break;
case 38: SetLocalInt(OBJECT_SELF,"bBOLT_COLD",n); break;
case 39: SetLocalInt(OBJECT_SELF,"bBOLT_CONFUSE",n); break;
case 40: SetLocalInt(OBJECT_SELF,"bBOLT_DAZE",n); break;
case 41: SetLocalInt(OBJECT_SELF,"bBOLT_DEATH",n); break;
case 42: SetLocalInt(OBJECT_SELF,"bBOLT_DISEASE",n); break;
case 43: SetLocalInt(OBJECT_SELF,"bBOLT_DOMINATE",n); break;
case 44: SetLocalInt(OBJECT_SELF,"bBOLT_FIRE",n); break;
case 45: SetLocalInt(OBJECT_SELF,"bBOLT_KNOCKDOWN",n); break;
case 46: SetLocalInt(OBJECT_SELF,"bBOLT_LEVEL_DRAIN",n); break;
case 47: SetLocalInt(OBJECT_SELF,"bBOLT_LIGHTNING",n); break;
case 48: SetLocalInt(OBJECT_SELF,"bBOLT_PARALYZE",n); break;
case 49: SetLocalInt(OBJECT_SELF,"bBOLT_POISON",n); break;
case 50: SetLocalInt(OBJECT_SELF,"bBOLT_SHARDS",n); break;
case 51: SetLocalInt(OBJECT_SELF,"bBOLT_SLOW",n); break;
case 52: SetLocalInt(OBJECT_SELF,"bBOLT_STUN",n); break;
case 53: SetLocalInt(OBJECT_SELF,"bBOLT_WEB",n); break;
case 54: SetLocalInt(OBJECT_SELF,"bBREATH_PETRIFY",n); break;
case 55: SetLocalInt(OBJECT_SELF,"bCHARMMONSTER",n); break;
case 56: SetLocalInt(OBJECT_SELF,"bCOMMAND_THE_HORDE",n); break;
case 57: SetLocalInt(OBJECT_SELF,"bCONE_ACID",n); break;
case 58: SetLocalInt(OBJECT_SELF,"bCONE_COLD",n); break;
case 59: SetLocalInt(OBJECT_SELF,"bCONE_DISEASE",n); break;
case 60: SetLocalInt(OBJECT_SELF,"bCONE_FIRE",n); break;
case 61: SetLocalInt(OBJECT_SELF,"bCONE_LIGHTNING",n); break;
case 62: SetLocalInt(OBJECT_SELF,"bCONE_POISON",n); break;
case 63: SetLocalInt(OBJECT_SELF,"bCONE_SONIC",n); break;

// ???
/*
case 64: SetLocalInt(OBJECT_SELF,"bDC_DIVINE_WRATH",n); break;
case 65: SetLocalInt(OBJECT_SELF,"bDETECT_EVIL",n); break;
case 66: SetLocalInt(OBJECT_SELF,"bDIVINE_PROTECTION",n); break;
case 67: SetLocalInt(OBJECT_SELF,"bDIVINE_STRENGTH",n); break;
case 68: SetLocalInt(OBJECT_SELF,"bDIVINE_TRICKERY",n); break;
*/

case 69: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_ACID",n); break;
case 70: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_COLD",n); break;
case 71: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_FEAR",n); break;
case 72: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_FIRE",n); break;
case 73: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_GAS",n); break;
case 74: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_LIGHTNING",n); break;
case 75: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_NEGATIVE",n); break;
case 76: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_PARALYZE",n); break;
case 77: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_SLEEP",n); break;
case 78: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_SLOW",n); break;
case 79: SetLocalInt(OBJECT_SELF,"bDRAGON_BREATH_WEAKEN",n); break;
case 80: SetLocalInt(OBJECT_SELF,"bDRAGON_FEAR",n); break;
case 81: SetLocalInt(OBJECT_SELF,"bDRAGON_WING_BUFFET",n); break;
case 83: SetLocalInt(OBJECT_SELF,"bELEMENTAL_SHAPE",n); break;
case 93: SetLocalInt(OBJECT_SELF,"bGAZE_CHARM",n); break;
case 94: SetLocalInt(OBJECT_SELF,"bGAZE_CONFUSION",n); break;
case 95: SetLocalInt(OBJECT_SELF,"bGAZE_DAZE",n); break;
case 96: SetLocalInt(OBJECT_SELF,"bGAZE_DEATH",n); break;
case 97: SetLocalInt(OBJECT_SELF,"bGAZE_DESTROY_CHAOS",n); break;
case 98: SetLocalInt(OBJECT_SELF,"bGAZE_DESTROY_EVIL",n); break;
case 99: SetLocalInt(OBJECT_SELF,"bGAZE_DESTROY_GOOD",n); break;
case 100: SetLocalInt(OBJECT_SELF,"bGAZE_DESTROY_LAW",n); break;
case 101: SetLocalInt(OBJECT_SELF,"bGAZE_DOMINATE",n); break;
case 102: SetLocalInt(OBJECT_SELF,"bGAZE_DOOM",n); break;
case 103: SetLocalInt(OBJECT_SELF,"bGAZE_FEAR",n); break;
case 104: SetLocalInt(OBJECT_SELF,"bGAZE_PARALYSIS",n); break;
case 105: SetLocalInt(OBJECT_SELF,"bGAZE_PETRIFY",n); break;
case 106: SetLocalInt(OBJECT_SELF,"bGAZE_STUNNED",n); break;
case 107: SetLocalInt(OBJECT_SELF,"bGOLEM_BREATH_GAS",n); break;
case 108: SetLocalInt(OBJECT_SELF,"bHELL_HOUND_FIREBREATH",n); break;
case 109: SetLocalInt(OBJECT_SELF,"bHOWL_CONFUSE",n); break;
case 110: SetLocalInt(OBJECT_SELF,"bHOWL_DAZE",n); break;
case 111: SetLocalInt(OBJECT_SELF,"bHOWL_DEATH",n); break;
case 112: SetLocalInt(OBJECT_SELF,"bHOWL_DOOM",n); break;
case 113: SetLocalInt(OBJECT_SELF,"bHOWL_FEAR",n); break;
case 114: SetLocalInt(OBJECT_SELF,"bHOWL_PARALYSIS",n); break;
case 115: SetLocalInt(OBJECT_SELF,"bHOWL_SONIC",n); break;
case 116: SetLocalInt(OBJECT_SELF,"bHOWL_STUN",n); break;
case 120: SetLocalInt(OBJECT_SELF,"bKRENSHAR_SCARE",n); break;
/*
case 121: SetLocalInt(OBJECT_SELF,"bLAY_ON_HANDS",n); break;
case 122: SetLocalInt(OBJECT_SELF,"bLESSER_BODY_ADJUSTMENT",n); break;
*/
case 123: SetLocalInt(OBJECT_SELF,"bMANTICORE_SPIKES",n); break;
case 124: SetLocalInt(OBJECT_SELF,"bMEPHIT_SALT_BREATH",n); break;
case 125: SetLocalInt(OBJECT_SELF,"bMEPHIT_STEAM_BREATH",n); break;
case 126: SetLocalInt(OBJECT_SELF,"bMINDBLAST",n); break;
case 127: SetLocalInt(OBJECT_SELF,"bMUMMY_BOLSTER_UNDEAD",n); break;
case 128: SetLocalInt(OBJECT_SELF,"bNEGATIVE_PLANE_AVATAR",n); break;
case 135: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_CHARISMA",n); break;
case 136: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_CONSTITUTION",n); break;
case 137: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_DEXTERITY",n); break;
case 138: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_INTELLIGENCE",n); break;
case 139: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_STRENGTH",n); break;
case 140: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_WISDOM",n); break;
case 141: SetLocalInt(OBJECT_SELF,"bPULSE_COLD",n); break;
case 142: SetLocalInt(OBJECT_SELF,"bPULSE_DEATH",n); break;
case 143: SetLocalInt(OBJECT_SELF,"bPULSE_DISEASE",n); break;
case 144: SetLocalInt(OBJECT_SELF,"bPULSE_DROWN",n); break;
case 145: SetLocalInt(OBJECT_SELF,"bPULSE_FIRE",n); break;
case 146: SetLocalInt(OBJECT_SELF,"bPULSE_HOLY",n); break;
case 147: SetLocalInt(OBJECT_SELF,"bPULSE_LEVEL_DRAIN",n); break;
case 148: SetLocalInt(OBJECT_SELF,"bPULSE_LIGHTNING",n); break;
case 149: SetLocalInt(OBJECT_SELF,"bPULSE_NEGATIVE",n); break;
case 150: SetLocalInt(OBJECT_SELF,"bPULSE_POISON",n); break;
case 151: SetLocalInt(OBJECT_SELF,"bPULSE_SPORES",n); break;
case 152: SetLocalInt(OBJECT_SELF,"bPULSE_WHIRLWIND",n); break;
case 158: SetLocalInt(OBJECT_SELF,"bROGUES_CUNNING",n); break;
case 159: SetLocalInt(OBJECT_SELF,"bSEAHAG_EVILEYE",n); break;
case 160: SetLocalInt(OBJECT_SELF,"bSMITE_EVIL",n); break;
case 161: SetLocalInt(OBJECT_SELF,"bSMOKE_CLAW",n); break;
case 162: SetLocalInt(OBJECT_SELF,"bSUMMON_ANIMAL_COMPANION",n); break;
case 163: SetLocalInt(OBJECT_SELF,"bSUMMON_CELESTIAL",n); break;
case 164: SetLocalInt(OBJECT_SELF,"bSUMMON_FAMILIAR",n); break;
case 165: SetLocalInt(OBJECT_SELF,"bSUMMON_MEPHIT",n); break;
case 166: SetLocalInt(OBJECT_SELF,"bSUMMON_SLAAD",n); break;
case 167: SetLocalInt(OBJECT_SELF,"bSUMMON_TANARRI",n); break;
case 168: SetLocalInt(OBJECT_SELF,"bTOUCH_PETRIFY",n); break;
case 169: SetLocalInt(OBJECT_SELF,"bTROGLODYTE_STENCH",n); break;
//case 170: SetLocalInt(OBJECT_SELF,"bTRUMPET_BLAST",n); break;
//case 171: SetLocalInt(OBJECT_SELF,"bTURN_UNDEAD",n); break;
case 172: SetLocalInt(OBJECT_SELF,"bTYRANT_FOG_MIST",n); break;
case 173: SetLocalInt(OBJECT_SELF,"bWHIRLWIND",n); break;
case 174: SetLocalInt(OBJECT_SELF,"bWHOLENESS_OF_BODY",n); break;
case 175: SetLocalInt(OBJECT_SELF,"bWILD_SHAPE",n); break;}
}


void TemplateSpell(object o)
{
if(n == -1) n = d6();
switch(Random(366))
{
case 0: SetLocalInt(OBJECT_SELF,"bSPELL_ACID_FOG",n); break;
case 1: SetLocalInt(OBJECT_SELF,"bSPELL_ACID_SPLASH",n); break;
case 2: SetLocalInt(OBJECT_SELF,"bSPELL_ACTIVATE_ITEM_PORTAL",n); break;
case 3: SetLocalInt(OBJECT_SELF,"bSPELL_ACTIVATE_ITEM_SELF2",n); break;
case 4: SetLocalInt(OBJECT_SELF,"bSPELL_AID",n); break;
case 5: SetLocalInt(OBJECT_SELF,"bSPELL_ALL_SPELLS",n); break;
case 6: SetLocalInt(OBJECT_SELF,"bSPELL_AMPLIFY",n); break;
case 7: SetLocalInt(OBJECT_SELF,"bSPELL_ANIMATE_DEAD",n); break;
case 8: SetLocalInt(OBJECT_SELF,"bSPELL_AURA_OF_VITALITY",n); break;
case 9: SetLocalInt(OBJECT_SELF,"bSPELL_AURAOFGLORY",n); break;
case 10: SetLocalInt(OBJECT_SELF,"bSPELL_AWAKEN",n); break;
case 11: SetLocalInt(OBJECT_SELF,"bSPELL_BALAGARNSIRONHORN",n); break;
case 12: SetLocalInt(OBJECT_SELF,"bSPELL_BALL_LIGHTNING",n); break;
case 13: SetLocalInt(OBJECT_SELF,"bSPELL_BANE",n); break;
case 14: SetLocalInt(OBJECT_SELF,"bSPELL_BANISHMENT",n); break;
case 15: SetLocalInt(OBJECT_SELF,"bSPELL_BARKSKIN",n); break;
case 16: SetLocalInt(OBJECT_SELF,"bSPELL_BATTLETIDE",n); break;
case 17: SetLocalInt(OBJECT_SELF,"bSPELL_BESTOW_CURSE",n); break;
case 18: SetLocalInt(OBJECT_SELF,"bSPELL_BIGBYS_CLENCHED_FIST",n); break;
case 19: SetLocalInt(OBJECT_SELF,"bSPELL_BIGBYS_CRUSHING_HAND",n); break;
case 20: SetLocalInt(OBJECT_SELF,"bSPELL_BIGBYS_FORCEFUL_HAND",n); break;
case 21: SetLocalInt(OBJECT_SELF,"bSPELL_BIGBYS_GRASPING_HAND",n); break;
case 22: SetLocalInt(OBJECT_SELF,"bSPELL_BIGBYS_INTERPOSING_HAND",n); break;
case 23: SetLocalInt(OBJECT_SELF,"bSPELL_BLACK_BLADE_OF_DISASTER",n); break;
case 24: SetLocalInt(OBJECT_SELF,"bSPELL_BLACKSTAFF",n); break;
case 25: SetLocalInt(OBJECT_SELF,"bSPELL_BLADE_BARRIER",n); break;
case 26: SetLocalInt(OBJECT_SELF,"bSPELL_BLADE_THIRST",n); break;
case 27: SetLocalInt(OBJECT_SELF,"bSPELL_BLESS",n); break;
case 28: SetLocalInt(OBJECT_SELF,"bSPELL_BLESS_WEAPON",n); break;
case 29: SetLocalInt(OBJECT_SELF,"bSPELL_BLINDNESS_AND_DEAFNESS",n); break;
case 30: SetLocalInt(OBJECT_SELF,"bSPELL_BLOOD_FRENZY",n); break;
case 31: SetLocalInt(OBJECT_SELF,"bSPELL_BOMBARDMENT",n); break;
case 32: SetLocalInt(OBJECT_SELF,"bSPELL_BULLS_STRENGTH",n); break;
case 33: SetLocalInt(OBJECT_SELF,"bSPELL_BURNING_HANDS",n); break;
case 34: SetLocalInt(OBJECT_SELF,"bSPELL_CALL_LIGHTNING",n); break;
case 35: SetLocalInt(OBJECT_SELF,"bSPELL_CAMOFLAGE",n); break;
case 36: SetLocalInt(OBJECT_SELF,"bSPELL_CATS_GRACE",n); break;
case 37: SetLocalInt(OBJECT_SELF,"bSPELL_CHAIN_LIGHTNING",n); break;
case 38: SetLocalInt(OBJECT_SELF,"bSPELL_CHARGER",n); break;
case 39: SetLocalInt(OBJECT_SELF,"bSPELL_CHARM_MONSTER",n); break;
case 40: SetLocalInt(OBJECT_SELF,"bSPELL_CHARM_PERSON",n); break;
case 41: SetLocalInt(OBJECT_SELF,"bSPELL_CHARM_PERSON_OR_ANIMAL",n); break;
case 42: SetLocalInt(OBJECT_SELF,"bSPELL_CIRCLE_OF_DEATH",n); break;
case 43: SetLocalInt(OBJECT_SELF,"bSPELL_CIRCLE_OF_DOOM",n); break;
case 44: SetLocalInt(OBJECT_SELF,"bSPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE",n); break;
case 45: SetLocalInt(OBJECT_SELF,"bSPELL_CLARITY",n); break;
case 46: SetLocalInt(OBJECT_SELF,"bSPELL_CLOAK_OF_CHAOS",n); break;
case 47: SetLocalInt(OBJECT_SELF,"bSPELL_CLOUD_OF_BEWILDERMENT",n); break;
case 48: SetLocalInt(OBJECT_SELF,"bSPELL_CLOUDKILL",n); break;
case 49: SetLocalInt(OBJECT_SELF,"bSPELL_COLOR_SPRAY",n); break;
case 50: SetLocalInt(OBJECT_SELF,"bSPELL_COMBUST",n); break;
case 51: SetLocalInt(OBJECT_SELF,"bSPELL_CONE_OF_COLD",n); break;
case 52: SetLocalInt(OBJECT_SELF,"bSPELL_CONFUSION",n); break;
case 53: SetLocalInt(OBJECT_SELF,"bSPELL_CONTAGION",n); break;
case 54: SetLocalInt(OBJECT_SELF,"bSPELL_CONTINUAL_FLAME",n); break;
case 55: SetLocalInt(OBJECT_SELF,"bSPELL_CONTROL_UNDEAD",n); break;
case 56: SetLocalInt(OBJECT_SELF,"bSPELL_CRAFT_HARPER_ITEM",n); break;
case 57: SetLocalInt(OBJECT_SELF,"bSPELL_CREATE_GREATER_UNDEAD",n); break;
case 58: SetLocalInt(OBJECT_SELF,"bSPELL_CREATE_UNDEAD",n); break;
case 59: SetLocalInt(OBJECT_SELF,"bSPELL_CREEPING_DOOM",n); break;
case 60: SetLocalInt(OBJECT_SELF,"bSPELL_CRUMBLE",n); break;
case 61: SetLocalInt(OBJECT_SELF,"bSPELL_CURE_CRITICAL_WOUNDS",n); break;
case 62: SetLocalInt(OBJECT_SELF,"bSPELL_CURE_LIGHT_WOUNDS",n); break;
case 63: SetLocalInt(OBJECT_SELF,"bSPELL_CURE_MINOR_WOUNDS",n); break;
case 64: SetLocalInt(OBJECT_SELF,"bSPELL_CURE_MODERATE_WOUNDS",n); break;
case 65: SetLocalInt(OBJECT_SELF,"bSPELL_CURE_SERIOUS_WOUNDS",n); break;
case 66: SetLocalInt(OBJECT_SELF,"bSPELL_DARKFIRE",n); break;
case 67: SetLocalInt(OBJECT_SELF,"bSPELL_DARKNESS",n); break;
case 68: SetLocalInt(OBJECT_SELF,"bSPELL_DARKVISION",n); break;
case 69: SetLocalInt(OBJECT_SELF,"bSPELL_DAZE",n); break;
case 70: SetLocalInt(OBJECT_SELF,"bSPELL_DEAFENING_CLANG",n); break;
case 71: SetLocalInt(OBJECT_SELF,"bSPELL_DEATH_ARMOR",n); break;
case 72: SetLocalInt(OBJECT_SELF,"bSPELL_DEATH_WARD",n); break;
case 73: SetLocalInt(OBJECT_SELF,"bSPELL_DECHARGER",n); break;
case 74: SetLocalInt(OBJECT_SELF,"bSPELL_DECK_AVATAR",n); break;
case 75: SetLocalInt(OBJECT_SELF,"bSPELL_DECK_BUTTERFLYSPRAY",n); break;
case 76: SetLocalInt(OBJECT_SELF,"bSPELL_DECK_GEMSPRAY",n); break;
case 77: SetLocalInt(OBJECT_SELF,"bSPELL_DECK_OF_MANY_THINGS",n); break;
case 78: SetLocalInt(OBJECT_SELF,"bSPELL_DELAYED_BLAST_FIREBALL",n); break;
case 79: SetLocalInt(OBJECT_SELF,"bSPELL_DESTRUCTION",n); break;
case 80: SetLocalInt(OBJECT_SELF,"bSPELL_DIRGE",n); break;
case 81: SetLocalInt(OBJECT_SELF,"bSPELL_DISMISSAL",n); break;
case 82: SetLocalInt(OBJECT_SELF,"bSPELL_DISPEL_MAGIC",n); break;
case 83: SetLocalInt(OBJECT_SELF,"bSPELL_DISPLACEMENT",n); break;
case 84: SetLocalInt(OBJECT_SELF,"bSPELL_DIVINE_FAVOR",n); break;
case 85: SetLocalInt(OBJECT_SELF,"bSPELL_DIVINE_MIGHT",n); break;
case 86: SetLocalInt(OBJECT_SELF,"bSPELL_DIVINE_POWER",n); break;
case 87: SetLocalInt(OBJECT_SELF,"bSPELL_DIVINE_SHIELD",n); break;
case 88: SetLocalInt(OBJECT_SELF,"bSPELL_DOMINATE_ANIMAL",n); break;
case 89: SetLocalInt(OBJECT_SELF,"bSPELL_DOMINATE_MONSTER",n); break;
case 90: SetLocalInt(OBJECT_SELF,"bSPELL_DOMINATE_PERSON",n); break;
case 91: SetLocalInt(OBJECT_SELF,"bSPELL_DOOM",n); break;
case 92: SetLocalInt(OBJECT_SELF,"bSPELL_DROWN",n); break;
case 93: SetLocalInt(OBJECT_SELF,"bSPELL_EAGLE_SPLEDOR",n); break;
case 94: SetLocalInt(OBJECT_SELF,"bSPELL_EARTHQUAKE",n); break;
case 95: SetLocalInt(OBJECT_SELF,"bSPELL_ELECTRIC_JOLT",n); break;
case 96: SetLocalInt(OBJECT_SELF,"bSPELL_ELEMENTAL_SHIELD",n); break;
case 97: SetLocalInt(OBJECT_SELF,"bSPELL_ELEMENTAL_SUMMONING_ITEM",n); break;
case 98: SetLocalInt(OBJECT_SELF,"bSPELL_ELEMENTAL_SWARM",n); break;
case 99: SetLocalInt(OBJECT_SELF,"bSPELL_ENDURANCE",n); break;
case 100: SetLocalInt(OBJECT_SELF,"bSPELL_ENDURE_ELEMENTS",n); break;
case 101: SetLocalInt(OBJECT_SELF,"bSPELL_ENERGY_BUFFER",n); break;
case 102: SetLocalInt(OBJECT_SELF,"bSPELL_ENERGY_DRAIN",n); break;
case 103: SetLocalInt(OBJECT_SELF,"bSPELL_ENERVATION",n); break;
case 104: SetLocalInt(OBJECT_SELF,"bSPELL_ENTANGLE",n); break;
case 105: SetLocalInt(OBJECT_SELF,"bSPELL_ENTROPIC_SHIELD",n); break;
case 106: SetLocalInt(OBJECT_SELF,"bSPELL_EPIC_DRAGON_KNIGHT",n); break;
case 107: SetLocalInt(OBJECT_SELF,"bSPELL_EPIC_HELLBALL",n); break;
case 108: SetLocalInt(OBJECT_SELF,"bSPELL_EPIC_MAGE_ARMOR",n); break;
case 109: SetLocalInt(OBJECT_SELF,"bSPELL_EPIC_MUMMY_DUST",n); break;
case 110: SetLocalInt(OBJECT_SELF,"bSPELL_EPIC_RUIN",n); break;
case 111: SetLocalInt(OBJECT_SELF,"bSPELL_ETHEREAL_VISAGE",n); break;
case 112: SetLocalInt(OBJECT_SELF,"bSPELL_ETHEREALNESS",n); break;
case 113: SetLocalInt(OBJECT_SELF,"bSPELL_EVARDS_BLACK_TENTACLES",n); break;
case 114: SetLocalInt(OBJECT_SELF,"bSPELL_EXPEDITIOUS_RETREAT",n); break;
case 115: SetLocalInt(OBJECT_SELF,"bSPELL_FEAR",n); break;
case 116: SetLocalInt(OBJECT_SELF,"bSPELL_FEEBLEMIND",n); break;
case 117: SetLocalInt(OBJECT_SELF,"bSPELL_FIND_TRAPS",n); break;
case 118: SetLocalInt(OBJECT_SELF,"bSPELL_FINGER_OF_DEATH",n); break;
case 119: SetLocalInt(OBJECT_SELF,"bSPELL_FIRE_STORM",n); break;
case 120: SetLocalInt(OBJECT_SELF,"bSPELL_FIREBALL",n); break;
case 121: SetLocalInt(OBJECT_SELF,"bSPELL_FIREBRAND",n); break;
case 122: SetLocalInt(OBJECT_SELF,"bSPELL_FLAME_ARROW",n); break;
case 123: SetLocalInt(OBJECT_SELF,"bSPELL_FLAME_LASH",n); break;
case 124: SetLocalInt(OBJECT_SELF,"bSPELL_FLAME_STRIKE",n); break;
case 125: SetLocalInt(OBJECT_SELF,"bSPELL_FLAME_WEAPON",n); break;
case 126: SetLocalInt(OBJECT_SELF,"bSPELL_FLARE",n); break;
case 127: SetLocalInt(OBJECT_SELF,"bSPELL_FLESH_TO_STONE",n); break;
case 128: SetLocalInt(OBJECT_SELF,"bSPELL_FLYING_DEBRIS",n); break;
case 129: SetLocalInt(OBJECT_SELF,"bSPELL_FOXS_CUNNING",n); break;
case 130: SetLocalInt(OBJECT_SELF,"bSPELL_FREEDOM_OF_MOVEMENT",n); break;
case 131: SetLocalInt(OBJECT_SELF,"bSPELL_GATE",n); break;
case 132: SetLocalInt(OBJECT_SELF,"bSPELL_GEDLEES_ELECTRIC_LOOP",n); break;
case 133: SetLocalInt(OBJECT_SELF,"bSPELL_GHOSTLY_VISAGE",n); break;
case 134: SetLocalInt(OBJECT_SELF,"bSPELL_GHOUL_TOUCH",n); break;
case 135: SetLocalInt(OBJECT_SELF,"bSPELL_GLOBE_OF_INVULNERABILITY",n); break;
case 136: SetLocalInt(OBJECT_SELF,"bSPELL_GLYPH_OF_WARDING",n); break;
case 137: SetLocalInt(OBJECT_SELF,"bSPELL_GREASE",n); break;
case 138: SetLocalInt(OBJECT_SELF,"bSPELL_GREAT_THUNDERCLAP",n); break;
case 139: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_BULLS_STRENGTH",n); break;
case 140: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_CATS_GRACE",n); break;
case 141: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_DISPELLING",n); break;
case 142: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_EAGLE_SPLENDOR",n); break;
case 143: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_ENDURANCE",n); break;
case 144: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_FOXS_CUNNING",n); break;
case 145: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_MAGIC_FANG",n); break;
case 146: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_MAGIC_WEAPON",n); break;
case 147: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_OWLS_WISDOM",n); break;
case 148: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_PLANAR_BINDING",n); break;
case 149: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_RESTORATION",n); break;
case 150: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_SHADOW_CONJURATION_ACID_ARROW",n); break;
case 151: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_SHADOW_CONJURATION_MINOR_GLOBE",n); break;
case 152: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_SHADOW_CONJURATION_MIRROR_IMAGE",n); break;
case 153: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_SHADOW_CONJURATION_SUMMON_SHADOW",n); break;
case 154: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_SHADOW_CONJURATION_WEB",n); break;
case 155: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_SPELL_BREACH",n); break;
case 156: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_SPELL_MANTLE",n); break;
case 157: SetLocalInt(OBJECT_SELF,"bSPELL_GREATER_STONESKIN",n); break;
case 158: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_ACID",n); break;
case 159: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_CALTROPS",n); break;
case 160: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_CHICKEN",n); break;
case 161: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_CHOKING",n); break;
case 162: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_FIRE",n); break;
case 163: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_HOLY",n); break;
case 164: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_TANGLE",n); break;
case 165: SetLocalInt(OBJECT_SELF,"bSPELL_GRENADE_THUNDERSTONE",n); break;
case 166: SetLocalInt(OBJECT_SELF,"bSPELL_GUST_OF_WIND",n); break;
case 167: SetLocalInt(OBJECT_SELF,"bSPELL_HAMMER_OF_THE_GODS",n); break;
case 168: SetLocalInt(OBJECT_SELF,"bSPELL_HARM",n); break;
case 169: SetLocalInt(OBJECT_SELF,"bSPELL_HASTE",n); break;
case 170: SetLocalInt(OBJECT_SELF,"bSPELL_HEAL",n); break;
case 171: SetLocalInt(OBJECT_SELF,"bSPELL_HEALING_CIRCLE",n); break;
case 172: SetLocalInt(OBJECT_SELF,"bSPELL_HEALING_STING",n); break;
case 173: SetLocalInt(OBJECT_SELF,"bSPELL_HEALINGKIT",n); break;
case 174: SetLocalInt(OBJECT_SELF,"bSPELL_HOLD_ANIMAL",n); break;
case 175: SetLocalInt(OBJECT_SELF,"bSPELL_HOLD_MONSTER",n); break;
case 176: SetLocalInt(OBJECT_SELF,"bSPELL_HOLD_PERSON",n); break;
case 177: SetLocalInt(OBJECT_SELF,"bSPELL_HOLY_AURA",n); break;
case 178: SetLocalInt(OBJECT_SELF,"bSPELL_HOLY_SWORD",n); break;
case 179: SetLocalInt(OBJECT_SELF,"bSPELL_HORIZIKAULS_BOOM",n); break;
case 180: SetLocalInt(OBJECT_SELF,"bSPELL_HORRID_WILTING",n); break;
case 181: SetLocalInt(OBJECT_SELF,"bSPELL_HORSE_ASSIGN_MOUNT",n); break;
case 182: SetLocalInt(OBJECT_SELF,"bSPELL_HORSE_DISMOUNT",n); break;
case 183: SetLocalInt(OBJECT_SELF,"bSPELL_HORSE_MENU",n); break;
case 184: SetLocalInt(OBJECT_SELF,"bSPELL_HORSE_MOUNT",n); break;
case 185: SetLocalInt(OBJECT_SELF,"bSPELL_HORSE_PARTY_DISMOUNT",n); break;
case 186: SetLocalInt(OBJECT_SELF,"bSPELL_HORSE_PARTY_MOUNT",n); break;
case 187: SetLocalInt(OBJECT_SELF,"bSPELL_ICE_DAGGER",n); break;
case 188: SetLocalInt(OBJECT_SELF,"bSPELL_ICE_STORM",n); break;
case 189: SetLocalInt(OBJECT_SELF,"bSPELL_IDENTIFY",n); break;
case 190: SetLocalInt(OBJECT_SELF,"bSPELL_IMPLOSION",n); break;
case 191: SetLocalInt(OBJECT_SELF,"bSPELL_IMPROVED_INVISIBILITY",n); break;
case 192: SetLocalInt(OBJECT_SELF,"bSPELL_INCENDIARY_CLOUD",n); break;
case 193: SetLocalInt(OBJECT_SELF,"bSPELL_INFERNO",n); break;
case 194: SetLocalInt(OBJECT_SELF,"bSPELL_INFESTATION_OF_MAGGOTS",n); break;
case 195: SetLocalInt(OBJECT_SELF,"bSPELL_INFLICT_CRITICAL_WOUNDS",n); break;
case 196: SetLocalInt(OBJECT_SELF,"bSPELL_INFLICT_LIGHT_WOUNDS",n); break;
case 197: SetLocalInt(OBJECT_SELF,"bSPELL_INFLICT_MINOR_WOUNDS",n); break;
case 198: SetLocalInt(OBJECT_SELF,"bSPELL_INFLICT_MODERATE_WOUNDS",n); break;
case 199: SetLocalInt(OBJECT_SELF,"bSPELL_INFLICT_SERIOUS_WOUNDS",n); break;
case 200: SetLocalInt(OBJECT_SELF,"bSPELL_INVISIBILITY",n); break;
case 201: SetLocalInt(OBJECT_SELF,"bSPELL_INVISIBILITY_PURGE",n); break;
case 202: SetLocalInt(OBJECT_SELF,"bSPELL_INVISIBILITY_SPHERE",n); break;
case 203: SetLocalInt(OBJECT_SELF,"bSPELL_IOUN_STONE_BLUE",n); break;
case 204: SetLocalInt(OBJECT_SELF,"bSPELL_IOUN_STONE_DEEP_RED",n); break;
case 205: SetLocalInt(OBJECT_SELF,"bSPELL_IOUN_STONE_DUSTY_ROSE",n); break;
case 206: SetLocalInt(OBJECT_SELF,"bSPELL_IOUN_STONE_PALE_BLUE",n); break;
case 207: SetLocalInt(OBJECT_SELF,"bSPELL_IOUN_STONE_PINK",n); break;
case 208: SetLocalInt(OBJECT_SELF,"bSPELL_IOUN_STONE_PINK_GREEN",n); break;
case 209: SetLocalInt(OBJECT_SELF,"bSPELL_IOUN_STONE_SCARLET_BLUE",n); break;
case 210: SetLocalInt(OBJECT_SELF,"bSPELL_IRONGUTS",n); break;
case 211: SetLocalInt(OBJECT_SELF,"bSPELL_ISAACS_GREATER_MISSILE_STORM",n); break;
case 212: SetLocalInt(OBJECT_SELF,"bSPELL_ISAACS_LESSER_MISSILE_STORM",n); break;
case 213: SetLocalInt(OBJECT_SELF,"bSPELL_KEEN_EDGE",n); break;
case 214: SetLocalInt(OBJECT_SELF,"bSPELL_KNOCK",n); break;
case 215: SetLocalInt(OBJECT_SELF,"bSPELL_KOBOLD_JUMP",n); break;
case 216: SetLocalInt(OBJECT_SELF,"bSPELL_LEGEND_LORE",n); break;
case 217: SetLocalInt(OBJECT_SELF,"bSPELL_LESSER_DISPEL",n); break;
case 218: SetLocalInt(OBJECT_SELF,"bSPELL_LESSER_MIND_BLANK",n); break;
case 219: SetLocalInt(OBJECT_SELF,"bSPELL_LESSER_PLANAR_BINDING",n); break;
case 220: SetLocalInt(OBJECT_SELF,"bSPELL_LESSER_RESTORATION",n); break;
case 221: SetLocalInt(OBJECT_SELF,"bSPELL_LESSER_SPELL_BREACH",n); break;
case 222: SetLocalInt(OBJECT_SELF,"bSPELL_LESSER_SPELL_MANTLE",n); break;
case 223: SetLocalInt(OBJECT_SELF,"bSPELL_LIGHT",n); break;
case 224: SetLocalInt(OBJECT_SELF,"bSPELL_LIGHTNING_BOLT",n); break;
case 225: SetLocalInt(OBJECT_SELF,"bSPELL_MAGE_ARMOR",n); break;
case 226: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_CIRCLE_AGAINST_CHAOS",n); break;
case 227: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_CIRCLE_AGAINST_EVIL",n); break;
case 228: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_CIRCLE_AGAINST_GOOD",n); break;
case 229: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_CIRCLE_AGAINST_LAW",n); break;
case 230: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_FANG",n); break;
case 231: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_MISSILE",n); break;
case 232: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_VESTMENT",n); break;
case 233: SetLocalInt(OBJECT_SELF,"bSPELL_MAGIC_WEAPON",n); break;
case 234: SetLocalInt(OBJECT_SELF,"bSPELL_MASS_BLINDNESS_AND_DEAFNESS",n); break;
case 235: SetLocalInt(OBJECT_SELF,"bSPELL_MASS_CAMOFLAGE",n); break;
case 236: SetLocalInt(OBJECT_SELF,"bSPELL_MASS_CHARM",n); break;
case 237: SetLocalInt(OBJECT_SELF,"bSPELL_MASS_HASTE",n); break;
case 238: SetLocalInt(OBJECT_SELF,"bSPELL_MASS_HEAL",n); break;
case 239: SetLocalInt(OBJECT_SELF,"bSPELL_MELFS_ACID_ARROW",n); break;
case 240: SetLocalInt(OBJECT_SELF,"bSPELL_MESTILS_ACID_BREATH",n); break;
case 241: SetLocalInt(OBJECT_SELF,"bSPELL_MESTILS_ACID_SHEATH",n); break;
case 242: SetLocalInt(OBJECT_SELF,"bSPELL_METEOR_SWARM",n); break;
case 243: SetLocalInt(OBJECT_SELF,"bSPELL_MIND_BLANK",n); break;
case 244: SetLocalInt(OBJECT_SELF,"bSPELL_MIND_FOG",n); break;
case 245: SetLocalInt(OBJECT_SELF,"bSPELL_MINOR_GLOBE_OF_INVULNERABILITY",n); break;
case 246: SetLocalInt(OBJECT_SELF,"bSPELL_MONSTROUS_REGENERATION",n); break;
case 247: SetLocalInt(OBJECT_SELF,"bSPELL_MORDENKAINENS_DISJUNCTION",n); break;
case 248: SetLocalInt(OBJECT_SELF,"bSPELL_MORDENKAINENS_SWORD",n); break;
case 249: SetLocalInt(OBJECT_SELF,"bSPELL_NATURES_BALANCE",n); break;
case 250: SetLocalInt(OBJECT_SELF,"bSPELL_NEGATIVE_ENERGY_BURST",n); break;
case 251: SetLocalInt(OBJECT_SELF,"bSPELL_NEGATIVE_ENERGY_PROTECTION",n); break;
case 252: SetLocalInt(OBJECT_SELF,"bSPELL_NEGATIVE_ENERGY_RAY",n); break;
case 253: SetLocalInt(OBJECT_SELF,"bSPELL_NEUTRALIZE_POISON",n); break;
case 254: SetLocalInt(OBJECT_SELF,"bSPELL_ONE_WITH_THE_LAND",n); break;
case 255: SetLocalInt(OBJECT_SELF,"bSPELL_OWLS_INSIGHT",n); break;
case 256: SetLocalInt(OBJECT_SELF,"bSPELL_OWLS_WISDOM",n); break;
case 257: SetLocalInt(OBJECT_SELF,"bSPELL_PALADIN_SUMMON_MOUNT",n); break;
case 258: SetLocalInt(OBJECT_SELF,"bSPELL_PHANTASMAL_KILLER",n); break;
case 259: SetLocalInt(OBJECT_SELF,"bSPELL_PLANAR_ALLY",n); break;
case 260: SetLocalInt(OBJECT_SELF,"bSPELL_PLANAR_BINDING",n); break;
case 261: SetLocalInt(OBJECT_SELF,"bSPELL_POISON",n); break;
case 262: SetLocalInt(OBJECT_SELF,"bSPELL_POLYMORPH_SELF",n); break;
case 263: SetLocalInt(OBJECT_SELF,"bSPELL_POWER_WORD_KILL",n); break;
case 264: SetLocalInt(OBJECT_SELF,"bSPELL_POWER_WORD_STUN",n); break;
case 265: SetLocalInt(OBJECT_SELF,"bSPELL_POWERSTONE",n); break;
case 266: SetLocalInt(OBJECT_SELF,"bSPELL_PRAYER",n); break;
case 267: SetLocalInt(OBJECT_SELF,"bSPELL_PREMONITION",n); break;
case 268: SetLocalInt(OBJECT_SELF,"bSPELL_PRISMATIC_SPRAY",n); break;
case 269: SetLocalInt(OBJECT_SELF,"bSPELL_PROTECTION__FROM_CHAOS",n); break;
case 270: SetLocalInt(OBJECT_SELF,"bSPELL_PROTECTION_FROM_ELEMENTS",n); break;
case 271: SetLocalInt(OBJECT_SELF,"bSPELL_PROTECTION_FROM_EVIL",n); break;
case 272: SetLocalInt(OBJECT_SELF,"bSPELL_PROTECTION_FROM_GOOD",n); break;
case 273: SetLocalInt(OBJECT_SELF,"bSPELL_PROTECTION_FROM_LAW",n); break;
case 274: SetLocalInt(OBJECT_SELF,"bSPELL_PROTECTION_FROM_SPELLS",n); break;
case 275: SetLocalInt(OBJECT_SELF,"bSPELL_QUILLFIRE",n); break;
case 276: SetLocalInt(OBJECT_SELF,"bSPELL_RAISE_DEAD",n); break;
case 277: SetLocalInt(OBJECT_SELF,"bSPELL_RAY_OF_ENFEEBLEMENT",n); break;
case 278: SetLocalInt(OBJECT_SELF,"bSPELL_RAY_OF_FROST",n); break;
case 279: SetLocalInt(OBJECT_SELF,"bSPELL_REGENERATE",n); break;
case 280: SetLocalInt(OBJECT_SELF,"bSPELL_REMOVE_BLINDNESS_AND_DEAFNESS",n); break;
case 281: SetLocalInt(OBJECT_SELF,"bSPELL_REMOVE_CURSE",n); break;
case 282: SetLocalInt(OBJECT_SELF,"bSPELL_REMOVE_DISEASE",n); break;
case 283: SetLocalInt(OBJECT_SELF,"bSPELL_REMOVE_FEAR",n); break;
case 284: SetLocalInt(OBJECT_SELF,"bSPELL_REMOVE_PARALYSIS",n); break;
case 285: SetLocalInt(OBJECT_SELF,"bSPELL_RESIST_ELEMENTS",n); break;
case 286: SetLocalInt(OBJECT_SELF,"bSPELL_RESISTANCE",n); break;
case 287: SetLocalInt(OBJECT_SELF,"bSPELL_RESTORATION",n); break;
case 288: SetLocalInt(OBJECT_SELF,"bSPELL_RESURRECTION",n); break;
case 289: SetLocalInt(OBJECT_SELF,"bSPELL_ROD_OF_WONDER",n); break;
case 290: SetLocalInt(OBJECT_SELF,"bSPELL_SANCTUARY",n); break;
case 291: SetLocalInt(OBJECT_SELF,"bSPELL_SCARE",n); break;
case 292: SetLocalInt(OBJECT_SELF,"bSPELL_SCINTILLATING_SPHERE",n); break;
case 293: SetLocalInt(OBJECT_SELF,"bSPELL_SEARING_LIGHT",n); break;
case 294: SetLocalInt(OBJECT_SELF,"bSPELL_SEE_INVISIBILITY",n); break;
case 295: SetLocalInt(OBJECT_SELF,"bSPELL_SHADES_CONE_OF_COLD",n); break;
case 296: SetLocalInt(OBJECT_SELF,"bSPELL_SHADES_FIREBALL",n); break;
case 297: SetLocalInt(OBJECT_SELF,"bSPELL_SHADES_STONESKIN",n); break;
case 298: SetLocalInt(OBJECT_SELF,"bSPELL_SHADES_SUMMON_SHADOW",n); break;
case 299: SetLocalInt(OBJECT_SELF,"bSPELL_SHADES_WALL_OF_FIRE",n); break;
case 300: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_CONJURATION_DARKNESS",n); break;
case 301: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_CONJURATION_INIVSIBILITY",n); break;
case 302: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_CONJURATION_MAGE_ARMOR",n); break;
case 303: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_CONJURATION_MAGIC_MISSILE",n); break;
case 304: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_CONJURATION_SUMMON_SHADOW",n); break;
case 305: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_DAZE",n); break;
case 306: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_EVADE",n); break;
case 307: SetLocalInt(OBJECT_SELF,"bSPELL_SHADOW_SHIELD",n); break;
case 308: SetLocalInt(OBJECT_SELF,"bSPELL_SHAPECHANGE",n); break;
case 309: SetLocalInt(OBJECT_SELF,"bSPELL_SHELGARNS_PERSISTENT_BLADE",n); break;
case 310: SetLocalInt(OBJECT_SELF,"bSPELL_SHIELD",n); break;
case 311: SetLocalInt(OBJECT_SELF,"bSPELL_SHIELD_OF_FAITH",n); break;
case 312: SetLocalInt(OBJECT_SELF,"bSPELL_SHIELD_OF_LAW",n); break;
case 313: SetLocalInt(OBJECT_SELF,"bSPELL_SILENCE",n); break;
case 314: SetLocalInt(OBJECT_SELF,"bSPELL_SLAY_LIVING",n); break;
case 315: SetLocalInt(OBJECT_SELF,"bSPELL_SLEEP",n); break;
case 316: SetLocalInt(OBJECT_SELF,"bSPELL_SLOW",n); break;
case 317: SetLocalInt(OBJECT_SELF,"bSPELL_SOUND_BURST",n); break;
case 318: SetLocalInt(OBJECT_SELF,"bSPELL_SPELL_MANTLE",n); break;
case 319: SetLocalInt(OBJECT_SELF,"bSPELL_SPELL_RESISTANCE",n); break;
case 320: SetLocalInt(OBJECT_SELF,"bSPELL_SPELLSTAFF",n); break;
case 321: SetLocalInt(OBJECT_SELF,"bSPELL_SPHERE_OF_CHAOS",n); break;
case 322: SetLocalInt(OBJECT_SELF,"bSPELL_SPIKE_GROWTH",n); break;
case 323: SetLocalInt(OBJECT_SELF,"bSPELL_STINKING_CLOUD",n); break;
case 324: SetLocalInt(OBJECT_SELF,"bSPELL_STONE_BONES",n); break;
case 325: SetLocalInt(OBJECT_SELF,"bSPELL_STONE_TO_FLESH",n); break;
case 326: SetLocalInt(OBJECT_SELF,"bSPELL_STONEHOLD",n); break;
case 327: SetLocalInt(OBJECT_SELF,"bSPELL_STONESKIN",n); break;
case 328: SetLocalInt(OBJECT_SELF,"bSPELL_STORM_OF_VENGEANCE",n); break;
case 329: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_I",n); break;
case 330: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_II",n); break;
case 331: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_III",n); break;
case 332: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_IV",n); break;
case 333: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_V",n); break;
case 334: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_VI",n); break;
case 335: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_VII",n); break;
case 336: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_VIII",n); break;
case 337: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_IX",n); break;
case 338: SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_SHADOW",n); break;
case 339: SetLocalInt(OBJECT_SELF,"bSPELL_SUNBEAM",n); break;
case 340: SetLocalInt(OBJECT_SELF,"bSPELL_SUNBURST",n); break;
case 341: SetLocalInt(OBJECT_SELF,"bSPELL_TASHAS_HIDEOUS_LAUGHTER",n); break;
case 342: SetLocalInt(OBJECT_SELF,"bSPELL_TENSERS_TRANSFORMATION",n); break;
case 343: SetLocalInt(OBJECT_SELF,"bSPELL_TIME_STOP",n); break;
case 344: SetLocalInt(OBJECT_SELF,"bSPELL_TRAP_ARROW",n); break;
case 345: SetLocalInt(OBJECT_SELF,"bSPELL_TRAP_BOLT",n); break;
case 346: SetLocalInt(OBJECT_SELF,"bSPELL_TRAP_DART",n); break;
case 347: SetLocalInt(OBJECT_SELF,"bSPELL_TRAP_SHURIKEN",n); break;
case 348: SetLocalInt(OBJECT_SELF,"bSPELL_TRUE_SEEING",n); break;
case 349: SetLocalInt(OBJECT_SELF,"bSPELL_TRUE_STRIKE",n); break;
case 350: SetLocalInt(OBJECT_SELF,"bSPELL_TYMORAS_SMILE",n); break;
case 351: SetLocalInt(OBJECT_SELF,"bSPELL_UNDEATH_TO_DEATH",n); break;
case 352: SetLocalInt(OBJECT_SELF,"bSPELL_UNDEATHS_ETERNAL_FOE",n); break;
case 353: SetLocalInt(OBJECT_SELF,"bSPELL_UNHOLY_AURA",n); break;
case 354: SetLocalInt(OBJECT_SELF,"bSPELL_VAMPIRIC_TOUCH",n); break;
case 355: SetLocalInt(OBJECT_SELF,"bSPELL_VINE_MINE",n); break;
case 356: SetLocalInt(OBJECT_SELF,"bSPELL_VINE_MINE_CAMOUFLAGE",n); break;
case 357: SetLocalInt(OBJECT_SELF,"bSPELL_VINE_MINE_ENTANGLE",n); break;
case 358: SetLocalInt(OBJECT_SELF,"bSPELL_VINE_MINE_HAMPER_MOVEMENT",n); break;
case 359: SetLocalInt(OBJECT_SELF,"bSPELL_VIRTUE",n); break;
case 360: SetLocalInt(OBJECT_SELF,"bSPELL_WAIL_OF_THE_BANSHEE",n); break;
case 361: SetLocalInt(OBJECT_SELF,"bSPELL_WALL_OF_FIRE",n); break;
case 362: SetLocalInt(OBJECT_SELF,"bSPELL_WAR_CRY",n); break;
case 363: SetLocalInt(OBJECT_SELF,"bSPELL_WEB",n); break;
case 364: SetLocalInt(OBJECT_SELF,"bSPELL_WEIRD",n); break;
case 365: SetLocalInt(OBJECT_SELF,"bSPELL_WORD_OF_FAITH",n); break;
case 366: SetLocalInt(OBJECT_SELF,"bSPELL_WOUNDING_WHISPERS",n); break;
}
}

void TemplateAbilities( )
{
    int i;
    int nHD = GetHitDice(OBJECT_SELF);
    for(i = 0; i < nHD; i++) TemplateAbility(OBJECT_SELF);
}

void TemplateSpells()
{
    int i;
    int nHD = GetHitDice(OBJECT_SELF);
    for(i = 0; i < nHD; i++) TemplateSpell(OBJECT_SELF);
}

void TemplateType()
{
    int nPoints= GetHitDice(OBJECT_SELF);
    int rt = GetRacialType(OBJECT_SELF);
    switch(rt)
    {
    case 0:
    case 1:
    case 17:
    case 18:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 10:
    case 12:
    case 13:
    case 14:
        //TemplateSpells();
        break;

    // dragon, reptilian, outsider
    case 11:
    case 15:
    case 20:
        //if(n < 5)
        //    TemplateSpells();
        //else
            TemplateAbilities();

    // animal, beast, magical beast,ooze
    case 8:
    case 9:
    case 19:
    case 29:
    case 23:
    case 25:
        TemplateAbilities();
        break;

    // undead
    case 24:
        //if(n < 4)
        //    TemplateAbilities();
        //else
        //    TemplateSpells();
        break;
    }
    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
}



