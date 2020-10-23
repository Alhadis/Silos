#include "heartward_inc"
#include "inc_item_props"
#include "Soul_inc"

void SetLocalsancty2(object oPC)
{
     object oItem=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
     int iType= GetBaseItemType(oItem);

     if (GetHasFeat(FEAT_HOLY_MARTIAL_STRIKE))
         return;

     switch (iType)
     {
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        case BASE_ITEM_ARROW:
          iType=GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
          break;
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LONGBOW:
          oItem=GetItemInSlot(INVENTORY_SLOT_ARROWS);
          break;
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
          oItem=GetItemInSlot(INVENTORY_SLOT_BOLTS);
          break;
        case BASE_ITEM_SLING:
          oItem=GetItemInSlot(INVENTORY_SLOT_BULLETS);
          break;
     }

     if (Sanctify_Feat(iType) &&  !GetLocalInt(oItem,"SanctMar"))
     {
       SetLocalInt(oItem,"SanctMar",1);
     }
     oItem=GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
     iType= GetBaseItemType(oItem);
     if (Sanctify_Feat(iType) &&  !GetLocalInt(oItem,"SanctMar"))
     {
        SetLocalInt(oItem,"SanctMar",1);
     }

}


void SetLocalFistRaziel(object oPC)
{
    object oItem=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
    int iType= GetBaseItemType(oItem);

     switch (iType)
     {
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        case BASE_ITEM_ARROW:
          iType=GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
          break;
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LONGBOW:
          oItem=GetItemInSlot(INVENTORY_SLOT_ARROWS);
          break;
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
          oItem=GetItemInSlot(INVENTORY_SLOT_BOLTS);
          break;
        case BASE_ITEM_SLING:
          oItem=GetItemInSlot(INVENTORY_SLOT_BULLETS);
          break;
     }

      SetLocalInt(oItem,"MartialStrik",1);

     oItem=GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
     iType= GetBaseItemType(oItem);
     SetLocalInt(oItem,"MartialStrik",1);


}

void SetLocalStormlord(object oPC)
{
   object oItem=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);

   if (GetBaseItemType(oItem)!=BASE_ITEM_SHORTSPEAR) return;
   if (GetLocalInt(oItem,"STShock")) return;

   if (GetHasFeat(FEAT_SHOCK_WEAPON,oPC)) SetLocalInt(oItem,"STShock",1);
   if (GetHasFeat(FEAT_THUNDER_WEAPON,oPC)) SetLocalInt(oItem,"STThund",1);
}

void main()
{
   object oPC=OBJECT_SELF;

   if (GetLevelByClass(CLASS_TYPE_STORMLORD,oPC)) SetLocalStormlord(oPC);
   SetLocalsancty2(oPC);
   if (GetLevelByClass(CLASS_TYPE_FISTRAZIEL,oPC)>9) SetLocalFistRaziel(oPC);
   if (GetHasFeat(FEAT_SHADOWDISCOPOR, oPC)) {SetLocalInt(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC),"ShaDiscorp",1);}




}
