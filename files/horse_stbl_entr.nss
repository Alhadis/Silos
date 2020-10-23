//*************************************
//    Filename:  horse_stbl_entr
/*
    Created by Gregg Anderson
    10/1/2006
*/
//*************************************
void main()
{
    object oPC = GetEnteringObject();

    FloatingTextStringOnCreature("You have entered a stable area.",oPC,FALSE);
    SetLocalInt(oPC,"stables",1);
}
