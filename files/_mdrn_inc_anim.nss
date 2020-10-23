/*  PLAYER ACTION SYSTEM INCLUDE - inc_pas
    v1.00 9/11/2004
    by Kerry Solberg - http://www.realmsofmyth.org
*/
// Adopted for D20 Modern by Forrestwolf
// System comes from C.R.A.P. project.

#include "_mdrn_inc_acont"

int nCnt;
const float JUMP_ANIM_DISTANCE_SCALAR = 6.3;   // orig = 3.974
const float CLIMB_ANIM_DISTANCE_SCALAR = 1.135;

//Determine if oObject is encumbered because of the weight of items carried
int GetIsEncumbered(object oObject);

//Return a location 75% of the distance between lStart and lEnd
location GetThreeQuarterLocation(location lStart, location lEnd);

//The caller will attempt a detect traps action on oTarget
void DetectTraps(object oTarget);

//The calling object will display floaty text... no one else will see it.
void DisplayText(string sMsg);

//The calling object will display floaty text.. party members will see it.
void DisplayTextAll(string sMsg);

void DisplayTextAll(string sMsg)
{
    FloatingTextStringOnCreature(sMsg, OBJECT_SELF, TRUE);
}

void DisplayText(string sMsg)
{
    FloatingTextStringOnCreature(sMsg, OBJECT_SELF, FALSE);
}

void crp_PlayAnimation(int nAnim)
{
    float fSpeed, fDur;
    switch(nAnim)
    {
        case ANIMATION_LISTEN: fSpeed = 0.5; fDur = 6.0; break;
        case ANIMATION_SPIKE_LOW: fSpeed = 1.0; fDur = 5.0; break;
        case ANIMATION_JUMP: fSpeed = 2.5; fDur = 2.3; break;
        case ANIMATION_REST: fSpeed = 1.3; fDur = 13.5; break;
    }
    ActionPlayAnimation(nAnim, fSpeed, fDur);
}

void ClearPAWVariables()
{
    DeleteLocalObject(OBJECT_SELF, "PAW_TARGET");
    DeleteLocalObject(OBJECT_SELF, "PAW_PIT");
    DeleteLocalInt(OBJECT_SELF, "PAW_TARGET_TYPE");
    DeleteLocalInt(OBJECT_SELF, "PAW_JUMP");
    DeleteLocalInt(OBJECT_SELF, "PAW_SPIKES");
    DeleteLocalInt(OBJECT_SELF, "PAW_ROPE");
    DeleteLocalInt(OBJECT_SELF, "PAW_MALLET");
    DeleteLocalInt(OBJECT_SELF, "PAW_OPEN");
    DeleteLocalInt(OBJECT_SELF, "PAW_HIDDEN_COMPARTMENT");
    DeleteLocalInt(OBJECT_SELF, "PIT_OPTIONS");
}

float GetAppearanceModifierFromABAScaling(object oPC)
{
    int iRacialType = GetRacialType(oPC);

    if (GetGender(oPC) == GENDER_MALE)
    {
        if(iRacialType == IP_CONST_RACIALTYPE_HUMAN)
            return 1.0;
        else if(iRacialType == IP_CONST_RACIALTYPE_HALFLING)
            return 0.65;
        else if(iRacialType == IP_CONST_RACIALTYPE_ELF)
            return 0.895;
        else if(iRacialType == IP_CONST_RACIALTYPE_DWARF)
            return 0.68;
        else if(iRacialType == IP_CONST_RACIALTYPE_GNOME)
            return 0.63;
        else return 1.03;
    }
    else
    {
        if(iRacialType == IP_CONST_RACIALTYPE_HUMAN)
            return 0.988;
        else if(iRacialType == IP_CONST_RACIALTYPE_HALFLING)
            return 0.632;
        else if(iRacialType == IP_CONST_RACIALTYPE_ELF)
            return 0.883;
        else if(iRacialType == IP_CONST_RACIALTYPE_DWARF)
            return 0.648;
        else if(iRacialType == IP_CONST_RACIALTYPE_GNOME)
            return 0.63;
        else return 0.997;
    }
}

