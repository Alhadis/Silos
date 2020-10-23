////////////////////////////////////////////////////////////////////////////////
// Pocket Dimension
//
// 2004 Kensai <kensai@pacbell.net>
////////////////////////////////////////////////////////////////////////////////


const int       pd_debug_level      = 0;

const int       pd_buflen           = 1024;
const string    pd_fn_pad0          = "";
const string    pd_fn_pad16         = "................";
const string    pd_fn_pad32         = "................................";
const string    pd_fn_pad64         = "................................................................";
const string    pd_fn_pad128        = "................................................................................................................................";
const string    pd_fn_pad256        = "................................................................................................................................................................................................................................................................";
const string    pd_var_msg          = "pd_msg";
const string    pd_var_pkey         = "pd_pkey";
const string    pd_var_pname        = "pd_pname";
const string    pd_var_bufpad       = "pd_bufpad";
const string    pd_sep              = "¬";

const string    pd_fn_probe         = "NWNX!PDP!PROBE";
const string    pd_fn_time          = "NWNX!PDP!TIME";


////////////////////////////////////////////////////////////////////////////////
// utility functions
////////////////////////////////////////////////////////////////////////////////


int pd_probe();


////////////////////////////////////////////////////////////////////////////////
// error handling
////////////////////////////////////////////////////////////////////////////////


string pd_last_msg();
void pd_set_msg( string msg );


////////////////////////////////////////////////////////////////////////////////
// internal
////////////////////////////////////////////////////////////////////////////////


int pd_fn( string fn, string parms, string pad = pd_fn_pad64 );


////////////////////////////////////////////////////////////////////////////////
// utility functions
////////////////////////////////////////////////////////////////////////////////


int pd_probe()
{
    object  mod = GetModule();
    
    SetLocalString( mod, pd_fn_probe, "0" );
    return StringToInt( GetLocalString( mod, pd_fn_probe ) );
}


int pd_time()
{
    object  mod = GetModule();
    
    SetLocalString( mod, pd_fn_time, pd_fn_pad32 );
    return StringToInt( GetLocalString( mod, pd_fn_time ) );
}


////////////////////////////////////////////////////////////////////////////////
// error handling
////////////////////////////////////////////////////////////////////////////////


string pd_last_msg()
{
    return GetLocalString( GetModule(), pd_var_msg );
}


void pd_set_msg( string msg )
{
    SetLocalString( GetModule(), pd_var_msg, msg );
}


////////////////////////////////////////////////////////////////////////////////
// Player Info
//
// Since the player name is not available once the player has disconnected,
// we need to store it on the character object so we can do some final cleanup.
// I figure that since things work this way the player name is probably always
// requested over the network.  Assuming this is true it should be faster to
// read a local variable than use the normal GetPCPlayerName call.
////////////////////////////////////////////////////////////////////////////////


string pd_get_pname( object pc )
{
    string pname = GetLocalString( pc, pd_var_pname );

    if( pname == "" )
    {
        pname = GetPCPlayerName( pc );
        SetLocalString( pc, pd_var_pname, pname );
    }
    return pname;
}


string pd_get_pkey( object pc )
{
    string pkey = GetLocalString( pc, pd_var_pkey );

    if( pkey == "" )
    {
        pkey = GetPCPublicCDKey( pc );
        SetLocalString( pc, pd_var_pkey, pkey );
    }
    return pkey;
}


////////////////////////////////////////////////////////////////////////////////
// return format (1+ is all integers >= 1):
// 0  : failure and buffer too short for message
// 1+ : success and buffer too short for message
// 0¬message  : failure and buffer long enough for message
// 1+¬message : success and buffer long enough for message
//
// so if the message length is 1 char then we know we've gotten
// the first response format, otherwise we've gotten the second
////////////////////////////////////////////////////////////////////////////////


int pd_fn( string fn, string parms, string pad )
{
    object  mod = GetModule();

    SetLocalString( mod, fn, parms + pd_sep + pad );

    string  ret = GetLocalString( mod, fn );
    int     sep = FindSubString( ret, pd_sep );

    // if sep was not found then either PDP is not running
    // or it didn't have room for the informative message
    // and just returned the boolean success fail state
    if( sep == -1 )
    {
        pd_set_msg( "" );
        return StringToInt( ret );
    }
    pd_set_msg( GetStringRight( ret, ( GetStringLength( ret ) - sep ) - 1 ) );
    return StringToInt( GetStringLeft( ret, sep ) );
}
