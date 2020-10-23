// Record damage of target
void main()
{
    SetLocalInt(OBJECT_SELF, "nMdrnConDam", GetTotalDamageDealt());
    SetLocalInt(OBJECT_SELF, "nd20_Hurt", GetTotalDamageDealt());
}
