/*
 d20 Modern Core Charcter Code

 @author SuTech aka David Caron
           geekfiend aka Joe LaPenna (geekfiend@gravemistakes.com)
*/

#include "_mdrn_include"


//Returns the PC_Skin item if it is in a players inventory
object GetPCCoreInInventory(object oTarget, string sCoreItemTag = PCSKIN);

//Checks to see if player is wearing PC_Skin
int GetIsWearingPCCore(object oTarget, string sCoreItemTag = PCSKIN);

//Equips PC_Skin if player is not wearing it, creates it on PC
//if it does not exist in their inventory
void EquipPCCore(object oTarget, string sCoreItemTag = PCSKIN);

//Get PC Skin Object from oTarget
object GetPCCore(object oTarget, string sCoreItemTag = PCSKIN);

//Check if Passive Skill Feat bonus has been applied
int GetIsPassiveFeatEffectApplied(itemproperty prop, object oTarget);

//Apply Passive Feat Bonus
int AddPassiveFeatSkillBonus( int iRowCount, object oTarget );

//Loads the lot of Passive Skill Granting feats to oTarget
void LoadPassiveFeats( object oTarget );

//Gets the Attack Bonus property on the PCCore
itemproperty GetMdrnIPAttackBonus(object oTarget, int iToRemove = FALSE);

//Gets the value of the attack bonus on the PCCore, if set, will remove the IP as well.
int GetMdrnAttackBonus(object oTarget, int iToRemove = FALSE);

//Increases the AttackBonus on the PCCore by iBonus on oTarget
void MdrnIncreaseAttackBonus(int iBonus, object oTarget);

//Decreases the AttackBonus on the PCCore by iBonus on oTarget
void MdrnDecreaseAttackBonus(int iBonus, object oTarget);

//Sets the AttackBonus on the PCCore by iBonus on oTarget
void SetMdrnAttackBonus(int iBonus, object oTarget);

////////////////////////////////////////////////////////////////////////////////
// PC Skin Functions
////////////////////////////////////////////////////////////////////////////////

int GetCoreItemSlot(string sTag){
    if(sTag==PCSKIN)
        return INVENTORY_SLOT_CARMOUR;
    else if(sTag==PCFIST)
        return INVENTORY_SLOT_CWEAPON_R;
    else{
        SendDebugMessage("Invalid Slot, returning -1");
        return -1;
    }
}

//Returns the PC_Skin item if it is in a players inventory
object GetPCCoreInInventory(object oTarget, string sCoreItemTag = PCSKIN){
    object oItem=GetFirstItemInInventory(oTarget);
    while(GetIsObjectValid(oItem)){
        if(GetTag(oItem)==sCoreItemTag){
            SendDebugMessage("PC_Skin in Inventory:" + GetName(oTarget) );
            return oItem;           //Only returns if HAS PC_Skin in Inventory
        }
        oItem=GetNextItemInInventory(oTarget);
    }
    //Only returns if no PC_Skin in Inventory
    return GetObjectByTag("THISISINVALID");
    SendDebugMessage("PC_Skin not in Inventory:" + GetName(oTarget) );
}

//Checks to see if player is wearing PC_Skin
int GetIsWearingPCCore(object oTarget, string sCoreItemTag = PCSKIN){
    object oPCCore=GetItemInSlot(GetCoreItemSlot(sCoreItemTag), oTarget);
    if(GetIsObjectValid(oPCCore))
        if(GetResRef(oPCCore)==sCoreItemTag){
            return TRUE;            //Returns TRUE if oTarget is wearing PC_Skin
            SendDebugMessage("PC_Skin is Worn:" + GetName(oTarget) );
        }
    SendDebugMessage("PC_Skin not Worn:" + GetName(oTarget) );
    return FALSE;                   //Will return FALSE if not wearing PC_Skin
}

//Equips PC_Skin if player is not wearing it, creates it on PC
//if it does not exist in their inventory then equips it
void EquipPCCore(object oTarget, string sCoreItemTag = PCSKIN){
    SendDebugMessage("EquipPCCore: Attempting");
    if(!GetIsWearingPCCore(oTarget, sCoreItemTag)){
        object oPCCore=GetPCCoreInInventory(oTarget, sCoreItemTag);
        if(!GetIsObjectValid(oPCCore)){
            oPCCore = CreateItemOnObject(sCoreItemTag, oTarget);
            SendDebugMessage("PC_Skin Created:" + GetName(oTarget) );
        }
        AssignCommand(oTarget, ActionEquipItem(oPCCore, GetCoreItemSlot(sCoreItemTag)));
    }
}

//Get PC Skin Object from oTarget
object GetPCCore(object oTarget, string sCoreItemTag = PCSKIN){
    if( GetIsWearingPCCore(oTarget, sCoreItemTag) ){
        SendDebugMessage("Getting PCCore from: " + GetName(oTarget) );
        return GetItemInSlot( GetCoreItemSlot(sCoreItemTag), oTarget );
    }
    else{
        return InvalidObject();
    }
}

