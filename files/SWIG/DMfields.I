/*
$Author: hans $
$Revision: 1.1.1.1 $
$Date: 2001/12/17 22:39:31 $
$Locker:  $
$Log: DMfields.I,v $
Revision 1.1.1.1  2001/12/17 22:39:31  hans
Initial import to CVS

# Revision 340.0  1997/05/27  23:09:26  root
# COMMENT : Initial checkin to 3.4.0 RCS from 3.3.0 src
#
# Revision 330.1  1996/09/19  08:55:24  satya
# COMMENT : Dimensions: Implemented text clearance gap for vertical dimensions
#
# Implemented text clearance gap for veritical line dimensioning  
#  -Bala TR#11925984
#
# Revision 320.0  1994/12/12  17:52:57  root
# COMMENT : Initial checkin to 3.2 RCS from 3.1 src
#
# Revision 240.4  1993/11/01  05:24:26  samuel
# COMMENT : 119310726 - Alt mode chars in prefix & suffix
#
# Revision 240.3  1993/09/20  08:52:44  samuel
# COMMENT : Changes for SGI compilation
#
# Revision 240.2  1993/06/07  11:44:06  gvk
# COMMENT : TR# 11912649 - Added ESC seq to reduce size of tol value in single string.
#
# Revision 240.1  1992/12/31  15:14:25  mike
# COMMENT : TR119222870 - remove fi.h dependencies, use exfi.h definitions instead
#
# Revision 240.0  1992/12/06  23:48:00  tim
# COMMENT : Initial checkin to 2.4 RCS
#
# Revision 220.0  1992/08/29  06:26:41  root
# COMMENT : Corresponds to Rel201.11 in 2.0.1 RCS
#
Revision 201.11  1992/07/30  09:08:30  gvk
COMMENT : Fix for tolerance format in dual mode.

Revision 201.9  1992/01/20  07:58:41  dimdp20
COMMENT : Dimension Fixes Release - S. Poovannan - Jan 20 1992

*/

class implementation DMroot;

#define AS_DEBUG 1

%safe
#include "exfi.h"
#include "math.h"
%endsafe

#include "dimtxtdef.h"
#include "fielddef.h"
#include "dimtxt.h"

extern struct DMglobal DM_global;
extern struct DMglobal_param frm_glob;

#define WHITE_SPACE_COMPENSATION 0.331366


IGRint DMstart_str(dim_text, field_num, std_arr)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
/*.DMstart_str*/
{
	IGRuchar *text_ptr;
    struct DMloc_param p_loc;
	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr, field_num, ATTR_NON_EDITABLE,dim_text->length);

   /* Fix for TR#11925984  */
    dm$get_dim_param(
            type = DM_LOC_PARAM,
            p_data = (char *) &p_loc);
    if( p_loc.txt_posn == TXT_POSN_EMBEDDED ||
        p_loc.txt_orie == TXT_ORIE_HORIZONTAL ||
        p_loc.txt_orie == TXT_ORIE_VERTICAL)
    {    
      horizon_move(text_ptr, std_arr->dm_text_clear,dim_text->length);
      vertical_move(text_ptr, std_arr->dm_text_clear,dim_text->length); 
    } 

	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMcompute_prefix(prefix_val, dim_text, field_num, std_arr,kanji_font,text_font)
char *prefix_val;
struct DMtxt_str *dim_text;
int field_num;
struct DMstd_param *std_arr;
IGRshort kanji_font,text_font;
/*.DMcompute_prefix*/
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];

	start_field(text_ptr, field_num, ATTR_EDITABLE, dim_text->length);

	/* Add prefix */

	DMadd_prefix_suffix(dim_text,prefix_val,text_font,kanji_font);
	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr, field_num+1, ATTR_NON_EDITABLE,dim_text->length);
	horizon_move(text_ptr, std_arr->dm_pre_suf_gap,dim_text->length);
	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMtext_box(dim_text, field_num)
struct DMtxt_str *dim_text;
int field_num;
/*.DMtext_box*/
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];

	start_field(text_ptr,field_num,ATTR_EDITABLE,dim_text->length);
	return(TRUE);
}

