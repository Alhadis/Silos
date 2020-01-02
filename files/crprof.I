/* ------------------------------------------------------------------------- */
/*                               API Definition                              */
/* ------------------------------------------------------------------------- */

/*
  ABSTRACT
	The API creates a profile with the given data. 

  DESCRIPTION
	Given the data for line segments, arcs or circles 
	the API creates a profile with these segments. 
	Implicit Constraints are not placed on these profiles.

  NOTES
	Circles cannot be drawn as part of a composite curve. So
	when circles are drawn thru the API, that should be the only
	input.

  ARGUMENTS
	PWobjid 		refplid
	PWosnum 		os
	int 			num_elems
        struct PWprofelms 	*elements
	PWboolean 		close_profile	
        PWobjid 		*profile

  CAVEATS

	Arcs are currently drawn only in counter clockwise direction.

  HISTORY

     Satya   07/12/96   Creation 

*/

/* Includes */
class implementation	SKmgr;

#include <stdio.h>
#include <alloca.h>
#include <math.h>

#include "OMminimum.h"
#include "OMprimitives.h"
#include "OMmacros.h"
#include "igetypedef.h"

#include "igrtypedef.h"
#include "igr.h"
#include "igrdp.h"
#include "godef.h"
#include "gr.h"
#include "go.h"

#include "grdpbdef.h"
#include "grdpbmacros.h"

#include "EMSmsgdef.h"
#include "emsdef.h"
#include "EMSprop.h"
#include "EMSbnddef.h"
#include "EMSbnd.h"
#include "EMSopt.h"
#include "EMdtmacros.h"

#include "SKdef.h"
#include "bserr.h"
#include "bsparameters.h"
#include "bsdistptpt.h"
#include "bsptnwtold.h"
#include "ECmsg.h"

#include "PWminimum.h"
#include "PWerror.h"
#include "PWgmdata.h"
#include "crprof.h"
#include "PWapi/refplnqry.h"
#include "PWapi/mx.h"
#include "actparam.h"

extern PWclassid OPP_GR3dlineseg_class_id, OPP_GR3dpoint_class_id;
extern PWclassid OPP_GR3dcirarc_class_id, OPP_GR3dcircle_class_id;
extern PWclassid OPP_GRcompcurve_class_id;
extern PWclassid OPP_GRcurve_class_id;
extern PWclassid OPP_SKgeometry_class_id, OPP_SKarc_class_id;

from GRcompcurve import EMmakecomp;

/* ------------------------------------------------------------------------- */
/*                            API Source Code                                */
/* ------------------------------------------------------------------------- */

