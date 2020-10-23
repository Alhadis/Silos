#include "x0_i0_spawncond"
#include "ai_inc"

void PriestSummon(int n, string resref)
{
    effect eEff =  EffectVisualEffect(VFX_IMP_UNSUMMON);
    DelayCommand(0.1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eEff,GetLocation(OBJECT_SELF)));
    int i;
    for(i = 0; i < n; i++)
    {
        object oC = CreateObject(OBJECT_TYPE_CREATURE,resref,GetLocation(OBJECT_SELF));
    }
}

void State0()
{
    object oSeen=GetLastPerceived();
    SetLocalInt(OBJECT_SELF,"nCurrentState",1);
    ClearAllActions(TRUE);
    PriestSummon(4+d6(),"giantcentipede");
}

void State1()
{

    SetLocalInt(OBJECT_SELF,"nCurrentState",2);
    PriestSummon(4+d6(),"gianttick");
}

void State2()
{
    SetLocalInt(OBJECT_SELF,"nCurrentState",3);
    PriestSummon(3+d6(),"mmp_vampbat");
}

void State3()
{
    int nHold = GetLocalInt(OBJECT_SELF,"nHoldPerson");
    if(nHold > 2) SetLocalInt(OBJECT_SELF,"nCurrentState",4);

    object oE = FindNearestEnemyWithoutEffect(OBJECT_SELF,EFFECT_TYPE_PARALYZE);
    if(GetIsObjectValid(oE))
    {
        SetLocalInt(OBJECT_SELF,"nHoldPerson",nHold+1);
        ActionCastSpellAtObject(SPELL_HOLD_PERSON,oE,METAMAGIC_EXTEND,TRUE);
    }
}

void main()
{
    int nState = GetLocalInt(OBJECT_SELF,"nCurrentState");
    SendMessageToPC(GetFirstPC(),"State="+IntToString(nState));

    __TurnCombatRoundOn(TRUE);
    switch(nState)
    {
    case 0:
        State0();
        break;
    case 1:
        State1();
        break;
    case 2:
        State2();
        break;
    case 3:
        State3();
        break;
    case 4:
    default:
        if(d6() < 4)
        {
            ActionCastSpellAtObject(SPELL_INFESTATION_OF_MAGGOTS,FindNearestEnemy(OBJECT_SELF),METAMAGIC_ANY,TRUE);
        }
    }
    __TurnCombatRoundOn(FALSE);
}
