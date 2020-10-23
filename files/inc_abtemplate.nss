void MMPABB_Adhesive(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ENTANGLE,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Slow(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 3)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_SLOW,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bSlow",d6());

}

void MMPABB_Sleep(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 4)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_SLEEP,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bSlow",1);

}

void MMPABB_Blindness(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 3)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_BLINDNESS_AND_DEAFNESS,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bBlindeness",1);

}

void MMPABB_Daze(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_DAZE,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPABB_Fear(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 6)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_FEAR,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bFear",d6());


}

void MMPABB_Bewilder(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 5)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_FEEBLEMIND,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bFeebleMind",d6());
}

void MMPABB_Confusion(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if( nHD > 6)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_CONFUSION,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bConfusion",d6());

}

void MMPABB_Contagion(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 5)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_CONTAGION,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }

    SetLocalInt(OBJECT_SELF,"bContagion",1);


}

void MMPABB_HoldPerson(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 7)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_HOLD_PERSON,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bHoldPerson",d6());

}

void MMPABB_HoldMonster(object oSkin)
{
    int nHD = GetHitDice(OBJECT_SELF);
    if(nHD > 10)
    {
        itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_HOLD_MONSTER,GetHitDice(OBJECT_SELF));
        IPSafeAddItemProperty(oSkin,ip);
    }
    SetLocalInt(OBJECT_SELF,"bHoldMonster",d6());

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


void MMPF_TouchPetrify(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPetrifyTouch",num);
}

void MMPF_CharmPerson(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bCharmPerson",num);
}

void MMPF_CharmMonster(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bCharmMonster",num);
}

void MMPF_HoldPerson(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bHoldPerson",num);
}

void MMPF_HoldMonster(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bHoldMonster",num);
}

void MMPF_DominatePerson(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bDominatePerson",num);
}

void MMPF_DominateMonster(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bDominateMonster",num);
}

void MMPF_Boom(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoom",num);
}

void MMPF_Scare(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bScare",num);
}

void MMPF_FeebleMind(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bFeebleMind",num);
}

void MMPF_Daze(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bDaze",num);
}

void MMPF_Insanity(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bInsanity",num);
}

void MMPF_DeafeningClang(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bDeafeningClang",num);
}

void MMPF_Displacement(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bDisplacement",num);
}

void MMPF_EnergyDrain(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bEnergyDrain",num);
}


void MMPF_Fear(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bFear",num);
}

void MMPF_FingerOfDeath(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bFingerOfDeath",num);
}

void MMPF_GhoulTouch(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bGhoulTouch",num);
}

void MMPF_VampiricTouch(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bVampiricTouch",num);
}

void MMP_AbberationTable(object oSkin)
{
    int die = Die(58);
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
    case 44:
        MMPF_HoldPerson(oSkin,d6());
        break;
    case 45:
        MMPF_HoldMonster(oSkin,d6());
        break;
    case 46:
        MMPF_CharmPerson(oSkin,d6());
        break;
    case 47:
        MMPF_CharmMonster(oSkin,d6());
        break;
    case 48:
        MMPF_DominatePerson(oSkin,d6());
        break;
    case 49:
        MMPF_DominateMonster(oSkin,d6());
        break;
    case 50:
        MMPF_Boom(oSkin,d6());
        break;
    case 51:
        MMPF_Scare(oSkin,d6());
        break;
    case 52:
        MMPF_Daze(oSkin,d6());
        break;
    case 53:
        MMPF_Insanity(oSkin,d6());
        break;
    case 54:
        MMPF_DeafeningClang(oSkin,d6());
        break;
    case 55:
        MMPF_Displacement(oSkin,d6());
        break;
    case 56:
        MMPF_GhoulTouch(oSkin,d6());
        break;
    case 57:
        MMPF_VampiricTouch(oSkin,d6());
        break;
    default:
        MMPF_FeebleMind(oSkin);
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

