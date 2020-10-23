void main()
{
object oPC=GetEnteringObject();
int wurf=d20(1);

effect Fallschaden=EffectDamage(20*wurf, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL);
effect halberFallschaden=EffectDamage(10*wurf, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL);
effect umfall=EffectKnockdown();
effect eFirst=EffectVisualEffect(VFX_IMP_DEATH_WARD, FALSE);
int zufall=Random(4);
object oTarget;
location lTarget;
location lPC=GetLocation(oPC);

  switch (zufall) {
        case 0: oTarget = GetWaypointByTag("wz_eis");
                lTarget=GetLocation(oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oPC, 4.0);
                FloatingTextStringOnCreature("Eine Boe erfasst dich.", oPC, FALSE);
                SendMessageToPC(oPC, "Eine Boe erfasst dich und weht dich ueber den Rand.");
                SendMessageToPC(oPC, "Du faellst ...");
                FloatingTextStringOnCreature("Du faellst ....", oPC, FALSE);
                DelayCommand(1.0,  FloatingTextStringOnCreature("und faellst ....", oPC, FALSE));
                DelayCommand(1.0,  SendMessageToPC(oPC, "und faellst ..."));
                DelayCommand(2.0,  FloatingTextStringOnCreature("und faellst ....", oPC, FALSE));
                DelayCommand(2.0,  SendMessageToPC(oPC, "und faellst ..."));
                DelayCommand(3.0,  FloatingTextStringOnCreature("und faellst ....", oPC, FALSE));
                DelayCommand(3.0,  SendMessageToPC(oPC, "und faellst ..."));

                DelayCommand(3.1, BlackScreen(oPC));
 // If the PC does not have the item ""wz_fliegen"".
    if ( GetItemPossessedBy(oPC, "Fluegelbenutzen") == OBJECT_INVALID )
    {  DelayCommand(4.5,AssignCommand(oPC, ActionJumpToLocation(lTarget)));
      DelayCommand(5.7,  FadeFromBlack(oPC));
                DelayCommand(5.8,ApplyEffectToObject(DURATION_TYPE_INSTANT,umfall, oPC,6.0));
                DelayCommand(5.9,ApplyEffectToObject(DURATION_TYPE_INSTANT, Fallschaden, oPC));
                SendMessageToPC(oPC, "asdf0");
                break;
    }
                else

              {  DelayCommand(4.5,AssignCommand(oPC, ActionJumpToLocation(lTarget)));
                DelayCommand(5.7,  FadeFromBlack(oPC));
                DelayCommand(5.8,ApplyEffectToObject(DURATION_TYPE_INSTANT,umfall, oPC,6.0));
                DelayCommand(5.9,ApplyEffectToObject(DURATION_TYPE_INSTANT, halberFallschaden, oPC));
                SendMessageToPC(oPC, "asdf0/2");  }
                break;
        case 1: oTarget = GetWaypointByTag("wz_rauch");
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oPC, 4.0);
                FloatingTextStringOnCreature("Eine Boe erfasst dich.", oPC, FALSE);
                SendMessageToPC(oPC, "Eine Boe erfasst dich und weht dich ueber den Rand.");
                lTarget=GetLocation(oTarget);
                SendMessageToPC(oPC, "Du faellst ...");
                 FloatingTextStringOnCreature("Du faellst ....", oPC, FALSE);
               DelayCommand(1.0,  FloatingTextStringOnCreature("und faellst ....", oPC, FALSE));
                DelayCommand(1.0,  SendMessageToPC(oPC, "und faellst ..."));
                DelayCommand(2.0,  FloatingTextStringOnCreature("und faellst ....", oPC, FALSE));
                DelayCommand(2.0,  SendMessageToPC(oPC, "und faellst ..."));
                DelayCommand(3.0,  FloatingTextStringOnCreature("und faellst ....", oPC, FALSE));
                DelayCommand(3.0,  SendMessageToPC(oPC, "und faellst ..."));

                DelayCommand(3.1, BlackScreen(oPC));
                DelayCommand(4.5,AssignCommand(oPC, ActionJumpToLocation(lTarget)));
                DelayCommand(5.7, FadeFromBlack(oPC));
                break;
        case 2: break;
        case 3: break;
      }






}
