/* ###################   APOGEE COMPILED   ################## */
class implementation EMSsurface;

#include "EMS.h"
#include "emsmacros.h"
#include "EMSlmdef.h"
#include "EMSopt.h"

from EMSsubbs import EMmove_face;
from EMSedge import EMmove_edge;
from EMSedge import EMmove_vertex;
from EMSsfmove import EMmove_execute;

method EMmove(IGRlong         *EMmsg;
              IGRshort        move_type;
              struct GRid     move_obj_id;
              IGRpoint        from_pt,
                              to_pt;
              IGRshort        option;
              struct GRmd_env *my_env;
              IGRshort        *display_option)

/*
Notes 
      Upon exit the completion code will be one of

                - EMS_S_Success if successful
    			- EMS_E_Fail (severe) if failure

Assumption

Bugs

History
	
	  gupta 	05/04/87:	design date

Algorithm

      Invoke the appropriate message based on move_type. These are

      EMS_MOVE_FACE --
      EMS_MOVE_EDGE --
      EMS_MOVE_VERTEX --
   
      Once, the instruction table is set up in the message. Execute the
      this table. 
*/
               
{
  IGRlong          stat_OM, msg;

/*--------------------------------------------------------------------*/

  *EMmsg = EMS_S_Success;
  stat_OM = OM_S_SUCCESS;
 
  switch(move_type)
   {
    case EMS_MOVE_FACE:
      
      stat_OM = om$send(msg = message EMSsubbs.EMmove_face (&msg, my_env),
                        targetid = move_obj_id.objid,
                        targetos = move_obj_id.osnum);
      EMerr_hndlr(msg == EMS_I_DiffSrfOrder, *EMmsg, EMS_I_DiffSrfOrder,
                  wrapup);
      EMomerr_hndlr(stat_OM, wrapup, "EMtop_move.EMmove_face");
      EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_SurfaceError, wrapup);
      break;

    case EMS_MOVE_EDGE:
      
      stat_OM = om$send(msg = message EMSedge.EMmove_edge (&msg, my_env),
                        targetid = move_obj_id.objid,
                        targetos = move_obj_id.osnum);
      EMerr_hndlr(msg == EMS_I_DiffSrfOrder, *EMmsg, EMS_I_DiffSrfOrder,
                  wrapup);
      EMomerr_hndlr(stat_OM, wrapup, "EMtop_move.EMmove_edge");
      EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);
      break;

    case EMS_MOVE_VERTEX:
      
      stat_OM = om$send(msg = message EMSedge.EMmove_vertex (&msg,
                              option, my_env),
                        targetid = move_obj_id.objid,
                        targetos = move_obj_id.osnum);
      EMerr_hndlr(msg == EMS_I_DiffSrfOrder, *EMmsg, EMS_I_DiffSrfOrder,
                  wrapup);
      EMomerr_hndlr(stat_OM, wrapup, "EMtop_move.EMmove_vertex");
      EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);
      break;
   
    default:
      
      *EMmsg = EMS_E_InvalidArg;
      break;
   }  
 
  {
    GRobjid *display_ids = NULL;
    IGRint  display_count = 0, inx;

    stat_OM = om$send(msg = message EMSsfmove.EMmove_execute (&msg,
                            from_pt, to_pt, my_env, display_option,
                            &display_ids, &display_count),
                      targetid = my_id);
    EMomerr_hndlr(stat_OM, wrapup, "EMtop_move.EMmove_execute");
    EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

    if (*display_option & EMS_DO_DISPLAY)
    {
      enum GRdpmode display_mode=GRbd;

      for(inx=0; inx<display_count; inx++)
      {
        stat_OM = om$send(msg = message GRgraphics.GRdisplay(&msg, 
                                &my_env->md_env.matrix_type, 
                                my_env->md_env.matrix,
                                &display_mode,
                                &my_env->md_id),
                          targetid = display_ids[inx]);

        EMomerr_hndlr(stat_OM, wrapup, "EMtop_move.EMmove_execute");
        EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);
      }
    }

    if (display_ids) om$dealloc(ptr = display_ids);
  }


wrapup:

   return(stat_OM);
}

end implementation EMSsurface;
