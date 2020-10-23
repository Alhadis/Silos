//MVP file
/* the local vars   are mvp1_score ,mvp1_object and so forth to mvp6*/


#include "nwk_mvp_statue"

//store the ultmative MVP stats
//used in database and in mod variables
//name of database
const string sUMvPDatabase = "NWK_MVP_DATABASE";
//the name of the player
const string sUMvPName = "NWK_MVP_NAME";
//the account name of the player
const string sUMvPAccountName = "NWK_MVP_ACOUNTNAME";
//the score of the ultimative MvP
const string sUMvPScore = "NWK_MVP_SCORE";

//value of a team point
const int MVP_TEAM_POINT_VALUE = 5;

//initialise the ultimative MvP system
//- fetch the values of the ultimative MvP
//- store in mod variable
void InitUltimativeMvP ();


//Update the ultmative MvP values if necessary
void UpdateUltimativeMvP ();





//startin with 1 (the MVP)
object getMvpObj(int index)
{
   string index_as_st = IntToString(index);
   return GetLocalObject(GetModule(),"mvp"+index_as_st+"_obj"  );
}


int getMvpScore(int index)
{
    string index_as_st = IntToString(index);
    return GetLocalInt (GetModule(),"mvp"+index_as_st+"_score");
}

string getMvpName(int index)
{
  string index_as_st = IntToString(index);
  return GetLocalString (GetModule(),"mvp"+index_as_st+"_name");
}



void setMvp(int index,object obj,int score,string name)
{
    string index_as_st = IntToString(index);
    SetLocalObject( GetModule(),"mvp"+index_as_st+"_obj",obj);
    SetLocalInt   ( GetModule(),"mvp"+index_as_st+"_score",score);
    SetLocalString( GetModule(),"mvp"+index_as_st+"_name",name);



}






int MAX_MVP=6;



/* check if the score of the oScorer deserve to get in the MVP list.
mvp1=fighter/34
mvp2=sorc/32
mvp3=wiz/32
mvp4=bard/29
mvp5=rogue/10
mvp6=ranger/3

We come with oScorer wiz/27 [killed teamMember]
searching is he above 3 ?yap. above 10 yap. above 29 ?NAY.
so we should put him as the 5th . But he is in the list now already(3rd)
so we will first delete him from list and only then do the check.

*/

/* deletes the mvp. it is reffrenced by object and name(as backup if ibject-invalid)
*/
void deleteMvp(object oMvp,string name)
{
    int i;
    int match_found=0;

    //determine if he is amongst the 6 mvps
    for (i=1;i<=MAX_MVP;i++)
       if (getMvpObj(i)==oMvp)
            match_found=i;

    //if didnt find yet, try to find by name
    if (!match_found)
       for (i=1;i<=MAX_MVP;i++)
         if (getMvpName(i)==name)
             match_found=i;

    if (!match_found)
        return; //no one to delete

    //else delete him.match holds it`s index in the "list"
    //from his point and to MAX_MVP , all will get closer to mvp1 by one place.
    //p.s. Mvp6 will be emptied.
    //example : delete number 4. do it by:
    //put 5 into 4 , put 6 into 5 , and init 6.

    for (i=match_found;i<MAX_MVP;i++)
    {
        setMvp(i,
               getMvpObj(i+1),
               getMvpScore(i+1),
               getMvpName(i+1)
              );
    }

    //erase number MAX_MVP (=6).
    setMvp(MAX_MVP,OBJECT_INVALID,0,"");
}


void   DestroyMvpEffects(object oLooser) //he is now only in the 2nd place
{
      effect e;

      e=GetFirstEffect(oLooser);
      while (GetIsEffectValid(e))
      {
       if (GetEffectSubType(e)==SUBTYPE_EXTRAORDINARY)
            if (GetEffectType(e)==EFFECT_TYPE_SKILL_INCREASE)
                 RemoveEffect(oLooser,e);

       e=GetNextEffect(oLooser);
      }



}

/* the effect is ultra-vision and Visual effect.
the reson is that we cannot take it down otherwise.
*/
void CreateMvpEffects(object oMvp)
{

    int nVisEffect;
    effect eEffect,eUltra,eFinal;

    // set the visual effects
    nVisEffect = VFX_COM_HIT_SONIC;
//    VFX_DUR_MIND_AFFECTING_DOMINATED
//    VFX_DUR_MIND_AFFECTING_NEGATIVE
//    VFX_DUR_PROTECTION_EVIL_MAJOR
//  VFX_DUR_TENTACLE
//  VFX_COM_SPECIAL_RED_WHITE
 /*
    eFinal= EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR);
    eFinal=EffectLinkEffects(eFinal, EffectVisualEffect( VFX_DUR_MIND_AFFECTING_DOMINATED));
    eFinal=EffectLinkEffects(eFinal, EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR));
    eFinal=EffectLinkEffects(eFinal, EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR));
    eUltra=EffectUltravision();
    eEffect=EffectLinkEffects(eFinal,eUltra);
    eEffect = ExtraordinaryEffect(eFinal);

// put the visual on the PC
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eEffect,oMvp);
*/
    //DEBUG EFFECTS
    eFinal=EffectVisualEffect(VFX_DUR_GLYPH_OF_WARDING);
//    eFinal=EffectLinkEffects(eFinal,EffectVisualEffect(VFX_DUR_TENTACLE));

    eUltra=EffectSkillIncrease(SKILL_PERSUADE, 1);
    // eUltra=EffectRegenerate(5, 10.0);

    eFinal=EffectLinkEffects(eFinal,eUltra);
    eFinal = ExtraordinaryEffect(eFinal);

 // put the visual on the PC
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFinal,oMvp);

}





