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
#include "mabcmidpt.h"
#include "bssortptsln.h"
#include "bsscale_pts.h"
#include "bsptinbx.h"
#include "bspt_on_lne.h"
#include "bsproj1.h"
#include "bsproj0.h"
#include "bspl_of_pts.h"
#include "bsnorvec.h"
#include "bslldist.h"
#include "bsdptseg2.h"
#include "bsdotp.h"
#include "bsdistptpt.h"
#include "bscvnormal.h"
#include "bsbx2.h"

#define BLIND		3

from GRcurve 	import GRptextend;
from GRgraphics import GRcptform, GRconstruct, GRdelete;
from EMSsubbs	import GRgetsize, GRgetgeom;
from GRvg	import GRgetrang;
from GR3dlinestr import GRputpolyline;
from GRcompcurve import EMmakecomp;
from GRowner 	import GRget_number_components, GRget_components, GRdrop;

extern OMuword OPP_GR3dlinestr_class_id, OPP_GRcompcurve_class_id;
extern OMuword OPP_GAcompcurve_class_id;
extern IGRboolean WANT_POST220_BEHAVIOR;

IGRlong EFslot_ret_prof(EMmsg, surf_info, active_GRid, depth_type, 
		slot, construct_list, pro_nor_rev,  new_prof_id)

IGRlong			*EMmsg;
struct	GRlc_info	*surf_info;
struct	GRid		*active_GRid;
IGRushort 	*depth_type;
struct	EMSslot		*slot;
struct  GRvg_construct  *construct_list;
IGRboolean 		pro_nor_rev;
struct  GRid		*new_prof_id;

/*
Description:

This method creates a new profile for slot. This new profile is later used for
creating a surface of projection (as we don't want to modify the original
profile).

Variables:

IGRlong	 *EMmsg		    O	Completion code.
struct GRlc_info *surf_info I	Surfaces information.
struct GRid *active_GRid    I	Active state solid id.
IGRushort *depth_type I Slot depth for finite slot
struct slot_data *slot	I/  O	Relative information of slot.
IGRboolean pro_nor_rev  I TRUE if the profile normal is reversed else FALSE
struct GRid *new_prof_id    O 	id of the new profile created

History:

Sudha    06/30/93   Modified for BSprototypes ansification
Rustagi  06/17/93   The profile was being shifted by this value causing the
                    change in the desired depth value for the slot. 
                    I have reset it to '0.0'. -> TR #119221336. The change
                    has been incorporated for the blind slot only.
Tapadia  01/28/92   Fixed TR's 92n0409, 92n0317 & 92n0462
Tapadia  11/13/91   Created a closed profile for all slots. Construct a plane 
		    by projecting all the range points onto the profile.
Tapadia  10/10/91   Fixed a few TR's
Tapadia  09/08/91   Modified to support composite curves
Tapadia  08/22/91   Creation date
*/