IGRint DMcompute_symbol_text(osnum,symbol_struct,dim_text,field_num,std_arr,act_font)
OMuword osnum;
struct DMsymbol_info *symbol_struct;
struct DMstd_param *std_arr;
struct DMtxt_str *dim_text;
int field_num;
short act_font;
/*.DMcompute_symbol_text*/
{
	OMuword font_num;
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];

	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);

	if(field_num == FNUM_SYMBOL_AFTER)
		horizon_move(text_ptr,std_arr->dm_sym_gap,dim_text->length);

	if(symbol_struct){
		font_num = DMmap_font(osnum, symbol_struct->font_num);
		change_font(text_ptr, font_num, dim_text->length);
		*text_ptr++ = symbol_struct->font_char;
	}
	else *text_ptr++ = 'R'; /*   radial no need to change font */

	dim_text->length++; /* symbol character*/
	if(symbol_struct)
		change_font(text_ptr,act_font,dim_text->length);

	if(field_num == FNUM_SYMBOL_BEFORE)
		horizon_move(text_ptr,std_arr->dm_sym_gap,dim_text->length);

	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMcompute_single_start(dim_text,field_num,std_arr,loc_param)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
struct DMloc_param *loc_param;
/*.DMcompute_single_start*/
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];

	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	end_field(text_ptr,dim_text->length);

	field_num++;
	start_field(text_ptr, field_num, ATTR_EDITABLE,dim_text->length);
	return(TRUE);
}

IGRint DMcompute_single_end(dim_text,field_num,std_arr,p_par_loc,move_flag)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
IGRint move_flag;
struct DMloc_param *p_par_loc;
/*.DMcompute_single_end*/
{
	IGRuchar *text_ptr;
	int f_no;
	double zero , val1, val2,back,half;
	double white_space = WHITE_SPACE_COMPENSATION;
	
	text_ptr = &dim_text->str[dim_text->length];

	zero = 0.0;
	back = 0.33;
	val1 = 0.001;
	val2 = 0.0;
	half = -0.5;
	
	text_ptr = &dim_text->str[dim_text->length];

	end_field(text_ptr,dim_text->length);
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	if (!move_flag)
	{
		f_no = FNUM_SINGLE_START;
		move_to_field(text_ptr,f_no,RIGHT_BASE,val1,val2,dim_text->length); 
		f_no = FNUM_SINGLE_START +1 ;
		move_to_field(text_ptr,f_no,RIGHT_CENTER,val2,val1,dim_text->length);
	}
	else
	{
		f_no = FNUM_SINGLE_START +1 ;
		move_to_field(text_ptr,f_no,RIGHT_BASE,zero,zero,dim_text->length);
	}

	/* - Compensate by adding a horizontal move - */

	horizon_move(text_ptr, white_space, dim_text->length);
	end_field(text_ptr,dim_text->length);

	return(TRUE);
}


IGRint DMdual_above_start(dim_text,field_num,std_arr,env_param,loc_param)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int 	field_num;
struct DMenv_param *env_param;
struct DMloc_param *loc_param;

/*.DMdual_above_start*/
{
	int f_no;
	IGRuchar *text_ptr;
	double zero  = 0.0, half = 0.5;
	
	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);	/* field to refer  */
	end_field(text_ptr,dim_text->length);
	f_no = field_num+1;
	start_field(text_ptr,f_no,ATTR_NON_EDITABLE,dim_text->length);		/* justification field */
	vertical_move(text_ptr,half,dim_text->length);
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr,f_no+1,ATTR_EDITABLE,dim_text->length);		/*  upper justification field   */
	justify_field(text_ptr,LEFT_CENTER,zero,dim_text->length);
	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr,f_no+2,ATTR_EDITABLE,dim_text->length);
								/* field for the dim string  */
	return(TRUE);
}

IGRint DMdual_above_middle(dim_text,field_num,std_arr,p_par_loc)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
struct DMloc_param *p_par_loc;
int field_num;
/*.DMdual_above_middle*/
{
	IGRuchar *text_ptr;
	int  f_no;
	double zero = 0.0;
	double dm_dual_off;

	text_ptr = &dim_text->str[dim_text->length];

	end_field(text_ptr,dim_text->length);
	f_no = FNUM_DUAL_START;
	
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	/* - check if f_no + 2 works for both cases*/
	if(p_par_loc->tole_mode == TOLE_MODE_REF /* && type is paren */)
		move_to_field(text_ptr,f_no + 2,LEFT_BASE,zero,zero,dim_text->length);
	else
		move_to_field(text_ptr,f_no + 3,LEFT_BASE,zero,zero,dim_text->length);

	dm_dual_off = -std_arr->dm_dual_off;
	vertical_move(text_ptr,dm_dual_off,dim_text->length);
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr,field_num+1,ATTR_EDITABLE,dim_text->length);
	justify_field(text_ptr,LEFT_CAP,zero,dim_text->length);
	return(TRUE);	
}

