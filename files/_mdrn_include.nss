#include "_mdrn_const"

//Sends a debug message to Any PC and DM on the server as well as the log
void SendDebugMessage(string sText);

//Only gets info from .2das in bugtesting
string DebugGet2DAString(string name, string column, int row );

//Returns an invalid object
object InvalidObject();

//Returns an invalid property
itemproperty InvalidItemProperty();

//Checks to see if the item already has a property on it
int getItemHasProperty(object oItem, itemproperty ipComp);

//Sends a debug message to Any PC and DM on the server as well as the log
void SendDebugMessage(string sText){
    if( MDRN_DEBUG == TRUE ){
        SendMessageToAllDMs(sText);
        WriteTimestampedLogEntry(sText);
        object oPC=GetFirstPC();
        while(GetIsObjectValid(oPC)){
            SendMessageToPC(oPC,sText);
            oPC=GetNextPC();
        }
    }
}

//Load Script Debugger
void MdrnDebugger(){
    if( MDRN_DEBUG == TRUE )
        SpawnScriptDebugger();
}
//Only gets info from .2das in bugtesting
string DebugGet2DAString(string name, string column, int row ){
    if( MDRN_DEBUG == TRUE )
        return Get2DAString(name, column, row);
    else
        return "";
}

//Returns an invalid object
object InvalidObject(){
    return GetObjectByTag("..$!#12");
}

//Returns an invalid property
itemproperty InvalidItemProperty(){
    return GetFirstItemProperty(InvalidObject());
}

//Checks to see if the item already has a property on it
int getItemHasProperty(object oItem, itemproperty ipComp)
{
    int ipCompDuration = GetItemPropertyDurationType( ipComp );

    itemproperty ipCurProp = GetFirstItemProperty( oItem );

    while ( GetIsItemPropertyValid(ipCurProp) )
    {
        if (
            ( GetItemPropertyType(ipCurProp) == GetItemPropertyType(ipComp) ) &&
            ( GetItemPropertySubType(ipCurProp) == GetItemPropertySubType(ipComp) ) &&
            ( GetItemPropertyDurationType(ipCurProp) == ipCompDuration ) &&
            ( GetItemPropertyParam1(ipCurProp) == GetItemPropertyParam1(ipComp) ) &&
            ( GetItemPropertyParam1Value(ipCurProp) == GetItemPropertyParam1Value(ipComp) )
           )
                            return TRUE;
        ipCurProp = GetNextItemProperty( oItem );
    }

    return FALSE;
}

//Translate to string the variety of item properties.
string ipTypeToString(int type){
    return DebugGet2DAString("itemprops", "Label", type);
}

string ipSkillSubTypeToString(int type){
    return DebugGet2DAString("skills", "Label", type);
}

string FeatNameToString(int type){
    return DebugGet2DAString("feat", "Label", type);
}

string ipParam1ToString(int type){
    return DebugGet2DAString("iprp_paramtable", "Label", type);
}

string ipParam1ValueToString(int type, int val){
    return DebugGet2DAString(DebugGet2DAString("iprp_paramtable", "TableResRef", type), "Label", val);
}

//Character Information Debugging: Exports all information about a character to string

