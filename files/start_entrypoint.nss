void main()
{
// NWTACTICS By Jhenne (tallonzek@hotmail.com)
// 07/07/02
// insert this script into a blank area. it will strip all items from the pc
// and set their exp to a specfic amount, 12th level in this case.
int xp_limit=1300000;
object oPC = GetEnteringObject();

int nGold = GetGold(oPC);
//object oCustoms = GetObjectByTag("customs");
location lEntry =GetLocation (GetObjectByTag("entry_point"));
//int nHasEntered=GetLocalInt(oPC, "entered");


   // empty the PC's Inventory
  //emptyPc(oPC);

   // Make the PC level as needed
   SetXP(oPC, xp_limit);


   // Set the PC's gold to zero. actually we are telling the
   // PC to destroy his gold. how evil :)
    AssignCommand ( oPC, TakeGoldFromCreature ( nGold, oPC, TRUE));


    // turn off his plot flag if it's on
   SetPlotFlag ( oPC, FALSE);

    // clear his team stats

    SetLocalInt(oPC, "kills", FALSE);
    SetLocalInt(oPC, "deaths", FALSE);
    SetLocalInt(oPC, "personalscore", FALSE);
    SetLocalInt(oPC, "HasGoal", FALSE);
    SetLocalInt(oPC, "BonusHP", 0);
    SetLocalInt(oPC,"darts",0);
    SetLocalInt(oPC,"throwing_axes",0);
    SetLocalInt(oPC,"shurikens",0);
    SetLocalInt(oPC,"arrows",0);
    ClearAllActions();

    SendMessageToPC (oPC, "You have been stripped of your gear to prevent cheating; new gear will be given to you by the 3 Officers in your sanctuary. All characters on this mod are level 20 and your level has been set to 20 as well.");
    // Give Rule and Kits Book
// }
}
