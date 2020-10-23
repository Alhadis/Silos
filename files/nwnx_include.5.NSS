// Name     : NWNX include
// Purpose  : Functions for querying NWNX status and installed plugins
// Author   : Ingmar Stieger
// Modified : 18/11/2006
// Copyright: This file is licensed under the terms of the
//            GNU GENERAL PUBLIC LICENSE (GPL) Version 2
/**/

const string sSpacer = "................................................................................................................................";

// return TRUE if NWNX is installed
int NWNXInstalled()
{
	SetLocalString(GetModule(), "NWNX!INSTALLED", sSpacer);
	if (GetLocalString(GetModule(), "NWNX!INSTALLED") == "TRUE")
		return TRUE;
	else
		return FALSE;
}

// return number of registered plugins / function classes
int NWNXGetPluginCount()
{
	SetLocalString(GetModule(), "NWNX!GET_PLUGIN_COUNT", sSpacer);
	return(StringToInt(GetLocalString(GetModule(), "NWNX!GET_PLUGIN_COUNT")));
}

// return function class specified by parameter nPlugin
string NWNXGetPluginClass(int nPlugin)
{
	SetLocalString(GetModule(), "NWNX!GET_PLUGIN_CLASS!" + IntToString(nPlugin), sSpacer);
	return(GetLocalString(GetModule(), "NWNX!GET_PLUGIN_CLASS!" + IntToString(nPlugin)));
}

string NWNXGetPluginSubClass(string sClass)
{
	SetLocalString(GetModule(), "NWNX!" + sClass + "!GET_SUBCLASS", sSpacer);
	return(GetLocalString(GetModule(), "NWNX!" + sClass + "!GET_SUBCLASS"));
}

string NWNXGetPluginVersion(string sClass)
{
	SetLocalString(GetModule(), "NWNX!" + sClass + "!GET_VERSION", sSpacer);
	return(GetLocalString(GetModule(), "NWNX!" + sClass + "!GET_VERSION"));
}

string NWNXGetPluginDescription(string sClass)
{
	int i;
    string sBigSpacer;
	
    // Create placeholder for (possibly) long descriptions
    for (i = 0; i < 8; i++)     // reserve 8*128 bytes
       	sBigSpacer += sSpacer;
    
	SetLocalString(GetModule(), "NWNX!" + sClass + "!GET_DESCRIPTION", sBigSpacer);
	return(GetLocalString(GetModule(), "NWNX!" + sClass + "!GET_DESCRIPTION"));
}