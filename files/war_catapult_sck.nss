#include "nwk_constants"

void main()
{
object oPC = GetLastUsedBy();
object oCatapult=OBJECT_SELF;
//string sTeam = GetLocalString(oPC, "team");
effect ePuff;
effect eFire;
object oTarget = GetObjectByTag(mapFullTagName("Throne"));
location lEffect = GetLocation(oTarget);
int nTest =TRUE;
int nTimer = GetLocalInt(oCatapult, "timer");
string sTargetTeam;

if (nTimer != nTest)
    {
    PlaySound("cb_sh_catapult");
    ePuff=EffectVisualEffect(VFX_FNF_HOWL_ODD);
    eFire=EffectVisualEffect(VFX_FNF_FIREBALL);
    int nFireBall = SPELL_FIREBALL;
    ActionCastFakeSpellAtObject( nFireBall, oTarget, PROJECTILE_PATH_TYPE_DEFAULT);
    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePuff, lEffect));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFire, lEffect));
    SetLocalInt (oCatapult, "timer", TRUE);

       object oFireTarget = GetFirstObjectInShape(SHAPE_CUBE, 15.0, lEffect, OBJECT_TYPE_CREATURE);
       while(GetIsObjectValid(oFireTarget))
       {
          string sTargetTeam =GetLocalString(oFireTarget, "team");
    //      if (GetIsDM(oFireTarget) == FALSE)
    //      {
    //         if (sTargetTeam != "BLUE")
    //         {
                AssignCommand ( oFireTarget, DelayCommand(2.0, ApplyEffectToObject (DURATION_TYPE_TEMPORARY, EffectDamage(d6(17), DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY), oFireTarget)));
    //         }
    //      }
          oFireTarget = GetNextObjectInShape(SHAPE_CUBE, 15.0, lEffect, OBJECT_TYPE_CREATURE);
       }
    DelayCommand(45.0, SetLocalInt(oCatapult, "timer", FALSE));
    }

}