int GetIsEncumbered(object oObject)
{
    int nStr = GetAbilityScore(oObject, ABILITY_STRENGTH);
    int nWeight = GetWeight(oObject);
    int nCapacity = 0;
    switch(nStr)
    {
        case 3: nCapacity = 200; break;
        case 4: nCapacity = 260; break;
        case 5: nCapacity = 330; break;
        case 6: nCapacity = 400; break;
        case 7: nCapacity = 460; break;
        case 8: nCapacity = 530; break;
        case 9: nCapacity = 600; break;
        case 10: nCapacity = 660; break;
        case 11: nCapacity = 760; break;
        case 12: nCapacity = 860; break;
        case 13: nCapacity = 1000; break;
        case 14: nCapacity = 1160; break;
        case 15: nCapacity = 1330; break;
        case 16: nCapacity = 1530; break;
        case 17: nCapacity = 1730; break;
        case 18: nCapacity = 2000; break;
        case 19: nCapacity = 2330; break;
        case 20: nCapacity = 2660; break;
        case 21: nCapacity = 3060; break;
        case 22: nCapacity = 3460; break;
        case 23: nCapacity = 4000; break;
        case 24: nCapacity = 4660; break;
        case 25: nCapacity = 5330; break;
        case 26: nCapacity = 6130; break;
        case 27: nCapacity = 6930; break;
        case 28: nCapacity = 8000; break;
        case 29: nCapacity = 9330;
    }

    if(CRP_DEBUG == 1)
    {
        string sMsg = "WEIGHT/CAPACITY " +
                      IntToString(nWeight)+ "/"+IntToString(nCapacity);
        SendMessageToPC(OBJECT_SELF, sMsg );
    }
    if(nWeight >= nCapacity)
        return TRUE;
    else
        return FALSE;
}

