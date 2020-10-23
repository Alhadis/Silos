void main()
{
    SetLocalString(GetModule(),"NWNX!INIT","1");
    //Switches
    ExecuteScript("module_switches",OBJECT_SELF);
    ExecuteScript("prc_onmodload", OBJECT_SELF);
    ExecuteScript("x2_mod_def_load",OBJECT_SELF);
}
