//#include "inc_utility" //reemplazado por inc_debug
//#include "inc_debug"
#include "Leto_SQL_inc"
//#include "Leto_switches"
//constants defining directories
//must be changed to each install
//alternativly it will use a local string on the module named NWN_DIR if set
//in preference to the constant
const string NWN_DIR = "/home/nwn/";
const string MOD_DIR = "mod/";
const string DB_NAME = "NWNXLeto";
const string DB_GATEWAY_VAR = "NWNXLeto";
const string WP_LIMBO = "";

//set this to true if using build 18 or earlier of letoscript.dll
const int PHEONIX_SYNTAX = FALSE;

/*YOU MUST ADD THE FOLLOWING TO YOUR ON CLIENT EXIT EVENT

    object oPC = GetExitingObject();
    LetoPCExit(oPC);

*/

//Script Types
//taken from the build03.18 release notes
/*
SCRIPT, taking a LetoScript script as a parameter. Example:

void main()
{
    SendMessageToAllDMs("Firing LetoScript test...");

    string LetoTest;
    SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", "<file:open BOB 'g:/nwn/localvault/bob.bic'><FirstName> <LastName>");
    LetoTest = GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");

    SendMessageToAllDMs("Result: #" + LetoTest + "#");
}


SPAWN, taking a LetoScript script as a parameter. Unlike SCRIPT, this
creates a new thread that runs (simultaneously) in the background while
your server goes on doing its business. Running a SCRIPT that takes 10
seconds to complete means your server will hang for 10 seconds while it
waits for the script to complete. Running the same script as a SPAWN means
the server doesn't hang at all, but the script runs "in the background"
instead (and still takes 10 seconds to complete). The result you get back
from SPAWN is the ThreadId created for your script. Record it! Unless you
POLL for that ThreadId, the thread will hang around indefinitely, costing
system resources, until NWNX is shut down. Note that SPAWN does not share
the state that SCRIPT maintains. That is, you cannot operate on a handle
that you have previously opened in a SCRIPT. (In fact, allowing SPAWN and
QFORGET to share state with SCRIPT could have disastrous consequences, and
force scripters using NWNX-Leto to write "thread safe" LetoScript!)

POLL, taking a ThreadId as a parameter. The result will tell you whether
this thread is still working, or has completed. You will get one of three
results: "Error: ### not done." (### is your ThreadId) if the thread is
still working, "Error: ..." for some other error (... is the exact error),
or you will not get "Error:" at the beginning of the string, and instead
you will get the result of your script. ZombieBench provides a very good
example of how to use POLL correctly.

QFORGET, taking a LetoScript script as a parameter. This is a "Queue and
Forget" version of SPAWN. Like SPAWN, the script is queued (it will not
run until all previous SPAWN and QFORGET scripts have completed), but you
cannot POLL for a QFORGET thread, and upon completion the thread is
automatically terminated. You would use QFORGET when you want to multithread
a script, but you don't care what the results are, and you don't need to
wait for it to complete to do something else (such as RCO). There is no
result from QFORGET (just an empty string).

FFORGET, taking a LetoScript script as a parameter. This is the "Fire and
Forget" version of SPAWN, but unlike QFORGET, the thread is created and
the script run immediately, rather than being put at the end of the queue.
Although this sounds like a tempting alternative to QFORGET for a script
you want completed quickly, EXTREME CAUTION must be exercised when using
FFORGET. It is unstable and prone to cause exceptions in the script it
runs. There should be no danger to NWNX itself - although even that isn't
a guarantee.
*/

//instanty runs the letoscript sScript
//for sType see abive
//if sType is POLL, PollThread is atomatically started
//and sPollScript is passed as the script name
string LetoScript(string sScript, string sType = "SCRIPT", string sPollScript = "");

//This command adds the script to the cuttent owner's superscript
//to run the superscript use StackedLetoScripRun
void StackedLetoScript(string sScript);

//poll an existing thread
//when the thread is finished, script sScript is run
void PollThread(string sThreadID, string sScript);

//credit to demux
//gets a bicpath of a pc
//must be servervault to work
string GetBicPath(object oPC);

//credit to demux
//gets the filename of a PCs bic
//must be servervault
string GetBicFileName(object oPC);

