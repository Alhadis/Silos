
void main()
{
object wz_oPC= GetEnteringObject();
object wz_oWP_landung = GetObjectByTag ("wz_WP_landung");
//object oWP_sturz =GetObjectByTag ("WP_sturz");

//int iStr = GetAbilityScore(oPC, ABILITY_STRENGTH);
int iDex= GetAbilityScore(wz_oPC, ABILITY_DEXTERITY);

if
(iDex>15)
{AssignCommand(wz_oPC, ActionJumpToObject (wz_oWP_landung));}
else
{int i_wz_Zufall = d6(1);
if
(i_wz_Zufall<=2)

{ PlaySound("as_cv_woodbreak1");
AssignCommand(wz_oPC, ActionJumpToObject (wz_oWP_landung));
 AssignCommand (wz_oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 5.0));
 int iSchaden = d6(2);
 effect eDamage= EffectDamage (iSchaden, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL);
  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, wz_oPC);
  AssignCommand(wz_oPC, SpeakString("Das tat weh! Musste die Leitersprosse brechen?", TALKVOLUME_TALK)); }
 else
 {AssignCommand(wz_oPC, ActionJumpToObject (wz_oWP_landung));}
 }
 }


