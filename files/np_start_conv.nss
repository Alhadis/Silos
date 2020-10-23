void main()
{

        object oPC = GetEnteringObject();
        object oMold = GetObjectByTag("mold_conv_a");
        AssignCommand (oPC, ActionStartConversation(oMold));
}
