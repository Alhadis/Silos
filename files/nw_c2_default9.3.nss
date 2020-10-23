// This is alpha everyting in here is subject to and will change.

#include "x0_i0_anims"
#include "x0_i0_treasure"

#include "x2_inc_switches"
#include "x3_inc_skin"
#include "x2_i0_spells"

#include "lutes"
#include "ai_inc"

#include "mmp_lutes"
#include "inc_mmpaberr"
#include "inc_mmpmrbd"
#include "inc_mmpooze"

#include "inc_templates0"
#include "sd_lootsystem"
#include "oc_inc_spawn"

int iSocketedLootChance = 0;
int bMunchkin = FALSE;          // Set to TRUE if you want to use the munchkin (no monster upgrades)
int bOC = TRUE;                 // Set to TRUE if compiling for Official campaign
int bModifyArmorAndWeapons=TRUE;

#include "inc_uras"


void main()
{

    object sack = OBJECT_SELF;

///////////////////////////////////////////
// Hack for fLootModifier
///////////////////////////////////////////
    float fLootMod = 1.0;
    if(!GetLocalInt(GetModule(),"bUrasRunOnce"))
    {
        SetLocalInt(GetModule(),"bUrasRunOnce",1);
        if(bMunchkin == TRUE)
            fLootMod = 5.0;
        else if(GetLocalFloat(GetModule(),"fLootMod") == 0.0)
            fLootMod = 1.0;
        SetLocalFloat(GetModule(),"fLootMod",fLootMod);
    }



////////////////////////////////////////////
// AI behavior and templates
////////////////////////////////////////////
    if(bMunchkin == FALSE)
    {

        // templates
        int rt = GetRacialType(OBJECT_SELF);
        object oSkin = GetItemInSlot(INVENTORY_SLOT_CARMOUR);

///////////////////////////////
// fixes to OC creatures.
///////////////////////////////
        if(rt == RACIAL_TYPE_GIANT && FindSubString(GetTag(OBJECT_SELF),"OGRE")==-1)
            SetLocalInt(OBJECT_SELF,"bGiant",TRUE);

        if(rt == RACIAL_TYPE_GIANT && FindSubString(GetTag(OBJECT_SELF),"OGRE")!=-1)
            SetLocalInt(OBJECT_SELF,"bOgre",TRUE);

        if(FindSubString( GetTag(OBJECT_SELF), "TROLL") != -1)
            SetLocalInt(OBJECT_SELF,"bTroll",TRUE);


        // these are mainly to fix things in OC that won't overide.
        if(FindSubString( GetTag(OBJECT_SELF), "MINOGON") != -1)
        {

            object oSkin = GetItemInSlot(INVENTORY_SLOT_CARMOUR);
            itemproperty ip;

            if(!GetIsObjectValid(oSkin))
            {
                oSkin = CreateItemOnObject("mmp_baseskin");
                AssignCommand(OBJECT_SELF,SKIN_SupportEquipSkin(oSkin));
            }

            effect eF = EffectACIncrease(8);

            SetLocalInt(OBJECT_SELF,"DontUpgradeWeapons",1);
            ip = ItemPropertyRegeneration(10);
            IPSafeAddItemProperty(oSkin,ip);
            ip = ItemPropertyBonusSpellResistance(20);
            IPSafeAddItemProperty(oSkin,ip);
            SetLocalInt(OBJECT_SELF,"X2_L_NUMBER_OF_ATTACKS",2);
            SetLocalInt(OBJECT_SELF,"bForceLvlUp",1);
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_minogon");

        }
        if(FindSubString( GetTag(OBJECT_SELF), "HELMED_HORROR") != -1)
        {
            object oSkin = GetItemInSlot(INVENTORY_SLOT_CARMOUR);
            itemproperty ip;
            effect eF = EffectACIncrease(8);

            IPSafeAddItemProperty(oSkin,ip);
            ip = ItemPropertyBonusSpellResistance(20);
            IPSafeAddItemProperty(oSkin,ip);
            SetLocalInt(OBJECT_SELF,"X2_L_NUMBER_OF_ATTACKS",2);
            SetLocalInt(OBJECT_SELF,"bForceLvlUp",1);
        }
        if(FindSubString( GetTag(OBJECT_SELF), "GREYRENDER") != -1)
        {
            SetLocalInt(OBJECT_SELF,"X2_L_NUMBER_OF_ATTACKS",3);
            SetLocalInt(OBJECT_SELF,"bForceLvlUp",1);

            effect eF = EffectDamageResistance(DAMAGE_TYPE_SLASHING,50);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);
            eF = EffectDamageResistance(DAMAGE_TYPE_PIERCING,50);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);
            eF = EffectDamageResistance(DAMAGE_TYPE_BLUDGEONING,50);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);

            eF = EffectTemporaryHitpoints(d12(6));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);
        }
        if(FindSubString( GetTag(OBJECT_SELF), "GARGOYLE") != -1)
        {
            object oSkin = GetItemInSlot(INVENTORY_SLOT_CARMOUR);

            SetLocalInt(OBJECT_SELF,"X2_L_NUMBER_OF_ATTACKS",3);

            effect eF = EffectACIncrease(8);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);
            eF = EffectDamageReduction(50,1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);
            eF = EffectDamageResistance(DAMAGE_TYPE_SLASHING,50);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);
            eF = EffectDamageResistance(DAMAGE_TYPE_PIERCING,100);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eF,OBJECT_SELF);

            int nHD = GetHitDice(OBJECT_SELF);
            int nEnhance = nHD/5+1;
            object oCW;

            itemproperty ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            ip = ItemPropertyBonusSpellResistance(16);
            IPSafeAddItemProperty(oSkin,ip);

        }
        if(rt == RACIAL_TYPE_UNDEAD && FindSubString(GetTag(OBJECT_SELF),"GHOUL") != -1
            && FindSubString(GetTag(OBJECT_SELF),"GHAST") != -1)
        {
            int nHD = GetHitDice(OBJECT_SELF);
            int nEnhance = nHD/5+1;
            object oCW;

            itemproperty ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_PARALYZE_2,GetHitDice(OBJECT_SELF));
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

        }

