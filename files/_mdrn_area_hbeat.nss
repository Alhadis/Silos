/*
    Used as on_heartbeat event for areas. If area is to have a heartbeat effect
    place the name of the script in the variable Heartbeat on the area.
*/

void main()
{
    //halt if no PCs in area
    if (GetLocalInt(OBJECT_SELF,"NumPCs")<=0) return;

    //check for specific area heartbeat script and run if there is one
    string sScript = GetLocalString(OBJECT_SELF,"Heartbeat");
    if (sScript!="") ExecuteScript(sScript,OBJECT_SELF);
}