IGRint DMdual_above_end(dim_text,field_num,std_arr,p_par_loc)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
struct DMloc_param *p_par_loc;
/*.DMdual_above_end*/
{
	IGRuchar *text_ptr;
	int f_no;
	double zero = 0.0;
	double white_space = WHITE_SPACE_COMPENSATION;
	double half = -0.5;

	text_ptr = &dim_text->str[dim_text->length];

	end_field(text_ptr,dim_text->length);		/* End of the lower_dimension*/
	end_field(text_ptr,dim_text->length);		/* End of the  dual dimension*/
	
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	f_no = FNUM_DUAL_START+2;		/* dual dimension begin  */
	move_to_field(text_ptr,f_no,RIGHT_CENTER,zero,zero,dim_text->length);
	vertical_move(text_ptr, half, dim_text->length);
	horizon_move(text_ptr, white_space, dim_text->length);
	end_field(text_ptr,dim_text->length);

	return(TRUE);
}

IGRint DMadd_dimension_field(dim_text,field_num,dimn_val,env_param,p_loc,p_misc,mode)
struct DMtxt_str *dim_text;
struct DMenv_param *env_param;
IGRdouble dimn_val;
int field_num;
struct DMmisc_param *p_misc;
struct DMloc_param *p_loc;
int mode;
/*.DMadd_dimension_field*/
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];
	
	start_field(text_ptr,field_num,ATTR_DIM_TYPE,dim_text->length);

	if( p_misc->mod_comp == MOD_COMP_DYNAMIC)
        {
         	DMcompute_dim_string(dim_text,p_loc,env_param,
                                     dimn_val,p_misc,mode);
        }
        else
	{
		/*| function to check if input is kanji */
		DMadd_prefix_suffix(dim_text,
			    p_misc->dim_override,
			    env_param->text_font,
			    p_misc->sixteen_bit_font);
	}

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMadd_angular_field(osnum,dim_text,dim_field_no,dimn_val,p_env,
		    p_loc,p_misc)