//////////////////////////////////////
// Templates
//////////////////////////////////////


        if(d10() == 1  && GetStandardFactionReputation(STANDARD_FACTION_HOSTILE) > 10)
        {

            SetLocalInt(OBJECT_SELF,"bForceLvlUp",TRUE);



            // Goblinoids
            if( rt == RACIAL_TYPE_HUMANOID_GOBLINOID && IsMagicUser(OBJECT_SELF) && d20()==1)
            {
                int lvl = GetCharacterLevel(OBJECT_SELF);
                if(lvl == 1) SetLocalInt(OBJECT_SELF,"bPrestidigator",TRUE);
                else if(lvl < 3) SetLocalInt(OBJECT_SELF,"bEvoker",TRUE);
                else if(lvl < 5) SetLocalInt(OBJECT_SELF,"bConjurer",TRUE);
                else if(lvl < 7) SetLocalInt(OBJECT_SELF,"bTheurgist",TRUE);
                else if(lvl < 9) SetLocalInt(OBJECT_SELF,"bMagician",TRUE);
            }
            else if( rt == RACIAL_TYPE_HUMANOID_GOBLINOID  && d6() == 1)
            {
                SetLocalInt(OBJECT_SELF,"bGoblinTrickster",1);
            }
            else if( rt == RACIAL_TYPE_HUMANOID_GOBLINOID && d10() == 1 && IsCleric(OBJECT_SELF))
            {
                SetLocalInt(OBJECT_SELF,"bGoblinShaman",1);
            }
            else if( rt == RACIAL_TYPE_HUMANOID_GOBLINOID && d10() == 1 && (IsCleric(OBJECT_SELF) || IsMagicUser(OBJECT_SELF)))
            {
                SetLocalInt(OBJECT_SELF,"bGoblinPriest",1);
            }
            else if( rt == RACIAL_TYPE_HUMANOID_GOBLINOID  && d6() == 1 && FindSubString(GetTag(OBJECT_SELF),"HOBGOBLIN") != -1)
            {
                SetLocalInt(OBJECT_SELF,"bHobgoblinTrickster",1);
            }
            else if( rt == RACIAL_TYPE_HUMANOID_GOBLINOID && d10() == 1 && IsCleric(OBJECT_SELF) && FindSubString(GetTag(OBJECT_SELF),"HOBGOBLIN") != -1)
            {
                SetLocalInt(OBJECT_SELF,"bHobgoblinShaman",1);
            }


            // anything except undead, constructs and elementals.
            else if(    rt != RACIAL_TYPE_UNDEAD &&
                        rt != RACIAL_TYPE_CONSTRUCT &&
                        rt != RACIAL_TYPE_ELEMENTAL)
            {
                int n = Random(18);

                switch(n)
                {
                case 0: SetLocalInt(OBJECT_SELF,"bHalfFiend",TRUE); break;
                case 1: SetLocalInt(OBJECT_SELF,"bHalfAir",TRUE); break;
                case 2: SetLocalInt(OBJECT_SELF,"bHalfEarth",TRUE); break;
                case 3: SetLocalInt(OBJECT_SELF,"bHalfFire",TRUE); break;
                case 4: SetLocalInt(OBJECT_SELF,"bHalfWater",TRUE); break;
                case 5: SetLocalInt(OBJECT_SELF,"bOoze",TRUE); break;
                case 6: SetLocalInt(OBJECT_SELF,"bAberOoze",TRUE); break;
                case 7: SetLocalInt(OBJECT_SELF,"bAberration",TRUE); break;
                case 8: SetLocalInt(OBJECT_SELF,"bDemonic",TRUE); break;
                case 9: SetLocalInt(OBJECT_SELF,"bDemonicAberration",TRUE); break;
                case 10: SetLocalInt(OBJECT_SELF,"bAluDemon",TRUE); break;
                case 11: SetLocalInt(OBJECT_SELF,"bHalfTroll",TRUE); break;
                case 12: SetLocalInt(OBJECT_SELF,"bHalfGiant",TRUE); break;
                case 13: SetLocalInt(OBJECT_SELF,"bRegenerating",TRUE); break;
                case 14: SetLocalInt(OBJECT_SELF,"bLemorian",TRUE); break;
                case 15: SetLocalInt(OBJECT_SELF,"bBloodedOne",1); break;
                case 16: SetLocalInt(OBJECT_SELF,"bArachnoid",1); break;
                case 17: SetLocalInt(OBJECT_SELF,"bIceCreature",TRUE); break;
                case 18: SetLocalInt(OBJECT_SELF,"bHalfOgre",TRUE); break;
                }
            }
            // undead only.
            else if(rt == RACIAL_TYPE_UNDEAD)
            {

                if(IsMagicUser(OBJECT_SELF) || IsCleric(OBJECT_SELF))
                {
                    int n;
                    int i;
                    for(i = 0; i < 4+d4(); i++) CreateObject(OBJECT_TYPE_CREATURE,"nw_skeleton",GetLocation(OBJECT_SELF));

                }
                else if(FindSubString(GetTag(OBJECT_SELF),"SKELCHIEF") != -1)
                {
                    int n;
                    int i;
                    for(i = 0; i < 2+d4(); i++) CreateObject(OBJECT_TYPE_CREATURE,"nw_skelwarr01",GetLocation(OBJECT_SELF));
                }
                else if(FindSubString(GetTag(OBJECT_SELF),"ZOMBIEBOSS") != -1)
                {
                    int n;
                    int i;
                    for(i = 0; i < 2+d4(); i++) CreateObject(OBJECT_TYPE_CREATURE,"nw_zombwarr01",GetLocation(OBJECT_SELF));
                }

                switch(Random(15))
                {
                case 0: SetLocalInt(OBJECT_SELF,"bApostate",TRUE); break;
                case 1: SetLocalInt(OBJECT_SELF,"bHeretic",TRUE); break;
                case 2: SetLocalInt(OBJECT_SELF,"bFallen",TRUE); break;
                case 3: SetLocalInt(OBJECT_SELF,"bMorbid",TRUE); break;
                case 4: SetLocalInt(OBJECT_SELF,"bUnholy",TRUE); break;
                case 5: SetLocalInt(OBJECT_SELF,"bOoze",TRUE); break;
                case 6: SetLocalInt(OBJECT_SELF,"bAberOoze",TRUE); break;
                case 7: SetLocalInt(OBJECT_SELF,"bAberration",TRUE); break;
                case 8: SetLocalInt(OBJECT_SELF,"bDemonic",TRUE); break;
                case 9: SetLocalInt(OBJECT_SELF,"bDemonicAberration",TRUE); break;
                case 10: SetLocalInt(OBJECT_SELF,"bAbilityDrain", TRUE); break;
                case 11: SetLocalInt(OBJECT_SELF,"bLifeDrain", TRUE); break;
                case 12: SetLocalInt(OBJECT_SELF,"bWraithLife", TRUE); SetLocalInt(OBJECT_SELF,"X2_L_INCORPOREAL",1); break;
                case 13: SetLocalInt(OBJECT_SELF,"bSpectreLike", TRUE);SetLocalInt(OBJECT_SELF,"X2_L_INCORPOREAL",1); break;
                case 14: SetLocalInt(OBJECT_SELF,"bGhoulish",TRUE); break;
                case 15: SetLocalInt(OBJECT_SELF,"bIceCreature",TRUE); break;

                }
            }
        }
        if(d20() == 1 && GetStandardFactionReputation(STANDARD_FACTION_HOSTILE) > 10)
        {
            SetLocalInt(OBJECT_SELF,"bForceLvlUp",TRUE);
            IncreaseSizeTemplate();
        }


