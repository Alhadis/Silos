void main()
{
    // define variables; get activator, target, racial type, and gender.
    object oObject = GetItemActivatedTarget();
    object oPC = GetItemActivator();
    location oLocation = GetLocation(oPC);

    CopyObject(oObject,oLocation,oPC);
}
