/*
Name
        DYmove

Synopsis
        IGRint DYmove (msg, caller_id, caller_os, from_point, curr_mod,
                       gschan, event)

        IGRlong            *msg;            return code
        GRobjid             caller_id;      caller id
        OMuword             caller_os;      caller's object space
        struct EX_button   *from_point;     move from point
        struct GRmd_env    *curr_mod;       current module
        OM_S_CHANSELECT    *gschan;         channel located containing object
        struct GRevent     *event;          containing located object

Description
        This routine causes the indicated object to go into move, or drag,
        dynamics, i.e. the object will be dragged by the cursor.  According
        to the dpb parameter indicating dynamics type, the routine will
        either create a copy of the indicated object and repeatedly
        transform that copy, or combine the necessary transformation with
        the original object's environment matrix so that the dynamic display
        appears to make the necessary translation.

Notes
        The input arguments gschan and event are used to determine what
        object to drag.  If not NULL, gschan is expected to point to a
        channel containing the results of a call to gr$gslocate.  If gschan
        is NULL, then event is expected to point to an event with the
        information about located_object[0] filled in, such as the
        accept event from lc$locate.

        The temporary copy, or clone, is created in the current module space
        as defined in the dpb.  A NULL_OBJID is placed in the module
        environment structure to indicate to the graphics object methods that
        no R-tree manipulations are to be performed.

Return values
        IGRint  ()      MSSUCC - success
                        MSFAIL - failure

        IGRlong *msg    MSSUCC - success
                        MSFAIL - failure

History
        mrm     07/18/86    creation
                03/09/87    include file revision
                11/13/87    call GRxform since GRtform no longer exists
                08/05/88    use display dynamics; allow event to specify
                            object to move
*/

class implementation CEO_GSLOCATE;

#include "coimport.h"
#include "msdef.h"
#include "grgs.h"
#include "dpmacros.h"
#include "comndef.h"
#include "grdpbdef.h"
#include "grdpbmacros.h"
#include "growner.h"
#include "dpstruct.h"

extern IGRboolean MAtrlmx(), MAtypemx(), MAmulmx();

from GRgraphics import GRxform, GRcopy, GRdelete;

struct dyn_args
{
    IGRboolean          mode;
    struct GRid         dyn_obj;
    struct GRmd_env     dyn_mod;
    struct EX_button    from_point;
    struct GRmdenv_info trans;
};

IGRint DYmove (msg, caller_id, caller_os, from_point, curr_mod,
               gschan, event)

IGRlong            *msg;            /* return code */
GRobjid             caller_id;      /* caller id */
OMuword             caller_os;      /* caller's object space */
struct EX_button   *from_point;     /* move from point */
struct GRmd_env    *curr_mod;       /* current module */
OM_S_CHANSELECT    *gschan;         /* channel located containing object */
struct GRevent     *event;          /* containing located object */

{
    IGRboolean          dyn_on;         /* is dynamics on? */
    IGRboolean          inquire = 1;    /* inquire from DPdynflags */
    IGRint              DYmove_dyn();   /* dynamics function */
    IGRint              size;           /* for dpb call */
    IGRlong             sts;            /* return code */
    struct GRobj_env    obj_info;       /* object going into dynamics */
    struct GRid         caller;         /* caller structure */
    struct dyn_args     move_data;      /* arguments passed to DYmove_dyn */

    *msg = MSSUCC;

    /*
     *  if dynamics is off then exit
     */

    DPdynflags (msg, &inquire, &dyn_on, NULL);

    if (!dyn_on)
    {
        return (*msg = MSSUCC);
    }

    /*
     *  get info about the object going into dynamics
     */

    if (gschan)
    {
        caller.objid = caller_id;
        caller.osnum = caller_os;

        sts = GRgsget_simple_object (msg, &caller, gschan, &obj_info);

        if (!(sts & *msg & 1))
        {
            SSDeactivate();            // Turn off Smart Sketch for sets
            return (*msg = MSSUCC);
        }
    }
    else
    {
        obj_info.obj_id = event->located_object[0].located_obj;
        obj_info.mod_env = event->located_object[0].module_info;
    }

    /*
     *  check dynamics mode
     */

    size = sizeof (IGRboolean);

    sts = gr$get_dynamics_copy_flag (msg = msg, sizbuf = &size,
                                     buffer = &move_data.mode, nret = &size);

    /*
     *  set up dynamic object
     */

