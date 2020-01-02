/* ###################   APOGEE COMPILED   ################## */
class implementation EMSedge;

#include "EMS.h"
#include "EMSbnddef.h"
#include "EMSlm.h"
#include "EMSlmdef.h"
#include "EMSerrordef.h"
#include "EMSdef.h"
#include "emsmacros.h"
#include "OMmacros.h"

from EMSsfmove import EMloop_add;

method EMmove_edge  (
        IGRlong    *EMmsg;                 /* completion code */
        struct GRmd_env *my_env)
/*
Notes 
      Upon exit the completion code will be one of

                - EMS_S_Success if successful
    			- EMS_E_Fail (severe) if failure
                - EMS_E_EdgeError error in edge method
Assumption

Bugs

History
	
	  gupta 	05/04/87:	design date
                10/19/87:   changed to new class structure and modified
                            for composite surfaces
Algorithm

      move myself -- EMS_MOVE_LIN_EDGE
      move my common edge -- EMS_MOVE_LIN_EDGE
      for (i=0; i<2; i++)
      {
       end point = my begin_point
       o get all edges of the composite which are not degenerate and
         share the 'end point'-- num_edge, edges[]
       o for (i=0; i<num_edge; i++)
         {
          if edges[i] != me && != comm_edge)
           {
            move edges[i] -- EMS_MOVE_INT_PRP_EDGE
            if (edges[i]'s vertex at end point hasn't been moved
             {
               save some info regarding this vertex and belonging to a 
               particular loop, so that next time it is not moved again
 
               move the vertex EMS_MOVE_LIN_VERTEX
             }
           }
         }
       end point = my end point      
      }  
*/

