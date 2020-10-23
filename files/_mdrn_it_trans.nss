void main()
{
        // Transmogrifier by Forrestwolf
        // This tool will randomize a targeted NPC's head appearance, name, portrait, and phenotype.
        // define variables; get activator, target, racial type, and gender.
        int nHead;
        int nPort;
        string sNewName;
        object oNPC = GetItemActivatedTarget();
        object oPC = GetItemActivator();
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
                    nHead = Random(34)+1;

                }
                else
                {
                    sNewName = RandomName(NAME_FIRST_HUMAN_FEMALE);
                    nPort = Random(25)+67;
                    nHead = Random(27)+1;
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

        // Set portrait.
        SetPortraitId(oNPC, nPort);

        // Set head.
        SetCreatureBodyPart(CREATURE_PART_HEAD, nHead, oNPC);

        // Set name.
        SetName(oNPC, sNewName);

        // 25% chance of having a big phenotype (this is because I find builders/DM's do not use big phenotypes even half the time).
        if (d100()<26)
            SetPhenoType(PHENOTYPE_BIG, oNPC);

}