//This will automatically add the required code before and after, and will
//adapt based on PC/NPC/etc.
//This overwites the existing object which will break stored references
//such as henchmen. The new object is returned.
//the result of the script is stored on the module in LetoResult for 1 second
//if nDestroyOriginal is set then PCs will be booted and non-pcs will be destroyed
object RunStackedLetoScriptOnObject(object oObject, string sLetoTag = "OBJECT",    string sType = "SCRIPT", string sPollScript = "", int nDestroyOriginal = TRUE);

const int DEBUG = FALSE;

void DoDebug(string s)
{
    WriteTimestampedLogEntry(s);
}

string GetNWNDir()
{
    string sReturn = GetLocalString(GetModule(), "NWN_DIR");
    if(sReturn == "")
        sReturn = NWN_DIR;
    return sReturn;
}

//credit to demux
string GetBicFileName(object oPC)
{
    string sChar, sBicName;
    string sPCName = GetStringLowerCase(GetName(oPC));
    int i, iNameLength = GetStringLength(sPCName);

    for(i=0; i < iNameLength; i++) {
        sChar = GetSubString(sPCName, i, 1);
        if (TestStringAgainstPattern("(*a|*n|*w|'|-|_)", sChar)) {
            if (sChar != " ") sBicName += sChar;
        }
    }
    return GetStringLeft(sBicName, 16);
}

//credit to demux
string GetBicPath(object oPC)
{
    // Gets a local var stored on oPC on "event client enter". I do this because
    // "on even client leave", function GetPCPlayerName() can not be used. Since
    // a .bic file can not be changed while the owner is logged in, it is typical
    // to execute leto scripts when the client leaves (on event client leave).
    string PlayerName = GetLocalString(oPC, "PlayerName");
    if(PlayerName == "")
        PlayerName = GetPCPlayerName(oPC);

    // Retruns the full path to a .bic file.
    return GetNWNDir()+"servervault/"+PlayerName+"/"+GetBicFileName(oPC)+".bic";
}

void VoidLetoScript(string sScript, string sType = "SCRIPT", string sPollScript = "")
{
    LetoScript(sScript,sType,sPollScript);
}

string LetoScript(string sScript, string sType = "SCRIPT", string sPollScript = "")
{
    string sAnswer;
    DoDebug(sType+" >: "+sScript);
    SetLocalString(GetModule(), "NWNX!LETO!"+sType, sScript);
    sAnswer = GetLocalString(GetModule(), "NWNX!LETO!"+sType);
    DoDebug(sType+" <: "+sAnswer);
    if(sType == "SPAWN")
        DelayCommand(1.0, PollThread(sAnswer, sPollScript));
    return sAnswer;
}

void LetoPCEnter(object oPC)
{
    SetLocalString(oPC, "Path", GetBicPath(oPC));
    DeleteLocalString(oPC, "LetoScript");
}

void LetoPCExit(object oPC)
{
    string sScript = GetLocalString(oPC, "LetoScript");
    if(sScript != "")
    {
        string sPath = GetLocalString(oPC, "Path");
        if(sPath == "")
            DoDebug("Path is Null");
        if(PHEONIX_SYNTAX)
        {
            //pheonix syntax
            sScript  = "<file:open CHAR <qq:"+sPath+">>"+sScript;
            sScript += "<file:save CHAR <qq:"+sPath+">>";
            sScript += "<file:close CHAR >";
        }
        else
        {
            //unicorn syntax
            sScript  = "%char= '"+sPath+"'; "+sScript;
            sScript += "%char = '>'; ";
            sScript += "close %char; ";
        }
        string sScriptResult = LetoScript(sScript);
        SetLocalString(GetModule(), "LetoResult", sScriptResult);
        AssignCommand(GetModule(), DelayCommand(1.0, DeleteLocalString(GetModule(), "LetoResult")));
    }
}

void StackedLetoScript(string sScript)
{
    DoDebug("SLS :"+sScript);
    SetLocalString(GetModule(), "LetoScript", GetLocalString(GetModule(), "LetoScript")+ sScript);
}

void PollThread(string sThreadID, string sScript)
{
    if(GetLocalInt(GetModule(), "StopThread"+sThreadID) == TRUE)
        return;
    DoDebug("Polling: "+sThreadID);
    //add blank space to capture error messages
    string sResult = LetoScript(sThreadID+"                                   "
        +"                                   "
        +"                                   "
        +"                                   "
        +"                                   "
        +"                                   "
        +"                                   "
        +"                                   "
        +"                                   ", "POLL");
    if(sResult == "Error: "+sThreadID+" not done.")
    {
        DelayCommand(1.0, PollThread(sThreadID, sScript));
        return;
    }
    else
    {
        DoDebug("Poll: Executing: "+sScript);
        SetLocalInt(GetModule(), "StopThread"+sThreadID, TRUE);
        DelayCommand(6.0, DeleteLocalInt(GetModule(), "StopThread"+sThreadID));
        ExecuteScript(sScript, OBJECT_SELF);
    }
}

