void main()
{
object wz_oPC= GetEnteringObject();
object wz_oWP_bruecke_nah = GetObjectByTag ("wz_WP_bruecke_nah");

{AssignCommand(wz_oPC, ActionJumpToObject (wz_oWP_bruecke_nah));}
}
