// lmpperfmisc
// Miscellaneous functions for the Performer NPC's.

// Change this to set the interval between performances.
int nHoursBetweenPerformances = 2;

// State transitions (User-defined event numbers)
int stPerformerMin = 5001;
int stPerformerDoneMoveToPerform = 5001;
int stPerformerDoneMoveHome = 5002;
int stPerformerMax = 5099;

void MoveToPerformPoint();
void StartPerform();
void Perform();
void PerformMagic(object oOtherGuy);
void PerformSong(object oOtherGuy);
void TerminatePerformBoth();
object GetMyChair();
void DonClothes();

void lmpDebugMsg(string st, int n = 99999)
{
/* REMOVED to hide troubleshooting messages
    string stMsg;
    stMsg = GetName(OBJECT_SELF);
    stMsg = stMsg + ": ";
    stMsg = stMsg + st;
    if (n != 99999) {
        stMsg = stMsg + ": ";
        stMsg = stMsg + IntToString(n);
    }
    SendMessageToAllDMs(stMsg);
    object oPC = GetFirstPC();
    if (oPC != OBJECT_INVALID)
        SendMessageToPC(oPC, stMsg);
*/
}

object GetOtherGuy()
{
    if (GetTag(OBJECT_SELF) == "lmpPerformer1") {
        return GetNearestObjectByTag("lmpPerformer2");
    } else {
        return GetNearestObjectByTag("lmpPerformer1");
    }
}

int IsPerformer1()
{
    return (GetTag(OBJECT_SELF) == "lmpPerformer1");
}

object GetNearbyPC()
{
    return GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
}

// STATE TRANSITIONS
// The character states are:
// 0: Idle waiting for next performance
// 1: Moving to performance point
// 2: Performing
// 3: Moving back to idle point

int GetCurrentState()
{
    return GetLocalInt(OBJECT_SELF, "PerfState");
}

void SetCurrentState(int n)
{
    SetLocalInt(OBJECT_SELF, "PerfState", n);
    lmpDebugMsg("Set state", n);
}

void SignalStateTransition(int st)
{
    ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(st)));
}

void OnHeartbeatUpdatePerformerState()
{
    // Check times for various daily actions. Check from latest to earliest,
    // so that actions are skipped if it's too late for them (e.g. when module
    // starts up).
    int nState;
    int nHour;
    nState = GetCurrentState();
    nHour = GetTimeHour();
    if (nHour < 6) {
        // reset cycle while sleeping
        if (nState > 0)
            SetCurrentState(0);
        SetLocalInt(OBJECT_SELF, "lmpPerformLastTime", 0);
    } else if (nState == 0 && nHour >= 9 && GetIsDay()) {
        int nLastTime = GetLocalInt(OBJECT_SELF, "lmpPerformLastTime");
        if (nHour - nLastTime >= nHoursBetweenPerformances) {
            // Showtime! Get moving.
            StartPerform();
            //SetCurrentState(1);
            //SetLocalInt(OBJECT_SELF, "lmpPerformLastTime", nHour);
            //MoveToPerformPoint();
        }
    }
}

void PerformerDoneMoveToPerform()
{
    // Arrived at performance point. Start performing.
    lmpDebugMsg("User-defined event DoneMoveToPerform");
    int nState = GetCurrentState();
    if (nState != 1) {
        lmpDebugMsg("ERROR: TerminatePerform: Invalid state", nState);
    } else {
        SetCurrentState(2);
        // Perform! until further notice
        Perform();
    }
}

