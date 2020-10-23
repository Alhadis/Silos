#include "x2_inc_switches"
#include "d0_functions_inc"

void main()
{
    object oPC           = OBJECT_SELF;
    object oQuiver       = GetSpellCastItem();
    string sQuiverResRef = GetResRef(oQuiver);
    string sQuiverAmmo   = GetLocalString(oPC, D0_QUIVER_AMMO);
    int    nQuiverConfig = GetLocalInt(oPC, D0_QUIVER_CONFIG);
    object oQuiverItem;
    string sResRef;
    int    nLen, nBaseSlot;

    if(GetStringLeft(sQuiverResRef, 7) == "d0_bqui")
    {
        sResRef   = "d0_bolt_";
        nLen      = 8;
        nBaseSlot = INVENTORY_SLOT_BOLTS;
    }
    else if(GetStringLeft(sQuiverResRef, 9) == "d0_quiver")
    {
        sResRef   = "d0_arrow_";
        nLen      = 10;
        nBaseSlot = INVENTORY_SLOT_ARROWS;
    }
    else if(GetStringLeft(sQuiverResRef, 7) == "d0_kqui")
    {
        sResRef   = "d0_bullet_";
        nLen      = 8;
        nBaseSlot = INVENTORY_SLOT_BULLETS;
    }

    sResRef += GetStringRight(sQuiverResRef, GetStringLength(sQuiverResRef)-nLen);

    AdvDebug(oPC, "Quiver: "+sQuiverResRef);
    AdvDebug(oPC, "Arrow ResRef: "+sResRef);
    AdvDebug(oPC, "Using manual method: "+IntToString(nQuiverConfig));

    if(nQuiverConfig)
    {
        oQuiverItem = CreateItemOnObject(sResRef, oPC, 1000);
        DeleteLocalString(oPC, D0_QUIVER_AMMO);
        DeleteLocalObject(oPC, D0_QUIVER_AMMO);
    }
    else
    {
        // Selber Koecher 2-mal benutzt - deaktivierung
        if(sResRef == sQuiverAmmo)
        {
            FloatingTextStringOnCreature(ColorText("Automatischer Köcher deaktiviert!", nwcYellow), oPC, FALSE);
            DeleteLocalString(oPC, D0_QUIVER_AMMO);
            DeleteLocalObject(oPC, D0_QUIVER_AMMO);
        }
        // Anderer Koecher benutzt - wechsel
        else
        {
            FloatingTextStringOnCreature(ColorText("Automatischer Köcher gewechselt!", nwcYellow), oPC, FALSE);
            SetLocalString(oPC, D0_QUIVER_AMMO, sResRef);
            DeleteLocalObject(oPC, D0_QUIVER_AMMO);
            oQuiverItem = GetItemPossessedBy(oPC, sResRef);

            if(!GetIsObjectValid(oQuiverItem))
            oQuiverItem = CreateItemOnObject(sResRef, oPC, 1000);

            if(GetResRef(GetItemInSlot(nBaseSlot, oPC)) != sResRef)
            DelayCommand(0.5, ActionEquipItem(oQuiverItem, nBaseSlot));
        }
    }
}
