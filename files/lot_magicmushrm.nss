#include "x0_i0_position"
#include "x0_i0_match"
#include "x2_inc_itemprop"

// Custom Glowing Mushroom Script needed - Mushroom should only do this once per mushroom random effect:
// for shrooms on Maze Area 2: https://steamuserimages-a.akamaihd.net/ugc/1475445820089242044/8641BAB874C8FAFF0E12CDE6ECF27B00E142BF1F/
// EFFECTS OF MUSHROOMS (LIKE RUSSIAN ROULLETTE)
// 1) Immediately causes blindness to the PC
// 2) Raises strength permanently by 1 point
// 3) Raises charisma permanently by 1 point
// 4) Raises wisdom permanently by 1 point
// 5) Raises intelligence permanently by 1 point
// 6) Raises dexterity permanently by 1 point
// 7) Causes PC to become invisible for a while
// 8) Lowers strength permanently by 1 point
// 9) Lowers charisma permanently by 1 point
// 10) Lowers wisdom permanently by 1 point
// 11) Lowers intelligence permanently by 1 point
// 12) Lowers dexterity permanently by 1 point
// 13) PC Is poisoned
// 14) Add a random gemstone to PC's inventory worth approx. 1000GP
// 15) Gives +1 to primary weapon
// 16) Heals all lost hitpoints and cures all dieseases / poisons / negative effects of the PC
// 17) Makes the PC into a complete idiot for a while (temporary incapacitating intelligence loss)
// 18) Adds +5 - +10 HP to the PC permanently
// 19) Causes Narcolepsy temporarily to the PC for 5 minutes
// 20) PC Pukes (Can use script for fishguts barrel that makes you puke)

void DoMushroomEffect();
void Puke();
void Narcolepsy();

void main()
{
    int iPiecesEaten = GetLocalInt(OBJECT_SELF, "PIECES_EATEN");

    if(iPiecesEaten < 6)
    {
        DoMushroomEffect();
        SetLocalInt(OBJECT_SELF, "PIECES_EATEN", iPiecesEaten+1);
        if(iPiecesEaten == 0) //This is first piece eaten.
        {
            SetLocalInt(OBJECT_SELF, "DAY_EATEN", GetCalendarDay());
            SetLocalInt(OBJECT_SELF, "MONTH_EATEN", GetCalendarMonth());
            SetLocalInt(OBJECT_SELF, "YEAR_EATEN", GetCalendarYear());
        }
    }
}