location GetThreeQuarterLocation(location lStart, location lEnd)
{
    float fX, fY;
    vector vStart = GetPositionFromLocation(lStart);
    vector vEnd = GetPositionFromLocation(lEnd);

    if(vEnd.x > vStart.x)
        fX = vEnd.x - ((vEnd.x - vStart.x) * 0.25);
    else
        fX = ((vStart.x - vEnd.x) * 0.25) + vEnd.x;

    if(vEnd.y > vStart.y)
        fY = vEnd.y - ((vEnd.y - vStart.y) * 0.25);
    else
        fY = ((vStart.y - vEnd.y) * 0.25) + vEnd.y;

    vector vMoveTo = Vector(fX, fY, vEnd.z);
    if(CRP_DEBUG >= 1)
    {   SendMessageToPC(OBJECT_SELF, "Start: "+FloatToString(vStart.x) + ", "+
        FloatToString(vStart.y));
        SendMessageToPC(OBJECT_SELF, "End: "+FloatToString(vEnd.x) + ", "+
        FloatToString(vEnd.y));
        SendMessageToPC(OBJECT_SELF, "MoveTo: "+FloatToString(fX) + ", "+
        FloatToString(fY));
    }
    return Location(GetArea(OBJECT_SELF), vMoveTo, 90.0);
}
int GetIsJumpProbable()
{
    //check distance first & valid jump area first now - added 11/23/05
    if(GetLocalInt(OBJECT_SELF, "JUMP_INVALID") == 1)
        return 0;

    float fAppearanceModifier = GetAppearanceModifierFromABAScaling(OBJECT_SELF);
    float fJumpLength;
    float fDis = GetDistanceBetweenLocations(GetLocation(OBJECT_SELF), GetSpellTargetLocation());

    if (CRP_DISABLE_RACIAL_JUMPING == 0)
    {
        fJumpLength = JUMP_ANIM_DISTANCE_SCALAR * fAppearanceModifier;
    }
    else
    {
        fJumpLength = JUMP_ANIM_DISTANCE_SCALAR * 1;
    }

    if(fDis > fJumpLength)
        return 0;

    int nProbable = 0;
    vector vStart = GetPositionFromLocation(GetLocation(OBJECT_SELF));
    vector vEnd = GetPositionFromLocation(GetSpellTargetLocation());

    if((vEnd.z - vStart.z) > 2.5)
        return 0;

    if((vStart.z - vEnd.z) > 3.5)
        return 0;

    float fX, fY;
    //Get new X coordinate
    if(vStart.x < vEnd.x)
        fX = ((vEnd.x - vStart.x) / 2) + vStart.x;
    else if(vStart.x > vEnd.x)
        fX = ((vStart.x - vEnd.x) / 2) + vEnd.x;
    else
        fX = vStart.x;

    //Get new Y coordinate
    if(vStart.y < vEnd.y)
        fY = ((vEnd.y - vStart.y) / 2) + vStart.y;
    else if(vStart.y > vEnd.y)
        fY = ((vStart.y - vEnd.y) / 2) + vEnd.y;
    else
        fY = vStart.y;

    vector vMiddle = Vector(fX, fY, vStart.z);
    location lMiddle = Location(GetArea(OBJECT_SELF), vMiddle, 90.0f);
    object oMiddle = CreateObject(OBJECT_TYPE_CREATURE, "crpc_jumplocator", lMiddle);
    vector vNew = GetPositionFromLocation(GetLocation(oMiddle));
    if(vNew.x != fX || vNew.y != fY)
        nProbable = 1;

    DestroyObject(oMiddle);

    //exploit check! added 11/23/05
    object oDoor = GetFirstObjectInShape(SHAPE_SPHERE, fDis / 2.0f, lMiddle, FALSE, OBJECT_TYPE_DOOR);
    if(GetIsObjectValid(oDoor))
        nProbable = 0;

    return nProbable;
}
int RevealObject(object oSearcher, object oMarker, int nDC, int nRogueCheck = 0)
{
    if((nDC - 5) > 20 && GetLevelByClass(CLASS_TYPE_ROGUE, oSearcher) < 1 &&
        nRogueCheck ==1)
        return 0;

    int nSearch = GetSkillRank(SKILL_SEARCH, oSearcher);

    //find a trap
    if(GetIsTrapped(oMarker) &&
       !GetTrapDetectedBy(oMarker, OBJECT_SELF) &&
       ((d20() + nSearch) >= (nDC - 15)))
    {
        vector vObject = GetPosition(oMarker);
        AssignCommand(oSearcher, SetFacingPoint(vObject));
        AssignCommand(oSearcher, ClearAllActions());
        AssignCommand(oSearcher, PlayVoiceChat(VOICE_CHAT_STOP));
        SetTrapDetectedBy(oMarker, oSearcher);
        DelayCommand(1.0, AssignCommand(oSearcher, SpeakString("A trap!")));
        return 1;
    }
    //find a hidden object
    else if((d20() + nSearch) >= nDC)
    {
        string sTag = GetLocalString(oMarker, "TAG");
        string sResRef = GetLocalString(oMarker, "RESREF");
        string sDestination = GetLocalString(oMarker, "DESTINATION");
        int nReset = GetLocalInt(oMarker, "RESET");
        location lLoc = GetLocation(oMarker);
        string sMSG1 = GetLocalString(oMarker, "MSG1");
        string sMSG2 = GetLocalString(oMarker, "MSG2");
        string sMSG3 = GetLocalString(oMarker, "MSG3");
        object oReveal;
        object oItem = GetLocalObject(oMarker, "ITEM");
        object oHolder = GetLocalObject(oMarker, "HOLDER");

        //has the object already been revealed?
        //if(nReset && GetIsObjectValid(GetObjectByTag(sTag)))
        object oChk = GetNearestObjectByTag(sTag);
        if(GetIsObjectValid(oChk) &&
           GetObjectType(oChk) == OBJECT_TYPE_PLACEABLE &&
           GetLocation(oChk) == GetLocation(oMarker))
            return 0;

        //item check
        if(GetIsObjectValid(oItem))
        {
            oReveal = CopyObject(oItem, lLoc, OBJECT_INVALID, sTag);
            DestroyObject(oItem);
        }
        //inventory placeable check
        else if(GetIsObjectValid(oHolder))
        {
            oReveal = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lLoc, FALSE, sTag);
            oItem = GetFirstItemInInventory(oHolder);
            while (GetIsObjectValid(oItem))
            {
                AssignCommand(oReveal, ActionTakeItem(oItem, oHolder));
                oItem = GetNextItemInInventory(oHolder);
            }
            DelayCommand(1.0, DestroyObject(oHolder));
        }
        //all other objects - secret doors/trapdoors
        else
        {
            oReveal = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lLoc, FALSE, sTag);
            SetLocalString(oReveal, "DESTINATION", sDestination);
            //the following apply to hidden tracks only
            SetLocalString(oReveal, "MSG1", sMSG1);
            SetLocalString(oReveal, "MSG2", sMSG2);
            SetLocalString(oReveal, "MSG3", sMSG3);
        }

        if(nReset)
            DelayCommand(IntToFloat(nReset), DestroyObject(oReveal));
        else
            DestroyObject(oMarker);

        vector vRevealed = GetPositionFromLocation(lLoc);
        AssignCommand(oSearcher, ClearAllActions());
        AssignCommand(oSearcher, SetFacingPoint(vRevealed));
        AssignCommand(oSearcher, ActionDoCommand(PlayVoiceChat(VOICE_CHAT_LOOKHERE)));
        AssignCommand(oSearcher, ActionMoveToObject(oReveal));
        return 1;
    }
    else
        return 0;

}