//////////////////////
// Templates and AI
//////////////////////

        // gives it at least a chance to use ability. If it is 0 (which most are) it can never use them in combat.
        effect eCon = EffectSkillIncrease(SKILL_CONCENTRATION,GetHitDice(OBJECT_SELF));
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eCon,OBJECT_SELF);

///////////////////////////////////////////////////////////////////////////
// stacking properties/traits
///////////////////////////////////////////////////////////////////////////
        if(GetLocalInt(OBJECT_SELF,"bRegenerating") == TRUE)
        {
            int nR = GetLocalInt(OBJECT_SELF,"nRegenerate");
            if(nR == 0) nR = d20();
            itemproperty ip = ItemPropertyRegeneration(nR);
            IPSafeAddItemProperty(oSkin,ip);
        }


////////////////////////////////////////////////////////////////////////////
// Race Traits/specific
////////////////////////////////////////////////////////////////////////////
        if(GetLocalInt(OBJECT_SELF,"bTroll") == TRUE)
        {
            itemproperty ip = ItemPropertyRegeneration(15);
            IPSafeAddItemProperty(oSkin,ip);
            effect eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,d4());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,d4());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

        }
        else if(GetLocalInt(OBJECT_SELF,"bGiant") == TRUE)
        {
            effect eEffect = EffectTemporaryHitpoints(d12(8));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,d4(2));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,d4(2));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            //SetName(OBJECT_SELF,"(Giant) " + GetName(OBJECT_SELF));
        }
        else if(GetLocalInt(OBJECT_SELF,"bOgre") == TRUE)
        {
            effect eEffect = EffectTemporaryHitpoints(d12(2));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,d3());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,d3());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            //SetName(OBJECT_SELF,"(Ogre) " + GetName(OBJECT_SELF));

        }

        else if(GetLocalInt(OBJECT_SELF,"bGoblinTrickster") == TRUE)
        {

            SetName(OBJECT_SELF,"(Goblin-Trickster) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_goblin");
        }
        else if(GetLocalInt(OBJECT_SELF,"bGoblinShaman") == TRUE)
        {
            SetName(OBJECT_SELF,"(Goblin-Shaman) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_gobshaman");
        }
        else if(GetLocalInt(OBJECT_SELF,"bGoblinPriest") == TRUE)
        {
            SetName(OBJECT_SELF,"(Priest-of-Maglubiyet) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_gobpriest");
        }
        else if(GetLocalInt(OBJECT_SELF,"bHoboblinTrickster") == TRUE)
        {

            SetName(OBJECT_SELF,"(Hobgoblin-Trickster) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_hobgoblintx");
        }
        else if(GetLocalInt(OBJECT_SELF,"bGoblinShaman") == TRUE)
        {
            SetName(OBJECT_SELF,"(Hobgoblin-Shaman) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_hobgobclr");
        }