void DoMushroomEffect(){

    int iEffect = d20();
    object oPC = GetLastUsedBy();

    //Bad Effects
    effect eBlindness = EffectBlindness();
    effect eSTRDec = SupernaturalEffect(EffectAbilityDecrease(ABILITY_STRENGTH, 1));
    effect eCHADec = SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 1));
    effect eWISDec = SupernaturalEffect(EffectAbilityDecrease(ABILITY_WISDOM, 1));
    effect eINTDec = SupernaturalEffect(EffectAbilityDecrease(ABILITY_INTELLIGENCE, 1));
    effect eDEXDec = SupernaturalEffect(EffectAbilityDecrease(ABILITY_DEXTERITY, 1));
    effect ePosion = EffectPoison(POISON_STRIPED_TOADSTOOL);
    effect eIdiot = EffectAbilityDecrease(ABILITY_INTELLIGENCE, 10); //Temp for 5 mins
    //effect eNarco = EffectSleep(); //Force player to fall asleep randomly for the next 5 mins.
    //effect ePuke = EffectVisualEffect(VFX_COM_CHUNK_GREEN_SMALL); //Player pukes

    effect eVisAbilityDec = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);

    //Good Effects
    effect eSTRInc = SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 1));
    effect eCHAInc = SupernaturalEffect(EffectAbilityIncrease(ABILITY_CHARISMA, 1));
    effect eWISInc = SupernaturalEffect(EffectAbilityIncrease(ABILITY_WISDOM, 1));
    effect eINTInc = SupernaturalEffect(EffectAbilityIncrease(ABILITY_INTELLIGENCE, 1));
    effect eDEXInc = SupernaturalEffect(EffectAbilityIncrease(ABILITY_DEXTERITY, 1));
    effect eInvis = EffectInvisibility(INVISIBILITY_TYPE_IMPROVED);
    //cleric heal
    itemproperty ipEnhanceBonus; //+1 to weapon
    effect eTempHP = EffectTemporaryHitpoints(4 + d6());
    int iRandGem;
    string sRandGemResRef;

    effect eVisAbilityInc = EffectVisualEffect(VFX_IMP_ELEMENTAL_PROTECTION);
    effect eVisEnhanceWep = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    object oItem;


    float fTimer = 0.0;

    switch(iEffect){
        //Bad effects
        case 1:
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBlindness, oPC, 10.0);
        break;
        case 2:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSTRDec, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        case 3:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCHADec, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        case 4:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWISDec, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        case 5:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eINTDec, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        case 6:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDEXDec, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        case 7:
            ApplyEffectToObject(DURATION_TYPE_INSTANT, ePosion, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        case 8:
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eIdiot, oPC, 300.0);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        case 9:
            while(fTimer < 300.0){
                DelayCommand(
                    fTimer,
                    AssignCommand(oPC, Narcolepsy())
                );
                fTimer += IntToFloat(30 + Random(120));
            }
        break;
        case 10:
            while(fTimer < 300.0){
                DelayCommand(
                    fTimer,
                    AssignCommand(oPC, Puke())
                );
                fTimer += IntToFloat(60 + Random(120));
            }
        break;
        // Good effects
        case 11:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSTRInc, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityInc, oPC);
        break;
        case 12:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCHAInc, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityInc, oPC);
        break;
        case 13:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWISInc, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityInc, oPC);
        break;
        case 14:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eINTInc, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityInc, oPC);
        break;
        case 15:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDEXInc, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityInc, oPC);
        break;
        case 16:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvis, oPC);
        break;
        case 17:
            ActionCastSpellAtObject(SPELL_GREATER_RESTORATION, oPC, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        break;
        case 18:
            oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
            ipEnhanceBonus = ItemPropertyEnhancementBonus(1);
            if(GetItemHasItemProperty(oItem, ITEM_PROPERTY_ENHANCEMENT_BONUS)){
                itemproperty ipLoop = GetFirstItemProperty(oItem);
                while(GetIsItemPropertyValid(ipLoop)){
                    if(GetItemPropertyType(ipLoop) == ITEM_PROPERTY_ENHANCEMENT_BONUS){
                        ipEnhanceBonus = ItemPropertyEnhancementBonus(
                            GetItemPropertyCostTableValue(ipLoop) + 1
                        );
                        break;
                    }
                }
            }
            IPSafeAddItemProperty(
                oItem,
                ipEnhanceBonus
            );
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisEnhanceWep, oPC);
        break;
        case 19:
            iRandGem = Random(5);
            switch(iRandGem){
                case 0:
                    sRandGemResRef = "nw_it_gem010";
                break;
                case 1:
                    sRandGemResRef = "nw_it_gem008";
                break;
                case 2:
                    sRandGemResRef = "nw_it_gem006";
                break;
                case 3:
                    sRandGemResRef = "nw_it_gem005";
                break;
                case 4:
                    sRandGemResRef = "nw_it_gem012";
                break;
            }
            CreateItemOnObject(sRandGemResRef, oPC);
            ActionSpeakString("You bite into something hard!");
        break;
        case 20:
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTempHP, oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisAbilityDec, oPC);
        break;
        default:

    }

}


void Puke()
{
    effect ePuke = EffectVisualEffect(VFX_COM_CHUNK_GREEN_SMALL); //Player pukes
    string sPukeTalk = "BBBLLLLAAAARRRRGGGGHHHHH!!!!";
    vector vPukeAt = GetChangedPosition(
        GetPosition(OBJECT_SELF),
        1.0,
        GetFacing(OBJECT_SELF)
    );
    location lPukeAt = Location(GetArea(OBJECT_SELF), vPukeAt, IntToFloat(Random(360)));
    ClearAllActions();
    ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE);
    ActionSpeakString(sPukeTalk);
    DelayCommand(
        2.0,
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, ePuke, lPukeAt, 1.0)
    );
}

void Narcolepsy()
{
    effect eNarco = EffectSleep(); //Force player to fall asleep randomly for the next 5 mins.
    effect eZzz = EffectVisualEffect(VFX_IMP_SLEEP);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eNarco, OBJECT_SELF, 10.0);
    if(GetHasEffect(EFFECT_TYPE_SLEEP, OBJECT_SELF))
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eZzz, OBJECT_SELF, 10.0);
}