int GetIsHidden(object oObject)
{
    int DC = 0;
    if(CRP_DEBUG >= 1) SendMessageToPC(OBJECT_SELF, GetTag(oObject));

    if(GetObjectType(oObject) == OBJECT_TYPE_TRIGGER &&
       GetIsTrapped(oObject)) DC = GetTrapDetectDC(oObject);

    if(GetObjectType(oObject) == OBJECT_TYPE_WAYPOINT)
       DC = GetLocalInt(oObject, "DC");

    return DC;
}
void SearchForSecrets(location lLoc, int bAutomatic=FALSE, object oSearcher=OBJECT_SELF, int nRogueCheck=1)
{
    ClearAllActions();
    //Check all the nearby objects
    int nType, nHidden;
    int nNth = 1;
    object oDiscover = GetNearestObjectToLocation(OBJECT_TYPE_ALL, lLoc, nNth);
    while(GetIsObjectValid(oDiscover) &&
          GetDistanceBetweenLocations(GetLocation(oDiscover), lLoc) <= 10.0f)
    {
        nType = GetObjectType(oDiscover);
        if(nType == OBJECT_TYPE_TRIGGER || nType == OBJECT_TYPE_WAYPOINT)
        {
            nHidden = GetIsHidden(oDiscover);
            if(CRP_DEBUG >= 1) SendMessageToPC(OBJECT_SELF, "dc"+IntToString(nHidden));
            if(nHidden >= 1 && LineOfSightObject(OBJECT_SELF, oDiscover) &&
                RevealObject(oSearcher, oDiscover, nHidden, nRogueCheck) == 1)
            {
                return;
            }
        }
        nNth++;
        oDiscover = GetNearestObjectToLocation(OBJECT_TYPE_ALL, lLoc, nNth);
    }
    if(!bAutomatic)
        FloatingTextStringOnCreature("You discover nothing unusual.", OBJECT_SELF, FALSE);
}
void DetectTraps(object oTarget)
{
    /*
    1. Determine whether the player is a rogue
    2. Determine character's search ability
    3. Determine the detection DC of the placeable or door
    */
    if(!GetIsTrapped(oTarget))
    {
        FloatingTextStringOnCreature("You detect no traps.", OBJECT_SELF, FALSE);
        return;
    }

    int nRogue = GetLevelByClass(CLASS_TYPE_ROGUE, OBJECT_SELF);
    int nSearch = GetSkillRank(SKILL_SEARCH, OBJECT_SELF);
    int nTrapDC = GetTrapDetectDC(oTarget);

    if(CRP_DEBUG >= 1)
    {
        SendMessageToPC(OBJECT_SELF, "DC "+IntToString(nTrapDC));
        SendMessageToPC(OBJECT_SELF,"Search "+IntToString(nSearch));
    }
    if(nRogue < 1 && nTrapDC > 20)
    {
        FloatingTextStringOnCreature("You detect no traps.", OBJECT_SELF, FALSE);
        return;
    }
    if( (d20()+nSearch) >= nTrapDC)
    {
        SetTrapDetectedBy(oTarget, OBJECT_SELF);
        PlayVoiceChat(VOICE_CHAT_LOOKHERE);
        DelayCommand(1.5, SpeakString("This is trapped!"));
    }
    else
    {
        FloatingTextStringOnCreature("You detect no traps.", OBJECT_SELF, FALSE);
        return;
    }
}
void SearchForHiddenCompartment(object oTarget, int nInventory = FALSE)
{
    int nDC = GetLocalInt(oTarget, "DC");
    int nSearch = GetSkillRank(SKILL_SEARCH);
    if(nDC < 1)
    {
        FloatingTextStringOnCreature("You find no hidden compartments.", OBJECT_SELF, FALSE);
        return;
    }
    else
    {
        if(CRP_DEBUG == 1)
        {
            SendMessageToPC(OBJECT_SELF, "DC: " + IntToString(nDC));
            SendMessageToPC(OBJECT_SELF, "INVENTORY: " + IntToString(nInventory));
        }
        if((d20() + nSearch) >= nDC)
        {
            object oMarker = GetNearestObjectByTag("SCCRP_HC");
            object oInv = GetLocalObject(oMarker, "HOLDER");
            //object oInv = GetObjectByTag("HC" + GetTag(oTarget));
            if(!GetIsObjectValid(oInv))
            {
                FloatingTextStringOnCreature("You find no hidden compartments.", OBJECT_SELF, FALSE);
                return;
            }
            else
            {
                object oCompartment;
                object oItem = GetFirstItemInInventory(oInv);
                if(!GetIsObjectValid(oItem))
                {
                    FloatingTextStringOnCreature("You find an empty secret compartment.", OBJECT_SELF, FALSE);
                    return;
                }
                switch(nInventory)
                {
                    case FALSE:
                    oCompartment = CreateObject(OBJECT_TYPE_PLACEABLE, "crpp_hid_compart", GetLocation(OBJECT_SELF));
                    SetLocalObject(oCompartment, "INVENTORY", oInv);
                    while(GetIsObjectValid(oItem))
                    {
                        AssignCommand(oCompartment, ActionTakeItem(oItem, oInv));
                        oItem = GetNextItemInInventory(oInv);
                    }
                    ActionInteractObject(oCompartment);
                    FloatingTextStringOnCreature("You find a hidden compartment!", OBJECT_SELF, FALSE);
                    break;

                    case TRUE:
                    while(GetIsObjectValid(oItem))
                    {
                        AssignCommand(oTarget, ActionTakeItem(oItem, oInv));
                        oItem = GetNextItemInInventory(oInv);
                    }
                    FloatingTextStringOnCreature("You find a hidden compartment!", OBJECT_SELF, FALSE);
                    return;
                }
            }
        }
        else
            FloatingTextStringOnCreature("You find no hidden compartments.", OBJECT_SELF, FALSE);
    }
}

