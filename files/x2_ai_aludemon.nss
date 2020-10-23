#include "inc_demons"



void SpecialAttack()
{
    int nDarkness = GetLocalInt(OBJECT_SELF,"nDarkness");
    int nDispel = GetLocalInt(OBJECT_SELF,"nDispel");
    int nUnholyBlight = GetLocalInt(OBJECT_SELF,"nUnholyBlight");
    int nChaosHammer = GetLocalInt(OBJECT_SELF,"nChaosHammer");
    int nBlasphemy = GetLocalInt(OBJECT_SELF,"nBlasphemy");
    int nDominate = GetLocalInt(OBJECT_SELF,"nDominate");
    int nInsanity = GetLocalInt(OBJECT_SELF,"nInsanity");
    int nPowerWord = GetLocalInt(OBJECT_SELF,"nPowerWord");
    int nCharm = GetLocalInt(OBJECT_SELF,"nCharmPerson");
    int nConfusion = GetLocalInt(OBJECT_SELF,"nConfusion");
    int nHD = GetHitDice(OBJECT_SELF);

    switch(Random(13)+1)
    {
    case 1:
        SendMessageToPC(GetFirstPC(),"Darkness");
        DEMON_CastDarkness();
        break;
    case 2:
        if(nDispel < nHD && nHD > 20)
        {
            SendMessageToPC(GetFirstPC(),"Dispel Magic");
            SetLocalInt(OBJECT_SELF,"nDispelMagic",nDispel+1);
            DEMON_CastGreaterDispel();
        }
        break;
    case 3:
        DEMON_Teleport();
        break;
    case 4:
        if(nUnholyBlight < nHD && nHD > 9)
        {
            SendMessageToPC(GetFirstPC(),"Unholy Blight");
            SetLocalInt(OBJECT_SELF,"nUnholyBlight",nUnholyBlight+1);
            DEMON_CastUnholyBlight();
        }
        break;
    case 5:
        SendMessageToPC(GetFirstPC(),"Mirror Image");
        DEMON_Blink();
        break;

    case 6:
        if(nChaosHammer < nHD && nHD > 11)
        {
            SendMessageToPC(GetFirstPC(),"Chaos Hammer");
            SetLocalInt(OBJECT_SELF,"nChaosHammer",nChaosHammer+1);
            DEMON_CastChaosHammer();
        }
        break;
    case 7:
        if(nBlasphemy < 3 && nHD > 15)
        {
            SendMessageToPC(GetFirstPC(),"Blasphemy");
            SetLocalInt(OBJECT_SELF,"nBlasphemy",1);
            DEMON_Blasphemy();
        }
        break;
    case 8:
        if(nCharm < nHD)
        {
            SetLocalInt(OBJECT_SELF,"nCharmPerson",1);
            SendMessageToPC(GetFirstPC(),"Charm Person");
            DEMON_CastCharmPerson();
        }
        break;
    case 9:
        if(nConfusion < nHD && nHD > 7)
        {
            SetLocalInt(OBJECT_SELF,"nConfusion",nConfusion+1);
            SendMessageToPC(GetFirstPC(),"Confusion");
            DEMON_CastConfusion();
        }
        break;
    case 10:
        if(nDominate < nHD && nHD > 10)
        {
            SendMessageToPC(GetFirstPC(),"Dominate");
            SetLocalInt(OBJECT_SELF,"nDominate",nDominate+1);
            DEMON_DominateMonster();
        }
        break;
    case 11:
        if(nInsanity < nHD && nHD > 20)
        {
            SendMessageToPC(GetFirstPC(),"Insanity");
            SetLocalInt(OBJECT_SELF,"nInsanity",1);
            DEMON_Insanity();
        }
        break;
    case 12:
        if(nPowerWord < nHD && nHD > 15)
        {
            SendMessageToPC(GetFirstPC(),"Power Word: Stun");
            SetLocalInt(OBJECT_SELF,"nPowerWord",1);
            DEMON_PowerWordStun();
        }
        break;
    case 13:
        if(nCharm < 3)
        {
            DEMON_CastCharmPerson();
        }
        break;
    default:
        DEMON_CastDispelMagic();
        break;
    }
}

void SpellCast(object oTarget)
{
    if(!GetIsObjectValid(oTarget))
        oTarget = PickEnemy(OBJECT_SELF);

    switch(d3())
    {
    case 1:
        SendMessageToPC(GetFirstPC(),"Darkeness");
        DEMON_CastDarkness();
        break;
    case 2:
        SendMessageToPC(GetFirstPC(),"Dispel");
        DEMON_DispelSpellCaster();
        break;
    case 3:
        SendMessageToPC(GetFirstPC(),"Teleport");
        DEMON_Teleport();
        break;

    }
}


void main()
{
    if(GetLastSpellHarmful() && GetIsEnemy(GetLastSpellCaster()) )
    {
        if(d6() < 4)
        {
            __TurnCombatRoundOn(TRUE);
            SpellCast(GetLastSpellCaster());
            __TurnCombatRoundOn(FALSE);
        }
    }
    else if(d6() < 4)
    {
        __TurnCombatRoundOn(TRUE);
        SpecialAttack();
        __TurnCombatRoundOn(FALSE);
    }

}
