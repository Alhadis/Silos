////////////////////////////////////////////////////////////////////////////////
// Pocket Dimension
//
// 2004 Kensai <kensai@pacbell.net>
////////////////////////////////////////////////////////////////////////////////


#include "pd_base_h"


////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////


const string    pd_fn_get_gvar  = "NWNX!PDP!GET_GVAR";
const string    pd_fn_set_gvar  = "NWNX!PDP!SET_GVAR";
const string    pd_fn_get_cvar  = "NWNX!PDP!GET_CVAR";
const string    pd_fn_set_cvar  = "NWNX!PDP!SET_CVAR";


////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////


const string    pd_int_tag      = "i";
const string    pd_dec_tag      = "d";
const string    pd_str_tag      = "s";
const string    pd_vec_tag      = "v";
const string    pd_loc_tag      = "l";

const string    pd_var_area     = "#AREA#";
const string    pd_var_pos_x    = "#POS_X#";
const string    pd_var_pos_y    = "#POS_Y#";
const string    pd_var_pos_z    = "#POS_Z#";
const string    pd_var_orient   = "#ORIENT#";
const string    pd_var_end      = "#END#";



////////////////////////////////////////////////////////////////////////////////
// wrapper functions
////////////////////////////////////////////////////////////////////////////////


void pd_set_int( string tag, int val, object pc = OBJECT_INVALID );
int pd_get_int( string tag, object pc = OBJECT_INVALID );

void pd_set_dec( string tag, float val, object pc = OBJECT_INVALID );
float pd_get_dec( string tag, object pc = OBJECT_INVALID );

void pd_set_str( string tag, string val, object pc = OBJECT_INVALID );
string pd_get_str( string tag, object pc = OBJECT_INVALID );

void pd_set_vec( string tag, vector val, object pc = OBJECT_INVALID );
vector pd_get_vec( string tag, object pc = OBJECT_INVALID );

void pd_set_loc( string tag, location val, object pc = OBJECT_INVALID );
location pd_get_loc( string tag, object pc = OBJECT_INVALID );


////////////////////////////////////////////////////////////////////////////////
// global
////////////////////////////////////////////////////////////////////////////////


void pd_set_gint( string tag, int val );
int pd_get_gint( string tag );

void pd_set_gdec( string tag, float val );
float pd_get_gdec( string tag );

void pd_set_gstr( string tag, string val );
string pd_get_gstr( string tag );

void pd_set_gvec( string tag, vector val );
vector pd_get_gvec( string tag );

void pd_set_gloc( string tag, location val );
location pd_get_gloc( string tag );


////////////////////////////////////////////////////////////////////////////////
// character
////////////////////////////////////////////////////////////////////////////////


void pd_set_cint( string tag, int val, object pc );
int pd_get_cint( string tag, object pc );

void pd_set_cdec( string tag, float val, object pc );
float pd_get_cdec( string tag, object pc );

void pd_set_cstr( string tag, string val, object pc );
string pd_get_cstr( string tag, object pc );

void pd_set_cvec( string tag, vector val, object pc );
vector pd_get_cvec( string tag, object pc );

void pd_set_cloc( string tag, location val, object pc );
location pd_get_cloc( string tag, object pc );


////////////////////////////////////////////////////////////////////////////////
// internal
////////////////////////////////////////////////////////////////////////////////


string pd_encode_vec( vector val );
vector pd_decode_vec( string val );
string pd_encode_loc( location val );
location pd_decode_loc( string val );


////////////////////////////////////////////////////////////////////////////////
// wrapper
////////////////////////////////////////////////////////////////////////////////


void pd_set_int( string tag, int val, object pc )
{
    if( pc == OBJECT_INVALID )
        pd_set_gint( tag, val );
    else if( GetIsPC( pc ) )
        pd_set_cint( tag, val, pc );
}


int pd_get_int( string tag, object pc )
{
    if( pc == OBJECT_INVALID )
        return pd_get_gint( tag );
    else if( GetIsPC( pc ) )
        return pd_get_cint( tag, pc );
    return 0;
}


void pd_set_dec( string tag, float val, object pc )
{
    if( pc == OBJECT_INVALID )
        pd_set_gdec( tag, val );
    else if( GetIsPC( pc ) )
        pd_set_cdec( tag, val, pc );
}


float pd_get_dec( string tag, object pc )
{
    if( pc == OBJECT_INVALID )
        return pd_get_gdec( tag );
    else if( GetIsPC( pc ) )
        return pd_get_cdec( tag, pc );
    return 0.0;
}


void pd_set_str( string tag, string val, object pc )
{
    if( pc == OBJECT_INVALID )
        pd_set_gstr( tag, val );
    else if( GetIsPC( pc ) )
        pd_set_cstr( tag, val, pc );
}