void VoidRunStackedLetoScriptOnObject(object oObject, string sLetoTag = "OBJECT",
    string sType = "SCRIPT", string sPollScript = "", int nDestroyOriginal = TRUE)
{
    RunStackedLetoScriptOnObject(oObject,sLetoTag,sType,sPollScript,nDestroyOriginal);
}

object RunStackedLetoScriptOnObject(object oObject, string sLetoTag = "OBJECT",
    string sType = "SCRIPT", string sPollScript = "", int nDestroyOriginal = TRUE)
{
    if(!GetIsObjectValid(oObject))
    {
        WriteTimestampedLogEntry("ERROR: "+GetName(oObject)+"is invalid");
        WriteTimestampedLogEntry("Script was "+GetLocalString(GetModule(), "LetoScript"));
        return OBJECT_INVALID;
    }
    string sCommand;
    object oReturn;
    location lLoc;
    object oWPLimbo = GetWaypointByTag(WP_LIMBO);
    location lLimbo;
    if(GetIsObjectValid(oWPLimbo))
        lLimbo = GetLocation(oWPLimbo);
    else
        lLimbo = GetStartingLocation();
    string sScript = GetLocalString(GetModule(), "LetoScript");
    DeleteLocalString(GetModule(), "LetoScript");
    string sScriptResult;
    //check if its a DM or PC
    //these use bic files
    if(GetIsPC(oObject) || GetIsDM(oObject))
    {
        if(nDestroyOriginal == FALSE)//dont boot
        {
            string sPath = GetLocalString(oObject, "Path");
            if(PHEONIX_SYNTAX)
            {
                sCommand = "<file:open '"+sLetoTag+"' "+sPath+">";
                sScript = sCommand+sScript;
                sCommand = "<file:close '"+sLetoTag+"'>";
                sScript = sScript+sCommand;
                //unicorn
            }
            else
            {
                sCommand = "%"+sLetoTag+" = '"+sPath+"'; ";
                sScript = sCommand+sScript;
                sCommand = "close %"+sLetoTag+"; ";
                sScript = sScript+sCommand;
            }
            sScriptResult = LetoScript(sScript, sType, sPollScript);
        }
        else//boot
        {
            SetLocalString(oObject, "LetoScript", GetLocalString(oObject, "LetoScript")+sScript);
            BootPC(oObject);
            return oReturn;
        }
    }
    //its an NPC/Placeable/Item, go through DB
    else if(GetObjectType(oObject) == OBJECT_TYPE_CREATURE
        || GetObjectType(oObject) == OBJECT_TYPE_ITEM
        || GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE
        || GetObjectType(oObject) == OBJECT_TYPE_STORE
        || GetObjectType(oObject) == OBJECT_TYPE_WAYPOINT)
    {
        if(PHEONIX_SYNTAX)
        {
            //Put object into DB
            StoreCampaignObject(DB_NAME, DB_GATEWAY_VAR, oObject);
            // Reaquire DB with new object in it
            sCommand += "<file:open FPT '" + GetNWNDir() + "database/" + DB_NAME + ".fpt'>";
            //Extract object from DB
            sCommand += "<fpt:extract FPT '"+DB_GATEWAY_VAR+"' "+sLetoTag+">";
            sCommand += "<file:close FPT>";
            sCommand += "<file:use "+sLetoTag+">";
        }
        else
        {
            //unicorn
            //Put object into DB
            string sSQL = "SELECT "+DB_GATEWAY_VAR+" FROM "+DB_NAME+" WHERE "+DB_GATEWAY_VAR+"="+DB_GATEWAY_VAR+" LIMIT 1";
            PRC_SQLExecDirect(sSQL);

            if (PRC_SQLFetch() == PRC_SQL_SUCCESS)
            {
                // row exists
                sSQL = "UPDATE "+DB_NAME+" SET val=%s WHERE "+DB_GATEWAY_VAR+"="+DB_GATEWAY_VAR;
                SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
            }
            else
            {
                // row doesn't exist
                // assume table doesnt exist too
                sSQL = "CREATE TABLE "+DB_NAME+" ( "+DB_GATEWAY_VAR+" TEXT, blob BLOB )";
                PRC_SQLExecDirect(sSQL);
                sSQL = "INSERT INTO "+DB_NAME+" ("+DB_GATEWAY_VAR+", blob) VALUES" +
                    "("+DB_GATEWAY_VAR+", %s)";
                SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
            }
            StoreCampaignObject ("NWNX", "-", oObject);
            // Reaquire DB with new object in it
            //force data to be written to disk
            sSQL = "COMMIT";
            PRC_SQLExecDirect(sSQL);
            sCommand += "sql.connect 'root', '' or die $!; ";
            sCommand += "sql.query 'SELECT blob FROM "+DB_NAME+" WHERE "+DB_GATEWAY_VAR+"="+DB_GATEWAY_VAR+" LIMIT 1'; ";
            sCommand += "sql.retrieve %"+sLetoTag+"; ";
        }
        //store their location
        lLoc = GetLocation(oObject);
        if(!GetIsObjectValid(GetAreaFromLocation(lLoc)))
            lLoc = GetStartingLocation();
        //destroy the original
        if(nDestroyOriginal == TRUE)
        {
            AssignCommand(oObject, SetIsDestroyable(TRUE));
            DestroyObject(oObject);
        }

        sScript = sCommand + sScript;
        sCommand = "";

        if(nDestroyOriginal == TRUE)
        {
        //its an NPC/Placeable/Item, go through DB
            if(PHEONIX_SYNTAX)
            {
                sCommand  = "<file:open FPT '" + GetNWNDir() + "database/" + DB_NAME + ".fpt'>";
                sCommand += "<fpt:replace FPT '" +DB_GATEWAY_VAR+ "' "+sLetoTag+">";
                sCommand += "<file:save FPT>";
                sCommand += "<file:close FPT>";
                sCommand += "<file:close "+sLetoTag+">";
            }
            else
            {
                //unicorn
                sCommand += "sql.query 'SELECT blob FROM "+DB_NAME+" WHERE "+DB_GATEWAY_VAR+"="+DB_GATEWAY_VAR+" LIMIT 1'; ";
                sCommand += "sql.store %"+sLetoTag+"; ";
                sCommand += "close %"+sLetoTag+"; ";
            }
        }

        sScript = sScript + sCommand;
        sScriptResult = LetoScript(sScript, sType, sPollScript);

        if(nDestroyOriginal == TRUE && sType != "POLL")
        {
            if(PHEONIX_SYNTAX)
            {
                if(GetObjectType(oObject) == OBJECT_TYPE_CREATURE)
                {
                    oReturn = RetrieveCampaignObject(DB_NAME, DB_GATEWAY_VAR, lLimbo);
                    AssignCommand(oReturn, JumpToLocation(lLoc));
                }
                else
                    oReturn = RetrieveCampaignObject(DB_NAME, DB_GATEWAY_VAR, lLoc);
            }
            else
            {
                string sSQL = "SELECT blob FROM "+DB_NAME+" WHERE "+DB_GATEWAY_VAR+"="+DB_GATEWAY_VAR+" LIMIT 1";
                SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
                if(GetObjectType(oObject) == OBJECT_TYPE_CREATURE)
                {
                    oReturn = RetrieveCampaignObject("NWNX", "-", lLimbo);
                    AssignCommand(oReturn, JumpToLocation(lLoc));
                }
                else
                    oReturn = RetrieveCampaignObject("NWNX", "-", lLoc);
            }
        }
    }
    SetLocalString(GetModule(), "LetoResult", sScriptResult);
    AssignCommand(GetModule(), DelayCommand(1.0, DeleteLocalString(GetModule(), "LetoResult")));

//    WriteTimestampedLogEntry(GetName(oReturn)+";");
    return oReturn;
}

// Agrega el script a la pila de ejecucion de oPC
void Leto_addScriptToPCStack( object oPC, string sScript );
void Leto_addScriptToPCStack( object oPC, string sScript )
{
    SetLocalString(oPC, "LetoScript", GetLocalString(oPC, "LetoScript")+sScript);
}

// Wrapper de la funcion LetoPCEnter para que coincida con nuestra nomenclatura tipica
void Leto_onEnter( object oPC );
void Leto_onEnter( object oPC )
{
    LetoPCEnter( oPC );
}

// Wrapper de la funcion LetoPCExit para que coincida con nuestra nomenclatura tipica
void Leto_onExit( object oPC );
void Leto_onExit( object oPC )
{
    LetoPCExit( oPC );
}