OMuword osnum;
struct DMtxt_str *dim_text;
int dim_field_no;
struct DMenv_param *p_env;
IGRdouble dimn_val;
struct DMmisc_param *p_misc;
struct DMloc_param *p_loc;
/*.DMadd_angular_field*/
{
	IGRuchar *text_ptr;
	struct measure_unit *unit_type;

	text_ptr = &dim_text->str[dim_text->length];
	
	start_field(text_ptr,dim_field_no,ATTR_DIM_TYPE,dim_text->length);

	unit_type = &p_loc->primary;
	unit_type->decacc = p_loc->angular.decacc;
	unit_type->fraacc = p_loc->angular.fraacc;

	if(p_misc->mod_comp == MOD_COMP_DYNAMIC)
		DMadd_angular_text(osnum, dim_text,unit_type,dimn_val,p_loc,p_env);
	else
	{
		/*| function to check if input is kanji */
		DMadd_prefix_suffix(dim_text,
			    p_misc->dim_override,
			    p_env->text_font,
			    p_misc->sixteen_bit_font);
		if( p_env->ang_unit != ANG_UNIT_RAD)
			DMadd_symbol_text(
				osnum,
				dim_text,
				&DM_global.symbol_info[p_env->dim_stan][SYM_TYPE_ANGULAR],
				p_env->text_font);
	}

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMtol_up_low_start_ansi(dim_text,dim_field,field_num,
		   std_arr,tol_size,tol_weig , descent_r)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
int dim_field;
IGRdouble tol_size;
char tol_weig;
IGRdouble descent_r;
/*.DMtol_up_low_start_ansi*/
{
	IGRuchar *text_ptr;
	double zero = 0.0;
	double hori_move,vert_move;
	double  dim_size;

	dim_size = 1/tol_size;

	text_ptr = &dim_text->str[dim_text->length];

	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	change_size(text_ptr, tol_size,dim_text->length);
	move_to_field(text_ptr,dim_field,RIGHT_CENTER,zero,zero,dim_text->length);

	hori_move = std_arr->dm_tol_hor_gap *dim_size;
	horizon_move(text_ptr,hori_move,dim_text->length);

	vert_move = std_arr->dm_tol_ver_gap - descent_r;
	vertical_move( text_ptr, vert_move,dim_text->length);

	change_weight(text_ptr,tol_weig,dim_text->length);
	end_field(text_ptr,dim_text->length);
	start_field(text_ptr,field_num + 1,ATTR_EDITABLE,dim_text->length);
	return(TRUE);
}
IGRint DMtol_up_low_start_iso(dim_text,dim_field,field_num,
		   std_arr,tol_size,tol_weig , descent_r)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
int dim_field;
IGRdouble tol_size;
char tol_weig;
IGRdouble descent_r;
/*.DMtol_up_low_iso*/
{
	IGRuchar *text_ptr;
	double zero = 0.0;
	double hori_move,vert_move;
	double  dim_size;

	dim_size = 1/tol_size;

	text_ptr = &dim_text->str[dim_text->length];

	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	change_size(text_ptr, tol_size,dim_text->length);
	move_to_field(text_ptr,dim_field,RIGHT_BASE,zero,zero,dim_text->length);

	hori_move = std_arr->dm_tol_hor_gap *dim_size;
	horizon_move(text_ptr,hori_move,dim_text->length);

	vert_move = 1 + 2* std_arr->dm_tol_ver_gap - descent_r;
	vertical_move( text_ptr, vert_move,dim_text->length);

	change_weight(text_ptr,tol_weig,dim_text->length);
	end_field(text_ptr,dim_text->length);
	start_field(text_ptr,field_num + 1,ATTR_EDITABLE,dim_text->length);
	return(TRUE);
}

IGRint DMtol_up_low_center_ansi(dim_text,dim_field,field_num,std_arr,tol_size, descent_r)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
int dim_field;
IGRdouble tol_size, descent_r;
/*.DMtol_up_low_center_ansi*/
{
	IGRuchar *text_ptr;
	double zero = 0.0;
	double hori_move,vert_move;
	double dim_size ;


	dim_size = 1/ tol_size;
	text_ptr = &dim_text->str[dim_text->length];

	end_field(text_ptr,dim_text->length);

	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
		move_to_field(text_ptr,dim_field,RIGHT_CENTER,zero,zero,dim_text->length);

		hori_move  = (std_arr->dm_tol_hor_gap * dim_size);
		horizon_move(text_ptr,hori_move,dim_text->length);

		vert_move = 1.0 + std_arr->dm_tol_ver_gap - descent_r;
		vert_move = -vert_move ;	/* Move Down */
		vertical_move(text_ptr, vert_move,dim_text->length);

	end_field(text_ptr,dim_text->length);

	start_field(text_ptr, field_num+1, ATTR_EDITABLE,dim_text->length);
	return(TRUE);
}
IGRint DMtol_up_low_center_iso(dim_text,dim_field,field_num,std_arr,tol_size, descent_r)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
int dim_field;
IGRdouble tol_size, descent_r;
/*.DMtol_up_low_center_iso*/
{
	IGRuchar *text_ptr;
	double zero = 0.0;
	double hori_move;
	double dim_size ;


	dim_size = 1/ tol_size;
	text_ptr = &dim_text->str[dim_text->length];

	end_field(text_ptr,dim_text->length);

	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
		move_to_field(text_ptr,dim_field,RIGHT_BASE,zero,zero,dim_text->length);

		hori_move  = (std_arr->dm_tol_hor_gap * dim_size);
		horizon_move(text_ptr,hori_move,dim_text->length);

	end_field(text_ptr,dim_text->length);

	start_field(text_ptr, field_num+1, ATTR_EDITABLE,dim_text->length);
	return(TRUE);
}

IGRint DMtol_up_low_end_ansi(dim_text,field_num,std_arr,tol_size,text_weight,descent_r)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
int text_weight;
IGRdouble tol_size,descent_r;
/*.DMtol_up_low_end_ansi*/
{
	IGRuchar *text_ptr;
	double dim_size, vert_move;

	dim_size = 1/tol_size;

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr, field_num, ATTR_NON_EDITABLE,dim_text->length);
		change_size(text_ptr, dim_size,dim_text->length);
		vert_move = (1.0 - descent_r + std_arr->dm_tol_ver_gap)*tol_size - 0.5;
		vertical_move(text_ptr,vert_move,dim_text->length);
		change_weight(text_ptr,text_weight,dim_text->length);

	end_field(text_ptr,dim_text->length);
	return(TRUE);
}
IGRint DMtol_up_low_end_iso(dim_text,field_num,std_arr,tol_size,text_weight,descent_r)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
int text_weight;
IGRdouble tol_size,descent_r;
/*.DMtol_up_low_end_iso*/
{
	IGRuchar *text_ptr;
	double dim_size;

	dim_size = 1/tol_size;

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr, field_num, ATTR_NON_EDITABLE,dim_text->length);
		change_size(text_ptr, dim_size,dim_text->length);
		change_weight(text_ptr,text_weight,dim_text->length);
	end_field(text_ptr,dim_text->length);
	return(TRUE);
}