{
  IGRlong                         stat_OM, msg, msg1;
  IGRint                          num_edges, i, j, k, cnt;
  OMuint                          count;
  IGRdouble                       uvbegpt[2], uvendpt[2],
                                  m_uvbegpt[2], m_uvendpt[2],
                                  c_uvbegpt[2], c_uvendpt[2];
  IGRboolean                      *right_vtx, vertex_moved, opt;
  GRobjid                         my_loop_id, comm_loop_id,
                                  *edge_ids, *vt_loop_ids;
  GRobjid                         loop_id;
  struct EMinstruction_table_info my_it_info;
  OM_S_OBJECT_LINKAGE             comm_edge_list;
  OM_S_CHANSELECT                 to_common_edge;
  IGRint  EMsend_loops();
/* ------------------------------------------------------------- */

  *EMmsg = EMS_S_Success;
  stat_OM = OM_S_SUCCESS;
  vt_loop_ids = NULL;
  count = opt = 0;

  /* get the active loop id of my edge */
 
  stat_OM = EMsend_loops(&msg,
                     message EMSboundary.EMget_objid (&msg1, &my_loop_id),
                     my_id, 0, OM_K_MAXINT, EMLP_ACTIVE, NULL, NULL);
  EMerr_hndlr(!(1 & stat_OM), *EMmsg, msg, wrapup);
  EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

  stat_OM = om$send(msg=message EMSedge.EMendpts(
                        &msg, m_uvbegpt, m_uvendpt, NULL,NULL,NULL),
                    targetid = my_id);
  EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMendpts");
  EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

  stat_OM = om$send(msg = message EMSedge.EMmake_compatible(&msg,
                          my_env),
                    targetid = my_id);
  EMerr_hndlr(msg == EMS_I_DiffSrfOrder,*EMmsg,EMS_I_DiffSrfOrder,wrapup);
  EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMmake_compatible");
  EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

  my_it_info.move_operation = EMS_MOVE_LIN_EDGE;

  my_it_info.params.end_pts[0] = m_uvbegpt[0];
  my_it_info.params.end_pts[1] = m_uvbegpt[1];

  my_it_info.params.end_pts[2] = m_uvendpt[0];
  my_it_info.params.end_pts[3] = m_uvendpt[1];

  stat_OM = om$send(msg=message EMSsfmove.EMloop_add(&msg,my_it_info,
                        my_loop_id),
                    targetid = sender_id,
                    targetos = sender_os);
  EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMloop_add");
  EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

  /* find the twin edge and repeat process */

  to_common_edge.type = OM_e_addr;
  to_common_edge.u_sel.addr = &ME.EMSedge->to_common_edge;

  /* find out objects connected to me on 
   * to_common_edge channel
   */
  stat_OM = om$get_channel_objects (object = me,
                                    p_chanselect = &to_common_edge,
                                    list = &comm_edge_list,
                                    size = 1,
                                    count = &count);
  EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.get_chan_obj");

  if (count)
   {
    /* get the active loop id of my twin edge */

    stat_OM = EMsend_loops(&msg,
                       message EMSboundary.EMget_objid (&msg1,
                       &comm_loop_id), comm_edge_list.S_objid, 0,
                       OM_K_MAXINT, EMLP_ACTIVE, NULL, NULL);
    EMerr_hndlr(!(1 & stat_OM), *EMmsg, msg, wrapup);
    EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

    stat_OM = om$send(msg=message EMSedge.EMendpts(
                          &msg, c_uvbegpt, c_uvendpt, NULL,NULL,NULL),
                      targetid = comm_edge_list.S_objid,
                      targetos = comm_edge_list.osnum);
    EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMendpts");
    EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

    my_it_info.move_operation = EMS_MOVE_LIN_EDGE;

    my_it_info.params.end_pts[0] = c_uvbegpt[0];
    my_it_info.params.end_pts[1] = c_uvbegpt[1];

    my_it_info.params.end_pts[2] = c_uvendpt[0];
    my_it_info.params.end_pts[3] = c_uvendpt[1];

    stat_OM = om$send(msg=message EMSsfmove.EMloop_add(&msg,my_it_info,
                          comm_loop_id),
                      targetid = sender_id,
                      targetos = sender_os);
    EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMloop_add");
    EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);
   }
  else
   {
    comm_edge_list.S_objid = NULL_OBJID;
    comm_loop_id = NULL_OBJID;
   }
  /* work on the edges connected to my end points */
  
  for (k=0; k<2; k++)
   {
    num_edges = j = 0;

    /* get all the edges on various surfaces which is not degenerate and
       shares my xyz vertex point -- begin or end (option) */

    stat_OM = om$send(msg = message EMSedge.EMgetvtxedges(&msg,
                            EMSvtxedges_nodegenerate,opt,0,
                            &num_edges, &edge_ids, &right_vtx),
                      targetid = my_id);
    EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMvtxedges");
    EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

    vt_loop_ids = (GRobjid *) om$malloc(size = num_edges *
                                        sizeof(GRobjid));

    EMerr_hndlr (! vt_loop_ids , *EMmsg, EMS_E_NoDynamicMemory, wrapup);

    for (i=1; i<num_edges; i++)
     {
      if (edge_ids[i] != comm_edge_list.S_objid)
       {
        /*
         * if the edge is not compatible with respect to its common edge
         * ---- the knot lines on these surfaces do not match, make them
         * compatible by inserting knotlines at appropriate parameters of
         * its surface 
         */
        stat_OM = om$send(msg = message EMSedge.EMmake_compatible(&msg,
                                my_env),
                          targetid = edge_ids[i]);
        EMerr_hndlr(msg == EMS_I_DiffSrfOrder,*EMmsg,EMS_I_DiffSrfOrder,
                    wrapup);
        EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMmake_compatible");
        EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);
    
        stat_OM = EMsend_loops(&msg,
                           message EMSboundary.EMget_objid (&msg1,
                           &loop_id), edge_ids[i], 0, OM_K_MAXINT,
                           EMLP_ACTIVE, NULL, NULL);
        EMerr_hndlr(EMis_error(msg1), *EMmsg, msg, wrapup);
        EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

        stat_OM = om$send(msg=message EMSedge.EMendpts(
                              &msg,uvbegpt,uvendpt,NULL,NULL,NULL),
                          targetid = edge_ids[i]);
        EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMendpts");
        EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

        my_it_info.move_operation = EMS_MOVE_INT_PRP_EDGE;
 
        if (right_vtx[i])
          {
            my_it_info.params.end_pts[0] = uvendpt[0];
            my_it_info.params.end_pts[1] = uvendpt[1];

            my_it_info.params.end_pts[2] = uvbegpt[0];
            my_it_info.params.end_pts[3] = uvbegpt[1];
          }
        else
          {
            my_it_info.params.end_pts[0] = uvbegpt[0];
            my_it_info.params.end_pts[1] = uvbegpt[1];
 
            my_it_info.params.end_pts[2] = uvendpt[0];
            my_it_info.params.end_pts[3] = uvendpt[1];
          }

        stat_OM = om$send(msg=message EMSsfmove.EMloop_add(&msg,
                              my_it_info, loop_id),
                          targetid = sender_id,
                          targetos = sender_os);
        EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMloop_add");
        EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

        if ((loop_id != my_loop_id) &&
            (loop_id != comm_loop_id))
         {
           vertex_moved = FALSE;
 
           /*
            * Check to see if the vertex has already been moved for this
            * loop through another edge. If so do not move it else move
            * it and save the loop id in vt_loop_ids[]
            */
 
           for(cnt=0; cnt<j; cnt++)
            {
             if(loop_id == vt_loop_ids[cnt])
                vertex_moved = TRUE;
            }

           if (! vertex_moved)
            {
             vt_loop_ids[j] = loop_id;
             j++;

             my_it_info.move_operation = EMS_MOVE_LIN_VERTEX;
    
             my_it_info.params.vt_pt[0] = my_it_info.params.end_pts[0];
             my_it_info.params.vt_pt[1] = my_it_info.params.end_pts[1];
    
             stat_OM = om$send(msg=message EMSsfmove.EMloop_add(&msg,
                                   my_it_info, loop_id),
                               targetid = sender_id,
                               targetos = sender_os);
             EMomerr_hndlr(stat_OM, wrapup, "EMeded_move.EMloop_add");
             EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);
            }
         }
       }
     }
    opt = 1;
   }

wrapup:

  if(vt_loop_ids) om$dealloc(ptr = vt_loop_ids);
  return(stat_OM);
}

end implementation EMSedge;