int crp_GetNearbyPartyMembers(object oPC)
{
    float fDis;
    nCnt = 1;
    object oPartyMem = GetFirstFactionMember(oPC, TRUE);
    while (GetIsObjectValid(oPartyMem))
    {
        fDis = GetDistanceBetween(oPC, oPartyMem);
        if(fDis > 0.0f && fDis < 20.0f)
        {
            nCnt++;
            SetLocalObject(oPC, "PARTY_MEM"+IntToString(nCnt), oPartyMem);
        }
        oPartyMem = GetNextFactionMember(oPC, TRUE);
    }
    return nCnt;
}

void crp_GiveNearbyPartyXP(object oPC, int nXPToDivide, string sOptMsg="")
{
    int nMembers = crp_GetNearbyPartyMembers(oPC);
    int nEqualAmt = nXPToDivide/nMembers;

    //always award at least 1 xp
    if(nEqualAmt < 1) nEqualAmt = 1;

    object oPartyMem = GetLocalObject(oPC, "PARTY_MEM"+IntToString(nCnt));
    while (GetIsObjectValid(oPartyMem))
    {
        GiveXPToCreature(oPartyMem, nEqualAmt);
        FloatingTextStringOnCreature(sOptMsg + IntToString(nEqualAmt) +
                                     " xp", oPartyMem, FALSE);
        nCnt--;
        oPartyMem = GetLocalObject(oPC, "PARTY_MEM"+IntToString(nCnt));
    }
    GiveXPToCreature(oPC, nEqualAmt);
    FloatingTextStringOnCreature(sOptMsg + IntToString(nEqualAmt) +
                                 "xp", oPC, FALSE);
}
