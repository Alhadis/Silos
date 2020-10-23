// Collection Purse: OnHeartbeat
// Check if gold was taken recently. (OnDisturbed checks for other objects being
// taken, but it doesn't work for gold.)
// Also empty the purse at the end of the day.

#include "lmpperfmisc"

void CheckGoldStolen()
{
    int nGold = GetGold();
    int nGoldPrev = GetLocalInt(OBJECT_SELF, "lmpPerfGold");
    SetLocalInt(OBJECT_SELF, "lmpPerfGold", nGold);
    //lmpDebugMsg("OnHeartbeatPurse contains", nGold);
    //lmpDebugMsg("OnHeartbeatPurse previous", nGoldPrev);
    if (nGold < nGoldPrev) {
        object oThief = GetLocalObject(OBJECT_SELF, "lmpPerfOpenedBy");
        if (oThief != OBJECT_INVALID) {
            SignalPurseStolenBoth(oThief);
        }
    }
}

void CreateGold(int nGold)
{
    CreateItemOnObject("nw_it_gold001", OBJECT_SELF, nGold);
}

void EmptyPurse()
{
    // NOTE: Did you know that if you do DestroyObject and then CreateItemOnObject
    // they can actually be done in the opposite order?!!? We guard against that
    // by resetting lmpPerfGold first else it can look like something was stolen.
    //lmpDebugMsg("EmptyPurse: contains", GetLocalInt(OBJECT_SELF, "lmpPerfGold"));
    SetLocalInt(OBJECT_SELF, "lmpPerfGold", 0); // do this first to avoid glitches
    object oItem = GetFirstItemInInventory();
    while (oItem != OBJECT_INVALID) {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory();
    }
    // Seed the purse with a bit of gold. An old busking trick.
    // NOTE: Delay 2 seconds, otherwise the gold gets destroyed (see above NOTE).
    DelayCommand(2.0, CreateGold(1));
    //lmpDebugMsg("EmptyPurse: reset to", GetLocalInt(OBJECT_SELF, "lmpPerfGold"));
    //lmpDebugMsg("EmptyPurse: actually contains", GetGold());
}

void main()
{
    // Check if any gold has been stolen from the purse.
    // NOTE: This is a kludge required because OnDisturbed isn't triggered when
    // gold is taken!
    CheckGoldStolen();

    // Empty the contents of the purse once per day.
    // This simulates the performers taking the money at the end of the day.
    int nHour = GetTimeHour();
    int fEmptiedToday = GetLocalInt(OBJECT_SELF, "lmpPerfEmptiedToday");
    if (nHour > 20 && !fEmptiedToday) {
        // Time to clean out the purse.
        SetLocalInt(OBJECT_SELF, "lmpPerfEmptiedToday", TRUE);
        EmptyPurse();
    } else if (nHour < 10 && fEmptiedToday) {
        // reset the variable to indicate this has not yet been done today
        SetLocalInt(OBJECT_SELF, "lmpPerfEmptiedToday", FALSE);
    }
}

