void main()
{
object oPC = GetPCSpeaker();
object oTar = GetLocalObject(oPC, "stool_fix_object");

SetLocalString(oPC, "Item_Name_Bev", GetName(oTar));
SetLocalInt(oPC, "Item_Name_Activ", 1);
}
