void main()
{
object oPC = GetLastUsedBy();
object oMe = OBJECT_SELF;

if(GetLocked(oMe) == TRUE)
	ActionStartConversation(oPC, "", TRUE, FALSE);
}