////////////////////////////////////////////////////////////////////////////////
// PC Feat Functions
////////////////////////////////////////////////////////////////////////////////

//Check if Passive Skill Feat bonus has been applied
int GetIsPassiveFeatEffectApplied(itemproperty prop, object oTarget){
    object oPCCore = GetItemInSlot( INVENTORY_SLOT_CARMOUR, oTarget );
    if( getItemHasProperty( oPCCore, prop ) ){
        SendDebugMessage("FEAT-GetIsPassiveFeatEffectApplied: Passive Skill " +
                        ipTypeToString(GetItemPropertyType(prop)) + " " +
                        ipSkillSubTypeToString(GetItemPropertySubType(prop)) +
                        " Has been Applied");
            return TRUE;
    }
    else
        SendDebugMessage("FEAT-GetIsPassiveFeatEffectApplied: Passive Skill " +
                        ipTypeToString(GetItemPropertyType(prop)) + " " +
                        ipSkillSubTypeToString(GetItemPropertySubType(prop)) +
                        " Has not been Applied");
    return FALSE;
}

//Apply Passive Feat Bonus
int AddPassiveFeatSkillBonus( int iRowCount, object oTarget ){
    int iFeatIndex = StringToInt( Get2DAString("_mdrn_ft_pasvsk", "FEAT", iRowCount) );

    if ( GetHasFeat( iFeatIndex, oTarget) ){
        SendDebugMessage( "FEAT-AddPassiveFeatSkillBonus: " + GetName(oTarget) +
                        " has feat: " + " " +
                        DebugGet2DAString("feat", "Label", iFeatIndex) );

        int iSkillIndex  = StringToInt( Get2DAString("_mdrn_ft_pasvsk", "SKILL", iRowCount) );
        int iBonus = StringToInt( Get2DAString("_mdrn_ft_pasvsk", "Bonus", iRowCount) );
        string sPick2da = Get2DAString("_mdrn_ft_pasvsk", "PICK", iRowCount);

        SendDebugMessage( "FEAT-AddPassiveFeatSkillBonus: iSkillIndex: " +
                            IntToString(iSkillIndex) + " iBonusAmount: " +
                            IntToString(iBonus) + " iFeatIndex: " +
                            IntToString(iFeatIndex) + " iRowCount: " +
                            IntToString(iRowCount) );

        itemproperty ipSkillBonus = ItemPropertySkillBonus( iSkillIndex, iBonus );
        SendDebugMessage( "FEAT-AddPassiveFeatSkillBonus: Item Property Details: " +
                            ipTypeToString(GetItemPropertyType(ipSkillBonus)) + " " +
                            ipSkillSubTypeToString(GetItemPropertySubType(ipSkillBonus)) );

        if ( GetIsPassiveFeatEffectApplied( ipSkillBonus, oTarget ) ){
            SendDebugMessage( "FEAT-AddPassiveFeatSkillBonus: Not Re-adding " +
                            FeatNameToString( iFeatIndex ) +
                            "to " + GetName(oTarget) );
        }
        else{
            object oPCCore = GetPCCore( oTarget );
            if( GetIsObjectValid(oPCCore) ){
                SendDebugMessage("FEAT-AddPassiveFeatSkillBonus: Applying feat " +
                                    FeatNameToString(iFeatIndex) +
                                    " to " + GetName(oTarget) );
                if(GetIsItemPropertyValid(ipSkillBonus)){
                    AddItemProperty(DURATION_TYPE_PERMANENT, ipSkillBonus, oPCCore );
                    return TRUE;
                }
                else{
                    SendDebugMessage( "FEAT-AddPassiveFeatSkillBonus: Apply Failed " +
                                        FeatNameToString(iFeatIndex) +
                                        " to " + GetName(oTarget) );
                }
            }
        }
    }

    SendDebugMessage( "FEAT-AddPassiveFeatSkillBonus: " + GetName(oTarget) + " does not have Feat: " +
                            FeatNameToString(iFeatIndex) );
    return FALSE;
}

void LoadPassiveFeats( object oTarget ){
    SendDebugMessage("FEAT-LoadPassiveFeat: " + GetName(oTarget));
    if(GetIsWearingPCCore(oTarget)){
        string sPick2da="";
        int iRowCount=0;
        int iStillValid = TRUE;
        while( iStillValid ){
            if( Get2DAString("_mdrn_ft_pasvsk", "FEAT", iRowCount) == "" )
                iStillValid = FALSE;
            else{
                    AddPassiveFeatSkillBonus( iRowCount, oTarget );
                    iRowCount++;
            }
        }
    }
    else
        SendDebugMessage("Aborting Passive Load, PCSkin not worn");
}

////////////////////////////////////////////////////////////////////////////////
// PC Attack Bonus Functions
////////////////////////////////////////////////////////////////////////////////