////////////////////////////////////////////////////////////////////////////
// Templates
////////////////////////////////////////////////////////////////////////////

        // strange template I did for test, it is a half-spider thing made by drow.
        if(GetLocalInt(OBJECT_SELF,"bHalfTroll") == TRUE)
        {
            itemproperty ip = ItemPropertyRegeneration(5);
            IPSafeAddItemProperty(oSkin,ip);
            effect eEffect = EffectTemporaryHitpoints(d12(2));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,d4());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,d4());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            IncreaseSizeTemplate();
            SetName(OBJECT_SELF,"(Half-Troll) " + GetName(OBJECT_SELF));
        }
        else if(GetLocalInt(OBJECT_SELF,"bHalfGiant") == TRUE)
        {
            effect eEffect = EffectTemporaryHitpoints(d12(3));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,d4(2));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,d4());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            IncreaseSizeTemplate();
            SetName(OBJECT_SELF,"(Half-Giant) " + GetName(OBJECT_SELF));
        }
        else if(GetLocalInt(OBJECT_SELF,"bHalfOgre") == TRUE)
        {
            effect eEffect = EffectTemporaryHitpoints(d12());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,d3());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,d3());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            IncreaseSizeTemplate();
            SetName(OBJECT_SELF,"(Half-Ogre) " + GetName(OBJECT_SELF));

        }
        if(GetLocalInt(OBJECT_SELF,"bArachnoid") == TRUE)
        {
            effect eEffect;
            itemproperty ip;
            object oCW;
            int nHD = GetHitDice(OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect=EffectSkillIncrease(SKILL_HIDE,4); ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect=EffectSkillIncrease(SKILL_SPOT,6); ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            ip = ItemPropertyOnMonsterHitProperties(IP_CONST_ONHIT_ITEMPOISON,IP_CONST_POISON_1D2_STRDAMAGE);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            eEffect = EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            SetName(OBJECT_SELF,"(Arachnoid) " + GetName(OBJECT_SELF));
        }
        // Aberrations have weird powers because there aren't any models of gibbering mouther things.
        else if(GetLocalInt(OBJECT_SELF,"bAberTable") == TRUE || GetLocalInt(OBJECT_SELF,"bAberration") == TRUE)
        {
            int i;
            for(i = 0; i < GetHitDice(OBJECT_SELF); i++)
                MMP_AbberationTable(oSkin);

            object oBite = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            MMP_AbberationCW(oBite);
            object oClaw = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            MMP_AbberationCW(oBite);

            SetName(OBJECT_SELF,"(Aberration) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_aberration");
        }
        // undead that has ghoul like properties.
        else if(GetLocalInt(OBJECT_SELF,"bGhoulish")==TRUE)
        {
            int nHD = GetHitDice(OBJECT_SELF);
            int nEnhance = nHD/5+1;
            object oCW;

            itemproperty ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            // untested if this works.
            ip = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_PARALYZE_2,GetHitDice(OBJECT_SELF));
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);
            SetLocalInt(OBJECT_SELF,"X2_L_NUMBER_OF_ATTACKS",3);
        }

        else if(GetLocalInt(OBJECT_SELF,"bAbilityDrain") == TRUE)
        {

            int ability = Random(6);
            itemproperty ip =
                    ItemPropertyOnMonsterHitProperties(
                        IP_CONST_ONHIT_ABILITYDRAIN,
                        ability);

            object oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            int nD = d6();
            switch(nD)
            {
            case 1: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_CHARISMA", d6()); break;
            case 2: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_WISDOM", d6()); break;
            case 3: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_DEXTERITY", d6()); break;
            case 4: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_STRENGTH", d6()); break;
            case 5: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_CONSTITUTION", d6()); break;
            case 6: SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_INTELLIGENCE", d6()); break;
            }

            switch(nD)
            {
            case 1: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_CHARISMA", d6()); break;
            case 2: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_WISDOM", d6()); break;
            case 3: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_DEXTERITY", d6()); break;
            case 4: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_STRENGTH", d6()); break;
            case 5: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_CONSTITUTION", d6()); break;
            case 6: SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_INTELLIGENCE", d6()); break;
            }


            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
            SetName(OBJECT_SELF," (Ability-Draining) " + GetName(OBJECT_SELF));
        }

        else if(GetLocalInt(OBJECT_SELF,"bWraithLike") == TRUE)
        {

            int ability = Random(6);
            itemproperty ip =
                    ItemPropertyOnMonsterHitProperties(
                        IP_CONST_ONHIT_ABILITYDRAIN,
                        ability);

            object oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            SetLocalInt(OBJECT_SELF,"bPULSE_ABILITY_DRAIN_CONSTITUTION", d6());
            SetLocalInt(OBJECT_SELF,"bBOLT_ABILITY_DRAIN_CONSTITUTION", d6());



            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
            SetName(OBJECT_SELF," (Wraith-Like) " + GetName(OBJECT_SELF));
        }

        else if(GetLocalInt(OBJECT_SELF,"bLifeDrain") == TRUE)
        {
            int nHD = GetHitDice(OBJECT_SELF);
            int ability = nHD/5+1;
            itemproperty ip =
                    ItemPropertyOnMonsterHitProperties(
                        IP_CONST_ONHIT_LEVELDRAIN,
                        ability);

            object oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            SetLocalInt(OBJECT_SELF,"bPULSE_LEVEL_DRAIN", d6());
            SetLocalInt(OBJECT_SELF,"bBOLT_LEVEL_DRAIN", d6());

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
            SetName(OBJECT_SELF," (Life-Draining) " + GetName(OBJECT_SELF));
        }
        else if(GetLocalInt(OBJECT_SELF,"bSpectreLike") == TRUE)
        {
            int nHD = GetHitDice(OBJECT_SELF);
            int ability = nHD/5+1;
            itemproperty ip =
                    ItemPropertyOnMonsterHitProperties(
                        IP_CONST_ONHIT_LEVELDRAIN,
                        ability);

            object oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            SetLocalInt(OBJECT_SELF,"bPULSE_LEVEL_DRAIN", d6());
            SetLocalInt(OBJECT_SELF,"bBOLT_LEVEL_DRAIN", d6());

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
            SetName(OBJECT_SELF," (Spectral) " + GetName(OBJECT_SELF));

        }
        // it should have wings
        else if(GetLocalInt(OBJECT_SELF,"bLemorian") == TRUE)
        {
            effect eEffect;
            itemproperty ip;
            object oCW;
            int nHD = GetHitDice(OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            ip = ItemPropertyDarkvision();
            IPSafeAddItemProperty(oSkin,ip);

            int sr = 10 + nHD;
            if(sr > 35) sr = 35;
            eEffect = EffectSpellResistanceIncrease(sr);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectACIncrease(1,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_ACID,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_COLD,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            if( nHD >= 0 && nHD <= 11)
            {
                int nDR = nHD/5+1;
                if(nDR == 6) nDR = nDR+1;
                int nAmt = 5;
                eEffect = EffectDamageReduction(nAmt, nHD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            }


            if( nHD >= 12 && nHD <= 40)
            {
                int nDR = nHD/5+1;
                if(nDR == 6) nDR = nDR+1;
                int nAmt = 10;
                eEffect = EffectDamageReduction(nAmt, nHD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            }


            eEffect = EffectImmunity(IMMUNITY_TYPE_POISON);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            int nEnhance = nHD/5+1;

            ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);
            ip = ItemPropertyOnMonsterHitProperties(IP_CONST_ONHIT_ITEMPOISON,IP_CONST_POISON_1D2_STRDAMAGE);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            if(GetHitDice(OBJECT_SELF) >= 1) SetLocalInt(OBJECT_SELF,"bSPELL_SCARE",3);
            if(GetHitDice(OBJECT_SELF) >= 3) SetLocalInt(OBJECT_SELF,"bSPELL_CHARM_PERSON",3);
            if(GetHitDice(OBJECT_SELF) >= 5) SetLocalInt(OBJECT_SELF,"bSPELL_FEAR",1);
            if(GetHitDice(OBJECT_SELF) >= 7) SetLocalInt(OBJECT_SELF,"bSPELL_CHARM_MONSTER",3);
            if(GetHitDice(OBJECT_SELF) >= 9) SetLocalInt(OBJECT_SELF,"bSPELL_DOMINATE_PERSON",1);
            if(GetHitDice(OBJECT_SELF) >= 11) SetLocalInt(OBJECT_SELF,"bSPELL_MASS_CHARM_PERSON",1);
            if(GetHitDice(OBJECT_SELF) >= 13) SetLocalInt(OBJECT_SELF,"bSPELL_UNHOLY_AURA",1);
            if(GetHitDice(OBJECT_SELF) >= 15) SetLocalInt(OBJECT_SELF,"bSPELL_MASS_CHARM_MONSTER",1);
            if(GetHitDice(OBJECT_SELF) >= 17) SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_IX",1);
            if(GetHitDice(OBJECT_SELF) >= 19) SetLocalInt(OBJECT_SELF,"bSPELL_DOMINATE_MONSTER",1);

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
        }
        // weird template
        else if(GetLocalInt(OBJECT_SELF,"bOozeTable") == TRUE || GetLocalInt(OBJECT_SELF,"bOoze") == TRUE)
        {
            int i;
            for(i = 0; i < GetHitDice(OBJECT_SELF); i++) MMP_OozeTable(oSkin);
            if(d6()==1) MMPOOZE_EvardsBlackTentacles(oSkin);
            object oBite = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            MMP_AbberationCW(oBite);
            object oClaw = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            MMP_AbberationCW(oBite);
            SetName(OBJECT_SELF,"(Ooze) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_ooze");
        }
        // even weirder template
        else if(GetLocalInt(OBJECT_SELF,"bAberOozeTable") == TRUE || GetLocalInt(OBJECT_SELF,"bAberOoze") == TRUE)
        {
            int i;
            for(i = 0; i < GetHitDice(OBJECT_SELF)/2+1; i++) MMP_OozeTable(oSkin);
            for(i = 0; i < GetHitDice(OBJECT_SELF)/2+1; i++) MMP_AbberationTable(oSkin);
            if(d6()==1) MMPOOZE_EvardsBlackTentacles(oSkin);
            object oBite = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            MMP_AbberationCW(oBite);
            object oClaw = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            MMP_AbberationCW(oBite);
            SetName(OBJECT_SELF,"(Aberrant-Ooze) " + GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_aberooze");
        }

        // anything possessed or having demon powers
        else if(GetLocalInt(OBJECT_SELF,"bDemonicTable") == TRUE || GetLocalInt(OBJECT_SELF,"bDemonic") == TRUE)
        {
            effect eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            int nHD = GetHitDice(OBJECT_SELF);
            int nEnhance = nHD/5+1;
            object oCW;
            itemproperty ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            int nHDc = GetHitDice(OBJECT_SELF)/5+1;
            effect eDR = EffectDamageReduction(5,nHDc);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_ACID,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_FIRE,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_COLD,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

             // needs to enhance natural weapons
            int sR = 10+nHD;
            if(sR > 25) sR = 25;
            eDR = EffectSpellResistanceIncrease(sR);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_demonic");

        }

        // this was chaos-twisted. Anything which was twisted by power of chaos in the abyss.
        else if(GetLocalInt(OBJECT_SELF,"bAberDemonicTable") == TRUE ||
            GetLocalInt(OBJECT_SELF,"bDemonicAberration") == TRUE )
        {
            effect eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

             // needs to enhance natural weapons
            int nHDc = GetHitDice(OBJECT_SELF)/5+1;
            effect eDR = EffectDamageReduction(5,nHDc);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_ACID,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_FIRE,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_COLD,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            int nHD = GetHitDice(OBJECT_SELF);
            int nEnhance = nHD/5+1;
            object oCW;
            itemproperty ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

            int sR = 10+nHD;
            if(sR > 25) sR = 25;
            eDR = EffectSpellResistanceIncrease(sR);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_aludemon");
        }

        // it is twisted by chaos (aberration) and psionic
        else if(GetLocalInt(OBJECT_SELF,"bPsychicTable")==TRUE || GetLocalInt(OBJECT_SELF,"bPsychic")==TRUE)
        {

            int i;
            for(i = 0; i < GetHitDice(OBJECT_SELF); i++) MMP_AbberationTable(oSkin);
            if(d6()==1) MMPOOZE_EvardsBlackTentacles(oSkin);

            object oBite = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            MMP_AbberationCW(oBite);
            object oClaw = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            MMP_AbberationCW(oBite);


            int nPoints= GetHitDice(OBJECT_SELF);
            nPoints = nPoints + GetAbilityModifier(ABILITY_INTELLIGENCE);
            nPoints = nPoints + GetAbilityModifier(ABILITY_WISDOM);
            nPoints = nPoints + GetAbilityModifier(ABILITY_CHARISMA);
            SetLocalInt(OBJECT_SELF,"nPoints",nPoints);
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_psychic");
        }


        // has a succubus for a mom.
        else if(GetLocalInt(OBJECT_SELF,"bAluDemon") == TRUE  )
        {
            effect eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,6);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            int nHDc = GetHitDice(OBJECT_SELF)/5+1;
            effect eDR = EffectDamageReduction(5,nHDc);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            int nHD = GetHitDice(OBJECT_SELF);
            int nEnhance = nHD/5+1;
            object oCW;
            itemproperty ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);

\             // needs to enhance natural weapons
            eDR = EffectDamageResistance(DAMAGE_TYPE_ACID,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_FIRE,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectDamageResistance(DAMAGE_TYPE_COLD,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
        }
        // weird template.
        else if(GetLocalInt(OBJECT_SELF,"bPsionicTable") == TRUE || GetLocalInt(OBJECT_SELF,"bPsionic") == TRUE)
        {
            int nPoints = GetHitDice(OBJECT_SELF)
                + GetAbilityModifier(ABILITY_INTELLIGENCE)
                + GetAbilityModifier(ABILITY_WISDOM);
            SetLocalInt(OBJECT_SELF,"nPoints",nPoints*GetAbilityModifier(ABILITY_CHARISMA));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_psionic");
        }

        // part air elemental
        else if(GetLocalInt(OBJECT_SELF,"bHalfAir") == TRUE )
        {
            effect eEffect;
            eEffect = EffectAbilityIncrease(
                ABILITY_DEXTERITY,
                2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_WISDOM,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            // natural weapons can have cold, electrical, and sonic properties
            int nHD = GetHitDice(OBJECT_SELF);
            effect eDR;
            eDR = EffectACIncrease(1,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            eDR = EffectDamageImmunityIncrease(DAMAGE_TYPE_COLD,100);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectImmunity(IMMUNITY_TYPE_DISEASE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_halfair");

            SetName(OBJECT_SELF," (Half-Air Elemental) " + GetName(OBJECT_SELF));

        }
        else if(GetLocalInt(OBJECT_SELF,"bHalfEarth") == TRUE)
        {
            effect eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityDecrease(ABILITY_DEXTERITY,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);


            eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            // natural weapons can have bludeeon, stun properties

            int nHD = GetHitDice(OBJECT_SELF);
            effect eDR;
            eDR = EffectACIncrease(3,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            eDR = EffectImmunity(IMMUNITY_TYPE_DISEASE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_halfearth");


            SetName(OBJECT_SELF," (Half-Earth Elemental) " + GetName(OBJECT_SELF));

        }
        else if(GetLocalInt(OBJECT_SELF,"bHalfFire") == TRUE )
        {
            effect eEffect;

            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            // natural weapons have fire, can have aura of fire

            int nHD = GetHitDice(OBJECT_SELF);
            effect eDR;
            eDR = EffectACIncrease(1,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            eDR = EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE,100);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectImmunity(IMMUNITY_TYPE_DISEASE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);


            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_halffire");


            SetName(OBJECT_SELF," (Half-Fire Elemental) " + GetName(OBJECT_SELF));

        }
        else if(GetLocalInt(OBJECT_SELF,"bHalfWater") == TRUE)
        {
            effect eEffect;

            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_WISDOM,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_WISDOM,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            eEffect = EffectTemporaryHitpoints(d12(4));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            // natural weapons have poison, acid
            int nHD = GetHitDice(OBJECT_SELF);
            effect eDR;
            eDR = EffectACIncrease(1,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            eDR = EffectDamageImmunityIncrease(DAMAGE_TYPE_COLD,100);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectImmunity(IMMUNITY_TYPE_DISEASE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);
            eDR = EffectImmunity(IMMUNITY_TYPE_POISON);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDR,OBJECT_SELF);

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_halfwater");

            SetName(OBJECT_SELF," (Half-Water Elemental) " + GetName(OBJECT_SELF));

        }
        // should have wings
        else if(GetLocalInt(OBJECT_SELF,"bCelestial") == TRUE)
        {
            effect eEffect;
            itemproperty ip;
            int nHD = GetHitDice(OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_WISDOM,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectACIncrease(5,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_ACID,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_COLD,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            int sr = 10 + nHD;
            if(sr > 32) sr = 32;
            eEffect = EffectSpellResistanceIncrease(sr);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            int nEnhance = nHD/5+1;
            object oCW;
            ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);


            if( nHD >= 0 && nHD <= 11)
            {
                int nDR = nHD/5+1;
                if(nDR == 6) nDR = nDR+1;
                int nAmt = 5;
                eEffect = EffectDamageReduction(nAmt, nHD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            }


            if( nHD >= 12 && nHD <= 40)
            {
                int nDR = nHD/5+1;
                if(nDR == 6) nDR = nDR+1;
                int nAmt = 10;
                eEffect = EffectDamageReduction(nAmt, nHD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            }

            ip = ItemPropertyDarkvision(); IPSafeAddItemProperty(oSkin,ip);
            if(GetHitDice(OBJECT_SELF) >= 1) SetLocalInt(OBJECT_SELF,"bSPELL_BLESS",1);
            if(GetHitDice(OBJECT_SELF) >= 1) SetLocalInt(OBJECT_SELF,"bSPELL_LIGHT",-1);
            if(GetHitDice(OBJECT_SELF) >= 2) SetLocalInt(OBJECT_SELF,"bSPELL_PROTECTION_FROM_EVIL",3);
            if(GetHitDice(OBJECT_SELF) >= 3) SetLocalInt(OBJECT_SELF,"bSPELL_AID",1);
            if(GetHitDice(OBJECT_SELF) >= 5) SetLocalInt(OBJECT_SELF,"bSPELL_CURE_SERIOUS_WOUNDS",1);
            if(GetHitDice(OBJECT_SELF) >= 6) SetLocalInt(OBJECT_SELF,"bSPELL_REMOVE_DISEASE",1);
            if(GetHitDice(OBJECT_SELF) >= 15) SetLocalInt(OBJECT_SELF,"bSPELL_MASS_CHARM_MONSTER",1);
            if(GetHitDice(OBJECT_SELF) >= 17) SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_MONSTER_IX",1);
            if(GetHitDice(OBJECT_SELF) >= 19) SetLocalInt(OBJECT_SELF,"bSPELL_RESSURECTION",1);

            if(GetHitDice(OBJECT_SELF) > 7)
            {
                ip = ItemPropertyBonusFeat(FEAT_SMITE_EVIL);
                IPSafeAddItemProperty(oSkin,ip);
            }
            SetName(OBJECT_SELF,"(Half-Celestial) "+ GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
        }
        // should have wings I think
        else if(GetLocalInt(OBJECT_SELF,"bHalfFiend")==TRUE)
        {
            effect eEffect;
            itemproperty ip;
            int nHD = GetHitDice(OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CHARISMA,2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectACIncrease(5,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_ACID,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_COLD,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL,10);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            int sr = 10 + nHD;
            if(sr > 32) sr = 32;
            eEffect = EffectSpellResistanceIncrease(sr);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            int nEnhance = nHD/5+1;
            object oCW;
            ip = ItemPropertyEnhancementBonus(nEnhance);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);


            if( nHD >= 0 && nHD <= 11)
            {
                int nDR = nHD/5+1;
                if(nDR == 6) nDR = nDR+1;
                int nAmt = 5;
                eEffect = EffectDamageReduction(nAmt, nHD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            }


            if( nHD >= 12 && nHD <= 40)
            {
                int nDR = nHD/5+1;
                if(nDR == 6) nDR = nDR+1;
                int nAmt = 10;
                eEffect = EffectDamageReduction(nAmt, nHD);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            }


            eEffect = EffectImmunity(IMMUNITY_TYPE_POISON);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            ip = ItemPropertyDarkvision(); IPSafeAddItemProperty(oSkin,ip);
            if(GetHitDice(OBJECT_SELF) >  0) SetLocalInt(OBJECT_SELF,"bSPELL_DARKNESS",3);
            if(GetHitDice(OBJECT_SELF) >= 3) SetLocalInt(OBJECT_SELF,"bSPELL_BANE",1);
            if(GetHitDice(OBJECT_SELF) >= 3) SetLocalInt(OBJECT_SELF,"bSPELL_DOOM",1);
            if(GetHitDice(OBJECT_SELF) >= 7) SetLocalInt(OBJECT_SELF,"bSPELL_POISON",1);
            if(GetHitDice(OBJECT_SELF) >= 8) SetLocalInt(OBJECT_SELF,"bSPELL_CONTAGION",1);
            if(GetHitDice(OBJECT_SELF) >= 9) SetLocalInt(OBJECT_SELF,"bSPELL_CIRCLE_OF_DOOM",1);
            if(GetHitDice(OBJECT_SELF) >= 11) SetLocalInt(OBJECT_SELF,"bSPELL_UNHOLY_AURA",1);
            if(GetHitDice(OBJECT_SELF) >= 13) SetLocalInt(OBJECT_SELF,"bSPELL_MASS_CHARM_MONSTER",1);
            if(GetHitDice(OBJECT_SELF) >= 15) SetLocalInt(OBJECT_SELF,"bSPELL_HORRID_WILTING",1);
            if(GetHitDice(OBJECT_SELF) >= 17) SetLocalInt(OBJECT_SELF,"bSPELL_SUMMON_CREATURE_IX",1);
            if(GetHitDice(OBJECT_SELF) >= 19) SetLocalInt(OBJECT_SELF,"bSPELL_DESTRUCTION",1);

            if(GetHitDice(OBJECT_SELF) > 1)
            {
                ip = ItemPropertyBonusFeat(FEAT_SMITE_GOOD);
                IPSafeAddItemProperty(oSkin,ip);
            }

            SetName(OBJECT_SELF,"(Half-Fiend) "+ GetName(OBJECT_SELF));
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
        }
        // magical enhanced humanoid
        else if(GetLocalInt(OBJECT_SELF,"bBloodedOne") == TRUE)
        {
            effect eEffect;
            itemproperty ip;
            object oCW;
            int nHD = GetHitDice(OBJECT_SELF);

            eEffect = EffectAbilityIncrease(ABILITY_STRENGTH,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,4);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectACIncrease(2,AC_NATURAL_BONUS);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            if(GetHitDice(OBJECT_SELF) >= 1) SetLocalInt(OBJECT_SELF,"bSPELL_WAR_CRY",3);

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
            SetName(OBJECT_SELF,"(Blooded-One)"+ GetName(OBJECT_SELF));
        }

        // cold
        else if(GetLocalInt(OBJECT_SELF,"bIceCreature") == 1)
        {
            effect eEffect;
            itemproperty ip;
            object oCW;
            int nHD = GetHitDice(OBJECT_SELF);

            AssignCommand(OBJECT_SELF,ActionCastSpellAtObject(SPELLABILITY_AURA_COLD,OBJECT_SELF,TRUE,METAMAGIC_EXTEND));
            eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION,1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);
            eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE,1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);


            if(GetHitDice(OBJECT_SELF) >= 1) SetLocalInt(OBJECT_SELF,"bSPELL_RAY_OF_FROST",-1);
            if(GetHitDice(OBJECT_SELF) >= 3) SetLocalInt(OBJECT_SELF,"bSPELL_ICE_DAGGER",3);
            if(GetHitDice(OBJECT_SELF) >= 7) SetLocalInt(OBJECT_SELF,"bSPELL_CONE_OF_COLD",1);
            if(GetHitDice(OBJECT_SELF) >= 9) SetLocalInt(OBJECT_SELF,"bSPELL_ICE_STORM",1);
            if(GetHitDice(OBJECT_SELF) >= 5) SetLocalInt(OBJECT_SELF,"bCONE_OF_COLD",3);
            if(GetHitDice(OBJECT_SELF) >= 3) SetLocalInt(OBJECT_SELF,"bBOLT_OF_COLD",3);
            if(GetHitDice(OBJECT_SELF) >= 6) SetLocalInt(OBJECT_SELF,"bBOLT_OF_COLD",6);
            if(GetHitDice(OBJECT_SELF) >= 9) SetLocalInt(OBJECT_SELF,"bBOLT_OF_COLD",9);
            if(GetHitDice(OBJECT_SELF) >= 4) SetLocalInt(OBJECT_SELF,"bPULSE_COLD",1);
            if(GetHitDice(OBJECT_SELF) >= 6) SetLocalInt(OBJECT_SELF,"bPULSE_COLD",3);
            if(GetHitDice(OBJECT_SELF) >= 8) SetLocalInt(OBJECT_SELF,"bPULSE_COLD",5);

            ip = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD,GetHitDice(OBJECT_SELF)/2+1);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            IPSafeAddItemProperty(oCW,ip);
            oCW = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            IPSafeAddItemProperty(oCW,ip);


            eEffect = EffectDamageImmunityIncrease(DAMAGE_TYPE_COLD,100);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);


            eEffect = EffectDamageImmunityDecrease(DAMAGE_TYPE_FIRE,100);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,OBJECT_SELF);

            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_template");
            SetName(OBJECT_SELF,"(Ice-Creature)"+ GetName(OBJECT_SELF));
        }


        // generates some random mutated stats, but no powers.
        else if(GetStandardFactionReputation(STANDARD_FACTION_HOSTILE,OBJECT_SELF) > 50)
        {
            if(d10() == 1)
            {
                RandomTemplate();
                SetName(OBJECT_SELF,"(Mutant) " + GetName(OBJECT_SELF));
            }
        }
        // only enable this if you want totally random templates that often make little sense.
        //else if(GetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT")=="" && d10()==1)
        //    TemplateType();


        // spawn minions
        if(GetLocalInt(OBJECT_SELF,"bMinions")==TRUE)
        {
            ExecuteScript(GetLocalString(OBJECT_SELF,"sMinionScript"),OBJECT_SELF);
        }
        // spawn henchmen
        if(GetLocalInt(OBJECT_SELF,"bHenchmen")==TRUE)
        {
            ExecuteScript(GetLocalString(OBJECT_SELF,"sHenchmenScript"),OBJECT_SELF);
        }


        if(GetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT")=="")
        {

            if(GetIsFighter(OBJECT_SELF))
            {
                string s;
                switch(d8())
                {
                case 1: s = "x2_ai_attackweak"; break;
                case 2: s = "x2_ai_attackstr"; break;
                case 3: s = "x2_ai_atkspellc"; break;
                case 4: s = "x2_ai_atkvuln"; break;
                default: s = "";
                }
                SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT",s);
            }
            else if(GetIsMagicUser(OBJECT_SELF))
            {
                if(GetLocalInt(OBJECT_SELF,"bPrestidigator"))
                {
                    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_prestidiga");
                    SetName(OBJECT_SELF,"(Presitidator) "+ GetName(OBJECT_SELF));
                }
                else if(GetLocalInt(OBJECT_SELF,"bConjurer"))
                {
                    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_conjurer");
                    SetName(OBJECT_SELF,"(Conjurer) "+ GetName(OBJECT_SELF));
                }
                else if(GetLocalInt(OBJECT_SELF,"bEvoker"))
                {
                    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_evoker");
                    SetName(OBJECT_SELF,"(Evoker) "+ GetName(OBJECT_SELF));
                }
                else if(GetLocalInt(OBJECT_SELF,"bTheurgist"))
                {
                    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_theurgist");
                    SetName(OBJECT_SELF,"(Thurgist) "+ GetName(OBJECT_SELF));
                }
                else if(GetLocalInt(OBJECT_SELF,"bMagician"))
                {
                    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_magician");
                    SetName(OBJECT_SELF,"(Magician) "+ GetName(OBJECT_SELF));
                }

                else
                    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT","x2_ai_wizard");
            }

        }

        // I give all monsters a little regeneration so they will heal over time. It isn't enough to be very challenging.
        if(!GetLocalInt(OBJECT_SELF,"bRegenerating"))
        {
            // give all creatures regeneration so they slowly heal
            itemproperty ip = ItemPropertyRegeneration(1);
            IPSafeAddItemProperty(oSkin,ip);
        }

/////////////////////////////
// Default Bioware stuff
/////////////////////////////
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_SEARCH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_SEARCH);
    }

    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT_IMMOBILE) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    }

    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);
    }

    // ***** DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ***** //

    // * Goes through and sets up which shouts the NPC will listen to.
    // *
    SetListeningPatterns();

    // * Walk among a set of waypoints.
    // * 1. Find waypoints with the tag "WP_" + NPC TAG + "_##" and walk
    // *    among them in order.
    // * 2. If the tag of the Way Point is "POST_" + NPC TAG, stay there
    // *    and return to it after combat.
    //
    // * Optional Parameters:
    // * void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
    //
    // * If "NW_FLAG_DAY_NIGHT_POSTING" is set above, you can also
    // * create waypoints with the tags "WN_" + NPC Tag + "_##"
    // * and those will be walked at night. (The standard waypoints
    // * will be walked during the day.)
    // * The night "posting" waypoint tag is simply "NIGHT_" + NPC tag.
    WalkWayPoints();

    //* Create a small amount of treasure on the creature
    if ((GetLocalInt(GetModule(), "X2_L_NOTREASURE") == FALSE)  &&
        (GetLocalInt(OBJECT_SELF, "X2_L_NOTREASURE") == FALSE)   )
    {
        CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    }


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //

    // * If Incorporeal, apply changes
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) == TRUE)
    {
        effect eConceal = EffectConcealment(50, MISS_CHANCE_TYPE_NORMAL);
        eConceal = ExtraordinaryEffect(eConceal);
        effect eGhost = EffectCutsceneGhost();
        eGhost = ExtraordinaryEffect(eGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConceal, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);

    }

    // * Give the create a random name.
    // * If you create a script named x3_name_gen in your module, you can
    // * set the value of the variable X3_S_RANDOM_NAME on OBJECT_SELF inside
    // * the script to override the creature's default name.
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_RANDOMIZE_NAME) == TRUE)
    {

        ExecuteScript("x3_name_gen",OBJECT_SELF);
        string sName = GetLocalString(OBJECT_SELF,"X3_S_RANDOM_NAME");
        if ( sName == "" )
        {
            sName = RandomName();
        }
        SetName(OBJECT_SELF,sName);
    }