void PerformerDoneMoveHome()
{
    // Arrived home. Go to sleep or something.
    lmpDebugMsg("User-defined event DoneMoveHome");
    int nState = GetCurrentState();
    if (nState != 3) {
        lmpDebugMsg("ERROR: TerminatePerform: Invalid state", nState);
    }
    SetCurrentState(0);
    SetLocalInt(OBJECT_SELF, "lmpPerformLastTime", GetTimeHour());
    // KLUDGE: This isn't the best time to do this, but there is no best time:
    if (!IsPerformer1() && GetLocalInt(OBJECT_SELF, "lmpPerform"))
        DonClothes();
    // If there's a chair nearby, sit in it. Else sit on the ground.
    object oChair = GetMyChair();
    if (oChair != OBJECT_INVALID) {
        ActionSit(oChair);
    } else {
        ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 9999.0);
    }
    // BUG: Can't put the character to sleep, because after he wakes up he
    // doesn't respond to any Action commands!??!
    /*effect effSleep = EffectSleep();
    effect effVis = EffectVisualEffect(VFX_IMP_SLEEP);
    effect eff = EffectLinkEffects(effSleep, effVis);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eff, OBJECT_SELF);*/
}

// Thanks to Rhodan.
int RemoveEffectType(object oTarget,int nEffectType)
{
    int nRemoved=FALSE;
    int nFound=0;
    effect eEffect;
    lmpDebugMsg("RemoveEffectType: Looking for effect", nEffectType);
    if (GetIsObjectValid(oTarget))
    {
        eEffect=GetFirstEffect(oTarget);
        if (GetIsEffectValid(eEffect))
        {
            do
            {
                nFound=GetEffectType(eEffect);
                // uncomment the next line if you want to see all the effects found
                lmpDebugMsg("RemoveEffectType: Found effect", nFound);
                if (nFound==nEffectType)
                {
                    RemoveEffect(oTarget, eEffect); // NOT Broken
                    lmpDebugMsg("RemoveEffectType: Removed effect", nFound);
                    nRemoved=TRUE;
                }
                eEffect=GetNextEffect(oTarget);
            } while (GetIsEffectValid(eEffect));
        }
    } else {
       nRemoved=FALSE;
    }
    lmpDebugMsg("RemoveEffectType: Done", nRemoved);
    return nRemoved;
}

object GetMyWaypoint(string sType)
{
    string sTag;
    object oWaypoint;
    sTag = GetTag(OBJECT_SELF);
    sTag = sTag + sType;
    return GetNearestObjectByTag(sTag);
}

void MoveToMyWaypoint(string sType)
{
    object oWaypoint = GetMyWaypoint(sType);
    if (GetIsObjectValid(oWaypoint)) {
        lmpDebugMsg("MoveToMyWaypoint: moving");
        //ClearAllActions();
        ActionMoveToObject(oWaypoint);
    } else {
        lmpDebugMsg("MoveToMyWaypoint: No waypoint");
    }
}

void MoveToPerformPoint()
{
    // BUG: Even though RemoveEffectType removes the sleep effect, and the
    // character stands up, no further actions can be performed! MoveToMyWaypoint
    // does absolutely nothing if called after the character wakes up.
    //RemoveEffectType(OBJECT_SELF, EFFECT_TYPE_SLEEP);
    ClearAllActions();
    // NOTE: Change this if the performer isn't sitting while resting!
    // BUG: There's no good way to interrupt a looping animation!
    // Without the following two lines, the performer will keep trying
    // to sit down during the performance!!
    ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0);
    ActionWait(2.0);
    lmpDebugMsg("MoveToPerformPoint: ready to move");
    MoveToMyWaypoint("Perform");
    SignalStateTransition(stPerformerDoneMoveToPerform);
}

void MoveHome()
{
    //ClearAllActions();
    MoveToMyWaypoint("Home");
    ActionDoCommand(SetFacingPoint(GetPosition(GetMyWaypoint("Perform"))));
    SignalStateTransition(stPerformerDoneMoveHome);
}

