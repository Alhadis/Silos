/* ###################   APOGEE COMPILED   ################## */
class implementation EMSsubbs;

#include "EMS.h"
#include "EMSerrordef.h"
#include "EMSbnddef.h"
#include "EMSlmdef.h"
#include "EMSlm.h"
#include "EMSopt.h"
#include "EMSprop.h"
#include "emsmacros.h"
#include "OMmacros.h"
#include "emsgeteddef.h"

#define INCR_SIZE 10
#define TOL 0.00001

from EMSedge import EMendpts;
from EMSedge import EMget_props;
from EMSedge import EMget_sf_edges;
from EMSedge import EMmake_compatible;
from EMSedge import EMgetvtxedges;
from EMSloop import EMnext_edge;
from EMSboundary import EMget_objid;
from EMSsfmove import EMloop_add;

method EMmove_face (
        IGRlong    *EMmsg;                /* completion code */
        struct GRmd_env *my_env)
/*
Notes 
      Upon exit the completion code will be one of

                - EMS_S_Success if successful
    			- EMS_F_Failif failure
                - EMS_E_EdgeError error in edge method
Assumption

Bugs

History
	
      gupta     05/04/87:   design date 
                10/19/87:   changed to new class structure and modified
                            for composite surfaces
      SM	02-Dec-87:  option changes to EMnext_edge
      NP    	08/25/92:   Modified for ANSI compliance. Changed some varibles to
			    "IGRuint" from "IGRint". Also did some typecasting.
Algorithm 

      move all the poles of the surface (face) under consideration.
      get all my edges and find their common edges. Move all the
      poles of these common edges through input vector. Get the
      edges sharing these common edges end points and move them
      proportionally (internal poles) through input vector. Before
      moving these edges, find out if their twin edges are compatible
      with them. If not, make them compatible. Finally move the edges,
      which share the vertices of the face under consideration and
      hasn't been processed above.
*/

