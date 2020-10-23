/*
    Transmogrifier by Forrestwolf
    Modified Nov 09, Vanya Mia to extend heads, add in appearance colours
    and provide option to avoid 1 or more changes according to NPC variables
    This tool will randomize a targeted NPC's head appearance, name, portrait, and phenotype.
    define variables; get activator, target, racial type, and gender.
*/
void main()
{
    int nHead;
    int nPort;
    int nFind;
    string sNewName;
    object oNPC = OBJECT_SELF;
    int nRace = GetRacialType(oNPC);
    int nGender = GetGender(oNPC);

    // Select name, portrait, and head possibilities based on race and gender.
    switch(nRace)
    {
        case (RACIAL_TYPE_HUMAN):
            if (nGender==GENDER_MALE)
            {
                sNewName = RandomName(NAME_FIRST_HUMAN_MALE);
                nPort = Random(35)+93;
                //find a head
                while (nFind != 1)
                {
                    nHead = Random(149)+1;
                    if (nHead > 49)
                        nHead = nHead + 50;
                    //eliminate unsuitable heads with hoods, veils, etc.
                    if ((nHead != 2) && (nHead != 31) && (nHead != 48) && (nHead != 103) && (nHead != 107)
                        && (nHead != 109) && (nHead != 113) && (nHead != 135) && (nHead != 143)
                        && (nHead != 144) && (nHead != 162) && (nHead != 163) && (nHead != 168)
                        && (nHead != 171) && (nHead != 178) && (nHead != 181) && (nHead != 187))
                            nFind = 1;
                }
            }
            else
            {
                sNewName = RandomName(NAME_FIRST_HUMAN_FEMALE);
                nPort = Random(25)+67;
                while (nFind != 1)
                {
                    nHead = Random(149)+1;
                    if (nHead > 49)
                        nHead = nHead + 50;
                    //eliminate unsuitable heads with hoods, veils, etc.
                    if ((nHead != 12) && (nHead != 33) && (nHead != 38) && (nHead != 118) && (nHead != 120)
                        && (nHead != 123) && (nHead != 131) && (nHead != 132) && (nHead != 143)
                        && (nHead != 150) && (nHead != 158) && (nHead != 159) && (nHead != 160)
                        && (nHead != 161) && (nHead != 164) && (nHead != 195))
                            nFind = 1;
                }
            }
            break;
        case (RACIAL_TYPE_HALFLING):
            if (nGender==GENDER_MALE)
            {
                sNewName = RandomName(NAME_FIRST_HALFLING_MALE);
                nPort = Random(6)+61;
                nHead = Random(10)+1;
            }
            else
            {
                sNewName = RandomName(NAME_FIRST_HALFLING_FEMALE);
                nPort = Random(6)+54;
                nHead = Random(11)+1;
            }
            break;
        case (RACIAL_TYPE_HALFELF):
            if (nGender==GENDER_MALE)
            {
                sNewName = RandomName(NAME_FIRST_HALFELF_MALE);
                nPort = Random(35)+93;
                nHead = Random(34)+1;
            }
            else
            {
                sNewName = RandomName(NAME_FIRST_HALFELF_FEMALE);
                nPort = Random(25)+67;
                nHead = Random(27)+1;
            }
            break;
        case (RACIAL_TYPE_HALFORC):
            if (nGender==GENDER_MALE)
            {
                sNewName = RandomName(NAME_FIRST_HALFORC_MALE);
                nPort = Random(6)+134;
                nHead = Random(13)+1;
            }
            else
            {
                sNewName = RandomName(NAME_FIRST_HALFORC_FEMALE);
                nPort = Random(4)+130;
                nHead = Random(12)+1;
            }
            break;
        case (RACIAL_TYPE_ELF):
            if (nGender==GENDER_MALE)
            {
                sNewName = RandomName(NAME_FIRST_ELF_MALE);
                nPort = Random(10)+31;
                nHead = Random(18)+1;
            }
            else
            {
                sNewName = RandomName(NAME_FIRST_ELF_FEMALE);
                nPort = Random(13)+18;
                nHead = Random(16)+1;
            }
            break;
        case (RACIAL_TYPE_GNOME):
            if (nGender==GENDER_MALE)
            {
                sNewName = RandomName(NAME_FIRST_GNOME_MALE);
                nPort = Random(7)+47;
                nHead = Random(13)+1;
            }
            else
            {
                sNewName = RandomName(NAME_FIRST_GNOME_FEMALE);
                nPort = Random(6)+41;
                nHead = Random(9)+1;
            }
            break;
        case (RACIAL_TYPE_DWARF):
            if (nGender==GENDER_MALE)
            {
                sNewName = RandomName(NAME_FIRST_DWARF_MALE);
                nPort = Random(9)+9;
                nHead = Random(13)+1;
            }
            else
            {
                sNewName = RandomName(NAME_FIRST_DWARF_FEMALE);
                nPort = Random(9)+1;
                nHead = Random(12)+1;
            }
            break;
        default: break;
    }

    if (GetLocalInt(oNPC,"notportrait")!=1)
    // Set portrait.
    SetPortraitId(oNPC, nPort);

    if (GetLocalInt(oNPC,"nothead")!=1)
    // Set head.
    SetCreatureBodyPart(CREATURE_PART_HEAD, nHead, oNPC);

    if (GetLocalInt(oNPC,"notcolours")!=1)
    {
        // Set skin colour
        SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(7));
        // Set hair colour
        int nColour = Random(24);
        // Reroll if grey to lower chance
        if ((nColour >= 16) && (nColour <=19)) nColour = Random(24);
        SetColor(oNPC, COLOR_CHANNEL_HAIR, nColour);
        // Set lip colour
        nColour = Random(4)+100;
        SetColor(oNPC, COLOR_CHANNEL_TATTOO_1, nColour);
        // Set eye colour
        nColour = Random(12) + 6;
        // Use or set to suitable colour then use
        switch (nColour)
        {
            case 8: nColour = nColour + 4; break;
            case 9: nColour = nColour + 4; break;
            case 10: nColour = nColour + 6; break;
            case 11: nColour = nColour + 6; break;
            case 12: nColour = nColour + 9; break;
            case 13: nColour = nColour + 9; break;
            case 14: nColour = nColour + 10; break;
            case 15: nColour = nColour + 10; break;
            case 16: nColour = nColour + 11; break;
            case 17: nColour = nColour + 11; break;
            default: break;
        }
        SetColor(oNPC, COLOR_CHANNEL_TATTOO_2, nColour);
    }

    if (GetLocalInt(oNPC,"notname")!=1)
    // Set name.
    SetName(oNPC, sNewName);

    // 20% chance of having a big phenotype (this is because I find builders/DM's do not use big phenotypes even half the time).
    if (d100()<20)
        SetPhenoType(PHENOTYPE_BIG, oNPC);

    if (GetLocalInt(oNPC,"notcloth")!=1)
    {
        // Get random clothing models
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
        object oChest = CreateItemOnObject("_mdrn_cl_base", oNPC);
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
}
