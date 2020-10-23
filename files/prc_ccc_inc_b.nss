#include "inc_utility"
#include "prc_ccc_inc"
#include "prc_ccc_inc_b"
#include "prc_ccc_inc_c"

//a choice has been made
//this records and moves to next stage
void ChoiceSelected(int nChoiceNo);

void ChoiceSelected(int nChoiceNo)
{
    int nStage  = GetStage(OBJECT_SELF);
    int nOrigStage;
    int nOffset = GetLocalInt(OBJECT_SELF, "ChoiceOffset");
    nChoiceNo += nOffset;

    int nRace = GetLocalInt(OBJECT_SELF, "Race");
    int nClass = GetLocalInt(OBJECT_SELF, "Class");
    int nSex = GetLocalInt(OBJECT_SELF, "Gender");
    int nStr = GetLocalInt(OBJECT_SELF, "Str");
    int nDex = GetLocalInt(OBJECT_SELF, "Dex");
    int nCon = GetLocalInt(OBJECT_SELF, "Con");
    int nInt = GetLocalInt(OBJECT_SELF, "Int");
    int nWis = GetLocalInt(OBJECT_SELF, "Wis");
    int nCha = GetLocalInt(OBJECT_SELF, "Cha");
    int nPoints = GetLocalInt(OBJECT_SELF, "Points");
    object oClone = GetLocalObject(OBJECT_SELF, "Clone");

    int nLevel = GetLocalInt(OBJECT_SELF, "Level");
    int nQTMCount;

    int i;
    string sFile;
    switch(nStage)
    {
        //simple stages
        case STAGE_INTRODUCTION:
            nStage++;
            break;
        case STAGE_GENDER:
            SetLocalInt(OBJECT_SELF, "Gender",
                GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_GENDER_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Gender");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
                nStage++;
            break;

        case STAGE_RACE:
            SetLocalInt(OBJECT_SELF, "Race",
                GetChoice(OBJECT_SELF));
            nStage++;
            DeleteLocalInt(OBJECT_SELF, "ChoiceOffset");
            break;
        case STAGE_RACE_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Race");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                SetLocalInt(OBJECT_SELF, "Appearance",
                    StringToInt(Get2DACache("racialtypes", "Appearance",
                        GetLocalInt(OBJECT_SELF, "Race"))));
                SetLocalInt(OBJECT_SELF, "Head", 1);
                //builder toggles
                if(nRace == RACIAL_TYPE_AVARIEL
                    && GetPRCSwitch(PRC_CONVOCC_AVARIEL_WINGS))
                    SetLocalInt(OBJECT_SELF, "Wings", 6);
                if(nRace == RACIAL_TYPE_FEYRI
                    && GetPRCSwitch(PRC_CONVOCC_FEYRI_WINGS))
                    SetLocalInt(OBJECT_SELF, "Wings", 3);
                if(nRace == RACIAL_TYPE_FEYRI
                    && GetPRCSwitch(PRC_CONVOCC_FEYRI_TAIL))
                    SetLocalInt(OBJECT_SELF, "Tail", 3);
                if(nRace == RACIAL_TYPE_RAKSHASA
                    && nSex == GENDER_FEMALE
                    && GetPRCSwitch(PRC_CONVOCC_RAKSHASHA_FEMALE_APPEARANCE))
                    SetLocalInt(OBJECT_SELF, "Appearance", APPEARANCE_TYPE_RAKSHASA_TIGER_FEMALE);
                if(nRace == RACIAL_TYPE_DRIDER
                    && nSex == GENDER_FEMALE
                    && GetPRCSwitch(PRC_CONVOCC_DRIDER_FEMALE_APPEARANCE))
                    SetLocalInt(OBJECT_SELF, "Appearance", APPEARANCE_TYPE_DRIDER_FEMALE);
                //make the clone
                MakeClone();
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
                    EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1),
                        GetLocation(OBJECT_SELF));
                //set tattoos to 1 so they show
                array_create(OBJECT_SELF, "Tattoo");
                for(i=1;i<=18;i++)
                {
                    array_set_int(OBJECT_SELF, "Tattoo",  i, 1);
                }
                DoCloneLetoscript();
                DoRotatingCamera();
                //racial bonuses
                AddRaceFeats(GetLocalInt(OBJECT_SELF, "Race"));
                //since 1.64 has broken PC specials, this is no longer needed
    //            AddRaceSpecials(GetLocalInt(OBJECT_SELF, "Race"));
                nStage++;
            }
            break;

        case STAGE_CLASS:
            SetLocalInt(OBJECT_SELF, "Class",
                GetChoice(OBJECT_SELF));
            nStage++;
            DeleteLocalInt(OBJECT_SELF, "ChoiceOffset");
            break;
        case STAGE_CLASS_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Class");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                //class bonuses
                array_create(OBJECT_SELF, "Feats");
                DoClassFeat(Get2DACache("classes", "FeatsTable",
                    GetLocalInt(OBJECT_SELF, "Class")));
                //Hit Points
                //levels 1 2 and 3 have max hit dice
                SetLocalInt(OBJECT_SELF, "HitPoints",
                    StringToInt(Get2DACache("classes", "HitDie",
                        GetLocalInt(OBJECT_SELF, "Class"))));
                nStage++;
            }
            break;

        //one option stages
        case STAGE_ALIGNMENT:
            switch(array_get_int(OBJECT_SELF, "ChoiceValue",nChoiceNo))
            {
                case 0: //lawful good
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 85);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 85);
                    break;
                case 1: //neutral good
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 50);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 85);
                    break;
                case 2: //chaotic good
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 15);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 85);
                    break;
                case 3: //lawful neutral
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 85);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 50);
                    break;
                case 4: //true neutral
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 50);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 50);
                    break;
                case 5: //chaotic neutral
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 15);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 50);
                    break;
                case 6: //lawful evil
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 85);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 15);
                    break;
                case 7: //neutral evil
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 50);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 15);
                    break;
                case 8: //chaotic evil
                    SetLocalInt(OBJECT_SELF, "LawfulChaotic", 15);
                    SetLocalInt(OBJECT_SELF, "GoodEvil", 15);
                    break;
            }
            nStage++;
            break;
        case STAGE_ALIGNMENT_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "LawfulChaotic");
                DeleteLocalInt(OBJECT_SELF, "GoodEvil");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;


        case STAGE_ABILITY:
            switch(GetChoice(OBJECT_SELF))
            {
                case ABILITY_STRENGTH:
                    nStr++;
                    SetLocalInt(OBJECT_SELF, "Str",nStr);
                    SetLocalInt(OBJECT_SELF, "Points", nPoints-GetCost(nStr));
                    break;
                case ABILITY_DEXTERITY:
                    nDex++;
                    SetLocalInt(OBJECT_SELF, "Dex",nDex);
                    SetLocalInt(OBJECT_SELF, "Points", nPoints-GetCost(nDex));
                    break;
                case ABILITY_CONSTITUTION:
                    nCon++;
                    SetLocalInt(OBJECT_SELF, "Con",nCon);
                    SetLocalInt(OBJECT_SELF, "Points", nPoints-GetCost(nCon));
                    break;
                case ABILITY_INTELLIGENCE:
                    nInt++;
                    SetLocalInt(OBJECT_SELF, "Int",nInt);
                    SetLocalInt(OBJECT_SELF, "Points", nPoints-GetCost(nInt));
                    break;
                case ABILITY_WISDOM:
                    nWis++;
                    SetLocalInt(OBJECT_SELF, "Wis",nWis);
                    SetLocalInt(OBJECT_SELF, "Points", nPoints-GetCost(nWis));
                    break;
                case ABILITY_CHARISMA:
                    nCha++;
                    SetLocalInt(OBJECT_SELF, "Cha",nCha);
                    SetLocalInt(OBJECT_SELF, "Points", nPoints-GetCost(nCha));
                    break;
            }
            if(GetLocalInt(OBJECT_SELF, "Points") == 0)
            {
                nStage++;
            }
            break;
        case STAGE_ABILITY_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Str");
                DeleteLocalInt(OBJECT_SELF, "Dex");
                DeleteLocalInt(OBJECT_SELF, "Con");
                DeleteLocalInt(OBJECT_SELF, "Int");
                DeleteLocalInt(OBJECT_SELF, "Wis");
                DeleteLocalInt(OBJECT_SELF, "Cha");
                DeleteLocalInt(OBJECT_SELF, "Points");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_SKILL:
            array_create(OBJECT_SELF, "Skills");
            if(GetChoice(OBJECT_SELF) == -2)
            {
                //save all remaining
                array_set_int(OBJECT_SELF, "Skills", -1,
                    array_get_int(OBJECT_SELF, "Skills", -1)+GetLocalInt(OBJECT_SELF, "Points"));
                SetLocalInt(OBJECT_SELF, "Points", 0);
                nStage++;
            }
            else
            {
                //increase the points in that skill
                array_set_int(OBJECT_SELF, "Skills", GetChoice(OBJECT_SELF),
                    array_get_int(OBJECT_SELF, "Skills", GetChoice(OBJECT_SELF))+1);
                //decrease points remaining
                if(TestStringAgainstPattern("**Cross**", array_get_string(OBJECT_SELF, "ChoiceTokens", nChoiceNo)))
                    nPoints -= 2 ;//cross class skill
                else
                    nPoints -= 1;//class
                SetLocalInt(OBJECT_SELF, "Points", nPoints);
                //check if finished
                if(nPoints <= 0)
                    nStage++;
                else //then recreate the tokens
                {
                    if(nPoints > 1)
                        SetupSkillToken(GetChoice(OBJECT_SELF), nChoiceNo);
                    else
                    {
                        for(i=0;i<array_get_size(OBJECT_SELF, "ChoiceValue");i++)
                        {
                            if(!SetupSkillToken(array_get_int(OBJECT_SELF, "ChoiceValue", i), i))
                                i--;
                        }
                    }
                }
    //          array_set_int(OBJECT_SELF, "StagesSetup", nStage, FALSE);
            }
            break;
        case STAGE_SKILL_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Points");
                DeleteLocalString(OBJECT_SELF, "Skills_-1");
                array_delete(OBJECT_SELF, "Skills");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_FEAT:
            SetLocalInt(OBJECT_SELF, "StartingFeat",
                GetChoice(OBJECT_SELF));
            nStage++;
            break;

        case STAGE_FEAT_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "StartingFeat");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                if(GetLocalInt(OBJECT_SELF, "StartingFeat") ==0)
                    array_set_int(OBJECT_SELF, "Feats",
                        array_get_size(OBJECT_SELF, "Feats"),
                            -1);
                else
                    array_set_int(OBJECT_SELF, "Feats",
                        array_get_size(OBJECT_SELF, "Feats"),
                            GetLocalInt(OBJECT_SELF, "StartingFeat"));
                //qtm shortcut
                nQTMCount = GetPRCSwitch(PRC_CONVOCC_BONUS_FEATS);
                for(i=0;i<array_get_size(OBJECT_SELF, "Feats");i++)
                {
                    if(array_get_int(OBJECT_SELF, "Feats", i) == FEAT_QUICK_TO_MASTER)
                        nQTMCount++;
                }
                nQTMCount -= GetLocalInt(OBJECT_SELF, "QTMFeat");
                if(nQTMCount)
                {
                    //flag QTMFeat as used
                    SetLocalInt(OBJECT_SELF, "QTMFeat", GetLocalInt(OBJECT_SELF, "QTMFeat")+1);
                    //force the list to regenerate
                    //alows for prerequisites being met
                    array_set_int(OBJECT_SELF, "StagesSetup", nStage, FALSE);
                    array_set_int(OBJECT_SELF, "StagesSetup", nStage-1, FALSE);
                    array_delete(OBJECT_SELF, "ChoiceValue");
                    array_delete(OBJECT_SELF, "ChoiceTokens");
                    //slide back 2 stages, so it can be set forward and still be reduced by 1
                    nStage--;
                    nStage--;
                }
                nStage++;
            }
            break;

        case STAGE_FAMILIAR:
            if(GetChoice(OBJECT_SELF) == -1)
                nStage++;//skip the check and domain2
            else
                SetLocalInt(OBJECT_SELF, "Familiar",
                    GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_FAMILIAR_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Familiar");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_ANIMALCOMP:
            if(GetChoice(OBJECT_SELF) == -1)
                nStage++;//skip the check and domain2
            else
                SetLocalInt(OBJECT_SELF, "AnimalCompanion",
                    GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_ANIMALCOMP_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "AnimalCompanion");
                nStage--;
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_DOMAIN1:
            if(GetChoice(OBJECT_SELF) == -1)
                nStage+=2;//skip the check and domain2
            else
                SetLocalInt(OBJECT_SELF, "Domain1",
                    GetChoice(OBJECT_SELF));
            nStage++;
            break;

        case STAGE_DOMAIN2:
            if(GetChoice(OBJECT_SELF) == -1)
                nStage++;//skip the check
            else
                SetLocalInt(OBJECT_SELF, "Domain2",
                    GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_DOMAIN_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Domain1");
                DeleteLocalInt(OBJECT_SELF, "Domain2");
                nStage--;
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                array_set_int(OBJECT_SELF, "Feats",
                   array_get_size(OBJECT_SELF, "Feats"),
                        StringToInt(Get2DACache("domains", "GrantedFeat",
                            GetLocalInt(OBJECT_SELF, "Domain1"))));
                array_set_int(OBJECT_SELF, "Feats",
                   array_get_size(OBJECT_SELF, "Feats"),
                        StringToInt(Get2DACache("domains", "GrantedFeat",
                            GetLocalInt(OBJECT_SELF, "Domain2"))));
                nStage++;
            }
            break;


        case STAGE_SPELLS:

            switch(nClass)
            {
                case CLASS_TYPE_WIZARD:
                    array_create(OBJECT_SELF, "SpellLvl1");
                    //add spell to array of selected ones
                    array_set_int(OBJECT_SELF, "SpellLvl1",
                        array_get_size(OBJECT_SELF, "SpellLvl1"),
                            GetChoice(OBJECT_SELF));
                    //remove spell from choices
                    for(i=nChoiceNo;i<array_get_size(OBJECT_SELF, "ChoiceValue");i++)
                        array_set_int(OBJECT_SELF, "ChoiceValue",i,  array_get_int(OBJECT_SELF, "ChoiceValue", i+1));
                    for(i=nChoiceNo;i<array_get_size(OBJECT_SELF, "ChoiceTokens");i++)
                        array_set_string(OBJECT_SELF, "ChoiceTokens",i, array_get_string(OBJECT_SELF, "ChoiceTokens",i+1));
                    array_shrink(OBJECT_SELF, "ChoiceValue", array_get_size(OBJECT_SELF, "ChoiceValue") -1);
                    array_shrink(OBJECT_SELF, "ChoiceTokens",array_get_size(OBJECT_SELF, "ChoiceTokens")-1);
                    //decrease the number of spells avaliable
                    SetLocalInt(OBJECT_SELF, "NumberOfSpells", GetLocalInt(OBJECT_SELF, "NumberOfSpells")-1);
                    //if that was the last spell, go to next stage
                    if(GetLocalInt(OBJECT_SELF, "NumberOfSpells")==0)
                        nStage++;
                    break;
                case CLASS_TYPE_SORCERER:
                    array_create(OBJECT_SELF, "SpellLvl1");
                    array_create(OBJECT_SELF, "SpellLvl0");
                    //add spell to array of selected ones
                    array_set_int(OBJECT_SELF, "SpellLvl"+IntToString(GetLocalInt(OBJECT_SELF, "CurrentSpellLevel")),
                        array_get_size(OBJECT_SELF, "SpellLvl"+IntToString(GetLocalInt(OBJECT_SELF, "CurrentSpellLevel"))),
                            GetChoice(OBJECT_SELF));
                    //remove spell from choices
                    for(i=nChoiceNo;i<array_get_size(OBJECT_SELF, "ChoiceValue");i++)
                        array_set_int(OBJECT_SELF, "ChoiceValue",i,  array_get_int(OBJECT_SELF, "ChoiceValue", i+1));
                    for(i=nChoiceNo;i<array_get_size(OBJECT_SELF, "ChoiceTokens");i++)
                        array_set_string(OBJECT_SELF, "ChoiceTokens",i, array_get_string(OBJECT_SELF, "ChoiceTokens",i+1));
                    array_shrink(OBJECT_SELF, "ChoiceValue", array_get_size(OBJECT_SELF, "ChoiceValue") -1);
                    array_shrink(OBJECT_SELF, "ChoiceTokens",array_get_size(OBJECT_SELF, "ChoiceTokens")-1);
                    //decrease the number of spells avaliable
                    SetLocalInt(OBJECT_SELF, "NumberOfSpells", GetLocalInt(OBJECT_SELF, "NumberOfSpells")-1);
                    //if that was the last spell, increase the level
                    if(GetLocalInt(OBJECT_SELF, "NumberOfSpells")==0)
                    {
                        //if there is another level to do
                        if(GetLocalInt(OBJECT_SELF, "CurrentSpellLevel") < StringToInt(Get2DACache("cls_spgn_sorc","NumSpellLevels" ,0))-1)
                        {
                            SetLocalInt(OBJECT_SELF, "CurrentSpellLevel", GetLocalInt(OBJECT_SELF, "CurrentSpellLevel")+1);
                            array_set_int(OBJECT_SELF, "StagesSetup", nStage, FALSE);
                            array_delete(OBJECT_SELF, "ChoiceValue");
                            array_delete(OBJECT_SELF, "ChoiceTokens");
                        }
                        else//otherwise do next stage
                            nStage++;
                    }
                    break;
                case CLASS_TYPE_BARD:
                    array_create(OBJECT_SELF, "SpellLvl0");
                    //add spell to array of selected ones
                    array_set_int(OBJECT_SELF, "SpellLvl"+IntToString(GetLocalInt(OBJECT_SELF, "CurrentSpellLevel")),
                        array_get_size(OBJECT_SELF, "SpellLvl"+IntToString(GetLocalInt(OBJECT_SELF, "CurrentSpellLevel"))),
                            GetChoice(OBJECT_SELF));
                    //remove spell from choices
                    for(i=nChoiceNo;i<array_get_size(OBJECT_SELF, "ChoiceValue");i++)
                        array_set_int(OBJECT_SELF, "ChoiceValue",i,  array_get_int(OBJECT_SELF, "ChoiceValue", i+1));
                    for(i=nChoiceNo;i<array_get_size(OBJECT_SELF, "ChoiceTokens");i++)
                        array_set_string(OBJECT_SELF, "ChoiceTokens",i, array_get_string(OBJECT_SELF, "ChoiceTokens",i+1));
                    array_shrink(OBJECT_SELF, "ChoiceValue", array_get_size(OBJECT_SELF, "ChoiceValue") -1);
                    array_shrink(OBJECT_SELF, "ChoiceTokens",array_get_size(OBJECT_SELF, "ChoiceTokens")-1);
                    //decrease the number of spells avaliable
                    SetLocalInt(OBJECT_SELF, "NumberOfSpells", GetLocalInt(OBJECT_SELF, "NumberOfSpells")-1);
                    //if that was the last spell, increase the level
                    if(GetLocalInt(OBJECT_SELF, "NumberOfSpells")==0)
                    {
                        //if there is another level to do
                        if(GetLocalInt(OBJECT_SELF, "CurrentSpellLevel") < StringToInt(Get2DACache("cls_spgn_bard","NumSpellLevels" ,0))-1)
                        {
                            SetLocalInt(OBJECT_SELF, "CurrentSpellLevel", GetLocalInt(OBJECT_SELF, "CurrentSpellLevel")+1);
                            array_set_int(OBJECT_SELF, "StagesSetup", nStage, FALSE);
                            array_delete(OBJECT_SELF, "ChoiceValue");
                            array_delete(OBJECT_SELF, "ChoiceTokens");
                        }
                        else//otherwise do next stage
                            nStage++;
                    }
                    break;
                default:
                    nStage++;
                    nStage++;//skip the check
                    break;
            }
            break;
        case STAGE_SPELLS_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                array_delete(OBJECT_SELF, "SpellLvl0");
                array_delete(OBJECT_SELF, "SpellLvl1");
                DeleteLocalInt(OBJECT_SELF, "NumberOfSpells");
                DeleteLocalInt(OBJECT_SELF, "CurrentSpellLevel");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_WIZ_SCHOOL:
            if(GetChoice(OBJECT_SELF) == -1)
                nStage++;//skip the check
            else
                SetLocalInt(OBJECT_SELF, "School",
                    GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_WIZ_SCHOOL_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "School");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_BONUS_FEAT:
            if(GetChoice(OBJECT_SELF) == -1)
                nStage++;//skip the check
            else
                SetLocalInt(OBJECT_SELF, "BonusFeat", GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_BONUS_FEAT_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "BonusFeat");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                array_set_int(OBJECT_SELF, "Feats",
                   array_get_size(OBJECT_SELF, "Feats")+1,
                        GetLocalInt(OBJECT_SELF, "BonusFeat"));
                SetLocalInt(OBJECT_SELF, "BonusFeatCount", GetLocalInt(OBJECT_SELF, "BonusFeatCount")+1);
                if(GetLocalInt(OBJECT_SELF, "BonusFeatCount") >= StringToInt(Get2DACache(Get2DACache("classes", "BonusFeatsTable", nClass),"Bonus",0)))
                {
                    nStage++;
                }
                else
                {
                    nStage--;
                    array_set_int(OBJECT_SELF, "StagesSetup", nStage, FALSE);
                    array_delete(OBJECT_SELF, "ChoiceValue");
                    array_delete(OBJECT_SELF, "ChoiceTokens");
                }
            }
            break;

        case STAGE_HAIR_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Hair");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_HEAD_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Head");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_PORTRAIT_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Portrait");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            else if(GetChoice(OBJECT_SELF) == 2)
            {
                ActionExamine(oClone);
                DelayCommand(1.0, ActionExamine(oClone));
                DelayCommand(2.0, ActionExamine(GetLocalObject(OBJECT_SELF, "Clone")));
            }
            break;
        case STAGE_SKIN_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Skin");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_TAIL_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Tail");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_WINGS_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Wings");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_APPEARANCE_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Appearance");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_SOUNDSET_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Soundset");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            else if(GetChoice(OBJECT_SELF) == 2)
            {
                PlayVoiceChat(0 ,GetLocalObject(OBJECT_SELF, "Clone"));
            }
            break;

        case STAGE_APPEARANCE:
            SetLocalInt(OBJECT_SELF, "Appearance",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_HAIR:
            SetLocalInt(OBJECT_SELF, "Hair",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_HEAD:
            SetLocalInt(OBJECT_SELF, "Head",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_PORTRAIT:
            SetLocalInt(OBJECT_SELF, "Portrait",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_SKIN:
            SetLocalInt(OBJECT_SELF, "Skin",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_SOUNDSET:
            SetLocalInt(OBJECT_SELF, "Soundset",
                GetChoice(OBJECT_SELF));
            DoCloneLetoscript();
            nStage++;
            break;
        case STAGE_TAIL:
            SetLocalInt(OBJECT_SELF, "Tail",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_WINGS:
            SetLocalInt(OBJECT_SELF, "Wings",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_TATTOOPART:
            if(GetChoice(OBJECT_SELF) == 0)
            {
                nStage++;
            }
            else
            {
                SwitchTattoo(GetChoice(OBJECT_SELF));
                DoCloneLetoscript();
            }
            break;
        case STAGE_TATTOOPART_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_TATTOOCOLOUR1:
            SetLocalInt(OBJECT_SELF, "TattooColour1",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_TATTOOCOLOUR1_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "TattooColor1");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;
        case STAGE_TATTOOCOLOUR2:
            SetLocalInt(OBJECT_SELF, "TattooColor2",
                GetChoice(OBJECT_SELF));
            nStage++;
            DoCloneLetoscript();
            break;
        case STAGE_TATTOOCOLOUR2_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "TattooColour2");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_RACIAL_ABILITY:
            SetLocalInt(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Ability",
                GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_RACIAL_ABILITY_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Ability");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_RACIAL_SKILL:
            array_create(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Skills");
            //increase the points in that skill
            array_set_int(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Skills", GetChoice(OBJECT_SELF),
                array_get_int(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Skills", GetChoice(OBJECT_SELF))+1);
            //decrease points remaining
            if(TestStringAgainstPattern("**Cross**", array_get_string(OBJECT_SELF, "ChoiceTokens", nChoiceNo)))
                nPoints -= 2 ;//cross class skill
            else
                nPoints -= 1;//class
            SetLocalInt(OBJECT_SELF, "Points", nPoints);
            //check if finished
            if(nPoints <= 0)
                nStage++;
            else //then recreate the tokens
            {
                if(nPoints > 1)
                    SetupSkillToken(GetChoice(OBJECT_SELF), nChoiceNo);
                else
                {
                    for(i=0;i<array_get_size(OBJECT_SELF, "ChoiceValue");i++)
                    {
                        if(!SetupSkillToken(array_get_int(OBJECT_SELF, "ChoiceValue", i), i))
                            i--;
                    }
                }
            }
            break;
        case STAGE_RACIAL_SKILL_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                DeleteLocalInt(OBJECT_SELF, "Points");
                array_delete(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Skills");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case STAGE_RACIAL_FEAT:
            SetLocalInt(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Feat",
                GetChoice(OBJECT_SELF));
            nStage++;
            break;
        case STAGE_RACIAL_FEAT_CHECK:
            if(GetChoice(OBJECT_SELF) == -1)
            {
                MarkStageNotSetUp(nStage, OBJECT_SELF);
                array_delete(OBJECT_SELF, "RaceLevel"+IntToString(nLevel)+"Feat");
                nStage--;
                array_delete(OBJECT_SELF, "ChoiceValue");
                array_delete(OBJECT_SELF, "ChoiceTokens");
                MarkStageNotSetUp(nStage, OBJECT_SELF);
            }
            else if(GetChoice(OBJECT_SELF) == 1)
            {
                nStage++;
            }
            break;

        case FINAL_STAGE:
            ExecuteScript("prc_ccc_make", OBJECT_SELF);
            break;
    }
    //check that the next stage is applicable
    if(nStage == STAGE_CLASS
        && GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
        && Get2DACache("ECL", "RaceClass", nRace)!= "")
    {
        nStage++;
        nStage++;//skip check too
        SetLocalInt(OBJECT_SELF, "Class", StringToInt(Get2DACache("ECL", "RaceClass", nRace)));
    }
    if(nStage == STAGE_BONUS_FEAT
        && StringToInt(Get2DACache(Get2DACache("Classes", "BonusFeatsTable", nClass), "Bonus", 0))<=0)
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_WIZ_SCHOOL
        && (nClass != CLASS_TYPE_WIZARD
            || GetPRCSwitch(PRC_PNP_SPELL_SCHOOLS)))
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_SPELLS
        && nClass != CLASS_TYPE_WIZARD
        && nClass != CLASS_TYPE_SORCERER
        && nClass != CLASS_TYPE_BARD)
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_FAMILIAR
        && ((nClass != CLASS_TYPE_WIZARD && nClass != CLASS_TYPE_SORCERER)
            || GetPRCSwitch(PRC_PNP_FAMILIARS))
        )
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_ANIMALCOMP
        && nClass != CLASS_TYPE_DRUID)
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_DOMAIN1
        && nClass != CLASS_TYPE_CLERIC)
    {
        nStage++;
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_APPEARANCE &&
        GetPRCSwitch(PRC_CONVOCC_DISALLOW_CUSTOMISE_MODEL))
    {
        nStage++;
        nStage++;
    }
    int bCanHaveWings;
    int bCanHaveTail;
    string sModelType = Get2DACache("appearance", "MODELTYPE", GetLocalInt(OBJECT_SELF, "Appearance"));
    if(sModelType == "P")
    {
        bCanHaveTail=TRUE;
        bCanHaveWings=TRUE;
    }
    else
    {
        if(TestStringAgainstPattern("**W**", sModelType))
            bCanHaveWings=TRUE;
        if(TestStringAgainstPattern("**T**", sModelType))
            bCanHaveTail=TRUE;
    }
    if(nStage == STAGE_SKIN
        && sModelType != "P")
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_HAIR
        && sModelType != "P")
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_WINGS
        && (GetPRCSwitch(PRC_CONVOCC_DISALLOW_CUSTOMISE_WINGS)
            || !bCanHaveWings))
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_TAIL
        && (GetPRCSwitch(PRC_CONVOCC_DISALLOW_CUSTOMISE_TAIL)
            || !bCanHaveTail))
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_SOUNDSET
        && GetPRCSwitch(PRC_CONVOCC_FORCE_KEEP_VOICESET))
    {
        SetLocalInt(OBJECT_SELF, "Soundset", -1);
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_PORTRAIT
        && GetPRCSwitch(PRC_CONVOCC_FORCE_KEEP_PORTRAIT))
    {
        SetLocalInt(OBJECT_SELF, "Portrait", -1);
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_HEAD
        && sModelType != "P")
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_TATTOOCOLOUR1
        && sModelType != "P")
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_TATTOOCOLOUR2
        && sModelType != "P")
    {
        nStage++;
        nStage++;
    }
    if(nStage == STAGE_TATTOOPART
        && sModelType != "P")
    {
        nStage++;
        nStage++;
    }
        //RACIAL_HITDICE IS DISABLED
    if(nStage == STAGE_RACIAL_ABILITY
        && (!GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
            || Get2DACache("ECL", "RaceClass", nRace)== ""))
    {
        nStage++;
        nStage++;
        nStage++;
        nStage++;
        nStage++;
        nStage++;
    }
    else
    {
        //RACIAL_HITDICE IS ENABLED
        if(nStage >= STAGE_RACIAL_ABILITY
            && GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
            && nLevel == 0
            && Get2DACache("ECL", "RaceClass", nRace) != "")
            nLevel = 1;

//        WriteTimestampedLogEntry("2da RaceClass is "+Get2DACache("ECL", "RaceClass", nRace));
//        WriteTimestampedLogEntry("2da RaceHD is "+Get2DACache("ECL", "RaceHD", nRace));
//        WriteTimestampedLogEntry("nStage is "+IntToString(nStage));
//        WriteTimestampedLogEntry("ENABLE_RACIAL_HITDICE is "+IntToString(GetLocalInt(GetModule(), "ENABLE_RACIAL_HITDICE")));
//        WriteTimestampedLogEntry("nLevel is "+IntToString(nLevel));

        if(nStage == STAGE_RACIAL_ABILITY
            && GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
            && (nLevel != 3 && nLevel != 7 && nLevel != 11 && nLevel != 15
                && nLevel != 19 && nLevel != 23 && nLevel != 27 && nLevel != 31
                && nLevel != 35 && nLevel != 39))
        {
            nStage++;
            nStage++;
        }
        if(nStage == STAGE_RACIAL_FEAT
            && GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
            && (nLevel != 3 && nLevel != 5 && nLevel != 8 && nLevel != 11
                && nLevel != 14 && nLevel != 17 && nLevel != 20 && nLevel != 23
                && nLevel != 26 && nLevel != 29 && nLevel != 32 && nLevel != 35
                && nLevel != 38 ))
        {
            nStage++;
            nStage++;
        }
        if(nStage >= FINAL_STAGE //this has to go here to be set forward properly
            && GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
            && nLevel < StringToInt(Get2DACache("ECL", "RaceHD", nRace)))
        {
            nLevel++;
            nStage = STAGE_RACIAL_ABILITY;
            array_set_int(OBJECT_SELF, "StagesSetup", STAGE_RACIAL_ABILITY,FALSE);
            array_set_int(OBJECT_SELF, "StagesSetup", STAGE_RACIAL_ABILITY_CHECK,FALSE);
            array_set_int(OBJECT_SELF, "StagesSetup", STAGE_RACIAL_FEAT,FALSE);
            array_set_int(OBJECT_SELF, "StagesSetup", STAGE_RACIAL_FEAT_CHECK,FALSE);
            array_set_int(OBJECT_SELF, "StagesSetup", STAGE_RACIAL_SKILL,FALSE);
            array_set_int(OBJECT_SELF, "StagesSetup", STAGE_RACIAL_SKILL_CHECK,FALSE);
            if(nStage == STAGE_RACIAL_ABILITY
                && GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
                && (nLevel != 3 && nLevel != 7 && nLevel != 11 && nLevel != 15
                    && nLevel != 19 && nLevel != 23 && nLevel != 27 && nLevel != 31
                    && nLevel != 35 && nLevel != 39))
            {
                nStage++;
                nStage++;
            }
            if(nStage == STAGE_RACIAL_FEAT
                && GetPRCSwitch(PRC_CONVOCC_ENABLE_RACIAL_HITDICE)
                && (nLevel != 3 && nLevel != 5 && nLevel != 8 && nLevel != 11
                    && nLevel != 14 && nLevel != 17 && nLevel != 20 && nLevel != 23
                    && nLevel != 26 && nLevel != 29 && nLevel != 32 && nLevel != 35
                    && nLevel != 38 ))
            {
                nStage++;
                nStage++;
            }
        }
    }
    SetLocalInt(OBJECT_SELF, "Stage", nStage);
    SetStage(nStage, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "Level", nLevel);
}