string pd_get_str( string tag, object pc )
{
    if( pc == OBJECT_INVALID )
        return pd_get_gstr( tag );
    else if( GetIsPC( pc ) )
        return pd_get_cstr( tag, pc );
    return "";
}


void pd_set_vec( string tag, vector val, object pc )
{
    if( pc == OBJECT_INVALID )
        pd_set_gvec( tag, val );
    else if( GetIsPC( pc ) )
        pd_set_cvec( tag, val, pc );
}


vector pd_get_vec( string tag, object pc )
{
    if( pc == OBJECT_INVALID )
        return pd_get_gvec( tag );
    else if( GetIsPC( pc ) )
        return pd_get_cvec( tag, pc );
    return Vector();
}


void pd_set_loc( string tag, location val, object pc )
{
    if( pc == OBJECT_INVALID )
        pd_set_gloc( tag, val );
    else if( GetIsPC( pc ) )
        pd_set_cloc( tag, val, pc );
}


location pd_get_loc( string tag, object pc )
{
    if( pc == OBJECT_INVALID )
        return pd_get_gloc( tag );
    else if( GetIsPC( pc ) )
        return pd_get_cloc( tag, pc );
    return Location( OBJECT_INVALID, Vector(), 0.0 );
}


////////////////////////////////////////////////////////////////////////////////
// global
////////////////////////////////////////////////////////////////////////////////


void pd_set_gint( string tag, int val )
{
    pd_fn( pd_fn_set_gvar,
           pd_int_tag + pd_sep + tag + pd_sep + IntToString( val ),
           pd_fn_pad0 );

}


int pd_get_gint( string tag )
{
    if( !pd_fn( pd_fn_get_gvar, pd_int_tag + pd_sep + tag ) )
        return 0;
    return StringToInt( pd_last_msg() );
}


void pd_set_gdec( string tag, float val )
{
    pd_fn( pd_fn_set_gvar,
		   pd_dec_tag + pd_sep + tag + pd_sep + FloatToString( val ),
		   pd_fn_pad0 );
}


float pd_get_gdec( string tag )
{
    if( !pd_fn( pd_fn_get_gvar, pd_dec_tag + pd_sep + tag ) )
        return 0.0;
    return StringToFloat( pd_last_msg() );
}


void pd_set_gstr( string tag, string val )
{
    pd_fn( pd_fn_set_gvar,
    	   pd_str_tag + pd_sep + tag + pd_sep + val,
    	   pd_fn_pad0 );
}


string pd_get_gstr( string tag )
{
    if( !pd_fn( pd_fn_get_gvar,
    			pd_str_tag + pd_sep + tag,
    			GetLocalString( GetModule(), pd_var_bufpad ) ) )
    {
        return "";
    }
    return pd_last_msg();
}


void pd_set_gvec( string tag, vector val )
{
    pd_fn( pd_fn_set_gvar,
    	   pd_vec_tag + pd_sep + tag + pd_sep + pd_encode_vec( val ),
    	   pd_fn_pad0 );
}


vector pd_get_gvec( string tag )
{
    if( !pd_fn( pd_fn_get_gvar, pd_vec_tag + pd_sep + tag, pd_fn_pad128 ) )
        return Vector();
    return pd_decode_vec( pd_last_msg() );
}


void pd_set_gloc( string tag, location val )
{
    pd_fn( pd_fn_set_gvar,
           pd_loc_tag + pd_sep + tag + pd_sep + pd_encode_loc( val ),
           pd_fn_pad0 );
}


location pd_get_gloc( string tag )
{
    if( !pd_fn( pd_fn_get_gvar, pd_loc_tag + pd_sep + tag, pd_fn_pad256 ) )
        return Location( OBJECT_INVALID, Vector(), 0.0 );
    return pd_decode_loc( pd_last_msg() );
}


////////////////////////////////////////////////////////////////////////////////
// character
////////////////////////////////////////////////////////////////////////////////


void pd_set_cint( string tag, int val, object pc )
{
    pd_fn( pd_fn_set_cvar,
           pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_int_tag + pd_sep + tag + pd_sep + IntToString( val ),
           pd_fn_pad0 );

}


int pd_get_cint( string tag, object pc )
{
    if( !pd_fn( pd_fn_get_cvar, pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_int_tag + pd_sep + tag ) )
        return 0;
    return StringToInt( pd_last_msg() );
}


void pd_set_cdec( string tag, float val, object pc )
{
    pd_fn( pd_fn_set_cvar,
    	   pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_dec_tag + pd_sep + tag + pd_sep + FloatToString( val ),
    	   pd_fn_pad0 );
}


