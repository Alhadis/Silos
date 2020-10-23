void main()
{
object oMe = OBJECT_SELF;
float fDel = GetLocalFloat(oMe, "delay");

DelayCommand(fDel, ActionCloseDoor(oMe));
DelayCommand(fDel + 1.0, SetLocked(oMe, 1));
}