PWresult pwCreateProfile 
( 
  PWobjid refplid,
  PWosnum os,
  int num_elems,
  struct PWprofelems *elements,
  PWboolean close_profile, 
  PWobjid *profile
)
{
  	struct GRid        	datplanid,eleid;
  	long			PWsts, OMmsg, OMsts, count, dum;
  	struct GRmd_env		mod_env;
  	struct IGRbsp_curve	*twopolecv, *cirarccv;
  	double			*poles,lentol;
  	struct GRvg_construct  	const_list;
  	struct IGResbc         	esbc;
  	int                   	sts,cnt,dumint,inx,inx1;
  	PWvector		dumvec,zvec,xvec,yvec;
        PWmatrix		idmx;
  	PWclassid  		objclass;
  	PWboolean		addele,flag;
  	PWpoint		        prev_pt,cen_pt,pt, pts2[2];
        PWobjid    		eleobj,firstobj, compobj;
  	struct GRlc_info 	geominfo[2];
  	struct IGRdisplay	active_display;
  	struct IGRpolyline 	py2pts;
        extern OMuword          EX_active_OS_num;
	PWpoint			loc_pt,glb_pt,origpt;
        double			trans_mat[3][3],scale = 1.0;


        
        OMmsg = EMS_S_Success;
        PWsts = PW_K_Success;
        OMsts = OM_S_SUCCESS;

        BSEXTRACTPAR (&OMmsg, BSTOLLENVEC, lentol);


        for(cnt = 0; cnt < num_elems; cnt++)
        {
          if (elements[cnt].type == circ_state)
          {
             if(num_elems != 1)
	     {
                PWsts = SetError (PW_K_Pathway, PW_K_Internal);
		goto wrapup;
             }
          }
        }
        datplanid.objid = refplid;
        datplanid.osnum = os;
	PWsts = pwGetDatpldata(refplid, os, MAIDMX, pwIdMx (idmx),xvec,yvec,zvec,origpt);

	for(inx=0; inx<3;inx++)
          for(inx1=0;inx1<3;inx1++)
	    trans_mat[inx][inx1] = 0.0;

        OM_BLOCK_MOVE(xvec,trans_mat[0],sizeof(PWvector));
        OM_BLOCK_MOVE(yvec,trans_mat[1],sizeof(PWvector));
        OM_BLOCK_MOVE(zvec,trans_mat[2],sizeof(PWvector));

        for(inx = 0; inx < num_elems; inx++)
        {
          OM_BLOCK_MOVE(elements[inx].start_pnt,loc_pt, sizeof(PWpoint));
          loc_pt[2] = 0;
	  BSptnwtold(&OMmsg,origpt,trans_mat,&scale,loc_pt,glb_pt);
          OM_BLOCK_MOVE(glb_pt,elements[inx].start_pnt,sizeof(PWpoint));

	  if(elements[inx].type == line_state)
          {
            OM_BLOCK_MOVE(elements[inx].second_data.end_pt,loc_pt, 
			  sizeof(PWpoint));
            loc_pt[2] = 0;
	    BSptnwtold(&OMmsg,origpt,trans_mat,&scale,loc_pt,glb_pt);
            OM_BLOCK_MOVE(glb_pt,elements[inx].second_data.end_pt, 
			  sizeof(PWpoint));
	  }
	  if(elements[inx].type == circ_state)
          {
            OM_BLOCK_MOVE(elements[inx].second_data.center,loc_pt, 
			  sizeof(PWpoint));
            loc_pt[2] = 0;
	    BSptnwtold(&OMmsg,origpt,trans_mat,&scale,loc_pt,glb_pt);
            OM_BLOCK_MOVE(glb_pt,elements[inx].second_data.center, 
			  sizeof(PWpoint));
	  }
	  if(elements[inx].type == arc_state) 
          {

            OM_BLOCK_MOVE(elements[inx].second_data.center,loc_pt, 
                          sizeof(PWpoint));
            loc_pt[2] = 0;
	    BSptnwtold(&OMmsg,origpt,trans_mat,&scale,loc_pt,glb_pt);
            OM_BLOCK_MOVE(glb_pt, elements[inx].second_data.center, 
		          sizeof(PWpoint));

            OM_BLOCK_MOVE(elements[inx].second_data.end_pt,
                          loc_pt, sizeof(PWpoint));
            loc_pt[2] = 0;
	    BSptnwtold(&OMmsg,origpt,trans_mat,&scale,loc_pt,glb_pt);
            OM_BLOCK_MOVE(glb_pt, elements[inx].second_data.end_pt,
                          sizeof(PWpoint));
          }
        }
    	twopolecv  = NULL;	
        firstobj = NULL_OBJID;

        if(os == EX_active_OS_num)
        {
          gr$get_module_env(msg = &OMmsg, buffer = &mod_env);
        }
        else
        {
          PWsts = pwActivateOS(os);
          if(PWsts == PW_K_Error)
          {
            PWsts = SetError(PW_K_Pathway, PW_K_Internal);
            goto wrapup;
          }
          flag = pwIsActivationOn();
          if(flag)
          {
            sts = pwGetActiveModuleEnv(&mod_env);
            if(!sts)
            {
              PWsts = SetError(PW_K_Pathway, PW_K_Internal);
              goto wrapup;
            }
          }
        }

	BSalloccv (2, 2, FALSE, NULL, &twopolecv, &OMmsg);
	pts2[0][0] = pts2[0][1] = pts2[0][2] = 0.0;
        OM_BLOCK_MOVE (pts2[0], pts2[1], sizeof (PWpoint));
        py2pts.num_points = 2;
        py2pts.points = (double *) pts2;
        EMcnvtpybsn (&OMmsg, 3, &py2pts, twopolecv);
        twopolecv->phy_closed = FALSE;

	BSalloccv (4, 7, TRUE, NULL, &cirarccv, &OMmsg);
        for (cnt=FIRST; cnt<=SECOND; cnt++)
        {
          OM_BLOCK_MOVE (&mod_env, &geominfo[cnt].module_info, 
                                           sizeof (struct GRmd_env));
          geominfo[cnt].located_obj.osnum = os;
        }

	const_list.msg = &OMmsg;
  	const_list.env_info = &mod_env;
	const_list.newflag = FALSE;
	const_list.properties = GRIS_DISPLAYABLE | GRIS_LOCATABLE;
	const_list.geometry = NULL;
	const_list.display = &active_display; 
	esbc.is_polydis = FALSE;
	esbc.is_curvedis = TRUE;
	const_list.class_attr = (char *) &esbc;
	const_list.name = NULL;

  	gr$get_active_level( msg = &OMmsg, buffer = &const_list.level);
        gr$get_active_display( msg = &OMmsg,buffer = const_list.display);

        addele = FALSE;
        for(cnt = 0; cnt < num_elems; cnt++)
        {
          if (elements[cnt].type == line_state)
          {

            OM_BLOCK_MOVE (elements[cnt].start_pnt, prev_pt, sizeof (PWpoint));
            OM_BLOCK_MOVE (elements[cnt].second_data.end_pt, pt, 
                                sizeof (PWpoint));
            poles = twopolecv->poles;
            OM_BLOCK_MOVE (prev_pt, poles, sizeof (PWpoint));
            OM_BLOCK_MOVE (pt, &poles[3], sizeof (PWpoint));

            objclass = OPP_GR3dlineseg_class_id;
            const_list.geometry = (char *) twopolecv;
            OMsts = om$construct (classid = objclass,
                       msg = message GRgraphics.GRconstruct (&const_list), 
                       osnum = os, p_objid = &eleobj);

            if (!(1&OMsts&OMmsg))
	    {
                PWsts = SetError (PW_K_Pathway, PW_K_Internal);
		goto wrapup;
            }
            addele = TRUE;
          }
         
          else if (elements[cnt].type == circ_state)
          {
             OM_BLOCK_MOVE(elements[cnt].start_pnt, prev_pt, sizeof (PWpoint));
             OM_BLOCK_MOVE(elements[cnt].second_data.center, 
                           cen_pt, sizeof (PWpoint));
             OM_BLOCK_MOVE (zvec, dumvec, sizeof (PWvector));

             BSprepcircp (&OMmsg, cen_pt, prev_pt, dumvec, cirarccv, dumvec, 
                            &dumint);
             objclass = OPP_GR3dcircle_class_id;

             const_list.geometry = (char *) cirarccv;
             OMsts = om$construct (classid = objclass,
                            msg = message GRgraphics.GRconstruct (&const_list), 
                            osnum = os, p_objid = &eleobj);
             if (!(1&OMsts&OMmsg))
	     {
                PWsts = SetError (PW_K_Pathway, PW_K_Internal);
		goto wrapup;
             }
             addele = TRUE;
          }
          else if (elements[cnt].type == arc_state)
          {
             OM_BLOCK_MOVE(elements[cnt].start_pnt, prev_pt, sizeof (PWpoint));
             OM_BLOCK_MOVE(elements[cnt].second_data.end_pt, pt, 
                           sizeof (PWpoint));
             OM_BLOCK_MOVE(elements[cnt].second_data.center, 
                           cen_pt, sizeof (PWpoint));
             OM_BLOCK_MOVE (zvec, dumvec, sizeof (PWvector));

             BSprepcarc (&OMmsg, prev_pt, cen_pt,
                         pt, dumvec, cirarccv, dumvec, &dumint);
             objclass = OPP_GR3dcirarc_class_id;

             const_list.geometry = (char *) cirarccv;
             OMsts = om$construct (classid = objclass,
                            msg = message GRgraphics.GRconstruct (&const_list), 
                            osnum = os, p_objid = &eleobj);
             if (!(1&OMsts&OMmsg))
	     {
                PWsts = SetError (PW_K_Pathway, PW_K_Internal);
		goto wrapup;
             }
             addele = TRUE;
          }
          else
          {
             PWsts = SetError (PW_K_Pathway, PW_K_Internal);
	     goto wrapup;
          }

          if (addele)
          {
              if(cnt == FIRST)
              {
                firstobj = eleobj;
              }
              else
              {
                if(cnt == SECOND)
                {
                  compobj = NULL_OBJID;
                  OMsts = om$construct (classid = OPP_GRcompcurve_class_id,
                                        osnum = os, p_objid = &compobj);             
                  OMsts = om$send(msg = message GRgraphics.GRconstruct(&const_list),
                                senderid = NULL_OBJID,
                                targetid = compobj,
                                targetos = os);   
                  if (!(1&OMsts&OMmsg))
	          {
                    PWsts = SetError (PW_K_Pathway, PW_K_Internal);
		    goto wrapup;
                  }
                  count = 2;
                  geominfo[0].located_obj.objid = firstobj;
                  geominfo[1].located_obj.objid = eleobj;
                }
                else
                {
                  count = 1;
                  geominfo[0].located_obj.objid = eleobj;
                }
                OMsts = om$send (msg = message GRcompcurve.EMmakecomp
                                 (&OMmsg, &mod_env, count, geominfo, &dum),
                                  senderid = NULL_OBJID,
                                  targetid = compobj, 
                                  targetos = os);
                if (!(1&OMsts&OMmsg))
	        {
                   PWsts = SetError (PW_K_Pathway, PW_K_Internal);
		   goto wrapup;
                }
              } 
          }
         }
         if (cnt > 1)
           eleobj = compobj;
         else
           eleobj = firstobj;

         eleid.objid = eleobj;
         eleid.osnum = os;
         
         SKcreate_profile(&OMmsg,SK_OPT_CREATE_GEOMETRY|SK_OPT_DISPLAY_GEOMETRY,
                          eleid.objid, &mod_env, &datplanid, NULL, NULL, NULL, 
                          NULL,NULL,NULL,close_profile,profile);
	 if (!(1&OMmsg))
	 {
	     PWsts = SetError (PW_K_Pathway, PW_K_Internal);
	     goto wrapup;
	 }
wrapup:
   PW_Wrapup (PWsts, "pwCreateProfile");
   return (PWsts);
}

end implementation SKmgr;
