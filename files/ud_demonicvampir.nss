// Demonic Vampire Template
#include "inc_ai"
#include "inc_magic"
#include "inc_demons"
#include "inc_mmp"

void VAMPIRE_SpecialAttack()
{
    if(GetLocalInt(OBJECT_SELF,"bSummons") == 0)
    {
        SetLocalInt(OBJECT_SELF,"bSummons",1);
        int x = Random(2);
        int i=0;
        int n = d4(4)+1;
        switch(x)
        {
        case 0:
            for(i = 0; i < n; i++)
            {
                CreateObject(OBJECT_TYPE_CREATURE,"NW_RATDIRE001",GetLocation(OBJECT_SELF));
            }
            break;
        case 1:
            for(i = 0; i < n; i++)
            {
                CreateObject(OBJECT_TYPE_CREATURE,"NW_WOLF",GetLocation(OBJECT_SELF));
            }
            break;
        }
   }
   else
   {
      object oMax = MaximizeCone(15.0);
      object oNear = FindNearestEnemy(OBJECT_SELF);
      float D = GetDistanceToObject(oNear);
      object oSeen = GetLastPerceived();
      if(D > 2.0 && D < 15.0)
      {
        string sCon = "D="+FloatToString(D);
        SendMessageToPC(GetFirstPC(),sCon);
        if(!GetIsObjectValid(oMax)) oMax = oSeen;
        if(!GetHasEffect(EFFECT_TYPE_DOMINATED,oMax))
        {
            ClearAllActions(TRUE);
            ActionCastSpellAtObject(SPELLABILITY_GAZE_DOMINATE,oMax,METAMAGIC_ANY,TRUE);
        }
      }
    }
}


void DEMONIC_SpecialAttack()
{
    int nDarkness = GetLocalInt(OBJECT_SELF,"nDarkness");
    int nDispel = GetLocalInt(OBJECT_SELF,"nDispel");
    int nUnholyBlight = GetLocalInt(OBJECT_SELF,"nUnholyBlight");
    int nChaosHammer = GetLocalInt(OBJECT_SELF,"nChaosHammer");
    int nBlasphemy = GetLocalInt(OBJECT_SELF,"nBlasphemy");
    int nDominate = GetLocalInt(OBJECT_SELF,"nDominate");
    int nInsanity = GetLocalInt(OBJECT_SELF,"nInsanity");
    int nPowerWord = GetLocalInt(OBJECT_SELF,"nPowerWord");

    switch(Random(13)+1)
    {
    case 1:

        if(nDarkness < GetHitDice(OBJECT_SELF))
        {
            SendMessageToPC(GetFirstPC(),"Darkness");
            SetLocalInt(OBJECT_SELF,"nDarkness",nDarkness+1);
            DEMON_CastDarkness();

        }
        break;
    case 2:
        if(nDarkness < GetHitDice(OBJECT_SELF))
        {
            SendMessageToPC(GetFirstPC(),"Dispel Magic");
            SetLocalInt(OBJECT_SELF,"nDarkness",nDispel+1);
            DEMON_DispelSpellCaster();
        }
        break;
    case 3:
        DEMON_Teleport();
        break;
    case 4:
        if(nUnholyBlight < (GetHitDice(OBJECT_SELF)/2+1))
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
        if(nUnholyBlight < (GetHitDice(OBJECT_SELF)/2+1))
        {
            SendMessageToPC(GetFirstPC(),"Chaos Hammer");
            SetLocalInt(OBJECT_SELF,"nChaosHammer",nChaosHammer+1);
            DEMON_CastChaosHammer();
        }
        break;
    case 7:
        if(nBlasphemy < 1)
        {
            SendMessageToPC(GetFirstPC(),"Blasphemy");
            SetLocalInt(OBJECT_SELF,"nBlasphemy",1);
            DEMON_Blasphemy();
        }
        break;
    case 8:
        SendMessageToPC(GetFirstPC(),"Charm Person");
        DEMON_CharmPerson();
        break;
    case 9:
        SendMessageToPC(GetFirstPC(),"Confusion");
        DEMON_CastConfusion();
        break;
    case 10:
        if(nDominate < GetHitDice(OBJECT_SELF)/2+1)
        {
            SendMessageToPC(GetFirstPC(),"Dominate");
            SetLocalInt(OBJECT_SELF,"nDominate",nDominate+1);
            DEMON_DominateMonster();
        }
        break;
    case 11:
        if(nInsanity < 1)
        {
            SendMessageToPC(GetFirstPC(),"Insanity");
            SetLocalInt(OBJECT_SELF,"nInsanity",1);
            DEMON_Insanity();
        }
        break;
    case 12:
        if(nPowerWord < 1)
        {
            SendMessageToPC(GetFirstPC(),"Power Word: Stun");
            SetLocalInt(OBJECT_SELF,"nPowerWord",1);
            DEMON_PowerWordStun();
        }
        break;
    case 13:
    default:
        SendMessageToPC(GetFirstPC(),"Dominate");
        DEMON_CastDispelMagic();
        break;


    }
}

void DEMONIC_SpellCast(object oTarget)
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
    int i;
    int nCalledBy = GetUserDefinedEventNumber();
    // enter desired behaviour here
    switch(nCalledBy)
    {
    case 1011:
            DEMONIC_SpellCast(GetLastSpellCaster());
            break;

    default:
        switch(d2())
        {
        case 1: VAMPIRE_SpecialAttack(); break;
        case 2: DEMONIC_SpecialAttack(); break;
        }
        break;

    }
    return;

}