float pd_get_cdec( string tag, object pc )
{
    if( !pd_fn( pd_fn_get_cvar, pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_dec_tag + pd_sep + tag ) )
        return 0.0;
    return StringToFloat( pd_last_msg() );
}


void pd_set_cstr( string tag, string val, object pc )
{
    pd_fn( pd_fn_set_cvar,
		   pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_str_tag + pd_sep + tag + pd_sep + val,
		   pd_fn_pad0 );
}


string pd_get_cstr( string tag, object pc )
{
    if( !pd_fn( pd_fn_get_cvar,
    			pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_str_tag + pd_sep + tag,
    			GetLocalString( GetModule(), pd_var_bufpad ) ) )
    {
        return "";
    }
    return pd_last_msg();
}


void pd_set_cvec( string tag, vector val, object pc )
{
    pd_fn( pd_fn_set_cvar,
           pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_vec_tag + pd_sep + tag + pd_sep + pd_encode_vec( val ),
           pd_fn_pad0 );
}


vector pd_get_cvec( string tag, object pc )
{
    if( !pd_fn( pd_fn_get_cvar, pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_vec_tag + pd_sep + tag, pd_fn_pad128 ) )
        return Vector();
    return pd_decode_vec( pd_last_msg() );
}


void pd_set_cloc( string tag, location val, object pc )
{
    pd_fn( pd_fn_set_cvar,
    	   pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_loc_tag + pd_sep + tag + pd_sep + pd_encode_loc( val ),
    	   pd_fn_pad0 );
}


location pd_get_cloc( string tag, object pc )
{
    if( !pd_fn( pd_fn_get_cvar, pd_get_pname( pc ) + pd_sep + GetName( pc ) + pd_sep + pd_loc_tag + pd_sep + tag, pd_fn_pad256 ) )
        return Location( OBJECT_INVALID, Vector(), 0.0 );
    return pd_decode_loc( pd_last_msg() );
}


////////////////////////////////////////////////////////////////////////////////
// internal
////////////////////////////////////////////////////////////////////////////////


string pd_encode_vec( vector val )
{
    return  pd_var_pos_x + FloatToString( val.x ) +
            pd_var_pos_y + FloatToString( val.y ) +
            pd_var_pos_z + FloatToString( val.z ) +
            pd_var_end;
}


vector pd_decode_vec( string val )
{
    int     beg = FindSubString( val, pd_var_pos_x ) + GetStringLength( pd_var_pos_x );
    int     end = FindSubString( val, pd_var_pos_y );      
    vector  vec;       

    vec.x = StringToFloat( GetSubString( val, beg, end - beg ) );
    beg = end + GetStringLength( pd_var_pos_y );
    end = FindSubString( val, pd_var_pos_z );
    vec.y = StringToFloat( GetSubString( val, beg, end - beg ) );
    beg = end + GetStringLength( pd_var_pos_z );
    end = FindSubString( val, pd_var_end );
    vec.z = StringToFloat( GetSubString( val, beg, end - beg ) );    
    return vec;   
}


string pd_encode_loc( location val )
{
    vector  pos = GetPositionFromLocation( val );
    
    return  pd_var_area + GetTag( GetAreaFromLocation( val ) ) +
            pd_var_pos_x + FloatToString( pos.x ) +
            pd_var_pos_y + FloatToString( pos.y ) +
            pd_var_pos_z + FloatToString( pos.z ) +
            pd_var_orient + FloatToString( GetFacingFromLocation( val ) ) +
            pd_var_end;
}


location pd_decode_loc( string val )
{  
    int     beg     = FindSubString( val, pd_var_area ) + GetStringLength( pd_var_area );
    int     end     = FindSubString( val, pd_var_pos_x );
    int     len     = GetStringLength( val );
    object  area    = GetObjectByTag( GetSubString( val, beg, end - beg ) );
    vector  pos;

    if( area == OBJECT_INVALID )
        return Location( OBJECT_INVALID, Vector(), 0.0 );
    beg = end + GetStringLength( pd_var_pos_x );
    end = FindSubString( val, pd_var_pos_y );
    pos.x = StringToFloat( GetSubString( val, beg, end - beg ) );
    beg = end + GetStringLength( pd_var_pos_y );
    end = FindSubString( val, pd_var_pos_z );
    pos.y = StringToFloat( GetSubString( val, beg, end - beg ) );
    beg = end + GetStringLength( pd_var_pos_z );
    end = FindSubString( val, pd_var_orient );
    pos.z = StringToFloat( GetSubString( val, beg, end - beg ) );
    beg = end + GetStringLength( pd_var_orient );
    end = FindSubString( val, pd_var_end );
    return Location( area, pos, StringToFloat( GetSubString( val, beg, end - beg ) ) );
}