{
  IGRlong                         stat_OM, msg, msg1;
  IGRushort               edge_prop, vt_edge_prop,
                                  nxt_edge_prop;
  IGRboolean                      is_valid;
  IGRboolean                      *right_vtx, vertex_moved;
  IGRboolean                      *is_deg, which_end = FALSE;
  IGRint                          i,j, k, num_edge, num_bytes1;
  IGRuint                         count, edge_cnt, comm_edge_cnt;
  IGRint			  ind, vt_ind, lp_cnt, ls_cnt, cnt;
  IGRint                          EMsend_loops();
  IGRdouble                       uv0begpt[2], uv0endpt[2];
  IGRdouble                       uv1begpt[2], uv1endpt[2];
  GRobjid                         *store_edges, comm_loop_id,
                                  *vtx_edges, *vt_loop_ids,
                                  nxt_edge, saved_loop_id;
  struct GRid                     edge_ids[2], surf_id;
  GRobjid                         loop_id;
  struct EMinstruction_table_info my_it_info;
  OM_S_OBJECT_LINKAGE             *edge_linkage,
                                  ls_linkage, my_loop,
                                  comm_edge_linkage;
  OM_S_CHANSELECT                 to_loopset, to_loops,
                                  to_comps, to_common_edge;
  extern                          IGRdouble fabs();
  IGRint EMsend_loops();
/* ------------------------------------------------------------- */

   *EMmsg = EMS_S_Success;
   stat_OM = OM_S_SUCCESS;
   ind = count = 0;

   edge_linkage = NULL;
   is_deg = NULL;
   store_edges = NULL;
   vt_loop_ids = NULL;
   saved_loop_id = NULL_OBJID;

   /* move myself (the whole face) */

   to_loopset.type = OM_e_addr;
   to_loopset.u_sel.addr = &ME.EMSsubbs->to_loopset;

   stat_OM = EMmake_chanselect (EMSloopset_to_loops, &to_loops);
   if (! (1 & stat_OM)) goto wrapup;

   /* get my loopset */

   stat_OM = om$get_channel_objects (object = me,
                                     p_chanselect = &to_loopset,
                                     list = &ls_linkage,
                                     size = 1,
                                     count = &count);
   EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.getchan_objs");

   /* get my loop --- should have only the natural loop */

   stat_OM = om$get_channel_objects (osnum = ls_linkage.osnum,
                                     objid = ls_linkage.S_objid,
                                     p_chanselect = &to_loops,
                                     list = &my_loop,
                                     size = 1,
                                     count = &count);
   EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.getchan_objs");
   if (count != 1)
       return EMS_E_InvalidArg;	

   my_it_info.move_operation = EMS_MOVE_LIN_FACE;

   loop_id = my_loop.S_objid;
   
   stat_OM = om$send(msg=message EMSsfmove.EMloop_add(&msg,my_it_info,
                         loop_id),
                     targetid = sender_id,
                     targetos = sender_os);
   EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMloop_add");
   EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

   /* EMSloop.to_edges, to_edges */
   stat_OM = EMmake_chanselect (EMSbd_owner_to_comps, &to_comps);
   if (! (1 & stat_OM)) goto wrapup;

   stat_OM = EMmake_chanselect (EMSedge_to_common_edge, &to_common_edge);
   if (! (1 & stat_OM)) goto wrapup;

   /* get my loop's edge count */

   stat_OM = om$get_channel_count (osnum = my_loop.osnum,
                                   objid = my_loop.S_objid,
                                   p_chanselect = &to_comps,
                                   count = &edge_cnt);
   EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.get_chan_cnt");

   /* find out objects connected to my loop on 
    * to_comps channel
    */

   num_bytes1 = edge_cnt * (sizeof (OM_S_OBJECT_LINKAGE));
   edge_linkage = (OM_S_OBJECT_LINKAGE *) om$malloc(size = num_bytes1);

   is_deg = (IGRboolean *) om$malloc(size = edge_cnt *
                                     sizeof (IGRboolean));
   EMerr_hndlr (! edge_linkage || ! is_deg, *EMmsg, EMS_E_NoDynamicMemory,
                wrapup);
   for (k=0; k<edge_cnt; k++)
        is_deg[k] = TRUE;

   stat_OM = om$get_channel_objects (osnum = my_loop.osnum,
                                     objid = my_loop.S_objid,
                                     p_chanselect = &to_comps,
                                     list = edge_linkage,
                                     size = edge_cnt,
                                     count = &count);
   EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.get_chan_objs");
   if (count != edge_cnt)
   return EMS_E_ChanCountWrong;	
   
   for (i = 0; i < edge_cnt; i++)
    {
     if (! ((ind) % INCR_SIZE))
      {
       if (! ind)
        {
         store_edges = (GRobjid *) om$malloc (size = INCR_SIZE *
                                              sizeof(GRobjid));
        }
       else
        {
         store_edges = (GRobjid *) om$realloc (ptr = (IGRchar *)store_edges,
                        size = (ind + INCR_SIZE) * sizeof(GRobjid));
        }
      }
     store_edges[ind] = edge_linkage[i].S_objid;
     ind++;

     stat_OM = om$send(msg=message EMSedge.EMget_props(&msg,
                           &edge_prop),
                       targetid = edge_linkage[i].S_objid,
                       targetos = edge_linkage[i].osnum);
     EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMget_props");
     EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

     /* move the common edge only if it is not degenerate */

     if(!(edge_prop & EMED_DEGENERATE))
      {
       is_deg[i] = FALSE;
       stat_OM = om$send(msg = message EMSedge.EMmake_compatible(&msg,
                               my_env),
                         targetid = edge_linkage[i].S_objid,
                         targetos = edge_linkage[i].osnum);
       EMerr_hndlr(msg == EMS_I_DiffSrfOrder,*EMmsg,EMS_I_DiffSrfOrder,
                   wrapup);
       EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMmake_compatible");
       EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

      /* get the count on common edge channel */

      stat_OM = om$get_channel_count (osnum = edge_linkage[i].osnum,
                                      objid = edge_linkage[i].S_objid,
                                      p_chanselect = &to_common_edge,
                                      count = &comm_edge_cnt);
      EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.get_chan_cnt");
     
      if (comm_edge_cnt)
       {    
       /* find out object connected to the edge on my loop on
        * to_common_edge channel
        */
       stat_OM = om$get_channel_objects (osnum = edge_linkage[i].osnum,
	                                     objid = edge_linkage[i].S_objid,
                                         p_chanselect = &to_common_edge,
                                         list = &comm_edge_linkage,
                                         size = 1,
                                         count = &count);
       EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.get_chan_obj");

       if (! ((ind) % INCR_SIZE))
        {
         store_edges = (GRobjid *) om$realloc (ptr = (IGRchar *)store_edges,
                        size = (ind + INCR_SIZE) * sizeof(GRobjid));
        }
       store_edges[ind] = comm_edge_linkage.S_objid;
       ind++;

       /* get the active loop id of the twin edge */

       stat_OM = EMsend_loops(&msg,
                          message EMSboundary.EMget_objid (&msg1,
                          &comm_loop_id), comm_edge_linkage.S_objid, 0, 
                          OM_K_MAXINT, EMLP_ACTIVE, NULL, NULL);
       EMerr_hndlr(EMis_error(msg1), *EMmsg, msg, wrapup);
       EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

       if ((comm_loop_id == saved_loop_id) && (i % 2 == 1))
           continue;
       else
           saved_loop_id = comm_loop_id;
       
       if(comm_loop_id != my_loop.S_objid)
        {
         stat_OM = om$send(msg=message EMSedge.EMendpts(
                               &msg, uv0begpt, uv0endpt, NULL,NULL,NULL),
                           targetid = comm_edge_linkage.S_objid,
                           targetos = comm_edge_linkage.osnum);
         EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMendpts");
         EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

         my_it_info.move_operation = EMS_MOVE_LIN_EDGE;

         my_it_info.params.end_pts[0] = uv0begpt[0];
         my_it_info.params.end_pts[1] = uv0begpt[1];

         my_it_info.params.end_pts[2] = uv0endpt[0];
         my_it_info.params.end_pts[3] = uv0endpt[1];

         loop_id = comm_loop_id;

         stat_OM = om$send(msg=message EMSsfmove.EMloop_add(&msg,
                               my_it_info, loop_id),
                           targetid = sender_id,
                           targetos = sender_os);
         EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMloop_add");
         EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

         /* get the edges, sharing the end points of the common edge */

         stat_OM = om$send(msg=message EMSedge.EMget_sf_edges(&msg,
                               EMS_WHL_EDGE, edge_ids, &num_edge),
                           targetid = comm_edge_linkage.S_objid,
                           targetos = comm_edge_linkage.osnum);
         EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMget_sf_edges");
         EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);
       
         for (j=0; j<num_edge; j++)
          {
           if (! ((ind) % INCR_SIZE))
            {
             store_edges = (GRobjid *) om$realloc (ptr = (IGRchar *)store_edges,
                            size = (ind + INCR_SIZE) * sizeof(GRobjid));
            }
           store_edges[ind] = edge_ids[j].objid;
           ind++;

           stat_OM = om$send(msg = message EMSedge.EMmake_compatible(&msg,
                                   my_env),
                             targetid = edge_ids[j].objid,
                             targetos = edge_ids[j].osnum);
           EMerr_hndlr(msg == EMS_I_DiffSrfOrder, *EMmsg, 
                       EMS_I_DiffSrfOrder, wrapup);
           EMomerr_hndlr(stat_OM, wrapup,"EMssfc_move.EMmake_compatible");
           EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

           stat_OM = om$send(msg=message EMSedge.EMendpts(
                                 &msg,uv1begpt,uv1endpt,NULL,NULL,NULL),
                             targetid = edge_ids[j].objid,
                             targetos = edge_ids[j].osnum);
           EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMendpts");
           EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

           my_it_info.move_operation = EMS_MOVE_INT_PRP_EDGE;
          
           if (j == 0)
            {
             my_it_info.params.end_pts[0] = uv1endpt[0];
             my_it_info.params.end_pts[1] = uv1endpt[1];

             my_it_info.params.end_pts[2] = uv1begpt[0];
             my_it_info.params.end_pts[3] = uv1begpt[1];
            }
           else
            {
             my_it_info.params.end_pts[0] = uv1begpt[0];
             my_it_info.params.end_pts[1] = uv1begpt[1];

             my_it_info.params.end_pts[2] = uv1endpt[0];
             my_it_info.params.end_pts[3] = uv1endpt[1];
            }
           loop_id = comm_loop_id;

           stat_OM = om$send(msg=message EMSsfmove.EMloop_add(&msg,
                                 my_it_info, loop_id),
                             targetid = sender_id,
                             targetos = sender_os);
           EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMloop_add");
           EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);
          }
        }
       }
      }
    }

   /*
    * work on the edges which share my vertices and has been left out
    * in the above processing. This happens only when a vertex is
    * shared by more than three surfaces
    */

   for (i=0; i<edge_cnt; i++)
    {
     vt_ind = num_edge = 0;
     if (is_deg[i])
         continue;

     /* get all the edges sharing edge's begin point */
   
     stat_OM = om$send(msg = message EMSedge.EMgetvtxedges(&msg,
                             EMSvtxedges_nodegenerate, which_end, 0,
                             &num_edge, &vtx_edges, &right_vtx),
                       targetid = edge_linkage[i].S_objid);
     EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMvtxedges");
     EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

     vt_loop_ids = (GRobjid *) om$malloc(size = num_edge *
                                         sizeof(GRobjid));
     EMerr_hndlr (! vt_loop_ids , *EMmsg, EMS_E_NoDynamicMemory, wrapup);

     for (j=0; j<num_edge; j++)
      {
       is_valid = TRUE;
       for (k=0; k<ind; k++)
        {
         if (IF_EQ_OBJID(vtx_edges[j], store_edges[k]))
         is_valid = FALSE;
        }
       if (is_valid)
        {
        /*
         * if the edge is not compatible with respect to its common edge
         * ---- the knot lines on these surfaces do not match, make them
         * compatible by inserting knotlines at appropriate parameters of
         * its surface 
         */
        stat_OM = om$send(msg = message EMSedge.EMmake_compatible(&msg,
                                my_env),
                          targetid = vtx_edges[j]);
        EMerr_hndlr(msg == EMS_I_DiffSrfOrder,*EMmsg,EMS_I_DiffSrfOrder,
                    wrapup);
        EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMmake_compatible");
        EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);
    
        stat_OM = EMsend_loops(&msg,
                           message EMSboundary.EMget_objid (&msg1,
                           &loop_id), vtx_edges[j], 0, OM_K_MAXINT,
                           EMLP_ACTIVE, NULL, NULL);
        EMerr_hndlr(!(1 & stat_OM), *EMmsg, msg, wrapup);
        EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

        stat_OM = om$send(msg = message EMSedge.EMendpts(
                                &msg,uv0begpt,uv0endpt,NULL,NULL,NULL),
                          targetid = vtx_edges[j]);
        EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMendpts");
        EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

        my_it_info.move_operation = EMS_MOVE_INT_PRP_EDGE;

        if (right_vtx[j])
         {
          my_it_info.params.end_pts[0] = uv0endpt[0];
          my_it_info.params.end_pts[1] = uv0endpt[1];

          my_it_info.params.end_pts[2] = uv0begpt[0];
          my_it_info.params.end_pts[3] = uv0begpt[1];
         }
        else
         {
          my_it_info.params.end_pts[0] = uv0begpt[0];
          my_it_info.params.end_pts[1] = uv0begpt[1];

          my_it_info.params.end_pts[2] = uv0endpt[0];
          my_it_info.params.end_pts[3] = uv0endpt[1];
         }

        stat_OM = om$send(msg = message EMSsfmove.EMloop_add(&msg,
                                my_it_info, loop_id),
                          targetid = sender_id,
                          targetos = sender_os);
        EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMloop_add");
        EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

        stat_OM = om$send(msg=message EMSedge.EMget_props(&msg,
                              &vt_edge_prop),
                          targetid = vtx_edges[j]);
        EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMget_props");
        EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

        stat_OM = EMsend_loops (&msg, message EMSloop.EMnext_edge
                  (&msg1,right_vtx[j] ? EMGetEd_Next : EMGetEd_Previous,
                  vtx_edges[j], &nxt_edge), vtx_edges[j], 0, 0, 
                  EMLP_ACTIVE, NULL, NULL);
        EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMnext_edge");
        EMerr_hndlr(EMSerror(msg | msg1), *EMmsg, EMS_E_EdgeError,wrapup);
    
        stat_OM = om$send(msg=message EMSedge.EMget_props(&msg,
                              &nxt_edge_prop),
                          targetid = nxt_edge);
        EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMget_props");
        EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

        if ((vt_edge_prop & EMED_SEAM) || (nxt_edge_prop & EMED_SEAM))
         {
          stat_OM = om$send(msg = message EMSedge.EMendpts(
                                 &msg,uv0begpt,uv0endpt,NULL,NULL,NULL),
                            targetid = nxt_edge);
          EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMendpts");
          EMerr_hndlr(EMis_error(msg), *EMmsg, EMS_E_EdgeError, wrapup);

          my_it_info.move_operation = EMS_MOVE_INT_PRP_EDGE;
   
          if ((fabs(uv0begpt[0] - my_it_info.params.end_pts[0]) < TOL) &&
              (fabs(uv0begpt[1] - my_it_info.params.end_pts[1]) < TOL))
             {
              my_it_info.params.end_pts[2] = uv0endpt[0];
              my_it_info.params.end_pts[3] = uv0endpt[1];
             }
          else
             {
              my_it_info.params.end_pts[2] = uv0begpt[0];
              my_it_info.params.end_pts[3] = uv0begpt[1];
             }

          stat_OM = om$send(msg = message EMSsfmove.EMloop_add(&msg,
                                  my_it_info, loop_id),
                            targetid = sender_id,
                            targetos = sender_os);
          EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMloop_add");
          EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);

          if (! ((ind) % INCR_SIZE))
           {
            store_edges = (GRobjid *) om$realloc (ptr = (IGRchar *)store_edges,
                           size = (ind + INCR_SIZE) * sizeof(GRobjid));
           }
          store_edges[ind] = nxt_edge;
          ind++;
         }
        else
         {
          vertex_moved = FALSE;
          /*
           * Check to see if the vertex has already been moved for this
           * loop through another edge. If so do not move it else move
           * it and save the loop id in vt_loop_ids[]
           */

          for(cnt=0; cnt<vt_ind; cnt++)
           {
            if (loop_id == vt_loop_ids[cnt])
                vertex_moved = TRUE;
           }

          if (! vertex_moved)
           {
            vt_loop_ids[vt_ind] = loop_id;
            vt_ind++;

            my_it_info.move_operation = EMS_MOVE_LIN_VERTEX;

            my_it_info.params.vt_pt[0] = my_it_info.params.end_pts[0];
            my_it_info.params.vt_pt[1] = my_it_info.params.end_pts[1];
    
            stat_OM = om$send(msg = message EMSsfmove.EMloop_add(&msg,
                                    my_it_info, loop_id),
                              targetid = sender_id,
                              targetos = sender_os);
            EMomerr_hndlr(stat_OM, wrapup, "EMssfc_move.EMloop_add");
            EMerr_hndlr(EMis_error(msg), *EMmsg, msg, wrapup);
           }
         }
        }
      }
    }

wrapup:

  if(edge_linkage) om$dealloc(ptr = edge_linkage);
  if(vt_loop_ids) om$dealloc(ptr = vt_loop_ids);
  if(store_edges) om$dealloc(ptr = store_edges);

  return(stat_OM);
}
end implementation EMSsubbs;
