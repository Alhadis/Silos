void main()
{
object oIt = GetItemActivatedTarget();
string sTag = GetTag(oIt);
object oPC = GetItemActivator();

SendMessageToPC(oPC, sTag);
}