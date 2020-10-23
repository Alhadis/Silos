#include "x0_i0_position"

object oPit = GetLocalObject(OBJECT_SELF, "PAW_PIT");
string sGoTo = GetLocalString(oPit, "DESTINATION");
object oGoTo = GetObjectByTag(sGoTo);

void EnterPit()
{
    //float fDir = GetOppositeDirection(GetFacing(OBJECT_SELF));
    //SetFacing(fDir);
    ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
    ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND));
    ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM7, 0.5, 0.5);
    DelayCommand(0.2, SetCommandable(FALSE, OBJECT_SELF));
    DelayCommand(0.73, SetCommandable(TRUE, OBJECT_SELF));
    DelayCommand(0.75, ActionJumpToObject(oGoTo));
}
void main()
{
    //ActionMoveToLocation(GetLocation(GetNearestObjectByTag("crpp_ropebundle", oPit)));
    ActionDoCommand(EnterPit());
}
