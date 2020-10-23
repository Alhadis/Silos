void main()
{
        // Transmogrifier by Forrestwolf
        // This tool will randomize a targeted NPC's head appearance, name, portrait, and phenotype.
        // define variables; get activator, target, racial type, and gender.
        int nHead;
        int nPort;
        string sNewName;
        object oNPC = GetItemActivatedTarget();

        int nChest = 105+Random(5);
        if (d10()< 6)
            nChest = 180+Random(6);
        int nPelvis = 101+Random(6);
        int nThigh = 104+Random(3);
        int nShin = 103+Random(7);
        int nFeet = 101+Random(6);
        int nBicep = 100+Random(10);
        int nForearm = 100+Random(10);
        // Create the base template
        object oChest = CreateItemOnObject("cloth100", oNPC);
        // Make each modification
        object oChest2 = CopyItemAndModify(oChest, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_TORSO, nChest);
        object oChest3 = CopyItemAndModify(oChest2, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_PELVIS, nPelvis);
        object oChest4 = CopyItemAndModify(oChest3, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LTHIGH, nThigh);
        object oChest5 = CopyItemAndModify(oChest4, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RTHIGH, nThigh);
        object oChest6 = CopyItemAndModify(oChest5, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RSHIN, nShin);
        object oChest7 = CopyItemAndModify(oChest6, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LSHIN, nShin);
        object oChest8 = CopyItemAndModify(oChest7, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOOT, nFeet);
        object oChest9 = CopyItemAndModify(oChest8, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOOT, nFeet);
        object oChest10 = CopyItemAndModify(oChest9, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LBICEP, nBicep);
        object oChest11 = CopyItemAndModify(oChest10, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RBICEP, nBicep);
        object oChest12 = CopyItemAndModify(oChest11, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOREARM, nForearm);
        object oChest13 = CopyItemAndModify(oChest12, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOREARM, nForearm);
        object oChest14 = CopyItemAndModify(oChest12, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_BELT, 0);
        int nColor1 = Random(64);
        int nColor2 = Random(64);
        int nColor3 = Random(64);
        object oChest15 = CopyItemAndModify(oChest14, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, nColor1);
        object oChest16 = CopyItemAndModify(oChest15, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, nColor1);
        object oChest17 = CopyItemAndModify(oChest16, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, nColor2);
        object oChest18 = CopyItemAndModify(oChest17, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, nColor2);
        object oChest19 = CopyItemAndModify(oChest18, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, nColor3);
         object oChest20 = CopyItemAndModify(oChest19, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, nColor3);
         // Clean up the duplicates
         DestroyObject(oChest);
         DestroyObject(oChest2);
         DestroyObject(oChest3);
         DestroyObject(oChest4);
         DestroyObject(oChest5);
         DestroyObject(oChest6);
         DestroyObject(oChest7);
         DestroyObject(oChest8);
         DestroyObject(oChest9);
         DestroyObject(oChest10);
         DestroyObject(oChest11);
         DestroyObject(oChest12);
         DestroyObject(oChest13);
         DestroyObject(oChest14);
         DestroyObject(oChest15);
         DestroyObject(oChest16);
         DestroyObject(oChest17);
         DestroyObject(oChest18);
         DestroyObject(oChest19);
         // Equip the final product
          AssignCommand(oNPC, ClearAllActions());
         AssignCommand(oNPC, ActionEquipItem(oChest20, INVENTORY_SLOT_CHEST));
}