object GetMyChair()
{
    // Return a empty chair *or* stool nearby.
    float dChair = 9999.0;
    object oChair = GetNearestObjectByTag("Chair");
    if (oChair != OBJECT_INVALID && GetSittingCreature(oChair) == OBJECT_INVALID)
        dChair = GetDistanceToObject(oChair);
    float dStool = 9999.0;
    object oStool = GetNearestObjectByTag("Stool");
    if (oStool != OBJECT_INVALID && GetSittingCreature(oStool) == OBJECT_INVALID)
        dStool = GetDistanceToObject(oStool);
    if (dChair <= dStool && dChair < 2.0)
        return oChair;
    else if (dStool < 2.0)
        return oStool;
    else
        return OBJECT_INVALID;
}

void FacePC()
{
    // Face a near-by PC.
    object oPC = GetNearbyPC();
    if (oPC != OBJECT_INVALID && GetDistanceToObject(oPC) <= 10.0)
        SetFacingPoint(GetPosition(oPC));
}

void FacePCBoth()
{
    // Tell both performers to face a near-by PC.
    object oOtherGuy = GetOtherGuy();
    if (oOtherGuy != OBJECT_INVALID)
        AssignCommand(oOtherGuy, FacePC());
    FacePC();
}

void SpeakOneLine(int iLine)
{
    SetLocalInt(OBJECT_SELF, "lmpPerformOneLiner", iLine);
    SpeakOneLinerConversation("lmpperfoneliners");
}

void StartPerform()
{
    if (GetCurrentState() != 0) {
        lmpDebugMsg("StartPerformBoth: Invalid state");
    } else {
        SetCurrentState(1);
        SetLocalInt(OBJECT_SELF, "lmpPerformLastTime", GetTimeHour());
        MoveToPerformPoint();
    }
}

void Perform()
{
    int fIsPerformer1 = IsPerformer1();
    object oOtherGuy = GetOtherGuy();
    lmpDebugMsg("Perform!");
    if (fIsPerformer1) {
        SpeakOneLine(1);
    }
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW);
    // NOTE: lmpPerformer1 is the one who coordinates the performance for both
    // performers. The same performance type (lmpPerform) must be set for
    // both performers!
    if (fIsPerformer1) {
        int nPerform = Random(5) + 1;
        SetLocalInt(OBJECT_SELF, "lmpPerform", nPerform);
        SetLocalInt(oOtherGuy, "lmpPerform", nPerform);
        lmpDebugMsg("Perform: nPerform", nPerform);
        switch (nPerform) {
        case 1:
        case 4:
            PerformMagic(oOtherGuy);
            break;
        case 2:
        case 3:
        case 5:
            PerformSong(oOtherGuy);
            break;
        }
    }
}

void PerformMagic(object oOtherGuy)
{
    SetLocalInt(OBJECT_SELF, "lmpPerfAct", 1);
    if (oOtherGuy != OBJECT_INVALID) {
        SetLocalInt(OBJECT_SELF, "lmpBeginPerform", 1);
        ActionStartConversation(oOtherGuy);
    }
}

void ContinuePerformance(int nAct)
{
    SetLocalInt(OBJECT_SELF, "lmpPerfAct", 2);
    SetLocalInt(OBJECT_SELF, "lmpBeginPerform", 1);
    ActionStartConversation(GetOtherGuy());
}

void PerformRabbitTrick()
{
    effect eff = EffectSummonCreature("badger01", VFX_FNF_SUMMON_MONSTER_1);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_PERMANENT, eff, OBJECT_SELF));
    ActionDoCommand(ContinuePerformance(2));
}

void DonClothes()
{
    object oClothes = GetItemPossessedBy(OBJECT_SELF, "lmpPerfCostume");
    if (oClothes != OBJECT_INVALID) {
        ActionEquipItem(oClothes, INVENTORY_SLOT_CHEST);
        lmpDebugMsg("DonClothes: Done");
    } else {
        lmpDebugMsg("DonClothes: ERROR: No clothes!");
    }
}