{
	IGRint 		i, j, pt_size, mat_siz = 3, sort_ind[3], st_int_ind,
			end_int_ind, num_new_pts = 0, num_sc_pts;
	IGRboolean 	st_pt_flag, end_pt_flag, sl_flag, online, world, 
			parallel, in_box, is_composite, blind_move,
			temp_st_flag, temp_end_flag, bot_flag, right_flag,
			top_flag, left_flag, st_int_flag, end_int_flag;
	IGRlong 	status, msg_loc, buf_size, rotten_one, num_pts;
	OMuword 	classid;
	IGRvector 	cur_nor, st_vec, end_vec, lin_nor[4], new_vec, fin_vec;
	IGRmatrix 	matrix;
	struct GRid 	new_id, comp_curve;
	GRrange 	range;
	IGRdouble 	proj_line[2][3], u, move_dist, dist_wrt_max, minpar, 
			dist_wrt_min, u_knots[4], v_knots[4], min_dist, scale,
			dot_val, dottol = 0.000001, mindist,
			st_tst_mindist = 0.0,
			end_tst_mindist = 0.0, delx, dely, delz, check_dist, 
			cht_tol;
	IGRpoint 	min_range, max_range, min_pt, max_pt, start_pt, end_pt,
			pl_pt1, pl_pt2, test_pt, inf_pt1, inf_pt2, temp_pt, 
			new_st_pt, new_end_pt, sort_pts[3], poles[4], st_ext_pt, 			minpt, *pol_pts, end_ext_pt, new_add_pts[2], pl_pts[4], 			cur_mid_pt, pl_cre_pts[8], pl_pr_pts[8], pivot_pt;
	GRobjid 	poly_id, new_poly_id;
	OM_S_OBJID 	new_comp_id;
	struct IGRpolyline polyline;
	struct GRpost_info post_info;
	struct IGRbsp_curve *cur_geom = NULL;
    	struct IGRbsp_surface pl_gm;
	struct GRlc_info *comp_ids = NULL;
	struct GRid *ids_comp = NULL;
	IGRint num_chil;
	OMuword assoc_id;

	*EMmsg = EMS_S_Success;
	pt_size = sizeof(IGRpoint);
	world = TRUE;
	status = msg_loc = OM_S_SUCCESS;
	pol_pts = NULL;
	status = BSEXTRACTPAR(&msg_loc, BSTOLCHRDHT, cht_tol);
	cht_tol *= 10.0;
	/* Dummy initialization */
	st_int_ind = end_int_ind = -1;
	move_dist = 0.0;
	fin_vec[0] = fin_vec[1] = fin_vec[2] = 0.0;

	for(i = 14; i > 0; i--) matrix[i] = 0.0;

	matrix[0] = matrix[5] = matrix[10] = matrix[15] = 1.0;
	st_pt_flag = end_pt_flag = st_int_flag = end_int_flag = FALSE;
	bot_flag = right_flag = top_flag = left_flag = FALSE;
	blind_move = sl_flag = is_composite = in_box = FALSE;
	temp_st_flag = temp_end_flag = FALSE;
	world = TRUE;
	scale = 1.05;

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

	/* find the differnce in x, y & z to compute the solid 8 points */
	delx = range[3] - range[0];
	dely = range[4] - range[1];
	delz = range[5] - range[2];

	OM_BLOCK_MOVE(&range[0], pl_cre_pts[0], pt_size);
	OM_BLOCK_MOVE(&range[3], pl_cre_pts[7], pt_size);

	OM_BLOCK_MOVE(&range[0], pl_cre_pts[1], pt_size);
	pl_cre_pts[1][0] = range[0] + delx;
	OM_BLOCK_MOVE(&range[0], pl_cre_pts[2], pt_size);
	pl_cre_pts[2][1] = range[1] + dely;
	OM_BLOCK_MOVE(&range[0], pl_cre_pts[3], pt_size);
	pl_cre_pts[3][2] = range[2] + delz;
	
	OM_BLOCK_MOVE(&range[3], pl_cre_pts[4], pt_size);
	pl_cre_pts[4][0] = range[3] - delx;
	OM_BLOCK_MOVE(&range[3], pl_cre_pts[5], pt_size);
	pl_cre_pts[5][1] = range[4] - dely;
	OM_BLOCK_MOVE(&range[3], pl_cre_pts[6], pt_size);
	pl_cre_pts[6][2] = range[5] - delz;

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

	if(cur_geom->rational) {
	  for(i = 0; i < cur_geom->num_poles; i++) {
	    j = 3 * i;
	    cur_geom->poles[j] = cur_geom->poles[j]/cur_geom->weights[i];
	    cur_geom->poles[j+1] = cur_geom->poles[j+1]/cur_geom->weights[i];
	    cur_geom->poles[j+2] = cur_geom->poles[j+2]/cur_geom->weights[i];
	  }
	}

	/* start point of profile & its normalized vector */
	OM_BLOCK_MOVE(&cur_geom->poles[0], start_pt, pt_size);
	OM_BLOCK_MOVE(start_pt, new_st_pt, pt_size);

	st_vec[0] = cur_geom->poles[3] - cur_geom->poles[0];
	st_vec[1] = cur_geom->poles[4] - cur_geom->poles[1];
	st_vec[2] = cur_geom->poles[5] - cur_geom->poles[2];
	BSnorvec(&msg_loc, st_vec);

	/* end point of profile & its normalized vector */
	end_pt[0] = cur_geom->poles[3 * (cur_geom->num_poles - 1)];
	end_pt[1] = cur_geom->poles[3 * (cur_geom->num_poles - 1) + 1];
	end_pt[2] = cur_geom->poles[3 * (cur_geom->num_poles - 1) + 2];

	OM_BLOCK_MOVE(end_pt, new_end_pt, pt_size);

	end_vec[0] = cur_geom->poles[3 * (cur_geom->num_poles - 2)] - 
			cur_geom->poles[3 * (cur_geom->num_poles -1)];
	end_vec[1] = cur_geom->poles[3 * (cur_geom->num_poles - 2) + 1] - 
			cur_geom->poles[3 * (cur_geom->num_poles -1) + 1];
	end_vec[2] = cur_geom->poles[3 * (cur_geom->num_poles - 2) + 2] - 
			cur_geom->poles[3 * (cur_geom->num_poles -1) + 2];
	BSnorvec(&msg_loc, end_vec);

	/* project all the 8 points points onto the profile plane */

	num_pts = 8;
	status = BSproj1(&msg_loc,pl_cre_pts[0],cur_nor,start_pt,pl_pr_pts[0]);
	status = BSproj1(&msg_loc,pl_cre_pts[1],cur_nor,start_pt,pl_pr_pts[1]);
	status = BSproj1(&msg_loc,pl_cre_pts[2],cur_nor,start_pt,pl_pr_pts[2]);
	status = BSproj1(&msg_loc,pl_cre_pts[3],cur_nor,start_pt,pl_pr_pts[3]);
	status = BSproj1(&msg_loc,pl_cre_pts[4],cur_nor,start_pt,pl_pr_pts[4]);
	status = BSproj1(&msg_loc,pl_cre_pts[5],cur_nor,start_pt,pl_pr_pts[5]);
	status = BSproj1(&msg_loc,pl_cre_pts[6],cur_nor,start_pt,pl_pr_pts[6]);
	status = BSproj1(&msg_loc,pl_cre_pts[7],cur_nor,start_pt,pl_pr_pts[7]);

	/* Get the minimum & maximum points of the 8 points */
	in_box = BSbx2(&msg_loc, &num_pts, pl_pr_pts, NULL, pl_pt1, pl_pt2);

	/* Check if the start & end points of profile are within the range */
    	in_box = BSptinbx(&msg_loc, start_pt, pl_pt1, pl_pt2, &mat_siz);
	if(in_box) { 
		st_pt_flag = TRUE;
		temp_st_flag = TRUE;
	}

    	in_box = BSptinbx(&msg_loc, end_pt, pl_pt1, pl_pt2, &mat_siz);
	if(in_box) { 
		end_pt_flag = TRUE;
		temp_end_flag = TRUE;
	}

	/* Of the 8 points create a plane */
    	pl_gm.poles =  (IGRdouble *)poles;
    	pl_gm.u_knots = u_knots;
    	pl_gm.v_knots = v_knots;

	BSpl_of_pts(num_pts, (IGRdouble *)pl_pr_pts, NULL, &pl_gm, &msg_loc);

	/* create the 4 lines from the plane */
	OM_BLOCK_MOVE(&pl_gm.poles[0], pl_pts[0], pt_size);
	OM_BLOCK_MOVE(&pl_gm.poles[3], pl_pts[1], pt_size);
	OM_BLOCK_MOVE(&pl_gm.poles[9], pl_pts[2], pt_size);
	OM_BLOCK_MOVE(&pl_gm.poles[6], pl_pts[3], pt_size);

	for(i = 0; i < 4; i++) {
	    	if(i == 3) 
			j = 0;
	    	else 
			j = i + 1;
		lin_nor[i][0] = pl_pts[i][0] - pl_pts[j][0];
		lin_nor[i][1] = pl_pts[i][1] - pl_pts[j][1];
		lin_nor[i][2] = pl_pts[i][2] - pl_pts[j][2];
	}

	/* now extend the start & end points if they are within the range to
	intersect with the solid */
	for(i = 0; i < 4; i++) {
	    BSnorvec(&msg_loc, lin_nor[i]);
	    OM_BLOCK_MOVE(pl_pts[i], test_pt, pt_size);

	    /* start point is in the range limits */
	    if(st_pt_flag) {
		/* Finds the intersection point of 2 infinite lines. Check 
		if the new point is in the same direction as the vector. If
		so accept it, else reject the new point */

		status = BSlldist(&msg_loc, start_pt, test_pt, st_vec,
			lin_nor[i] ,&parallel, &min_dist, inf_pt1, inf_pt2);
		if(!parallel) {
    		    in_box = BSptinbx(&msg_loc,inf_pt1,pl_pt1,pl_pt2,&mat_siz);
		    if(in_box) {
			/* Both the points could be same */
			check_dist = BSdistptpt(&msg_loc, start_pt, inf_pt1);
			new_vec[0] = start_pt[0] - inf_pt1[0];
			new_vec[1] = start_pt[1] - inf_pt1[1];
			new_vec[2] = start_pt[2] - inf_pt1[2];
			BSnorvec(&msg_loc, new_vec);
			dot_val = BSdotp(&msg_loc, st_vec, new_vec);

			if((dot_val + dottol) >= 1.0 || 
			    (check_dist - dottol) <= 0.0) {
				st_int_ind = i;
				st_pt_flag = FALSE;
				if((check_dist - dottol) <= 0.0) 
	    			    OM_BLOCK_MOVE(st_vec, new_vec, pt_size);
				/* Extra clearance - for creative selective
				surface/solid boolean */
				new_st_pt[0] = inf_pt1[0] - 
					(cht_tol * new_vec[0]);
				new_st_pt[1] = inf_pt1[1] - 
					(cht_tol * new_vec[1]);
				new_st_pt[2] = inf_pt1[2] - 
					(cht_tol * new_vec[2]);
			}
		    }
		}
	    } 
	    /* start point is outside the range limit */
	    else if(!st_pt_flag && !temp_st_flag) {
		    j = i + 1;
		    if (i == 3) j = 0;
		    BSdptseg2(start_pt, pl_pts[i], pl_pts[j], minpt, &minpar,
			&mindist, &msg_loc); 
		    if(i == 0) {
			st_tst_mindist = mindist;
			st_int_ind = i;
		    } 
		    if(i > 0) {
			if(mindist < st_tst_mindist) {
				st_tst_mindist = mindist;
				st_int_ind = i;
			}
		    }
	    }

	    /* end point is in the range limits */
	    if(end_pt_flag) {
		status = BSlldist(&msg_loc, end_pt, test_pt, end_vec,
			lin_nor[i] ,&parallel, &min_dist, inf_pt1, inf_pt2);

		if(!parallel) {
    		    in_box = BSptinbx(&msg_loc,inf_pt1,pl_pt1,pl_pt2,&mat_siz);
		    if(in_box) {
			/* Both the points could be same */
			check_dist = BSdistptpt(&msg_loc, end_pt, inf_pt1);
			new_vec[0] = end_pt[0] - inf_pt1[0];
			new_vec[1] = end_pt[1] - inf_pt1[1];
			new_vec[2] = end_pt[2] - inf_pt1[2];
			BSnorvec(&msg_loc, new_vec);
			dot_val = BSdotp(&msg_loc, end_vec, new_vec);

			if((dot_val + dottol) >= 1.0 || 
  			    (check_dist - dottol) <= 0.0) {
				end_int_ind = i;
				end_pt_flag = FALSE;
				if((check_dist - dottol) <= 0.0) 
	    			    OM_BLOCK_MOVE(end_vec, new_vec, pt_size);
				/* Extra clearance - for creative selective
				surface/solid boolean */
				new_end_pt[0]= inf_pt1[0] - 
					(cht_tol * new_vec[0]);
				new_end_pt[1]= inf_pt1[1] - 
					(cht_tol * new_vec[1]);
				new_end_pt[2]= inf_pt1[2] - 
					(cht_tol * new_vec[2]);
			}
		    }
		}
	    }
	    /* end point is outside the range limit */
	    else if(!end_pt_flag && !temp_end_flag) {
		    j = i + 1;
		    if (i == 3) j = 0;
		    BSdptseg2(end_pt, pl_pts[i], pl_pts[j], minpt, &minpar,
			&mindist, &msg_loc); 
		    if(i == 0) {
			end_tst_mindist = mindist;
			end_int_ind = i;
		    } 
		    if(i > 0) {
			if(mindist < end_tst_mindist) {
				end_tst_mindist = mindist;
				end_int_ind = i;
			}
		    }
		}
	}

	/* Scale the plane by a scaling factor (scale). Find the pivot point 
	(average of all the 4 points). This is done to avoid coincidence */

	num_sc_pts = 4;
	for(i = 0; i < 3; i++) {
	    	pivot_pt[i] = (pl_pts[0][i] + pl_pts[1][i] + 
		    pl_pts[2][i] + pl_pts[3][i]) / num_sc_pts;
	}
	BSscale_pts(num_sc_pts, (IGRdouble *)pl_pts, NULL, scale, pivot_pt, &msg_loc);

	/* For all slots we create a closed profile - hence find out the new
	points that need to be added */

	/* intersect on the same side */
	if(st_int_ind == end_int_ind) 
		num_new_pts = 0;
	/* bottom right corner point */
	else if((st_int_ind == 0 && end_int_ind == 1) ||
	 	(st_int_ind == 1 && end_int_ind == 0)) { 
		num_new_pts = 1;
		OM_BLOCK_MOVE(pl_pts[1], new_add_pts[0], pt_size);
	}
	/* bottom left corner point */
	else if((st_int_ind == 3 && end_int_ind == 0) ||
		(st_int_ind == 0 && end_int_ind == 3)) {
		num_new_pts = 1;
		OM_BLOCK_MOVE(pl_pts[0], new_add_pts[0], pt_size);
	}
	/* top right corner point */
	else if((st_int_ind == 1 && end_int_ind == 2) ||
		(st_int_ind == 2 && end_int_ind == 1)) {
		num_new_pts = 1;
		OM_BLOCK_MOVE(pl_pts[2], new_add_pts[0], pt_size);
	}
	/* top left corner point */
	else if((st_int_ind == 2 && end_int_ind == 3) ||
	   	(st_int_ind == 3 && end_int_ind == 2)) { 
		num_new_pts = 1;
		OM_BLOCK_MOVE(pl_pts[3], new_add_pts[0], pt_size);
	}
	/* bottom - top side points */
	else if(st_int_ind == 0 && end_int_ind == 2) {
		num_new_pts = 2;
		OM_BLOCK_MOVE(pl_pts[3], new_add_pts[0], pt_size);
		OM_BLOCK_MOVE(pl_pts[0], new_add_pts[1], pt_size);
	}
	/* top - bottom side points */
	else if(st_int_ind == 2 && end_int_ind == 0) {
		num_new_pts = 2;
		OM_BLOCK_MOVE(pl_pts[0], new_add_pts[0], pt_size);
		OM_BLOCK_MOVE(pl_pts[3], new_add_pts[1], pt_size);
	}
	/* right - left side point */
	else if(st_int_ind == 1 && end_int_ind == 3) {
		num_new_pts = 2;
		OM_BLOCK_MOVE(pl_pts[3], new_add_pts[0], pt_size);
		OM_BLOCK_MOVE(pl_pts[2], new_add_pts[1], pt_size);
	}
	/* left - right side point */
	else if(st_int_ind == 3 && end_int_ind == 1) {
		num_new_pts = 2;
		OM_BLOCK_MOVE(pl_pts[2], new_add_pts[0], pt_size);
		OM_BLOCK_MOVE(pl_pts[3], new_add_pts[1], pt_size);
	}
	/* copy the start & end point (when only one is extended) - usually 
	happens when we try to extend arcs */
	else { 
		OM_BLOCK_MOVE(start_pt, new_st_pt, pt_size);
		OM_BLOCK_MOVE(end_pt, new_end_pt, pt_size);
	}
	
	OM_BLOCK_MOVE(new_st_pt, proj_line[0], pt_size);
	proj_line[1][0] = new_st_pt[0] + cur_nor[0];
	proj_line[1][1] = new_st_pt[1] + cur_nor[1];
	proj_line[1][2] = new_st_pt[2] + cur_nor[2];

	/* project the min & max range points along the curve normal at the
	start point */ 
	
	BSproj0(&msg_loc, min_range, proj_line, min_pt);
	BSproj0(&msg_loc, max_range, proj_line, max_pt);
	BSpt_on_lne(&msg_loc, min_pt, max_pt, new_st_pt, &u, &online);
	OM_BLOCK_MOVE(new_st_pt, sort_pts[0], pt_size); 
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
		fin_vec[0] = temp_pt[0] - new_st_pt[0];
		fin_vec[1] = temp_pt[1] - new_st_pt[1];
		fin_vec[2] = temp_pt[2] - new_st_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) <= 0.0) 
			move_dist = BSdistptpt(&msg_loc, min_range, max_range);
	}
	/* for all slots except blind - the point could be inside or at the 
	end points */
	if(online && *depth_type != BLIND) {
	    dist_wrt_max = BSdistptpt(&msg_loc, new_st_pt, max_pt);
	    dist_wrt_min = BSdistptpt(&msg_loc, new_st_pt, min_pt);
	    /* if at the max end point */
	    if(dist_wrt_max <= dottol) {
		fin_vec[0] = min_pt[0] - new_st_pt[0];
		fin_vec[1] = min_pt[1] - new_st_pt[1];
		fin_vec[2] = min_pt[2] - new_st_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) <= 0.0) 
			move_dist = BSdistptpt(&msg_loc, min_range, max_range);
	    }
	    /* if at the mimimum end point */
	    else if(dist_wrt_min <= dottol) { 
	        fin_vec[0] = max_pt[0] - new_st_pt[0];
	        fin_vec[1] = max_pt[1] - new_st_pt[1];
	        fin_vec[2] = max_pt[2] - new_st_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		if((dot_val + dottol) <= 0.0) 
			move_dist = BSdistptpt(&msg_loc, min_range, max_range);
	    }
	    /* within the end points */
	    else {
	        fin_vec[0] = new_st_pt[0] - max_pt[0];
	        fin_vec[1] = new_st_pt[1] - max_pt[1];
	        fin_vec[2] = new_st_pt[2] - max_pt[2];
		BSnorvec(&msg_loc, fin_vec);
		dot_val = BSdotp(&msg_loc, fin_vec, cur_nor);
		move_dist = BSdistptpt(&msg_loc, min_range, max_range);
		if((dot_val + dottol) > 0.0) {
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

		/* move_dist -= cht_tol; */
                if (WANT_POST220_BEHAVIOR)
                   move_dist = 0.0; /* The profile was being shifted by this
                                     * value causing the change in the desired
                                     * depth value for the slot. I have reset
                                     * it to '0.0'. -> TR #119221336.
                                     * The change has been incorporated
                                     * for the blind slot only. -- RUSTAGI
                                     */ 
                else
                   move_dist -= cht_tol;
/*
 * Fixed Rustagi's fix so that older models do not cause topology mismatches
 * when new code gets invoked.
 * pp 07/25/93
 */

		if(pro_nor_rev) {
			fin_vec[0] = -1.0 * cur_nor[0];
			fin_vec[1] = -1.0 * cur_nor[1];
			fin_vec[2] = -1.0 * cur_nor[2];
		}
		else 
			OM_BLOCK_MOVE(cur_nor, fin_vec, pt_size);
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

	new_st_pt[0] += move_dist * fin_vec[0];
	new_st_pt[1] += move_dist * fin_vec[1];
	new_st_pt[2] += move_dist * fin_vec[2];

	new_end_pt[0] += move_dist * fin_vec[0];
	new_end_pt[1] += move_dist * fin_vec[1];
	new_end_pt[2] += move_dist * fin_vec[2];

	/* If the start point &/or end points are within the range limits, 
	extend to its new points computed above */
	if(temp_st_flag) {
		start_pt[0] += move_dist * fin_vec[0];
		start_pt[1] += move_dist * fin_vec[1];
		start_pt[2] += move_dist * fin_vec[2];

		status = om$send(mode = OM_e_wrt_object,
				msg = message GRcurve.GRptextend(EMmsg,
				&surf_info[0].module_info,
				start_pt, new_st_pt, st_ext_pt),
			senderid = NULL_OBJID,
			targetid = new_id.objid,
			targetos = new_id.osnum);

   		EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

		if(cur_geom->order > 2)
			OM_BLOCK_MOVE(st_ext_pt, new_st_pt, pt_size);
	}
	if(temp_end_flag) {
		end_pt[0] += move_dist * fin_vec[0];
		end_pt[1] += move_dist * fin_vec[1];
		end_pt[2] += move_dist * fin_vec[2];

		status = om$send(mode = OM_e_wrt_object,
				msg = message GRcurve.GRptextend(EMmsg,
				&surf_info[0].module_info,
				end_pt, new_end_pt, end_ext_pt),
			senderid = NULL_OBJID,
			targetid = new_id.objid,
			targetos = new_id.osnum);

   		EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

		if(cur_geom->order > 2)
			OM_BLOCK_MOVE(end_ext_pt, new_end_pt, pt_size);
	}

	*EMmsg = om$get_classid(objid = surf_info[2].located_obj.objid,
			osnum = surf_info[2].located_obj.osnum,
			p_classid = &classid);
   	EMerr_hndlr (!(1 & *EMmsg),*EMmsg,EMS_E_OMerror,wrapup);

	status = om$is_ancestry_valid(subclassid = classid,
			superclassid = OPP_GRcompcurve_class_id);
	if(status == OM_S_SUCCESS)
		is_composite = TRUE;

	/* assign the same to the slot structure to be used later */
	if(is_composite) {
		slot->axis_pts[0][0] = cur_geom->poles[3] + (move_dist *
					fin_vec[0]);
		slot->axis_pts[0][1] = cur_geom->poles[4] + (move_dist *
					fin_vec[1]);
		slot->axis_pts[0][2] = cur_geom->poles[5] + (move_dist *
					fin_vec[2]);
	}
	else {
		MAbcmidpt(EMmsg, cur_geom, cur_mid_pt);
		if(!(1 & *EMmsg)) goto wrapup;
		slot->axis_pts[0][0] = cur_mid_pt[0] + (move_dist * fin_vec[0]);
		slot->axis_pts[0][1] = cur_mid_pt[1] + (move_dist * fin_vec[1]);
		slot->axis_pts[0][2] = cur_mid_pt[2] + (move_dist * fin_vec[2]);
	}

	if(pro_nor_rev) {
		slot->axis_vec[0] = -1.0 * cur_nor[0];
		slot->axis_vec[1] = -1.0 * cur_nor[1];
		slot->axis_vec[2] = -1.0 * cur_nor[2];
	}
	else 
		OM_BLOCK_MOVE(cur_nor, &slot->axis_vec[0], pt_size);

	/* this is later used to check if the solid requires orientation */
	slot->dist_move = move_dist;

	if(blind_move) 
		slot->depth += fabs(move_dist);

	if(num_new_pts == 0) 
		polyline.num_points = 2;
	else if(num_new_pts == 1) 
		polyline.num_points = 3;
	else 
		polyline.num_points = 4;

	pol_pts = (IGRpoint *) om$malloc(size = (polyline.num_points *
			sizeof(IGRpoint)));
	if(!pol_pts) {
		status = EMS_E_NoDynamicMemory;
		goto wrapup;
	}

	/* move all the new points by the specified distance */
	for(i = 0; i < 2; i++) {
		new_add_pts[i][0] += move_dist * fin_vec[0]; 
		new_add_pts[i][1] += move_dist * fin_vec[1]; 
		new_add_pts[i][2] += move_dist * fin_vec[2]; 
	}

	if(num_new_pts == 0) {
	    	OM_BLOCK_MOVE(new_end_pt, pol_pts[0], pt_size);
	    	OM_BLOCK_MOVE(new_st_pt, pol_pts[1], pt_size);
	}
	else if(num_new_pts == 1) {
	    	OM_BLOCK_MOVE(new_end_pt, pol_pts[0], pt_size);
	    	OM_BLOCK_MOVE(new_add_pts[0], pol_pts[1], pt_size);
	    	OM_BLOCK_MOVE(new_st_pt, pol_pts[2], pt_size);
	}
	else {
	    	OM_BLOCK_MOVE(new_end_pt, pol_pts[0], pt_size);
	    	OM_BLOCK_MOVE(new_add_pts[0], pol_pts[1], pt_size);
	    	OM_BLOCK_MOVE(new_add_pts[1], pol_pts[2], pt_size);
	    	OM_BLOCK_MOVE(new_st_pt, pol_pts[3], pt_size);
	}
	polyline.points = *pol_pts;
	post_info.construct_flag = TRUE;
	
	status = om$construct(classid = OPP_GR3dlinestr_class_id,
			msg = message GR3dlinestr.GRputpolyline(EMmsg,
				&surf_info[0].module_info, &post_info,
				&polyline, &poly_id),
			p_objid = &new_poly_id,
			osnum = surf_info[0].located_obj.osnum);

   	EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

	status = om$construct(classid = OPP_GRcompcurve_class_id,
		msg = message GRgraphics.GRconstruct(construct_list),
		p_objid = &new_comp_id);

   	EMerr_hndlr (!(1&status), *EMmsg, EMS_E_Fail, wrapup);

	comp_curve.objid = new_comp_id;
	comp_curve.osnum = OM_Gw_current_OS;

	/* Get the class id. If it is of class associative composite curve
	then get all the components & pass it to the make composite method
	instead of passing the composite curve id. This is done because make
	composite doesn't get the individual components of associative 
	composite curve. This will have to be done till it is modified in
	EMmakecomp. Fix for TR 119220972 - Tapadia - 10/20/92 */

	status = om$get_classid(osnum = new_id.osnum,
		objid = new_id.objid,
		p_classid = &assoc_id);

	if(assoc_id == OPP_GAcompcurve_class_id) {
	    IGRlong loc_msg;
	
	    /* get all the component count & the individual components */
	    status = om$send(msg = message GRowner.GRget_number_components(
			&loc_msg, (int *)&num_chil),
		senderid = NULL_OBJID,
		targetid = new_id.objid,
		targetos = new_id.osnum);

   	    EMerr_hndlr (!(1&status&loc_msg), *EMmsg, EMS_E_Fail, wrapup);

	    ids_comp = (struct GRid *) om$malloc(size = num_chil *
			sizeof(struct GRid));

	    status = om$send(msg = message GRowner.GRget_components(&loc_msg,
			&surf_info[2].module_info,
			ids_comp, num_chil,
			(int *) &i, 0, OM_K_MAXINT),
		senderid = NULL_OBJID,
		targetid = new_id.objid,
		targetos = new_id.osnum);

   	    EMerr_hndlr (!(1&status&loc_msg), *EMmsg, EMS_E_Fail, wrapup);

	    status = om$send(msg = message GRowner.GRdrop(&loc_msg,
			&surf_info[2].module_info),
		senderid = NULL_OBJID,
		targetid = new_id.objid,
		targetos = new_id.osnum);

   	    EMerr_hndlr (!(1&status&loc_msg), *EMmsg, EMS_E_Fail, wrapup);

	    /* Incremented to account for line string being passed */
	    num_chil++;
	}
	else 
		num_chil = 2;

	comp_ids = (struct GRlc_info *) om$malloc(size = num_chil *
			sizeof(struct GRlc_info));
	
	if(!comp_ids) {
		*EMmsg = EMS_E_NoDynamicMemory;
		goto wrapup;
	}

	if(assoc_id == OPP_GAcompcurve_class_id) {
	    for(i = 0; i < (num_chil - 1); i++) {
		comp_ids[i].located_obj.objid = ids_comp[i].objid;
		comp_ids[i].located_obj.osnum = ids_comp[i].osnum;
		comp_ids[i].module_info = surf_info[0].module_info;
	    }
	}
	else {
		comp_ids[0].located_obj.objid = new_id.objid;
		comp_ids[0].located_obj.osnum = new_id.osnum;
		comp_ids[0].module_info = surf_info[0].module_info;
	}

	comp_ids[num_chil - 1].located_obj.objid = new_poly_id;
	comp_ids[num_chil - 1].located_obj.osnum = OM_Gw_current_OS;
	comp_ids[num_chil - 1].module_info = surf_info[0].module_info;

	/* make the composite curve */
	status = om$send(msg = message GRcompcurve.EMmakecomp(EMmsg,
			&surf_info[0].module_info, num_chil, comp_ids, 
			&rotten_one),
		senderid = NULL_OBJID,
		targetid = comp_curve.objid,
		targetos = comp_curve.osnum);	

   	EMerr_hndlr (!(1&status&*EMmsg),*EMmsg,EMS_E_Fail,wrapup);

	new_prof_id->objid = comp_curve.objid;
	new_prof_id->osnum = OM_Gw_current_OS;

wrapup:
	if(cur_geom)  om$dealloc(ptr = cur_geom);
	if(pol_pts) om$dealloc(ptr = pol_pts);
	if(comp_ids) om$dealloc(ptr = comp_ids);
	if(ids_comp) om$dealloc(ptr = ids_comp);
	if(msg_loc != -1)	return(EMS_S_Success);
	else return(EMS_E_Success);
} /* EFslot_new_prof() */

end implementation ECplslot;