IGRint DMtol_middle_start(dim_text,field_num,dim_field,std_arr,tol_size,tol_weig)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num, dim_field;
IGRdouble tol_size;
char   tol_weig;
/*.DMtol_middle_start*/
{
	IGRuchar *text_ptr;
	double dim_size;
	double zero = 0.0;

	dim_size = 1/tol_size;
	text_ptr = &dim_text->str[dim_text->length];
	
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
		move_to_field(text_ptr,dim_field,RIGHT_BASE,zero,zero,dim_text->length);
		horizon_move(text_ptr,std_arr->dm_tol_hor_gap,dim_text->length);
	change_size(text_ptr, tol_size,dim_text->length);
	change_weight(text_ptr,tol_weig,dim_text->length);
	end_field(text_ptr,dim_text->length);

	field_num++;
	start_field(text_ptr, field_num, ATTR_NON_EDITABLE,dim_text->length);
	return(TRUE);
}

IGRint DMtol_middle_end( dim_text, field_num, tol_size, text_weight)
struct DMtxt_str *dim_text;
int    field_num;
IGRdouble tol_size;
int    text_weight;
/*.DMtol_middle_end*/
{
	IGRuchar *text_ptr;
	double dim_size;

	dim_size = 1/tol_size;

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	field_num++;
	start_field(text_ptr, field_num, ATTR_NON_EDITABLE,dim_text->length);
		change_size(text_ptr, dim_size,dim_text->length);
		change_weight(text_ptr,text_weight,dim_text->length);
	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMtol_end( dim_text)
struct DMtxt_str *dim_text;
/*.DMtol_end*/
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMtol_limit_start(dim_text,field_num,std_arr) 
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr; 
int field_num;
/*.DMtol_limit_start*/
{
	IGRuchar *text_ptr;
	double offset;

	text_ptr = &dim_text->str[dim_text->length];
	
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	offset = (std_arr->dm_lim_ver_gap + 0.5);
	vertical_move(text_ptr,offset,dim_text->length);
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr, field_num + 1, ATTR_DIM_TYPE,dim_text->length);
	return(TRUE);
}

IGRint DMtol_limit_center(dim_text,field_num,orig_field,std_arr)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr; 
int field_num,orig_field;
/*.DMtol_limit_center*/
{
	IGRuchar *text_ptr;
	double zero = 0.0;
	double lim_off_b;

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	
	start_field(text_ptr,field_num ,ATTR_NON_EDITABLE,dim_text->length);
	move_to_field(text_ptr,orig_field,LEFT_BASE,zero,zero,dim_text->length);
	lim_off_b = -2 *( 0.5 +  std_arr->dm_lim_ver_gap);
	vertical_move(text_ptr,lim_off_b,dim_text->length);
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr,field_num + 1,ATTR_DIM_TYPE,dim_text->length);
	return(TRUE);
}

IGRint DMadd_label_field( dim_text,field_num,str,flag)
struct DMtxt_str *dim_text;
int field_num;
char *str;
int flag;
/*.DMadd_label_field*/
{
	IGRuchar *text_ptr;
	int len;

	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	len = strlen( str);
	memcpy( &dim_text->str[dim_text->length],str,len);
	dim_text->length += len;
	text_ptr = &dim_text->str[dim_text->length];
	end_field( text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMtol_lim_end( dim_text,field_num,std_arr)
struct DMtxt_str *dim_text;
struct DMstd_param *std_arr;
int field_num;
/*.DMtol_lim_end*/
{
	IGRuchar *text_ptr;
	double offset;

	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	offset = std_arr->dm_lim_ver_gap + 0.5;
	vertical_move(text_ptr,offset,dim_text->length);
	end_field(text_ptr,dim_text->length);	
	return(TRUE);
}

IGRint DMcompute_suffix(suffix_val,dim_text,field_num,std_arr,kanji_font,text_font)
char *suffix_val;
struct DMstd_param *std_arr;
struct DMtxt_str *dim_text;
int field_num;
IGRshort kanji_font, text_font;
/*.DMcompute_suffix*/
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];

	/*"dm_pre_suf_gap=%lf\n", std_arr->dm_pre_suf_gap*/

	start_field(text_ptr,field_num ,ATTR_NON_EDITABLE,dim_text->length);
	horizon_move(text_ptr,std_arr->dm_pre_suf_gap,dim_text->length);
	end_field(text_ptr,dim_text->length);

	start_field(text_ptr,field_num + 1 ,ATTR_EDITABLE,dim_text->length);

	DMadd_prefix_suffix(dim_text,suffix_val,text_font,kanji_font);
	text_ptr = &dim_text->str[dim_text->length];

	end_field(text_ptr,dim_text->length);

	return(TRUE);
}

