/*
    This script is placed in the on_open event for a door and will cause the door
    to close again after a delay.

    The delay is set in the CloseDelay variable on the door.
*/

void CloseMe()
{
    // Can't close if closed
    if(GetIsOpen(OBJECT_SELF))
    {
        ActionCloseDoor(OBJECT_SELF);
    }
}

void main()
{
    float fDelay = GetLocalFloat(OBJECT_SELF,"CloseDelay");
    DelayCommand(fDelay,CloseMe());
}
