#include "Horses_stableinc"

void main()
{
    object enteringObject = GetEnteringObject();

    //SendMessageToPC(GetFirstPC(), "Trigger: entro "+GetName(enteringObject));

    Horses_Stable_Trigger_onEnter( enteringObject );
}