IGRint DMend_dim(dim_text,field_num,std_arr)
struct DMstd_param *std_arr;
struct DMtxt_str *dim_text;
int field_num;
/*.DMend_dim*/
{
	IGRuchar *text_ptr;
	double factor;
    struct DMloc_param p_loc;
	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	factor  = std_arr->dm_text_clear;
   
  /* Fix for TR#11925984  */ 
    dm$get_dim_param(
            type = DM_LOC_PARAM,
            p_data = (char *) &p_loc);
    if( p_loc.txt_posn == TXT_POSN_EMBEDDED ||
        p_loc.txt_orie == TXT_ORIE_HORIZONTAL ||
        p_loc.txt_orie == TXT_ORIE_VERTICAL)
     {
       horizon_move(text_ptr,factor,dim_text->length);
       vertical_move(text_ptr,factor,dim_text->length); 
     } 

   					/* end space is same as dim_start */
	end_field(text_ptr,dim_text->length);
	return(TRUE);	
}

IGRint DMadd_symbol_text(osnum,dim_text, p_sym,text_font)
OMuword osnum;
struct DMtxt_str *dim_text;
struct DMsymbol_info *p_sym;
short text_font;
/*.DMadd_symbol*/
{
	OMuword font_num;
        IGRuchar *text_ptr;

        text_ptr = &dim_text->str[dim_text->length];

	if (osnum != NULL)
		font_num = DMmap_font(osnum, p_sym->font_num);
	else	font_num = p_sym->font_num;

	change_font(text_ptr, font_num,dim_text->length);
        *text_ptr++ = p_sym->font_char;
	dim_text->length += 1;
        change_font(text_ptr,text_font,dim_text->length);

        return(TRUE);
}

IGRint DMreturn_dim_field(dim_mode,dim_type,tole_mode,unit_mode,field_no)
int dim_mode,dim_type,tole_mode,unit_mode,*field_no;
/*.DMreturn_dim_field*/
{
	int type;

	if( dim_mode == DM_UNKNOWN_NUM)
	{
		if( dim_type == DM_UNKNOWN_NUM)
			*field_no = 0;
		else if( dim_type == FNUM_SINGLE_START  )
			*field_no = dim_type +2;
		else if ( dim_type == FNUM_DUAL_START )
			*field_no = dim_type +4;
		else if ( dim_type == FNUM_DUAL_MIDDLE)
			*field_no = dim_type +2;

		if( tole_mode == TOLE_MODE_LIMITS)
		   *field_no = dim_type + DM_DIM_OFFSET +/* tol field start*/
				DM_TOL_OFFSET + 	 /*  tol middle start */
				   DM_TOL_OFFSET + /*  tolerance limits start */
				   1 ;		/*  one field for just   */
	}
	else
	{
		if(dim_mode == DUAL_MODE_OFF)
		{
			*field_no = FNUM_SINGLE_START+2;
			type = FNUM_SINGLE_START;
		}
		else if(unit_mode == PRIMARY_UNIT)
		{
			type = FNUM_DUAL_START;
			*field_no = FNUM_DUAL_START +4;
		}
		else    
		{
			*field_no = FNUM_DUAL_MIDDLE +2;
			type = FNUM_DUAL_MIDDLE;
		}

		if( tole_mode == TOLE_MODE_LIMITS)
			*field_no = type + DM_DIM_OFFSET +/*tole field start */
				   DM_TOL_OFFSET + /*  tolerance middle start */
				   DM_TOL_OFFSET + /*  tolerance limits start */
				   1 ;		/*  one field for just   */
	}
	return(TRUE);
}

