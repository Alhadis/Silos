/*This script will cause anyone standing in it to
 have the door they touch be unlocked
 Place in the OnEnter of a trigger*/
 
void main()
{
    object oDoor;
    location here;
    here = GetLocation(GetEnteringObject());
    oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
        SetLocked(oDoor, FALSE);

}