//::///////////////////////////////////////////////
//:: [Vassal Feats]
//:: [prc_vassal.nss]
//:://////////////////////////////////////////////
//:: Check to see which Vassal of Bahamut lvls a creature
//:: has and apply the appropriate bonuses.
//:://////////////////////////////////////////////
//:: Created By: Zedium
//:: Created On: April 5, 2005
//:://////////////////////////////////////////////

#include "inc_item_props"
#include "prc_feat_const"
#include "prc_class_const"


void AddArmorOnhit(object oPC,int iEquip)
    {
    object oItem ;

    if (iEquip==2)
    {
        oItem=GetItemInSlot(INVENTORY_SLOT_CHEST,oPC);
        if ( GetLocalInt(oItem,"Dragonwrack"))
        return;

     if (GetBaseItemType(oItem)==BASE_ITEM_ARMOR)
        {
            AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,1),oItem);

            SetLocalInt(oItem,"Dragonwrack",1);
        }
    }
    else if (iEquip==1)
    {
        oItem=GetPCItemLastUnequipped();
        if (GetBaseItemType(oItem)!=BASE_ITEM_ARMOR) return;
            RemoveSpecificProperty(oItem,ITEM_PROPERTY_ONHITCASTSPELL,IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,0);
        DeleteLocalInt(oItem,"Dragonwrack");
    }
    else
    {
        oItem=GetItemInSlot(INVENTORY_SLOT_CHEST,oPC);
        if ( !GetLocalInt(oItem,"Dragonwrack")&& GetBaseItemType(oItem)==BASE_ITEM_ARMOR)
        {
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,1),oItem);
        SetLocalInt(oItem,"Dragonwrack",1);
    }
    }
    }

void DWRightWeap(object oPC,int iEquip)
{
  object oItem ;

  if (iEquip==2)
  {
     oItem=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
     if ( GetLocalInt(oItem,"DWright"))
         return;

     if (GetBaseItemType(oItem)!=BASE_ITEM_SMALLSHIELD || BASE_ITEM_TOWERSHIELD || BASE_ITEM_LARGESHIELD)
     {
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,1),oItem);

        SetLocalInt(oItem,"DWright",1);
     }
  }
  else if (iEquip==1)
  {
      oItem=GetPCItemLastUnequipped();
      if (GetBaseItemType(oItem)==BASE_ITEM_SMALLSHIELD || BASE_ITEM_TOWERSHIELD || BASE_ITEM_LARGESHIELD) return;
         RemoveSpecificProperty(oItem,ITEM_PROPERTY_ONHITCASTSPELL,IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,0);
      DeleteLocalInt(oItem,"DWright");
  }
   else
  {
     oItem=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
     if ( !GetLocalInt(oItem,"DWright")&& GetBaseItemType(oItem)!=BASE_ITEM_SMALLSHIELD || BASE_ITEM_TOWERSHIELD || BASE_ITEM_LARGESHIELD)
     {
       AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,1),oItem);
        SetLocalInt(oItem,"DWright",1);
     }
  }
  }

void DWLeftWeap(object oPC,int iEquip)
{
  object oItem ;

  if (iEquip==2)
  {
     oItem=GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
     if ( GetLocalInt(oItem,"DWleft"))
         return;

     if (GetBaseItemType(oItem)!=BASE_ITEM_SMALLSHIELD || BASE_ITEM_TOWERSHIELD || BASE_ITEM_LARGESHIELD)
     {
        AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,1),oItem);

        SetLocalInt(oItem,"DWleft",1);
     }
  }
  else if (iEquip==1)
  {
      oItem=GetPCItemLastUnequipped();
      if (GetBaseItemType(oItem)==BASE_ITEM_SMALLSHIELD || BASE_ITEM_TOWERSHIELD || BASE_ITEM_LARGESHIELD) return;
         RemoveSpecificProperty(oItem,ITEM_PROPERTY_ONHITCASTSPELL,IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,0);
      DeleteLocalInt(oItem,"DWleft");
  }
   else
  {
     oItem=GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
     if ( !GetLocalInt(oItem,"DWleft")&& GetBaseItemType(oItem)!=BASE_ITEM_SMALLSHIELD || BASE_ITEM_TOWERSHIELD || BASE_ITEM_LARGESHIELD)
     {
       AddItemProperty(DURATION_TYPE_PERMANENT,ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_UNIQUEPOWER,1),oItem);
        SetLocalInt(oItem,"DWleft",1);
     }
  }
  }