void PerformInvisTrick()
{
    ActionWait(1.0);
    ActionCastFakeSpellAtObject(SPELL_INVISIBILITY, OBJECT_SELF);
    object oClothes = GetItemPossessedBy(OBJECT_SELF, "lmpPerfCostume");
    if (oClothes != OBJECT_INVALID) {
        ActionUnequipItem(oClothes);
        lmpDebugMsg("PerformInvisTrick: Un-equiped");
    }
    ActionWait(1.0);
    ActionDoCommand(ContinuePerformance(2));
}

void PerformInvisTrick2()
{
    MoveToMyWaypoint("Home");
    //DonClothes();
}

void PerformSong(object oOtherGuy)
{
    FacePC();
    effect eff = EffectVisualEffect(VFX_DUR_BARD_SONG);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eff, OBJECT_SELF, 30.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eff, oOtherGuy, 30.0);
    SetLocalInt(OBJECT_SELF, "lmpBeginPerform", 1);
    ActionStartConversation(oOtherGuy);//GetNearbyPC());
    //DelayCommand(20.0, TerminatePerformBoth());
}

void TerminatePerform()
{
    // Clean up any variables, effects, states, etc.
    int nPerform = GetLocalInt(OBJECT_SELF, "lmpPerform");
    switch (nPerform) {
    case 2:
        // BUG: This doesn't actually work (see above).
        //RemoveEffectType(OBJECT_SELF, EFFECT_TYPE_SLEEP);
        break;
    case 4:
        // prefer to do this later
        //DonClothes();
        break;
    }

    // Go home.
    int nState = GetCurrentState();
    if (nState != 2 && nState != 6 && nState != 10) {
        lmpDebugMsg("ERROR: TerminatePerform: Invalid state", nState);
    } else {
        SetCurrentState(nState + 1);
        FacePC();
        ActionPlayAnimation(ANIMATION_FIREFORGET_BOW);
        ActionWait(2.0);
    }
    MoveHome();
}

void TerminatePerformBoth()
{
    // Tell both performers to go home.
    object oOtherGuy = GetOtherGuy();
    if (oOtherGuy != OBJECT_INVALID)
        AssignCommand(oOtherGuy, TerminatePerform());
    TerminatePerform();
}

void StartPerformBoth()
{
    // Tell both performers to start performing.
    object oOtherGuy = GetOtherGuy();
    if (oOtherGuy != OBJECT_INVALID)
        AssignCommand(oOtherGuy, StartPerform());
    StartPerform();
}

void OnPurseStolen(object oThief)
{
    lmpDebugMsg("OnPurseStolen: Called");
    // Check if I can see the thief.
    // BUG (maybe): It seems that GetObjectSeen *always* sees a rogue or ranger
    // who is hiding in shadows. Invisibility spell or potion makes the thief
    // invisible though.
    if (!GetObjectSeen(oThief))
        lmpDebugMsg("OnPurseStolen: Not seen.");
    if (GetDistanceBetween(OBJECT_SELF, oThief) < 40.0 && GetObjectSeen(oThief))
    {
        lmpDebugMsg("OnPurseStolen: Caught!!!");
        ClearAllActions();
        // Performer 1 utters an exclamation and Performer 2 converses with the
        // thief.
        if (IsPerformer1()) {
            SpeakOneLine(2);
        } else {
            SetLocalInt(OBJECT_SELF, "lmpPerformTheft", 1);
            SetLocalObject(OBJECT_SELF, "lmpPerformThief", oThief);
            ActionStartConversation(oThief);
        }
    }
    lmpDebugMsg("OnPurseStolen: Done.");
}

void SignalPurseStolenBoth(object oThief)
{
    //lmpDebugMsg("SignalPurseStolenBoth: THIEF!");
    object oNPC = GetNearestObjectByTag("lmpPerformer1");
    if (oNPC != OBJECT_INVALID)
        AssignCommand(oNPC, OnPurseStolen(oThief));
    oNPC = GetNearestObjectByTag("lmpPerformer2");
    if (oNPC != OBJECT_INVALID)
        AssignCommand(oNPC, OnPurseStolen(oThief));
}
