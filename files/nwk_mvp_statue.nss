#include "nwk_constants2"

const string STATUE_OBJECT_PREFIX_VAR_NAME = "statueObjectPrefix";
const int MAX_NUMBER_OF_STATUES=2;
const string STATUE_WP_PREFIX_VAR_NAME = "statueWPPrefix";

/** call it on new module */
void initializeWPPrefixNamesOfStatues()
{
    object oModule = GetModule();
    SetLocalString(oModule,STATUE_WP_PREFIX_VAR_NAME+"0","MVP_GOLD");
    SetLocalString(oModule,STATUE_WP_PREFIX_VAR_NAME+"1","MVP_SILVER");
}



object createStatue(object oPC,location statueLocation)
{
    ///*DEBUG*/SpeakString("lcreateStatue");
    object statue=CopyObject(oPC,statueLocation);


    effect eRessurect =  EffectResurrection ();
    eRessurect = EffectLinkEffects ( EffectHeal( GetMaxHitPoints (statue)), eRessurect );
    ApplyEffectToObject ( DURATION_TYPE_INSTANT, eRessurect, statue );
    int animation = ANIMATION_FIREFORGET_SALUTE;
    AssignCommand( statue, ActionPlayAnimation(animation) );

    //petrify him on delay (after action)
    effect  ePetrification= SupernaturalEffect (EffectPetrify());
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePetrification,statue));
    DelayCommand(4.0,SetPlotFlag(statue,TRUE));
    //make him immobile
    //SetCutsceneMode ( statue, TRUE );




    return statue;
}



/** changeMvpStatues
 *  The MVP has changed . so if there was an earlier mvp , destroy his
 *  statues . In any cases , create new statues and set saves them by object
 *  on the module , using the initializeWPPrefixNamesOfStatues()
 * Note: for this method to work , the prefix name of wp must be pre-initialzed
 * on the module.
 */
void changeMvpStatues(object newMVP)
{
    object oModule = GetModule();
    initializeWPPrefixNamesOfStatues(); //instead of in module startup (just foor now)
    //try to destroy all the old status

    object oCurrStatue;
    string sCurrVarName;
    int i;
    for (i=0;i<MAX_NUMBER_OF_STATUES;i++)
    {
        sCurrVarName = STATUE_OBJECT_PREFIX_VAR_NAME + IntToString(i);
        oCurrStatue = GetLocalObject(oModule,sCurrVarName);
        if (GetIsObjectValid(oCurrStatue))
        {
            DestroyObject(oCurrStatue);
        }
    }

    string sWPFullName;
    object wpObject;
    location wpLocation;
    if (GetIsObjectValid(newMVP))
    {
        //now create new ones at the designated places
        for (i=0;i<MAX_NUMBER_OF_STATUES;i++)
        {
            //get place number i prefix and add it a map suffix
            sWPFullName =mapFullTagName(GetLocalString(oModule,
                                        STATUE_WP_PREFIX_VAR_NAME+IntToString(i)));
      // /*DEBUG*/SpeakString("wp name is "+ sWPFullName);
            wpObject = GetObjectByTag(sWPFullName);

          //  if (wpObject ==OBJECT_INVALID)
          //  {
               // /*DEBUG*/SpeakString("loop of  object number"+IntToString(i));
                wpLocation = GetLocation(wpObject);
                oCurrStatue = createStatue(newMVP , wpLocation);

                sCurrVarName = STATUE_OBJECT_PREFIX_VAR_NAME + IntToString(i);
                SetLocalObject(oModule,sCurrVarName,oCurrStatue);
          //  }
        }
    }

}




