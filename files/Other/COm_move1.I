class implementation COm_move;

#include "OMmacros.h"
#include "AS_status.h"
#include "exmacros.h"
#include "macro.h"
#include "msmacros.h"
#include "ASmessages.h"
#include "dpmacros.h"

#define AS_DEBUG

%safe
char *COm_move_form_ptr = NULL;
char *COm_move_option_ptr = NULL;
int COm_move_nb_command = 0;

static int x_memo = -1,
       y_memo = -1,
       s_memo = -1;

%endsafe

from GRvg import GRgetobjinfo;
from GRgraphics import GRdisplay;
from NDnode import ASreturn_go;
from expression import list;

/*
History
  ???             mm/dd/yy             initial spec & wrote it
  elp             01/06/93             port to NT
  scw             08/10/94             port to Intel Solaris

*/

/******************************************************************************

   Interface function between C-form and CO

******************************************************************************/

COm_move_router(
  int    form_label,
  int    label,
  double value,
  char  *form_ptr)
/*.COm_router*/
{
 char text[80];
 int status;
 struct GRid cmd_obj;

 FIf_get_cmd_oid_os(form_ptr,&cmd_obj.objid,&cmd_obj.osnum);
 if(cmd_obj.objid == NULL_OBJID)
  {
   if(label != FORM_ABORT)
    {
     ex$message( buff = text,msgnumb = AS_S_FoNoAc);
    }
   else COm_move_delete_form();
  }
 else
  {
   status = om$send(msg = message COm_move.form_notification
				    (form_label,label,value,form_ptr,TRUE),
		  senderid = NULL_OBJID,
		  targetid = cmd_obj.objid,
		  targetos = cmd_obj.osnum);
   as$status()
  }
 return(1);
}

method init (int type; char *string_ptr )
{
 int status;
 int FORM = 0;
  status = om$send(msg = message COpara.init(type,string_ptr),
		   targetid = my_id,
		   mode = OM_e_wrt_message);

  /* Initialize form */

 if(COm_move_form_ptr == NULL)
  {
   FIf_new( FORM, "ASCptGraph", COm_move_router, &COm_move_form_ptr);
  }

 if(COm_move_form_ptr == NULL) return OM_W_ABORT;

 if(x_memo != -1)
  {
   FIf_set_location(COm_move_form_ptr,x_memo,y_memo);
   /*" set  s_memo %d\n",s_memo */
#if ! defined( NT )
   FIf_set_screen(COm_move_form_ptr,s_memo);
#endif
  }

   FIf_display(COm_move_form_ptr);
   COm_move_nb_command += 1;

  /* Initialize instances */

  me->Nb_Max_Feet = 0;

  /* Initialise chanselect to connect grset */

   status = om$make_chanselect (
      channame = "COm_move.located_graphics",
      p_chanselect = &me->located_chansel );
   as$status();

  return(status);
}

method wakeup ( IGRint n )
{
 int status;
 ex$message(msgnumb = AC_M_CopMov);

 status = om$send(msg = message COpara.wakeup(n),
		  targetid = my_id,
		  mode = OM_e_wrt_message);
 if(COm_move_form_ptr)
  {
   FIf_set_cmd_oid_os( COm_move_form_ptr, my_id, OM_Gw_current_OS );
   FIg_enable(COm_move_form_ptr,FORM_EXEC);

   status = om$send(msg = message COm_move.write_form(COm_move_form_ptr),
		    targetid = my_id);
  }
 return (status);
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*                                  sleep                                     */
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

method super_cmd.sleep ( IGRint n )
{
 int status,msg;

 if(COm_move_form_ptr)
  {
   FIf_set_cmd_oid_os(COm_move_form_ptr,NULL_OBJID,0);
   FIg_disable(COm_move_form_ptr,FORM_EXEC);
  }

 dp$erase_hilite(msg = &msg);
 status = om$send(msg = message COpara.sleep(n),
		   targetid = my_id,
		   mode = OM_e_wrt_message);
  return (status);
}

method delete(int n)
{
 int status;
/*
   delete the form and make the notification pointer point to the previous
   command object if any
*/
 if(COm_move_form_ptr)
  {
   COm_move_nb_command = COm_move_nb_command-1;
   if(COm_move_nb_command == 0) COm_move_delete_form();
  }
 status = om$send(msg = message COpara.delete(n),
		  targetid = my_id,
		  mode = OM_e_wrt_message);
 return(status);
}
COm_move_delete_form()
{
 FIf_get_location(COm_move_form_ptr,&x_memo,&y_memo);
 FIf_get_screen(COm_move_form_ptr,&s_memo);
 /*" get s_memo %d\n",s_memo */
 FIf_erase(COm_move_form_ptr);
 FIf_delete(COm_move_form_ptr);
 COm_move_form_ptr = NULL;
 COm_move_nb_command = 0;
 return(1);
}
end implementation COm_move;
