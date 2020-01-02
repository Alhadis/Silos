/* ###################   APOGEE COMPILED   ################## */
class implementation ECplslot;

%safe
#include <math.h>
%endsafe
#include <stdio.h>
#include "OMerrordef.h"
#include "OMmacros.h"
#include "igr.h"
#include "igrdef.h"
#include "igrtypedef.h"
#include "EMSmsgdef.h"
#include "EMSfeadef.h"
#include "emserr.h"
#include "bserr.h"
#include "bsparameters.h"
#include "EMSdef.h"
#include "bssortptsln.h"
#include "bspt_on_lne.h"
#include "bsproj0.h"
#include "bsnorvec.h"
#include "bsdotp.h"
#include "bsdistptpt.h"
#include "bscvnormal.h"

#define BLIND		3

from GRgraphics import GRcptform;
from EMSsubbs	import GRgetsize, GRgetgeom;
from GRvg	import GRgetrang, GRcenter;

IGRlong EFslot_ret_closed_prof(EMmsg, surf_info, active_GRid, depth_type, 
		slot, pro_nor_rev, new_prof_id)

IGRlong			*EMmsg;
struct	GRlc_info	*surf_info;
struct	GRid		*active_GRid;
IGRushort 	*depth_type;
struct	EMSslot		*slot;
IGRboolean 		pro_nor_rev;
struct  GRid		*new_prof_id;

/*
Description:

This method creates a new profile for slot. The input profile is closed. 
This new profile is later used for creating a surface of projection 
(as we don't want to modify the original profile).

Variables:

IGRlong	 *EMmsg		    O	Completion code.
struct GRlc_info *surf_info I	Surfaces information.
struct GRid *active_GRid    I	Active state solid id.
IGRushort *depth_type I Slot depth for finite slot
struct slot_data *slot	I/  O	Relative information of slot.
IGRboolean pro_nor_rev  I TRUE if the profile normal is reversed else FALSE
struct GRid *new_prof_id    O 	id of the new profile created

History:

Tapadia  01/02/92   Creation date
Sudha    06/30/93   Modified for BSprototypes ansification
*/