void ImperiousAura(object oPC ,object oSkin ,int iLevel)
{

   if(GetLocalInt(oSkin, "ImperiousAura") == iLevel) return;

    SetCompositeBonus(oSkin, "ImperiousAuraA", iLevel, ITEM_PROPERTY_SKILL_BONUS,SKILL_APPRAISE);
    SetCompositeBonus(oSkin, "ImperiousAuraP", iLevel, ITEM_PROPERTY_SKILL_BONUS,SKILL_PERFORM);
    SetCompositeBonus(oSkin, "ImperiousAuraPe", iLevel, ITEM_PROPERTY_SKILL_BONUS,SKILL_PERSUADE);
    SetCompositeBonus(oSkin, "ImperiousAuraT", iLevel, ITEM_PROPERTY_SKILL_BONUS,SKILL_TAUNT);
    SetCompositeBonus(oSkin, "ImperiousAuraB", iLevel, ITEM_PROPERTY_SKILL_BONUS,SKILL_BLUFF);
    SetCompositeBonus(oSkin, "ImperiousAuraI", iLevel, ITEM_PROPERTY_SKILL_BONUS,SKILL_INTIMIDATE);

}


void main()
{

    // *get the vassal's class level and his armors
    int nVassal = GetLevelByClass(CLASS_TYPE_VASSAL,OBJECT_SELF);
    object oArmor4 = GetItemPossessedBy(OBJECT_SELF, "Platinumarmor4");
    object oArmor6 = GetItemPossessedBy(OBJECT_SELF, "Platinumarmor6");
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST,OBJECT_SELF);
    object oPC = OBJECT_SELF;
    object oSkin = GetPCSkin(oPC);
    int bVassal = GetLevelByClass(CLASS_TYPE_VASSAL, OBJECT_SELF);

    //Imperious Aura
    if (bVassal>0) ImperiousAura(oPC, oSkin,bVassal);

    // *Level 1
    if (nVassal==1)
    // *Give him the Platinum Armor+4
    {
    if ( GetLocalInt(OBJECT_SELF, "Level1") == 1) return ;

    CreateItemOnObject("Platinumarmor4", OBJECT_SELF, 1);
    SetLocalInt(OBJECT_SELF, "Level1", 1);
    }

    // *Level 2
    if (nVassal==2)
    // *Shared Trove
    {
    if ( GetLocalInt(OBJECT_SELF, "Level2") == 1) return ;

    GiveGoldToCreature(OBJECT_SELF, 200000);
    SetLocalInt( OBJECT_SELF, "Level2", 1);
    }

    // *Level 4
    //Dragonwrack
    if (bVassal >= 4)
    {
        AddArmorOnhit( oPC,GetLocalInt(oPC,"ONEQUIP"));
        DWRightWeap( oPC,GetLocalInt(oPC,"ONEQUIP"));
        DWLeftWeap( oPC,GetLocalInt(oPC,"ONEQUIP"));
    }


    // *Level 5
    if (nVassal==5)
    // *Shared Trove
    {
    if ( GetLocalInt(OBJECT_SELF, "Level5") == 1) return ;

    GiveGoldToCreature(OBJECT_SELF, 50000);
    // *Platinum Armor +6
    DestroyObject(oArmor4, 0.0f);
    CreateItemOnObject("Platinumarmor6", OBJECT_SELF, 1);
    SetLocalInt( OBJECT_SELF, "Level5", 1);
    }

    // *Level 8
    if (nVassal==8)
    {
    // *Shared Trove
    GiveGoldToCreature(OBJECT_SELF, 80000);
    }

    // *Level 10
    if (nVassal==10)
    {
    // *platinum Armor +8
    if ( GetLocalInt(OBJECT_SELF, "Level10") == 1) return ;
    DestroyObject(oArmor6, 0.0f);
    CreateItemOnObject("Platinumarmor8", OBJECT_SELF, 1);
    SetLocalInt( OBJECT_SELF, "Level10", 1);
    }
}