    if (move_data.mode == COPY_DYNAMICS)
    {
        move_data.dyn_mod = *curr_mod;
        move_data.dyn_mod.md_id.objid = NULL_OBJID; /* no R-tree manips */
        move_data.dyn_obj.osnum = curr_mod->md_id.osnum;
        sts = om$send (msg = message GRgraphics.GRcopy
                            (msg,
                             &(obj_info.mod_env),
                             &move_data.dyn_mod,
                             &move_data.dyn_obj.objid),
                       senderid = caller_id,
                       targetid = obj_info.obj_id.objid,
                       targetos = obj_info.obj_id.osnum);

        if (!(sts & *msg & 1))
        {
            return (*msg = MSFAIL);
        }
    }
    else
    {
        move_data.dyn_obj.osnum = obj_info.obj_id.osnum;
        move_data.dyn_obj.objid = obj_info.obj_id.objid;
        move_data.dyn_mod = obj_info.mod_env;
        move_data.dyn_mod.md_id.objid = NULL_OBJID; /* no R-tree manips */
    }        

    move_data.from_point = *from_point;

    /*
     *  invoke dynamics
     */

    dp$dynamics (dyn_fun = DYmove_dyn, 
                 information = &move_data);

    if (move_data.mode == COPY_DYNAMICS)
    {
        /*
         *  delete dynamic object
         */

        sts = om$send (msg = message GRgraphics.GRdelete
                            (msg, &move_data.dyn_mod),
                       senderid = caller_id,
                       targetid = move_data.dyn_obj.objid,
                       targetos = move_data.dyn_obj.osnum);

        if (!(sts & *msg & 1))
        {
            return (*msg = MSFAIL);
        }
    }

    return (*msg = MSSUCC);
}

#argsused
IGRint DYmove_dyn (move_data, to_point, mtx, objects, num_objects, buffers,
                   num_buffers, in_dummy1, in_dummy2, in_dummy3, out_dummy1,
                   dyn_mod_info, out_dummy3)

struct dyn_args       *move_data;
struct EX_button      *to_point;
IGRdouble             *mtx;
struct GRid          **objects;
IGRint                *num_objects;
struct DPele_header  **buffers;
IGRint                *num_buffers;
IGRchar               *in_dummy1;
IGRchar               *in_dummy2;
IGRchar               *in_dummy3;
IGRchar              **out_dummy1;
struct GRmdenv_info  **dyn_mod_info;
IGRchar              **out_dummy3;
{
    IGRshort    mxtype, n;      /* matrix type for xform, index */
    IGRlong     sts, msg;       /* return codes */
    IGRdouble   delta[3];       /* delta vector between the two move points */
    IGRmatrix   t_matrix;       /* transformation matrix */

    /*
     *  get the delta vector between the two points
     */

    delta[0] = to_point->x - move_data->from_point.x;
    delta[1] = to_point->y - move_data->from_point.y;
    delta[2] = to_point->z - move_data->from_point.z;

    /*
     *  get a transformation matrix
     */

    if (MAtrlmx (&msg, delta, t_matrix))
    {
        if (move_data->mode == COPY_DYNAMICS)
        {
            /*
             *  transform the clone
             */

            MAtypemx (&msg, t_matrix, &mxtype);

            sts = om$send (msg = message GRgraphics.GRxform
                                (&msg, &move_data->dyn_mod, &mxtype,
                                 t_matrix, &move_data->dyn_obj.objid),
                           senderid = NULL_OBJID,
                           targetid = move_data->dyn_obj.objid,
                           targetos = move_data->dyn_obj.osnum);

            if (sts & msg & 1)
            {
                msg = MSSUCC;
                move_data->from_point.x = to_point->x;
                move_data->from_point.y = to_point->y;
                move_data->from_point.z = to_point->z;
            }
        }
        else
        {
            /*
             *  combine located object's module matrix and the
             *  translation matrix
             */

            n = 4;

            MAmulmx (&msg, &n, &n, &n, t_matrix,
                     move_data->dyn_mod.md_env.matrix,
                     move_data->trans.matrix);

            MAtypemx (&msg, move_data->trans.matrix,
                      &move_data->trans.matrix_type);

            *dyn_mod_info = &move_data->trans;
        }
    }
    else
    {
        msg = MSFAIL;   /* MAtrlmx failed */
    }

    /*
     *  set up the buffer pointer
     */

    *objects = &move_data->dyn_obj;
    *num_objects = 1;
    return (msg);
}

end implementation CEO_GSLOCATE;