////////////////////////////////////////////////
// Treasure - note that talent AI can use this.
///////////////////////////////////////////////

    // the random generator in this game is not uniform at all.
    float fLootChance = 0.5* fLootMod;
    if(fLootChance == 0.0) fLootChance = 0.5;
    if(fLootChance < 0.0) fLootChance = 0.0;

    int dice = Random(10000);
    int iChance = FloatToInt(fLootChance*10000);

    if( (dice <= iChance) && (GetStandardFactionReputation(STANDARD_FACTION_HOSTILE) > 50) )
    {
        if(GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 3)
        {
            int class = GetClassByPosition(0,OBJECT_SELF);

            if(class == CLASS_TYPE_ASSASSIN) SetLocalInt(sack,"Assassin",TRUE);
            if(class == CLASS_TYPE_BARD) SetLocalInt(sack,"Bard",1);
            if(class == CLASS_TYPE_MONK) SetLocalInt(sack,"Monk",1);
            if(class == CLASS_TYPE_CLERIC) SetLocalInt(sack,"Cleric",1);
            if(class == CLASS_TYPE_FIGHTER)  SetLocalInt(sack,"Fighter",1);
            if(class == CLASS_TYPE_GIANT) SetLocalInt(sack,"Giant",1);
            if(class == CLASS_TYPE_ROGUE) SetLocalInt(sack,"Rogue",1);
            if(class == CLASS_TYPE_WIZARD) SetLocalInt(sack,"Wizard",1);
            if(class == CLASS_TYPE_DRUID) SetLocalInt(sack,"Druid",1);
            if(class == CLASS_TYPE_RANGER) SetLocalInt(sack,"Ranger",1);
            if(class == CLASS_TYPE_PALADIN) SetLocalInt(sack,"Paladin",1);
            if(class == CLASS_TYPE_DRAGON) SetLocalInt(sack,"Dragon",1);
            /*
            if(class == CLASS_TYPE_OUTSIDER) SetLocalInt(sack,"Outsider",1);
            if(class == CLASS_TYPE_ABERRATION) SetLocalInt(sack,"Abberation",1);
            if(class == CLASS_TYPE_UNDEAD) SetLocalInt(sack,"Undead",1);
            if(class == CLASS_TYPE_MAGICAL_BEAST) SetLocalInt(sack,"MagicalBeast",1);
            */
            int rt = GetRacialType(OBJECT_SELF);
            if( rt != RACIAL_TYPE_ANIMAL &&
                rt != RACIAL_TYPE_VERMIN &&
                rt != RACIAL_TYPE_BEAST &&
                rt != RACIAL_TYPE_CONSTRUCT &&
                rt != RACIAL_TYPE_OOZE &&
                rt != RACIAL_TYPE_UNDEAD)
            {
                //SendMessageToPC(GetFirstPC(),"Lutes");
                iChestLevel = GetCharacterLevel(OBJECT_SELF);
                dice = Random(10000);

                // it will just drop socket way too much no matter what I do.
                //if(dice <= iSocketedLootChance)
                //    sd_droploot(OBJECT_SELF,OBJECT_SELF);
                //else
                    Lutes(OBJECT_SELF);
            }
        }
    }