IGRint DMmake_alter_text(osnum,dim_text,dimn_val, p_env,p_loc,p_misc,std_arr ,mea_type)
OMuword osnum;
struct DMtxt_str *dim_text;
IGRdouble dimn_val;
struct DMenv_param *p_env;
struct DMloc_param *p_loc;
struct DMmisc_param *p_misc;
struct DMstd_param *std_arr;
int mea_type;
/*.DMmake_alter_text*/
{
	int metric, dim_field_no;
	IGRuchar *text_ptr;
	struct DMsymbol_info *symbol_struct;
	IGRboolean parens_on, suffix_on, subfix_on;
	double zero = 0.0;
	double white_space = WHITE_SPACE_COMPENSATION;
	symbol_struct = NULL;
	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr,FNUM_DIM_ALT_START,ATTR_EDITABLE,dim_text->length);
	
   /* Fix for TR#11925984  */
    if( p_loc->txt_posn == TXT_POSN_EMBEDDED || 
        p_loc->txt_orie == TXT_ORIE_HORIZONTAL ||
        p_loc->txt_orie == TXT_ORIE_VERTICAL)
     {
       horizon_move(text_ptr, std_arr->dm_text_clear,dim_text->length);
       vertical_move(text_ptr, std_arr->dm_text_clear,dim_text->length);
     } 
	
	if (p_loc->tole_mode == TOLE_MODE_REF)
	{
		parens_on = (frm_glob.ref_type == REF_TYPE_PARENS);
		suffix_on = (frm_glob.ref_type == REF_TYPE_SUFFIX);
		subfix_on = (frm_glob.ref_type == REF_TYPE_SUBFIX);
	}
	else	parens_on = suffix_on = subfix_on = FALSE;

	if (p_misc->prefix_disp == DISP_ON && strlen(p_misc->prefix))
	{
		DMcompute_prefix(p_misc->prefix,
				 dim_text,
				 FNUM_PREFIX_START,
				 std_arr,
				 p_misc->sixteen_bit_font,
				 p_env->text_font);
	}

	if (p_env->sym_posn != SYM_POSN_NONE)
	{
		symbol_struct = (mea_type == RADIAL)?NULL:
		&DM_global.symbol_info[p_env->dim_stan][SYM_TYPE_DIAMETER];
	}

 	DMtext_box(dim_text,FNUM_DIM_FIELD); 

	if (parens_on)
		DMadd_begin_paren_field(dim_text, std_arr,"(");

	if(p_env->sym_posn == SYM_POSN_BEFORE)
	{
		DMcompute_symbol_text(osnum,
				      symbol_struct,
				      dim_text,
				      FNUM_SYMBOL_BEFORE,
				      std_arr,
				      p_env->text_font);
	}

	dm$return_field_no(dim_type = FNUM_SINGLE_START,
			   field_no = &dim_field_no);

	/*| start the dimension_field*/

	if( mea_type == STACKED_ANGULAR ||
	    mea_type == STRINGED_ANGULAR ||
	    mea_type == SINGLE_ARC_ANGLE)
        {
		DMadd_angular_field(osnum,dim_text,dim_field_no,dimn_val,p_env,
				    p_loc,p_misc);
	}
	else
	{
	  	DMadd_dimension_field(dim_text, dim_field_no,dimn_val,
				      p_env,p_loc,p_misc,PRIMARY_UNIT);
	}

	metric = (p_env->pri_unit == MEA_UNIT_MM) || (p_env->pri_unit == MEA_UNIT_METERS);
	if ((p_loc->deci_frac == FRACTION_MODE) && !metric)
	{
		text_ptr = &dim_text->str[dim_text->length];
		move_to_field(text_ptr, dim_field_no, RIGHT_BASE, zero, zero, dim_text->length);
		horizon_move(text_ptr, white_space, dim_text->length);
	}

	if (p_env->sym_posn == SYM_POSN_AFTER)
	{
		DMcompute_symbol_text(osnum,
				      symbol_struct,
				      dim_text,
				      FNUM_SYMBOL_AFTER,
				      std_arr,
				      p_env->text_font);
	}

	if (parens_on)
		DMadd_end_paren_field(dim_text, std_arr,")");

	DMtol_end(dim_text);		/* close the text box field*/

	if (suffix_on)
	{
		DMcompute_ref_suffix_field(
			dim_text,
			FNUM_REF_SUFFIX_SUBFIX,
			std_arr);
	}

	if (p_misc->suffix_disp == DISP_ON && strlen(p_misc->suffix))
	{
		DMcompute_suffix(p_misc->suffix,
				 dim_text,
				 FNUM_SUFFIX_START,
				 std_arr,
				 p_misc->sixteen_bit_font,
				 p_env->text_font);
	}

	if (subfix_on)
	{
		DMcompute_ref_subfix_field(
			dim_text,
			FNUM_REF_SUFFIX_SUBFIX,
			(p_env->dual_mode == DUAL_MODE_ON),
			std_arr);
	}
	text_ptr = &dim_text->str[dim_text->length];

  /* Fix for TR#11925984  */
    if( p_loc->txt_posn == TXT_POSN_EMBEDDED ||
        p_loc->txt_orie == TXT_ORIE_HORIZONTAL ||
        p_loc->txt_orie == TXT_ORIE_VERTICAL)
     {
       horizon_move(text_ptr, std_arr->dm_text_clear,dim_text->length);
       vertical_move(text_ptr, std_arr->dm_text_clear,dim_text->length);
     } 

	end_field(text_ptr,dim_text->length);

	return(TRUE);
}