/* change the mvp list to match the current players.
   control flow:
    1. try to delete him. if he wasnt in the list ,nothing will happen.
    2. find his needed new place (before whom does he need to be).
    3. if he needs to get in , make room for him by decreasing all in one
        place. if he needs to get in 4 - we will move 4 to 5,5 to 6 , 6 out and
        insert him to 4.
    4. tell oScorer what his new place .
    5. if he is now number one, destroy the old visual effects and statue and
        create new one with the oScorer now.
*/

int calcuateMvp(object oScorer)
{
    int i;
    int scorer_score= GetLocalInt(oScorer,"kill_points")+ MVP_TEAM_POINT_VALUE * GetLocalInt(oScorer,"personalscore") ;
    string scorer_name=GetName(oScorer);
    object old_mvp=  getMvpObj(1);

    //1//
    deleteMvp(oScorer,GetName(oScorer));

    //2//
    i=MAX_MVP;
    while  ( (i>0)&& (scorer_score> getMvpScore(i))  )
    {
        i--;
    }
    //this check stops when scorer_score is less (or-equal) to the cuurent`s one score.
    //so if it stops at 4 , it means the the 4th mvp is better than him
    //and we should put him at 5.
    //the two side cases are when it stops at 0 - scorer will be number 1
    //and stops at MAX_MVP -scorer don`t even get in.

    //3//
    if (i==MAX_MVP)
        return 0; //scorer is a looser , aint even in the mvp list.
    //else - move all one spot twards the edge
    //if he needs to get in , make room for him by decreasing all in one
    //    place. if he needs to get in 4 - we will move 4 to 5,5 to 6 , 6 out and
    //    insert him to 4.
    int right_place=i+1; //this is the place he should be in

//    4   set 5th to be filled with  4th
//    5   set 6th to be the 5th
//    6   stop
//but we need to do it from the end -
//    6  set 6 to be 5
//    5  set 5 to be 4
//    4  stop

    for (i=MAX_MVP;i>right_place;i--)
    {
        setMvp(i,
               getMvpObj(i-1),
               getMvpScore(i-1),
               getMvpName(i-1)
              );
    }

    //now insert him to his right place please
      setMvp(right_place,oScorer,scorer_score,scorer_name);


//4//
    string string_place;
    if (right_place==1)
        string_place="1st";
    else if (right_place==2)
         string_place="2nd" ;
    else if (right_place==3)
         string_place="3rd";
    else string_place=IntToString(right_place)+"th";


    FloatingTextStringOnCreature(
        "You are now the " + string_place + " mvp",
        oScorer,
        FALSE); //dont broadcast to faction

//5//   1. if he was the old mvp - do nothing.
   //   2. if he is new, destroy the old mvp effects and put new on him
    if  (right_place==1)//&&(oScorer!=old_mvp) )
    {
        DestroyMvpEffects(old_mvp); //he is now only in the 2nd place
        if (old_mvp!=oScorer) {
          FloatingTextStringOnCreature(
          //"You just lost your mvp title to "+
          "The new MVP is:" +
          GetName(oScorer), old_mvp, FALSE); //dont broadcast to faction
        }
        CreateMvpEffects( oScorer);

        changeMvpStatues(oScorer);

        //check if we have to update the ultimative MvP
        UpdateUltimativeMvP();
    }



 return 0;
}

/* destroy the effects and put them on again , so oPC will not get multiple mvp
 * effects.
 */
void quickMvpCheck(object oPC)
{
 if (getMvpObj(1)==oPC)
 {
    DestroyMvpEffects(oPC);
    CreateMvpEffects(oPC);
 }
}


/* remove all effects BUT the mvp effects.
 Does it by removing ALL , and then if needed adds effect
*/
void RemovePcEffects(object oPC)
{
 effect e=GetFirstEffect(oPC);
 while (GetIsEffectValid(e))
 {
    RemoveEffect(oPC,e);
    e=GetNextEffect(oPC);
 }

 if (getMvpObj(1)==oPC)
     CreateMvpEffects(oPC);
}




void InitUltimativeMvP ()
{
    SetLocalString ( GetModule(), sUMvPName, GetCampaignString ( sUMvPDatabase, sUMvPName ) );
    SetLocalString ( GetModule(), sUMvPAccountName, GetCampaignString ( sUMvPDatabase, sUMvPAccountName ) );
    SetLocalInt ( GetModule(), sUMvPScore, GetCampaignInt ( sUMvPDatabase, sUMvPScore ) );
}

void UpdateUltimativeMvP ()
{
    //get MvP score of 1st MVP and compare to ultmative score
    int nMvPPoints = getMvpScore (1);
    if ( nMvPPoints > GetLocalInt ( GetModule (), sUMvPScore ) )
    {

        string sName = GetName ( getMvpObj (1) );
        string sAccount = GetPCPlayerName ( getMvpObj (1) );
        WriteTimestampedLogEntry ( "NWK_DEBUG: nwk_mvp - new UMVP " + sName + " (" + sAccount + ") Score: " + IntToString ( nMvPPoints ) );
        SetCampaignString ( sUMvPDatabase, sUMvPName, sName );
        SetCampaignString ( sUMvPDatabase, sUMvPAccountName, sAccount );
        SetCampaignInt ( sUMvPDatabase, sUMvPScore, nMvPPoints );
        SetLocalString ( GetModule(), sUMvPName, sName );
        SetLocalString ( GetModule(), sUMvPAccountName, sAccount );
        SetLocalInt ( GetModule(), sUMvPScore, nMvPPoints );

    }
}


