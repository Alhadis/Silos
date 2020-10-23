void MMPOOZE_EvardsBlackTentacles(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_EVARDS_BLACK_TENTACLES,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPOOZE_BoltAcid(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltAcid",num);
}

void MMPOOZE_BoltDeath(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltDeath",num);
}

void MMPOOZE_BoltDisease(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltDisease",num);
}

void MMPOOZE_BoltPoison(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltPoison",num);
}

void MMPOOZE_PulseDisease(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPulseDisease",num);
}

void MMPOOZE_PulseDeath(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPulseDeath",num);
}

void MMPOOZE_PulsePoison(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPulsePoison",num);
}

void MMP_OozeTable(object oSkin)
{
    int die = Die(46);
    int nEffect;

    switch(die)
    {
    case 1:
        MMPABB_Adhesive(oSkin);
        break;
    case 2:
        MMPABB_Slow(oSkin);
        break;
    case 4:
        MMPABB_Blindness(oSkin);
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
    case 12:
        MMPABB_MindBlast(oSkin,d6());
        break;
    case 13:
        MMPABB_MindFog(oSkin,d6());
        break;
    case 14:
        MMPABB_LesserMindBlank(oSkin,d6());
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
        MMPOOZE_BoltAcid(oSkin,d6());
        break;
    case 31:
        MMPOOZE_BoltDeath(oSkin,d6());
        break;
    case 32:
        MMPOOZE_BoltDisease(oSkin,d6());
        break;
    case 33:
        MMPOOZE_BoltPoison(oSkin,d6());
        break;
    case 34:
        MMPABB_BoltDrainWisdom(oSkin,d6());
        break;
    case 35:
        MMPABB_SonicCone(oSkin,d6());
        break;
    case 36:
        MMPABB_RayOfEnfeeble(oSkin,d6());
        break;
    case 37:
        MMPABB_PulseDrainCHA(oSkin,d6());
        break;
    case 38:
        MMPABB_PulseDrainINT(oSkin,d6());
        break;
    case 39:
        MMPABB_PulseDrainWIS(oSkin,d6());
        break;
    case 40:
        MMPABB_PulseDrainCON(oSkin,d6());
        break;
    case 41:
        MMPABB_PulseDrainDEX(oSkin,d6());
        break;
    case 42:
        MMPABB_PulseDrainSTR(oSkin,d6());
        break;
    case 43:
        MMPOOZE_PulseDisease(oSkin,d6());
        break;
    case 44:
        MMPOOZE_PulseDeath(oSkin,d6());
        break;
    case 45:
        MMPOOZE_PulsePoison(oSkin,d6());
        break;

    default:
        MMPOOZE_EvardsBlackTentacles(oSkin);
        break;

    }
}

