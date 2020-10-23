// Wizard mutator

#include "x0_i0_anims"
#include "x0_i0_treasure"
#include "x2_inc_switches"
#include "lutes"
#include "x3_inc_skin"
//#include "inc_abtemplate"


void MMPABB_Adhesive(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ENTANGLE,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Slow(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_SLOW,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Sleep(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_SLEEP,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Blindness(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_BLINDNESS_AND_DEAFNESS,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Daze(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_DAZE,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Fear(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_FEAR,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Bewilder(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_FEEBLEMIND,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Confusion(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_CONFUSION,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Contagion(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_CONTAGION,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_HoldPerson(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_HOLD_PERSON,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_HoldMonster(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_HOLD_MONSTER,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_CharmingGaze(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bCharmGaze",num);
}

void MMPABB_MindBlast(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bMindBlast",num);
}

void MMPABB_MindFog(object oSkin, int num=1)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_CASTSPELL_MIND_FOG_9,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_LesserMindBlank(object oSkin, int num=1)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_CASTSPELL_LESSER_MIND_BLANK_9,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_AuraBlindness(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraBlinding",num);
}

void MMPABB_AuraCold(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraCold",num);
}

void MMPABB_AuraElectricity(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraElectricity",num);
}

void MMPABB_AuraFear(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraFear",num);
}

void MMPABB_AuraFire(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraFire",num);
}

void MMPABB_AuraHorror(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraHorror",num);
}

void MMPABB_AuraMenace(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraMenace",num);
}

void MMPABB_AuraProtection(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraMenace",num);
}

void MMPABB_AuraStun(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraStun",num);
}

void MMPABB_AuraUnearthlyVisage(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bAuraUnearthly",num);
}


void MMPABB_BoltDrainCharisma(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltCHA",num);
}

void MMPABB_BoltDrainWisdom(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltWIS",num);
}

void MMPABB_BoltDrainIntelligence(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltINT",num);
}

void MMPABB_BoltDrainConstitution(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltCON",num);
}

void MMPABB_BoltDrainDexterity(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltDEX",num);
}

void MMPABB_BoltDrainStrength(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltSTR",num);
}

void MMPABB_SonicCone(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bSonicCone",num);
}

void MMPABB_GazeParalysis(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGazeParalysis",num);
}

void MMPABB_GazeStunned(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGazeStun",num);
}

void MMPABB_GazeCharm(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGazeCharm",num);
}

void MMPABB_GazeConfusion(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGazeConfuse",num);
}

void MMPABB_GazeDaze(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGazeDaze",num);
}

void MMPABB_GazeDominate(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGazeDominate",num);
}

void MMPABB_GazeFear(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGazeFear",num);
}

void MMPABB_RayOfEnfeeble(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bRayEnfeeble",num);
}


void MMPABB_PulseDrainCHA(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPDCHA",num);
}

void MMPABB_PulseDrainINT(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPDINT",num);
}

void MMPABB_PulseDrainWIS(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPDWIS",num);
}

void MMPABB_PulseDrainCON(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPDCON",num);
}

void MMPABB_PulseDrainDEX(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPDDEX",num);
}

void MMPABB_PulseDrainSTR(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPDSTR",num);
}

void MMPABB_TouchPetrify(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPetrifyTouch",num);
}

void MMP_AbberationTable(object oSkin)
{
    int die = Die(44);
    int nEffect;

    switch(die)
    {
    case 1:
        MMPABB_Adhesive(oSkin);
        break;
    case 2:
        MMPABB_Slow(oSkin);
        break;
    case 3:
        MMPABB_Sleep(oSkin);
        break;
    case 4:
        MMPABB_Blindness(oSkin);
        break;
    case 5:
        MMPABB_Daze(oSkin);
        break;
    case 6:
        MMPABB_Fear(oSkin);
        break;
    case 7:
        MMPABB_Confusion(oSkin);
        break;
    case 8:
        MMPABB_Contagion(oSkin);
        break;
    case 9:
        MMPABB_HoldPerson(oSkin);
        break;
    case 10:
        MMPABB_HoldMonster(oSkin);
        break;
    case 11:
        MMPABB_CharmingGaze(oSkin,d6());
        break;
    case 12:
        MMPABB_MindBlast(oSkin,d6());
        break;
    case 13:
        MMPABB_MindFog(oSkin,d6());
        break;
    case 14:
        MMPABB_LesserMindBlank(oSkin,d6());
        break;
    case 15:
        MMPABB_AuraBlindness(oSkin,d6());
        break;
    case 16:
        MMPABB_AuraCold(oSkin,d6());
        break;
    case 17:
        MMPABB_AuraElectricity(oSkin,d6());
        break;
    case 18:
        MMPABB_AuraFear(oSkin,d6());
        break;
    case 19:
        MMPABB_AuraFire(oSkin,d6());
        break;
    case 20:
        MMPABB_AuraHorror(oSkin,d6());
        break;
    case 21:
        MMPABB_AuraMenace(oSkin,d6());
        break;
    case 22:
        MMPABB_AuraProtection(oSkin,d6());
        break;
    case 23:
        MMPABB_AuraStun(oSkin,d6());
        break;
    case 24:
        MMPABB_AuraUnearthlyVisage(oSkin,d6());
        break;
    case 25:
        MMPABB_BoltDrainCharisma(oSkin,d6());
        break;
    case 26:
        MMPABB_BoltDrainConstitution(oSkin,d6());
        break;
    case 27:
        MMPABB_BoltDrainStrength(oSkin,d6());
        break;
    case 28:
        MMPABB_BoltDrainIntelligence(oSkin,d6());
        break;
    case 29:
        MMPABB_BoltDrainWisdom(oSkin,d6());
        break;
    case 30:
        MMPABB_SonicCone(oSkin,d6());
        break;
    case 31:
        MMPABB_GazeParalysis(oSkin,d6());
        break;
    case 32:
        MMPABB_GazeCharm(oSkin,d6());
        break;
    case 33:
        MMPABB_GazeConfusion(oSkin,d6());
        break;
    case 34:
        MMPABB_GazeDaze(oSkin,d6());
        break;
    case 35:
        MMPABB_GazeParalysis(oSkin,d6());
        break;
    case 36:
        MMPABB_GazeDominate(oSkin,d6());
        break;
    case 37:
        MMPABB_RayOfEnfeeble(oSkin,d6());
        break;
    case 38:
        MMPABB_PulseDrainCHA(oSkin,d6());
        break;
    case 39:
        MMPABB_PulseDrainINT(oSkin,d6());
        break;
    case 40:
        MMPABB_PulseDrainWIS(oSkin,d6());
        break;
    case 41:
        MMPABB_PulseDrainCON(oSkin,d6());
        break;
    case 42:
        MMPABB_PulseDrainDEX(oSkin,d6());
        break;
    case 43:
        MMPABB_PulseDrainSTR(oSkin,d6());
        break;
    default:
        MMPABB_Bewilder(oSkin);
        break;

    }
}

void MMPABB_AbilityDrain(object oW)
{
    int ability = Random(6);
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_ABILITYDRAIN,
            ability);
    IPSafeAddItemProperty(oW,ip);

}

void MMPABB_AbilityBlindness(object oW)
{
    int x = d20();
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_BLINDNESS,
            x);
    IPSafeAddItemProperty(oW,ip);

}

void MMPABB_AbilityConfusion(object oW)
{
    int x = d20();
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_CONFUSION,
            x);
    IPSafeAddItemProperty(oW,ip);

}

void MMPABB_AbilityDeafness(object oW)
{
    int x = d20();
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_DEAFNESS,
            x);
    IPSafeAddItemProperty(oW,ip);

}

void MMPABB_AbilityDisease(object oW)
{
    int x = d20();
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_DISEASE,
            x);
    IPSafeAddItemProperty(oW,ip);

}

void MMPABB_AbilityFear(object oW)
{
    int x = d20();
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_FEAR,
            x);
    IPSafeAddItemProperty(oW,ip);

}


void MMPABB_AbilityHold(object oW)
{
    int x = d20();
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_HOLD,
            x);
    IPSafeAddItemProperty(oW,ip);

}


void MMPABB_AbilityPoison(object oW)
{
    int x = d20();
    itemproperty ip =
        ItemPropertyOnMonsterHitProperties(
            IP_CONST_ONHIT_ITEMPOISON,
            x);
    IPSafeAddItemProperty(oW,ip);

}


void MMP_AbberationCW(object oW)
{
    int n = Die(10);
    itemproperty ip;

    switch(n)
    {
    case 1: MMPABB_AbilityDrain(oW); break;
    case 2: MMPABB_AbilityBlindness(oW); break;
    case 3: MMPABB_AbilityDeafness(oW); break;
    case 4: MMPABB_AbilityDisease(oW); break;
    case 5: MMPABB_AbilityConfusion(oW); break;
    case 6: MMPABB_AbilityFear(oW); break;
    case 7: MMPABB_AbilityHold(oW); break;
    case 8:
    default:
        MMPABB_AbilityPoison(oW);
        break;
    }
}


void MMP_DoEquip()
{
    AssignCommand(OBJECT_SELF,ActionEquipMostEffectiveArmor());
}

object MMP_GenerateRing()
{
    string sRing = "lutes_ring0";
    int n = Random(10)+1;
    if( n < 10) sRing = sRing + "0" + IntToString(n);
    else sRing = sRing + IntToString(n);
    object oRing = CreateItemOnObject(sRing,oObject,1);
    struct sEnchantments Enchants;
    Enchants.oItem = oRing;
    Enchants.sName = "Enchanted Ring";
    EnchantItem(Enchants);
    SetName(Enchants.oItem,Enchants.sName);
    return oRing;
}

object MMP_GenerateAmulet()
{
    string sAmulet = "lutes_amulet0";
    int n = Random(10)+1;
    if( n < 10) sAmulet = sAmulet + "0" + IntToString(n);
    else sAmulet = sAmulet + IntToString(n);
    object oAmulet = CreateItemOnObject(sAmulet,oObject,1);
    struct sEnchantments Enchants;
    Enchants.oItem = oAmulet;
    Enchants.sName = "Enchanted Amulet";
    EnchantItem(Enchants);
    SetName(Enchants.oItem,Enchants.sName);
    return oAmulet;
}

object MMP_GenerateWand()
{
    string item = "lutes_wand";
    object oitem = CreateItemOnObject(item,OBJECT_SELF,1);
    struct sEnchantments Enchants;
    Enchants.oItem = oitem;
    Enchants.sName = "Enchanted Wand";
    SetName(oitem,Enchants.sName);
    SetIdentified(oitem, TRUE);
    EnchantMagic(Enchants);
    return oitem;
}

object MMP_GenerateStaff()
{
    string item = "lutes_staff";
    object oitem = CreateItemOnObject(item,OBJECT_SELF,1);
    struct sEnchantments Enchants;
    Enchants.oItem = oitem;
    Enchants.sName = "Enchanted Staff";
    SetName(oitem,Enchants.sName);
    struct sItemInfo info;

    struct sItemInfo wi;
    wi.sBluePrint=item;
    wi.sName     ="Enchanted Staff";
    wi.wType     = WEAPON_STAFF;
    EnchantWeapon(wi);
    EnchantMagic(Enchants);
    return oitem;
}

object MMP_GenerateRod()
{
    string item = "lutes_rod";
    object oitem = CreateItemOnObject(item,OBJECT_SELF,1);
    struct sEnchantments Enchants;
    Enchants.oItem = oitem;
    Enchants.sName = "Enchanted Rod";
    SetName(oitem,Enchants.sName);
    SetIdentified(oitem, TRUE);
    EnchantMagic(Enchants);
    return oitem;
}


object MMP_GenerateClericWeapon(int type = -1)
{
    struct sItemInfo ItemInfo;

    int iRoll = Random(5)+1;
    ItemInfo=GenerateBluntWeapon();

    ItemInfo.oItem = CreateItemOnObject(ItemInfo.sBluePrint,oObject);
    if( !GetIsObjectValid(ItemInfo.oItem) )
    {
        PrintString("Create Weapon " + ItemInfo.sName + " bp="+ItemInfo.sBluePrint+" failed.");
        return OBJECT_INVALID;
    }
    EnchantWeapon(ItemInfo);
    return ItemInfo.oItem;
}

object MMP_GenerateHeavyArmor()
{
    int iRoll = d6();
    struct sItemInfo ItemInfo;
    switch(iRoll)
    {
    case 1: ItemInfo = GenerateBandedMail(); break;
    case 2: ItemInfo = GenerateFullPlate(); break;
    case 3: ItemInfo = GenerateHalfPlate(); break;
    case 4: ItemInfo = GenerateSplintMail(); break;
    case 5: ItemInfo = GenerateScaleMail(); break;
    case 6: ItemInfo = GenerateBreastPlate(); break;
    case 7:
    default:
        ItemInfo = GenerateChainMail(); break;
    }

    ItemInfo.oItem = CreateItemOnObject(ItemInfo.sBluePrint,oObject);
    if( !GetIsObjectValid(ItemInfo.oItem) )
    {
        PrintString("Create Armor " + ItemInfo.sName + " bp="+ItemInfo.sBluePrint+" failed.");
        return OBJECT_INVALID;
    }
    EnchantArmor(ItemInfo);
    return ItemInfo.oItem;

}


object MMP_GenerateShield()
{
    int iRoll = d3();
    struct sItemInfo ItemInfo;

    switch(iRoll)
    {
    case 1: ItemInfo = GenerateSmallShield(); break;
    case 2: ItemInfo = GenerateLargeShield(); break;
    case 3: ItemInfo = GenerateTowerShield(); break;
    }

    ItemInfo.oItem = CreateItemOnObject(ItemInfo.sBluePrint,oObject);
    if( !GetIsObjectValid(ItemInfo.oItem) )
    {
        PrintString("Create Shield " + ItemInfo.sName + " bp="+ItemInfo.sBluePrint+" failed.");
        return OBJECT_INVALID;
    }

    EnchantArmor(ItemInfo);
    return ItemInfo.oItem;

}

void main()
{
    ExecuteScript("nw_c2_default9",OBJECT_SELF);
    if(GetLocalInt(GetModule(),"bUseAIScripts") == FALSE) return;


    // ***** Spawn-In Conditions ***** //

    // * REMOVE COMMENTS (// ) before the "Set..." functions to activate
    // * them. Do NOT touch lines commented out with // *, those are
    // * real comments for information.

    // * This causes the creature to say a one-line greeting in their
    // * conversation file upon perceiving the player. Put [NW_D2_GenCheck]
    // * in the "Text Seen When" field of the greeting in the conversation
    // * file. Don't attach any player responses.
    // *
    // SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION);

    // * Same as above, but for hostile creatures to make them say
    // * a line before attacking.
    // *
    // SetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION);

    // * This NPC will attack when its allies call for help
    // *
    // SetSpawnInCondition(NW_FLAG_SHOUT_ATTACK_MY_TARGET);

    // * If the NPC has the Hide skill they will go into stealth mode
    // * while doing WalkWayPoints().
    // *
    // SetSpawnInCondition(NW_FLAG_STEALTH);

    //--------------------------------------------------------------------------
    // Enable stealth mode by setting a variable on the creature
    // Great for ambushes
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_STEALTH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_STEALTH);
    }
    // * Same, but for Search mode
    // *
    // SetSpawnInCondition(NW_FLAG_SEARCH);

    //--------------------------------------------------------------------------
    // Make creature enter search mode after spawning by setting a variable
    // Great for guards, etc
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_SEARCH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_SEARCH);
    }
    // * This will set the NPC to give a warning to non-enemies
    // * before attacking.
    // * NN -- no clue what this really does yet
    // *
    // SetSpawnInCondition(NW_FLAG_SET_WARNINGS);

    // * Separate the NPC's waypoints into day & night.
    // * See comment on WalkWayPoints() for use.
    // *
    // SetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING);

    // * If this is set, the NPC will appear using the "EffectAppear"
    // * animation instead of fading in, *IF* SetListeningPatterns()
    // * is called below.
    // *
    //SetSpawnInCondition(NW_FLAG_APPEAR_SPAWN_IN_ANIMATION);

    // * This will cause an NPC to use common animations it possesses,
    // * and use social ones to any other nearby friendly NPCs.
    // *
    // SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);

    //--------------------------------------------------------------------------
    // Enable immobile ambient animations by setting a variable
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT_IMMOBILE) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    }
    // * Same as above, except NPC will wander randomly around the
    // * area.
    // *
    // SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);


    //--------------------------------------------------------------------------
    // Enable mobile ambient animations by setting a variable
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);
    }
    // **** Animation Conditions **** //
    // * These are extra conditions you can put on creatures with ambient
    // * animations.

    // * Civilized creatures interact with placeables in
    // * their area that have the tag "NW_INTERACTIVE"
    // * and "talk" to each other.
    // *
    // * Humanoid races are civilized by default, so only
    // * set this flag for monster races that you want to
    // * behave the same way.
    // SetAnimationCondition(NW_ANIM_FLAG_IS_CIVILIZED);

    // * If this flag is set, this creature will constantly
    // * be acting. Otherwise, creatures will only start
    // * performing their ambient animations when they
    // * first perceive a player, and they will stop when
    // * the player moves away.
    // SetAnimationCondition(NW_ANIM_FLAG_CONSTANT);

    // * Civilized creatures with this flag set will
    // * randomly use a few voicechats. It's a good
    // * idea to avoid putting this on multiple
    // * creatures using the same voiceset.
    // SetAnimationCondition(NW_ANIM_FLAG_CHATTER);

    // * Creatures with _immobile_ ambient animations
    // * can have this flag set to make them mobile in a
    // * close range. They will never leave their immediate
    // * area, but will move around in it, frequently
    // * returning to their starting point.
    // *
    // * Note that creatures spawned inside interior areas
    // * that contain a waypoint with one of the tags
    // * "NW_HOME", "NW_TAVERN", "NW_SHOP" will automatically
    // * have this condition set.
    // SetAnimationCondition(NW_ANIM_FLAG_IS_MOBILE_CLOSE_RANGE);


    // **** Special Combat Tactics *****//
    // * These are special flags that can be set on creatures to
    // * make them follow certain specialized combat tactics.
    // * NOTE: ONLY ONE OF THESE SHOULD BE SET ON A SINGLE CREATURE.

    // * Ranged attacker
    // * Will attempt to stay at ranged distance from their
    // * target.
    // SetCombatCondition(X0_COMBAT_FLAG_RANGED);

    // * Defensive attacker
    // * Will use defensive combat feats and parry
    // SetCombatCondition(X0_COMBAT_FLAG_DEFENSIVE);

    // * Ambusher
    // * Will go stealthy/invisible and attack, then
    // * run away and try to go stealthy again before
    // * attacking anew.
    // SetCombatCondition(X0_COMBAT_FLAG_AMBUSHER);

    // * Cowardly
    // * Cowardly creatures will attempt to flee
    // * attackers.
    // SetCombatCondition(X0_COMBAT_FLAG_COWARDLY);


    // **** Escape Commands ***** //
    // * NOTE: ONLY ONE OF THE FOLLOWING SHOULD EVER BE SET AT ONE TIME.
    // * NOTE2: Not clear that these actually work. -- NN

    // * Flee to a way point and return a short time later.
    // *
    // SetSpawnInCondition(NW_FLAG_ESCAPE_RETURN);

    // * Flee to a way point and do not return.
    // *
    // SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);

    // * Teleport to safety and do not return.
    // *
    // SetSpawnInCondition(NW_FLAG_TELEPORT_LEAVE);

    // * Teleport to safety and return a short time later.
    // *
    // SetSpawnInCondition(NW_FLAG_TELEPORT_RETURN);



    // ***** CUSTOM USER DEFINED EVENTS ***** /


    /*
      If you uncomment any of these conditions, the creature will fire
      a specific user-defined event number on each event. That will then
      allow you to write custom code in the "OnUserDefinedEvent" handler
      script to go on top of the default NPC behaviors for that event.

      Example: I want to add some custom behavior to my NPC when they
      are damaged. I uncomment the "NW_FLAG_DAMAGED_EVENT", then create
      a new user-defined script that has something like this in it:

      if (GetUserDefinedEventNumber() == 1006) {
          // Custom code for my NPC to execute when it's damaged
      }

      These user-defined events are in the range 1001-1007.
    */

    // * Fire User Defined Event 1001 in the OnHeartbeat
    // *
    // SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);

    // * Fire User Defined Event 1002
    // *
    // SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);

    // * Fire User Defined Event 1005
    // *
    //SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);

    // * Fire User Defined Event 1006
    // *
    //SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);

    // * Fire User Defined Event 1008
    // *
    // SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);

    // * Fire User Defined Event 1003
    // *
    //SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);

    // * Fire User Defined Event 1004
    // *
    // SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);



    // ***** DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ***** //

    // * Goes through and sets up which shouts the NPC will listen to.
    // *
    SetListeningPatterns();

    // * Walk among a set of waypoints.
    // * 1. Find waypoints with the tag "WP_" + NPC TAG + "_##" and walk
    // *    among them in order.
    // * 2. If the tag of the Way Point is "POST_" + NPC TAG, stay there
    // *    and return to it after combat.
    //
    // * Optional Parameters:
    // * void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
    //
    // * If "NW_FLAG_DAY_NIGHT_POSTING" is set above, you can also
    // * create waypoints with the tags "WN_" + NPC Tag + "_##"
    // * and those will be walked at night. (The standard waypoints
    // * will be walked during the day.)
    // * The night "posting" waypoint tag is simply "NIGHT_" + NPC tag.
    WalkWayPoints();

    //* Create a small amount of treasure on the creature
    if ((GetLocalInt(GetModule(), "X2_L_NOTREASURE") == FALSE)  &&
        (GetLocalInt(OBJECT_SELF, "X2_L_NOTREASURE") == FALSE)   )
    {
        CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    }


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //

    // * If Incorporeal, apply changes
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) == TRUE)
    {
        effect eConceal = EffectConcealment(50, MISS_CHANCE_TYPE_NORMAL);
        effect eGhost = EffectCutsceneGhost();
        effect eKDImmunity = EffectImmunity(IMMUNITY_TYPE_KNOCKDOWN);
        effect eImmunity = EffectImmunity(IMMUNITY_TYPE_ENTANGLE);//Shadooow: logically also immune to trap, but thats too much hardcore I guess
        effect eLink = EffectLinkEffects(eConceal,eGhost);
        eLink = EffectLinkEffects(eLink,eKDImmunity);
        eLink = EffectLinkEffects(eLink,eImmunity);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eLink), OBJECT_SELF);
    }

    // * Give the create a random name.
    // * If you create a script named x3_name_gen in your module, you can
    // * set the value of the variable X3_S_RANDOM_NAME on OBJECT_SELF inside
    // * the script to override the creature's default name.
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_RANDOMIZE_NAME) == TRUE)
    {
        ExecuteScript("x3_name_gen",OBJECT_SELF);
        string sName = GetLocalString(OBJECT_SELF,"X3_S_RANDOM_NAME");
        if ( sName == "" )
        {
            sName = RandomName();
        }
        SetName(OBJECT_SELF,sName);
    }

    object oSkin = GetItemInSlot(INVENTORY_SLOT_CARMOUR,OBJECT_SELF);
    iChestLevel = GetHitDice(OBJECT_SELF);
    if(!GetIsObjectValid(oSkin))
    {
        oSkin = CreateItemOnObject("mmp_baseskin");
        AssignCommand(OBJECT_SELF,SKIN_SupportEquipSkin(oSkin));
    }
    struct sItemInfo ItemInfo;
    struct sEnchantments Enchants;
    oObject = OBJECT_SELF;
    ItemInfo.oItem = oSkin;
    EnchantArmor(ItemInfo);
    int n = d6();
    int i;

    if(d6()==1)
    {
        object oRing = MMP_GenerateRing();
        AssignCommand(OBJECT_SELF,ActionEquipItem(oRing,INVENTORY_SLOT_RIGHTRING));
        SetDroppableFlag(oRing,TRUE);
    }
    if(d6()==1)
    {
        object oRing = MMP_GenerateRing();
        AssignCommand(OBJECT_SELF,ActionEquipItem(oRing,INVENTORY_SLOT_LEFTRING));
        SetDroppableFlag(oRing,TRUE);
    }
    if(d6()==1)
    {
        object oAmulet = MMP_GenerateAmulet();
        AssignCommand(OBJECT_SELF,ActionEquipItem(oAmulet,INVENTORY_SLOT_NECK));
        SetDroppableFlag(oAmulet,TRUE);
    }

    for(i = 0; i < GetHitDice(OBJECT_SELF); i++)
    {
        object oitem = MMP_GenerateWand();
        SetDroppableFlag(oitem,FALSE);
    }
    if(d6() < 3)
    {
        object oitem = MMP_GenerateStaff();
        SetDroppableFlag(oitem,FALSE);
    }
    if(d6() < 3)
    {
        object oitem = MMP_GenerateRod();
        SetDroppableFlag(oitem,FALSE);
    }

    for(i = 0; i < GetHitDice(OBJECT_SELF); i++) CreateStdPotion();
    for(i = 0; i < GetHitDice(OBJECT_SELF); i++) CreateStdScroll();

    for(i = 0; i < GetHitDice(OBJECT_SELF); i++)
    {
        MMP_AbberationTable(oSkin);
    }
    object oBite = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
    MMP_AbberationCW(oBite);
    object oClaw = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
    MMP_AbberationCW(oBite);

}

