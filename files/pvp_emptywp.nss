void main()
{
object oPC = GetPCSpeaker();
object oEquip = GetFirstItemInInventory(oPC);

//empty throwings weapons
SetLocalInt(oPC,"darts",0);
SetLocalInt(oPC,"throwing_axes",0);
SetLocalInt(oPC,"shurikens",0);
//empty ranged ammo
SetLocalInt(oPC,"arrows",0);
SetLocalInt(oPC,"bolts",0);
SetLocalInt(oPC,"bullets",0);


// empty the PC's Inventory
 string  sTag;

  while(GetIsObjectValid(oEquip))
  {
    sTag = GetTag(oEquip);
    if (GetStringLeft(sTag,2)=="wp")
         DestroyObject(oEquip);

      oEquip = GetNextItemInInventory(oPC);
    }



    oEquip=GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
    sTag = GetTag(oEquip);
    if (GetStringLeft(sTag,2)=="wp")
         DestroyObject(oEquip);


   oEquip=GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
 sTag = GetTag(oEquip);
    if (GetStringLeft(sTag,2)=="wp")
         DestroyObject(oEquip);

  oEquip=GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
sTag = GetTag(oEquip);
    if (GetStringLeft(sTag,2)=="wp")
         DestroyObject(oEquip);



  oEquip=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
sTag = GetTag(oEquip);
    if (GetStringLeft(sTag,2)=="wp")
         DestroyObject(oEquip);



   oEquip=GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
sTag = GetTag(oEquip);
    if (GetStringLeft(sTag,2)=="wp")
         DestroyObject(oEquip);



   oEquip=GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);
sTag = GetTag(oEquip);
    if (GetStringLeft(sTag,2)=="wp")
         DestroyObject(oEquip);


}
/*
oEquip = GetItemPossessedBy (oPC, "GoodGreataxe");
DestroyObject(oEquip);
oEquip = GetItemPossessedBy (oPC, "SilverGreatAxe");
DestroyObject(oEquip);
*/
    //AssignCommand (oPC, ActionEquipItem (oEquip, INVENTORY_SLOT_RIGHTHAND));
      //oEquip = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

    //if (GetBaseItemType(oEquip)!=BASE_ITEM_CSLASHWEAPON)
    //    DestroyObject(oEquip);

