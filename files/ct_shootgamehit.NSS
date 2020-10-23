void main()
{
object oPC = GetLastDamager();
int iNum = GetLocalInt(oPC, "shootgamehits");
object oMal = GetObjectByTag("ct_malazar");

SetLocalInt(oPC, "shootgamehits", iNum + 1);
SetLocalInt(oMal, "hit", 1);
AssignCommand(oMal, ActionSpeakString("A solid hit!"));
}