itemproperty GetMdrnIPAttackBonus(object oTarget, int iToRemove = FALSE){
    SendDebugMessage("MAB-GetMdrnIPAttackBonus");

    object oPCCore = GetPCCore(oTarget, PCFIST);
    itemproperty ipCurProp = GetFirstItemProperty( oPCCore );

    while ( GetIsItemPropertyValid(ipCurProp) )
    {
        if ( (GetItemPropertyType(ipCurProp) == ITEM_PROPERTY_ATTACK_BONUS) ||
             (GetItemPropertyType(ipCurProp) == ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER) ){
            if( iToRemove ){
                SendDebugMessage("MAB-Removing AB IP");
                RemoveItemProperty(oPCCore, ipCurProp);
            }
            SendDebugMessage("Found Property");
            return ipCurProp;
        }
        ipCurProp = GetNextItemProperty( oPCCore );
    }

    return InvalidItemProperty();
}

int GetMdrnAttackBonus(object oTarget, int iToRemove = FALSE){
    SendDebugMessage("MAB-GetMdrnAttackBonus: " + GetName(oTarget));
    itemproperty ip = GetMdrnIPAttackBonus(oTarget, iToRemove);
    int i;
    if (GetIsItemPropertyValid(ip)){
        i = GetItemPropertyCostTableValue(ip);
        SendDebugMessage("MAB is: " + IntToString(i) );
        if(GetItemPropertyType(ip) == ITEM_PROPERTY_ATTACK_BONUS)
           return GetItemPropertyCostTableValue(ip);
        else if(GetItemPropertyType(ip) == ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER)
           return -GetItemPropertyCostTableValue(ip);
        else return -555;
    }
    return 0;
}

void MdrnAttackBonusIncrease(int iBonus, object oTarget){
    SendDebugMessage("Increasing Attack Bonus");
    int iAttackBonus = GetMdrnAttackBonus(oTarget, TRUE);
    itemproperty ip;
    if( (iAttackBonus + iBonus) < 0)
        ip = ItemPropertyAttackPenalty(abs(iAttackBonus + iBonus));
    else if( (iAttackBonus + iBonus) >0)
        ip = ItemPropertyAttackBonus(abs(iAttackBonus + iBonus));
    else return;
    object oPCCore = GetPCCore(oTarget, PCFIST);
    AddItemProperty(DURATION_TYPE_PERMANENT, ip, oPCCore);
//    AssignCommand(oTarget, ActionEquipItem(oPCCore, GetCoreItemSlot(PCFIST)));
}

void MdrnAttackBonusDecrease(int iPenalty, object oTarget){
    SendDebugMessage("Decreasing Attack Bonus");
    int iAttackBonus = GetMdrnAttackBonus(oTarget, TRUE);
    iPenalty = abs(iPenalty);
    itemproperty ip;
    if( (iAttackBonus - iPenalty) < 0)
        ip = ItemPropertyAttackPenalty(abs(iAttackBonus - iPenalty));
    else if( (iAttackBonus - iPenalty) > 0)
        ip = ItemPropertyAttackBonus(abs(iAttackBonus - iPenalty));
    else return;
    object oPCCore = GetPCCore(oTarget, PCFIST);
    AddItemProperty(DURATION_TYPE_PERMANENT, ip, oPCCore);
//    AssignCommand(oTarget, ActionEquipItem(oPCCore, GetCoreItemSlot(PCFIST)));
}

void SetMdrnAttackBonus(int iScore, object oTarget){
    SendDebugMessage("Setting Attack Bonus");
    int iAttackBonus = GetMdrnAttackBonus(oTarget, TRUE);
    itemproperty ip;
    if(iScore < 0)
        ip = ItemPropertyAttackPenalty(abs(iScore));
    if(iScore > 0)
        ip = ItemPropertyAttackBonus(abs(iScore));
    object oPCCore = GetPCCore(oTarget, PCFIST);
    AddItemProperty(DURATION_TYPE_PERMANENT, ip, oPCCore );
    SendDebugMessage("SetMdrnAttackBonus: " + IntToString(iScore));
//    AssignCommand(oTarget, ActionEquipItem(oPCCore, GetCoreItemSlot(PCFIST)));
}

////////////////////////////////////////////////////////////////////////////////
// Weapon Proficiency Bonus/Penalty Functions
////////////////////////////////////////////////////////////////////////////////

void ManageWeaponProfs(object oTarget, object oItem, int Equiping = 0){
    SendDebugMessage("Managing Weapon Profs");
    int iType = GetBaseItemType(oItem);
    int iNeededFeat = StringToInt(Get2DAString("_mdrn_itemfeats","FeatIndex",iType));
    if( Equiping ){
        if( iNeededFeat!=0 && !GetHasFeat(iNeededFeat, oTarget) ){
            MdrnAttackBonusDecrease(4, oTarget);
            SendDebugMessage("ManageWeaponProf-Equip: Needed =" +
             IntToString(iNeededFeat));
        }
    }
    else{
        if( iNeededFeat!=0 && !GetHasFeat(iNeededFeat, oTarget) ){
            MdrnAttackBonusIncrease(4, oTarget);
            SendDebugMessage("ManageWeaponProf-UnEquip: Needed =" +
             IntToString(iNeededFeat));
        }
    }
}
