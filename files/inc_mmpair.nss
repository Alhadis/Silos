
void MMPAIR_Slow(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_SLOW,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPAIR_Blindness(object oSkin)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_BLINDNESS_AND_DEAFNESS,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);

}

void MMPAIR_GustOfWind(object oSkin, int num=1)
{
    itemproperty ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_GUST_OF_WIND,GetHitDice(OBJECT_SELF));
    IPSafeAddItemProperty(oSkin,ip);
    SetLocalInt(OBJECT_SELF,"bGustOfWind",num);
}

void MMPAIR_ConeOfLightning(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bConeOfLightning",num);
}

void MMPAIR_ElementalSwarm(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bElementalSwarm",num);
}

void MMPAIR_BallLightning(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBallLightning",num);
}

void MMPAIR_CallLightning(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bCallLightning",num);
}

void MMPAIR_LightningBolt(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bLightningBolt",num);
}

void MMPAIR_PulseLightning(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bPulseLightning",num);
}

void MMPAIR_BoltLightning(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoltLightning",num);
}

void MMPAIR_Whirlwind(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bWhirlwind",num);
}

void MMPAIR_ChainLightning(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bChainLightning",num);
}

void MMPAIR_CloudOfBewilderment(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bCloudOfBewilderment",num);
}

void MMPAIR_Cloudkill(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bCloudkill",num);
}

void MMPAIR_ElementalShield(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bElementalShield",num);
}

void MMPAIR_Boom(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bBoom",num);
}

void MMPAIR_IceStorm(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bIceStorm",num);
}

void MMPAIR_NatureBalance(object oSkin, int num=1)
{
    SetLocalInt(OBJECT_SELF,"bNatureBalance",num);
}


void MMP_HalfAirTable(object oSkin)
{
    int die = Die(19);
    int nEffect;

    switch(die)
    {
    case 1:
        MMPAIR_GustOfWind(oSkin);
        break;
    case 2:
        MMPAIR_Slow(oSkin);
        break;
    case 3:
        MMPAIR_Blindness(oSkin);
        break;
    case 4:
        MMPAIR_ConeOfLightning(oSkin);
        break;
    case 5:
        MMPAIR_ElementalSwarm(oSkin);
        break;
    case 6:
        MMPAIR_BallLightning(oSkin);
        break;
    case 7:
        MMPAIR_CallLightning(oSkin);
        break;
    case 8:
        MMPAIR_LightningBolt(oSkin);
        break;
    case 9:
        MMPAIR_PulseLightning(oSkin);
        break;
    case 10:
        MMPAIR_BoltLightning(oSkin);
        break;
    case 11:
        MMPAIR_Whirlwind(oSkin);
        break;
    case 12:
        MMPAIR_ChainLightning(oSkin);
        break;
    case 13:
        MMPAIR_CloudOfBewilderment(oSkin);
        break;
    case 14:
        MMPAIR_Cloudkill(oSkin);
        break;
    case 15:
        MMPAIR_ElementalShield(oSkin);
        break;
    case 16:
        MMPAIR_Boom(oSkin);
        break;
    case 17:
        MMPAIR_IceStorm(oSkin);
        break;
    case 18:
    default:
        MMPAIR_NatureBalance(oSkin);
        break;
    }
}

