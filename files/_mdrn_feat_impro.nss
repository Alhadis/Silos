// Scientific Improvisation
#include "inc_d20"
void main()
{
     object oPC = OBJECT_SELF;
     AssignCommand(oPC, ActionStartConversation(oPC, "_mdrn_conv_impro", TRUE));
    }
