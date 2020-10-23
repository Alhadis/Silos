/*
    _mdrn_ts_npcspwn
    Spawn in area NPCs at waypoint with tag of trigger.
    Type of NPC, number required, and number possible of the type are set as variables on calling trigger.
    NPCs can be made to attempt to sit in a chair with NW_CHAIR tag
    (Note large numbers will cause the sitting action to glitch and a long delay)
    NPCs will be ambient but whether or not NPCs will be mobile or not is set by variable Move on trigger.
    This version seeks to prevent duplicate resrefs being placed and may reduce the number placed accordingly
    A variable may be set on the calling trigger to ignore duplication.
*/

#include "global_const"

void main()
{
 object oArea = GetArea(OBJECT_SELF); //what area are we in
 int nDone = GetLocalInt(OBJECT_SELF,"Done"); //is it done
 int nNumNPCs  = GetLocalInt(OBJECT_SELF,"Num");  //how many do we want ideally
 int nNoDupe  = GetLocalInt(OBJECT_SELF,"NoDupe");  //do we care if they duplicate
 string sNPCType = GetLocalString(OBJECT_SELF,"Type"); //and of what type
 int nMax = GetLocalInt(OBJECT_SELF,"Max");  //how many blueprints there are for this type
 int nN = 0;     //NPC placement calculators and stores
 int nFound;
 int nAttempts;
 string sPlace;
 object oPlaced;

 //populate area with NPCs
    if ((sNPCType != "None") && (nDone != 1)) //check type chosen and not done
    {
        //stop trigger running again
        SetLocalInt(OBJECT_SELF,"Done",1);
        //check global value was found
        if (nMax == 0)
        {
            nNumNPCs = 0; //stop loop if not
        }
        while (nNumNPCs>0) //loop for number of NPCs needed
        {
            nAttempts = nMax; //set maximum number of attempts
            do  //look for unused NPC type
            {
                //generate random resref up to maximum (in constants) for each type
                nN = Random(nMax)+ 1;
                //work out NPC res ref
                if (nN < 10)
                {
                    sPlace = sNPCType + "0" + IntToString(nN);
                }
                else
                {
                    sPlace = sNPCType + IntToString(nN);
                }
                //check NPCs in area
                nFound = 0; //set to not found
                if (nNoDupe!=1)
                {
                    oPlaced = GetFirstObjectInArea(oArea);
                    while((GetIsObjectValid(oPlaced)) && (nFound != 1))
                    {
                        // Is resref the same as the one to place
                        if(GetResRef(oPlaced) == sPlace)
                        {
                            nFound = 1;
                        }
                        else
                        {
                            oPlaced = GetNextObjectInArea(oArea);
                        }
                    }
                }
                //decrement number of attempts left
                nAttempts = nAttempts - 1;
            } while ((nAttempts > 0) && (nFound == 1));
            //place NPC
            oPlaced=CreateObject(OBJECT_TYPE_CREATURE,sPlace,GetLocation(GetObjectByTag("WP_"+GetTag(OBJECT_SELF))));
            //GetNearestObjectByTag(sPlace,OBJECT_SELF,1);
            //Make raiseable
            ExecuteScript("npc_raise_death",oPlaced);
            //animate them
            if((GetIsObjectValid(oPlaced)) && (nFound != 1))
            {
                if (GetLocalInt(OBJECT_SELF,"Sit")==1)
                {
                    // turn off all animations
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT",0);
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT_IMMOBILE",0);
                    // remove any weapons
                    DelayCommand(0.1,AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPlaced))));
                    DelayCommand(0.2,AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPlaced))));
                    // call sitting script, with a delay to prevent NPCs trying to use the same chair and stalling
                    DelayCommand(0.5*IntToFloat(nNumNPCs),ExecuteScript("nw_c2_sitting",oPlaced));
                }
                else if (GetLocalInt(OBJECT_SELF,"Move")==1)
                {
                    // set them to move around not stand still and emote
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT",1);
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT_IMMOBILE",0);
                }
                else if (GetLocalInt(OBJECT_SELF,"NoEmote")==1)
                {
                    // set them to not move or emote at all
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT",0);
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT_IMMOBILE",0);
                }
                else
                {
                    // set the default option of standing still and emoting
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT_IMMOBILE",1);
                    SetLocalInt(oPlaced,"X2_L_SPAWN_USE_AMBIENT",0);
                }
                if (GetLocalString(OBJECT_SELF,"NewName")!="")
                {
                    SetName(oPlaced,GetLocalString(OBJECT_SELF,"NewName"));
                }
                if (GetLocalString(OBJECT_SELF,"Unequip")!="")
                {
                    if (GetLocalString(OBJECT_SELF,"Unequip")=="Left")
                        AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPlaced)));
                    if (GetLocalString(OBJECT_SELF,"Unequip")=="Right")
                        AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPlaced)));
                    if (GetLocalString(OBJECT_SELF,"Unequip")=="Hands")
                        AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPlaced)));
                        AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPlaced)));
                    if (GetLocalString(OBJECT_SELF,"Unequip")=="Chest")
                        AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_CHEST,oPlaced)));
                    if (GetLocalString(OBJECT_SELF,"Unequip")=="Head")
                        AssignCommand(oPlaced,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_HEAD,oPlaced)));
                }
            }
            //decrement number still to place
            nNumNPCs = nNumNPCs - 1;
        }
    }
}