/////////////////////////
// Upgrade and Enhance
//////////////////////////
    if(!bMunchkin)
    {
        if( (GetLocalInt(GetModule(),"difficulty") >= 0 || GetLocalInt(OBJECT_SELF,"bForceLvlUp")==1) )
        {
            if(GetLocalInt(OBJECT_SELF,"bNeverLvlUp")==0)
            {
                EnhanceSkin();
                EnhanceItems();
                Upgrade();
            }
        }

        if( (GetIsMagicUser(OBJECT_SELF) || GetIsCleric(OBJECT_SELF)))
        {
            oObject = OBJECT_SELF;
            iChestLevel = GetCharacterLevel(OBJECT_SELF);
            PersonalSpellBook();
        }
    }

////////////////////////////////////
// Modify Armour and Weapons
////////////////////////////////////
    if(bModifyArmorAndWeapons == TRUE)
    {
        object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST);
        if(GetIsObjectValid(oArmor))
        {
            oArmor = ModifyArmor(oArmor);
            if(GetIsObjectValid(oArmor)) {
                ActionEquipItem(oArmor,INVENTORY_SLOT_CHEST);
                DelayCommand(0.1,ForceArmor(OBJECT_SELF,oArmor));
            }
        }

        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
        if(GetIsObjectValid(oWeapon) && FindSubString(GetTag(oWeapon),"nw_it_cre") == -1)
        {
            object oNew = ModifyWeapon(oWeapon);
            if(GetIsObjectValid(oNew))
                AssignCommand(OBJECT_SELF,ActionEquipItem(oNew,INVENTORY_SLOT_RIGHTHAND));
        }
        if(d20() == 1) IncreaseWeaponSize(oWeapon);

        oWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
        if(GetIsObjectValid(oWeapon))
        {
            if(GetMeleeWeapon(oWeapon))
            {
                oWeapon = ModifyWeapon(oWeapon);
                if(GetIsObjectValid(oWeapon))
                    AssignCommand(OBJECT_SELF,ActionEquipItem(oWeapon,INVENTORY_SLOT_LEFTHAND));
            }
            else if(GetBaseItemType(oWeapon) == BASE_ITEM_SMALLSHIELD ||
                    GetBaseItemType(oWeapon) == BASE_ITEM_LARGESHIELD ||
                    GetBaseItemType(oWeapon) == BASE_ITEM_TOWERSHIELD)
            {
                oWeapon = ModifyShield(oWeapon);
                if(GetIsObjectValid(oWeapon))
                    AssignCommand(OBJECT_SELF,ActionEquipItem(oWeapon,INVENTORY_SLOT_LEFTHAND));
            }

        }

    }



        SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY);
        SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);
        SetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT);
        SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);

    }


}


