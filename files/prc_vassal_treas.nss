
#include "inc_item_props"
#include "prc_feat_const"
#include "prc_class_const"

void main()
{
    int nVassal = GetLevelByClass(CLASS_TYPE_VASSAL,OBJECT_SELF);
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST,OBJECT_SELF);
    object oPC = OBJECT_SELF;
    object oSkin = GetPCSkin(oPC);
    object oArmor4 = GetItemPossessedBy(OBJECT_SELF, "PlatinumArmor4");
    object oArmor6 = GetItemPossessedBy(OBJECT_SELF, "PlatinumArmor6");
    object oArmor8 = GetItemPossessedBy(OBJECT_SELF, "PlatinumArmor8");
    int bVassal = nVassal /2;
    
    // *Level 1
    if (nVassal==1)
    // *Give him the Platinum Armor+4
    {
    if ( GetLocalInt(OBJECT_SELF, "Level1") == 1) return ;
    if ( GetLocalInt(oSkin, "Level1") == 1) return ;
    
    CreateItemOnObject("Platinumarmor4", OBJECT_SELF, 1);
    SetLocalInt(OBJECT_SELF, "Level1", 1);
    SetLocalInt(oSkin, "Level1", 1);
    }

    // *Level 2
    if (nVassal==2)
    // *Shared Trove
    {
    if ( GetLocalInt(OBJECT_SELF, "Level2") == 1) return ;
    if ( GetLocalInt(oSkin, "Level2") == 1) return ;
    {
    GiveGoldToCreature(OBJECT_SELF, 20000);
    SetLocalInt( OBJECT_SELF, "Level2", 1);
    SetLocalInt( oSkin, "Level2", 1);
    }
    }


    // *Level 5
    if (nVassal==5)
    // *Shared Trove
    {
    if ( GetLocalInt(OBJECT_SELF, "Level5") == 1) return ;
    if ( GetLocalInt(oSkin, "Level5") == 1) return ;    
    {
    GiveGoldToCreature(OBJECT_SELF, 50000);
    SetLocalInt( OBJECT_SELF, "Level5", 1);
    SetLocalInt( oSkin, "Level5", 1);    
    }
    // *Platinum Armor +6
    DestroyObject(oArmor4, 0.0f);
    CreateItemOnObject("Platinumarmor6", OBJECT_SELF, 1);
    SetLocalInt( OBJECT_SELF, "Level5", 1);
    SetLocalInt( oSkin, "Level5", 1);    
    }
    
    // *Level 8
    if (nVassal==8)
    {
    // *Shared Trove
    if ( GetLocalInt(OBJECT_SELF, "Level8") == 1) return ;
    if ( GetLocalInt(oSkin, "Level8") == 1) return ;
    {
    GiveGoldToCreature(OBJECT_SELF, 80000);
    SetLocalInt( OBJECT_SELF, "Level8", 1);
    SetLocalInt( oSkin, "Level8", 1);
    }
    }

    // *Level 10
    if (nVassal==10)
    {
    // *platinum Armor +8
    if ( GetLocalInt(OBJECT_SELF, "Level10") == 1) return ;
    if ( GetLocalInt(oSkin, "Level10") == 1) return ;
    DestroyObject(oArmor6, 0.0f);
    CreateItemOnObject("Platinumarmor8", OBJECT_SELF, 1);
    SetLocalInt( OBJECT_SELF, "Level10", 1);
    SetLocalInt( oSkin, "Level10", 1);
    }
}
