void main()
{
    object oBauer = GetEnteringObject();

    if(GetResRef(oBauer) == "bauer")
    {
        int iI = 1;
        object oPC;

        while(!GetIsPC(oPC))
        {
            oPC = GetNearestObject(OBJECT_TYPE_CREATURE,oBauer,iI);
            iI++;
        }
        AssignCommand(oBauer,ActionStartConversation(oPC,"_mp_bauer1"));
    }
}
