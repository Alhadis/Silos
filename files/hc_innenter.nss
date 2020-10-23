//sr 5.3
// use this script in a area on_enter event of a inn main area.
// set inn area to disallow rest if you want to force pcs to buy a room (ie rooms are seperate areas).

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
 }
}
