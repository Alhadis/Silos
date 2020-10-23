void main()
{
object oDoor=GetObjectByTag("UDX1_DOOR_A");
SetLocked(oDoor,FALSE);
AssignCommand(oDoor,ActionOpenDoor(oDoor));
PlaySound("as_sw_lever1");
        PlayAnimation(ANIMATION_PLACEABLE_OPEN);
DelayCommand(1.0,SetLocked(oDoor,TRUE));
DelayCommand(60.0,AssignCommand(oDoor,ActionCloseDoor(oDoor)));

}