void main()
{
object oPC=GetEnteringObject();
object tor=GetNearestObject(OBJECT_TYPE_DOOR,oPC,1);
ActionUnlockObject(tor);
ActionOpenDoor(tor);
}