{
	IGRint 		i, pt_size, sort_ind[3];
	IGRboolean 	online, world, blind_move;
	IGRlong 	status, msg_loc, buf_size;
	IGRvector 	cur_nor, fin_vec;
	IGRmatrix 	matrix;
	struct GRid 	new_id;
	GRrange 	range;
	IGRdouble 	proj_line[2][3], u, move_dist, dist_wrt_max, 
			dist_wrt_min, dot_val, dottol = 0.000001;
	IGRpoint 	min_range, max_range, min_pt, max_pt, temp_pt, 
			start_pt, sort_pts[3], cur_mid_pt;
	struct IGRbsp_curve *cur_geom = NULL;
	IGRdouble cht_tol;

	*EMmsg = EMS_S_Success;
	pt_size = sizeof(IGRpoint);
	world = TRUE;
	status = msg_loc = OM_S_SUCCESS;
	status = BSEXTRACTPAR(&msg_loc, BSTOLCHRDHT, cht_tol);
	/* 10 times cht_tol */
	cht_tol *= 10.0;
	/* Dummy initialization */
	move_dist = 0.0;
	fin_vec[0] = fin_vec[1] = fin_vec[2] = 0.0;

	for(i = 14; i > 0; i--) matrix[i] = 0.0;

	matrix[0] = matrix[5] = matrix[10] = matrix[15] = 1.0;
	blind_move = FALSE;
	world = TRUE;

	/* Get the solid range limits */
	status = om$send(msg = message GRvg.GRgetrang(EMmsg,
			&surf_info[2].module_info.md_env.matrix_type,
			surf_info[2].module_info.md_env.matrix,
			&world, range),
		senderid = NULL_OBJID,
		targetid = active_GRid->objid,
		targetos = active_GRid->osnum);

   	EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);
		
	OM_BLOCK_MOVE(&range[0], min_range, pt_size);
	OM_BLOCK_MOVE(&range[3], max_range, pt_size);

	/* Get the curve size & geometry */
	status = om$send(msg = message GRvg.GRgetsize(EMmsg,
			&surf_info[2].module_info.md_env.matrix_type,
			surf_info[2].module_info.md_env.matrix,
			&buf_size),
		senderid = NULL_OBJID,
		targetid = surf_info[2].located_obj.objid,
		targetos = surf_info[2].located_obj.osnum);

   	EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

	cur_geom = (struct IGRbsp_curve *) om$malloc(size = buf_size);

	if(!cur_geom) {
		status = EMS_E_Fail;
		goto wrapup;
	}

	status = om$send(msg = message GRvg.GRgetgeom(EMmsg,
			&surf_info[2].module_info.md_env.matrix_type,
			surf_info[2].module_info.md_env.matrix,
			(IGRchar *)cur_geom),
		senderid = NULL_OBJID,
		targetid = surf_info[2].located_obj.objid,
		targetos = surf_info[2].located_obj.osnum);

   	EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

	/* Profile normal */
	BScvnormal2(EMmsg, cur_geom, cur_nor);

	/* start point of profile */
	OM_BLOCK_MOVE(&cur_geom->poles[0], start_pt, pt_size);

	OM_BLOCK_MOVE(start_pt, proj_line[0], pt_size);
	proj_line[1][0] = start_pt[0] + cur_nor[0];
	proj_line[1][1] = start_pt[1] + cur_nor[1];
	proj_line[1][2] = start_pt[2] + cur_nor[2];

	/* project the min & max range points along the curve normal at the
	start point */ 
	
	BSproj0(&msg_loc, min_range, proj_line, min_pt);
	BSproj0(&msg_loc, max_range, proj_line, max_pt);
	BSpt_on_lne(&msg_loc, min_pt, max_pt, start_pt, &u, &online);
	OM_BLOCK_MOVE(start_pt, sort_pts[0], pt_size); 
	OM_BLOCK_MOVE(min_pt, sort_pts[1], pt_size);
	OM_BLOCK_MOVE(max_pt, sort_pts[2], pt_size);

	/* sort all the 3 points - start point, min_pt & max_pt */
	BSsortptsln(3, FALSE, sort_pts, NULL, sort_ind, &msg_loc);

	/* for all slots except blind - if the point of profile doesn't lie 
	in the range limit of the line */
	if(!online && *depth_type != BLIND) {
		if(sort_ind[0] == 1) 
			OM_BLOCK_MOVE(min_pt, temp_pt, pt_size);
		else 
			OM_BLOCK_MOVE(max_pt, temp_pt, pt_size);
		fin_vec[0] = temp_pt[0] - start_pt[0];
		fin_vec[1] = temp_pt[1] - start_pt[1];
		fin_vec[2] = temp_pt[2] - start_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) <= 0.0) 
			move_dist = BSdistptpt(&msg_loc, start_pt, temp_pt);
	}
	/* for all slots except blind - the point could be inside or at the 
	end points */
	if(online && *depth_type != BLIND) {
	    dist_wrt_max = BSdistptpt(&msg_loc, start_pt, max_pt);
	    dist_wrt_min = BSdistptpt(&msg_loc, start_pt, min_pt);
	    /* if at the max end point */
	    if(dist_wrt_max <= dottol) {
		fin_vec[0] = min_pt[0] - start_pt[0];
		fin_vec[1] = min_pt[1] - start_pt[1];
		fin_vec[2] = min_pt[2] - start_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) <= 0.0) 
			move_dist = BSdistptpt(&msg_loc, start_pt, min_pt);
	    }
	    /* if at the mimimum end point */
	    else if(dist_wrt_min <= dottol) { 
	        fin_vec[0] = max_pt[0] - start_pt[0];
	        fin_vec[1] = max_pt[1] - start_pt[1];
	        fin_vec[2] = max_pt[2] - start_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) <= 0.0) 
			move_dist = BSdistptpt(&msg_loc, start_pt, max_pt);
	    }
	    /* within the end points */
	    else {
	        fin_vec[0] = start_pt[0] - max_pt[0];
	        fin_vec[1] = start_pt[1] - max_pt[1];
	        fin_vec[2] = start_pt[2] - max_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) <= 0.0) 
			move_dist = BSdistptpt(&msg_loc, start_pt, min_pt);
		else {
			move_dist = BSdistptpt(&msg_loc, start_pt, max_pt);
			fin_vec[0] *= -1.0;
			fin_vec[1] *= -1.0;
			fin_vec[2] *= -1.0;
		}
	    }
	}

	if(*depth_type != BLIND) {
		move_dist += cht_tol;	/* some tolerance */
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) > 0.0) 
			move_dist *= -1.0;
	}

	/* This is done because creative selective surface/solid boolean
	fails when the profile is exactly on the surface */

	if(online && *depth_type == BLIND) {
		blind_move = TRUE;
		/* some tolerance */
		move_dist -= cht_tol;
		if(pro_nor_rev) {
			fin_vec[0] = -1.0 * cur_nor[0];
			fin_vec[1] = -1.0 * cur_nor[1];
			fin_vec[2] = -1.0 * cur_nor[2];
		}
		else 	OM_BLOCK_MOVE(cur_nor, fin_vec, pt_size);
	}

	/* Copy & transform the old profile to create a new one */
	matrix[3] = move_dist * fin_vec[0]; 
	matrix[7] = move_dist * fin_vec[1]; 
	matrix[11] = move_dist * fin_vec[2]; 

	status = om$send(msg = message GRgraphics.GRcptform(EMmsg,
			&surf_info[0].module_info,
			matrix, &surf_info[0].module_info,
			&new_id.objid),
		senderid = NULL_OBJID,
		targetid = surf_info[2].located_obj.objid,
		targetos = surf_info[2].located_obj.osnum);

   	EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

	new_id.osnum = OM_Gw_current_OS;

	/* assign the same to the slot structure to be used later */
	status = om$send(msg = message GRvg.GRcenter(EMmsg, 
			&surf_info[2].module_info.md_env.matrix_type,
			surf_info[2].module_info.md_env.matrix,
			cur_mid_pt),
		senderid = NULL_OBJID,
		targetid = surf_info[2].located_obj.objid,
		targetos = surf_info[2].located_obj.osnum);
			
   	EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

	slot->axis_pts[0][0] = cur_mid_pt[0] + (move_dist * fin_vec[0]);
	slot->axis_pts[0][1] = cur_mid_pt[1] + (move_dist * fin_vec[1]);
	slot->axis_pts[0][2] = cur_mid_pt[2] + (move_dist * fin_vec[2]);

	if(pro_nor_rev) {
		slot->axis_vec[0] = -1.0 * cur_nor[0];
		slot->axis_vec[1] = -1.0 * cur_nor[1];
		slot->axis_vec[2] = -1.0 * cur_nor[2];
	}
	else 	OM_BLOCK_MOVE(cur_nor, &slot->axis_vec[0], pt_size);

	/* this is later used to check if the solid requires orientation */

	slot->dist_move = move_dist;
	if(blind_move) 
		slot->depth += fabs(move_dist);
	new_prof_id->objid = new_id.objid;
	new_prof_id->osnum = OM_Gw_current_OS;

wrapup:
	if(cur_geom)  om$dealloc(ptr = cur_geom);
	if(msg_loc != -1)	return(EMS_S_Success);
	else return(EMS_E_Success);
} /* EFslot_new_closed_prof() */

end implementation ECplslot;
