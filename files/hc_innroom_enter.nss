//sr 5.3
// use this script in a area on_enter event of a inn room area.


void main()
{
object oPC = GetEnteringObject();
if (GetIsPC(oPC))
 {
    // this should be left to true as signals area is a inn
    SetLocalInt(OBJECT_SELF, "HCINN", TRUE);
    // set to true if you want to consume food while resting in a INN.
    SetLocalInt(OBJECT_SELF, "FOODNEEDED", FALSE);
    // set to true if you want to limitrest based on last time rested.
    SetLocalInt(OBJECT_SELF, "LIMITREST", FALSE);
    // set to true to limit one time resting in this room.
    SetLocalInt(OBJECT_SELF, "RESTONCE", TRUE);
    // used with restonce to reset rested as pc enters room.
    DeleteLocalInt(oPC, "RESTED");
    //set the following to 1,2, or 3  for x1.5, x2, or x3 hitdie healing in room.
    // defaults to 1 normal bedrest healing (hitdice x 1.5).
    SetLocalInt(OBJECT_SELF, "ROOMTYPE", 3);
 }
}
