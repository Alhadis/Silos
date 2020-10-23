void main()
{
    object oCar = GetEnteringObject();
    if (GetLocalInt(oCar, "nSpeed")>0 && GetLocalInt(oCar, "nMdrnTran")==0)
    {

        // It's a car


        object oTarg;
        object oTran = GetNearestObject(OBJECT_TYPE_TRIGGER);
        if (GetDistanceBetween(oCar, oTran)<30.0)
        {
            oTarg = GetTransitionTarget(oTran);
            SetLocalInt(oCar, "nMdrnTran", 1);
            SetLocalInt(oCar, "nSpeed", 2);
            DelayCommand(30.0, SetLocalInt(oCar, "nMdrnTran", 0));
            AssignCommand(oCar, ClearAllActions());
            AssignCommand(oCar, ActionJumpToLocation(GetLocation(oTarg)));
            SetLocalLocation(oCar, "lMdrnTranLoc", GetLocation(oTarg));
        }
        else
        oTran = GetNearestObject(OBJECT_TYPE_DOOR);
        if (GetDistanceBetween(oCar, oTran)<30.0)
        {
            oTarg = GetTransitionTarget(oTran);
            SetLocalInt(oCar, "nMdrnTran", 1);
            SetLocalInt(oCar, "nSpeed", 2);
            DelayCommand(30.0, SetLocalInt(oCar, "nMdrnTran", 0));
            AssignCommand(oCar, ClearAllActions());
            AssignCommand(oCar, ActionJumpToLocation(GetLocation(oTarg)));
            SetLocalLocation(oCar, "lMdrnTranLoc", GetLocation(oTarg));
        }
    }
}