IGRint DMadd_prefix_suffix(dim_text,prefix,text_font,kanji_font)
IGRuchar *prefix;
struct DMtxt_str *dim_text;
IGRshort text_font,kanji_font;
{
	IGRint status;
	IGRlong rc;
	IGRint loc_len,pre_len;
	IGRchar loc_string[EXFI_STRLEN], *CharPtr;
	struct vfont_entry font_info;

	loc_len = 0;
	CharPtr = loc_string;

	if (prefix[0] & 0x80)
	{
		status =
		font$get_info(
			msg = &rc,
			font_num = &kanji_font,
			font_info = &font_info);
		dm$status(action = RET_STATUS);

		if (font_info.flags & SIXTEEN_BIT)
		{
			change_font(CharPtr,kanji_font,loc_len);
			pre_len= strlen((char *)prefix);
			memcpy(CharPtr,prefix,pre_len);
			CharPtr += pre_len;
			loc_len += pre_len;
			change_font(CharPtr,text_font,loc_len);

		}
		else
		{
			/* Alt mode char */

			loc_len = strlen((char *)prefix);
			strcpy(CharPtr,(char *)prefix);
		}
	}
	else
	{
		loc_len = strlen((char *)prefix);
		strcpy(CharPtr,(char *)prefix);
	}

	memcpy(&dim_text->str[dim_text->length],loc_string,loc_len);
	dim_text->length += loc_len;
	
	return(TRUE);
}

IGRint DMadd_begin_paren_field(dim_text,std_prm,str)
struct DMtxt_str *dim_text;
struct DMstd_param *std_prm;
char *str;
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];
/*
	start_field(text_ptr, field_num, ATTR_EDITABLE, dim_text->length);
*/	
	while(*str)
	{
		*text_ptr++ = *str++;
		dim_text->length++;
	}
	horizon_move(text_ptr,std_prm->dm_pre_suf_gap,dim_text->length);
/*
	end_field(text_ptr,dim_text->length);
*/
	return(TRUE);
}

DMadd_end_paren_field(dim_text,std_prm, str)
struct DMtxt_str *dim_text;
struct DMstd_param *std_prm;
char *str;
{
	IGRuchar *text_ptr;

	text_ptr = &dim_text->str[dim_text->length];
/*
	start_field(text_ptr, field_num, ATTR_EDITABLE, dim_text->length);
*/

	
	horizon_move(text_ptr,std_prm->dm_pre_suf_gap,dim_text->length);
	while(*str)
	{
		*text_ptr++ = *str++;
		dim_text->length++;
	}

/*
	end_field(text_ptr,dim_text->length);
*/
	return(TRUE);
}

IGRint DMcompute_ref_suffix_field(dim_text,field_num,std_prm)
struct DMtxt_str *dim_text;
int field_num;
struct DMstd_param *std_prm;
{
	IGRuchar *text_ptr;
	
	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr,field_num,ATTR_NON_EDITABLE,dim_text->length);
	horizon_move(text_ptr,std_prm->dm_pre_suf_gap,dim_text->length);
	DMadd_char_str(dim_text,"REF");
	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	return(TRUE);
}

IGRint DMcompute_ref_subfix_field(dim_text,field_num,dual_mode,std_prm)
struct DMtxt_str *dim_text;
int field_num;
int dual_mode;
struct DMstd_param *std_prm;
{
	int f_no;
	double zero = 0.0;
	double m_half = -0.5;

	IGRuchar *text_ptr;
	text_ptr = &dim_text->str[dim_text->length];
	start_field(text_ptr,field_num,ATTR_EDITABLE,dim_text->length);
	/* ref field to come back to old position */
	if(dual_mode)
		f_no = FNUM_DUAL_START + 2;
	else
		f_no = FNUM_SINGLE_START +1;

	move_to_field(text_ptr,f_no,CENTER_BOTTOM,zero,zero,dim_text->length);

	start_field(text_ptr,field_num +1,ATTR_EDITABLE,dim_text->length);

	justify_field(text_ptr,CENTER_CAP,zero,dim_text->length);
	DMadd_char_str(dim_text,"REF");
	text_ptr = &dim_text->str[dim_text->length];
	end_field(text_ptr,dim_text->length);
	move_to_field(text_ptr,FNUM_DIM_FIELD,RIGHT_CENTER,zero,zero,dim_text->length);
	vertical_move(text_ptr,m_half,dim_text->length);
	end_field(text_ptr,dim_text->length);
	
	return(TRUE);
}

end implementation DMroot;
