/*----
%GP% CODE CLASSIFICATION                           
----
%HD%

     CLASS NAME:              COtext
     METHOD NAME:             DYtextdyn
 
     Abstract:

        This function is used in text dynamics when the user moves the
cursor or enters a character.
-----
%SC%

     VALUE =  DYtext (elem,text_attr,lbs_geom,font_id,me_text_symb,
                      me_text_extents,me_text_length,me_text_string,
                      me_ActiveDisplay,me_ActiveAngle,me_viewind)

     VALUE =  DYtextdyn(info,pnt,pnt_flag,character,num_bytes,char_flag,
                        rot_matrix,objects,num_objects,buffers,num_buffers,
                        out_flags,viewind)
-----
%EN%
     ON ENTRY:

           NAME               DATA TYPE                  DESCRIPTION
     ----------------   ----------------------  -----------------------------
     *elem              struct DPele_header     info to pass to DPdynamics
     *text_attr         struct IGResintx        text specific attributes
     *lbs_geom          struct IGRlbsys         LBS geometry
     *font_id           IGRshort                object space of font manager
     *me_text_symb      struct GRdpb_text_symb  'active' text parameters
     *me_text_extents   struct extents          extents of text string
     *me_text_length    IGRshort                length of text string
     **me_text_string   unsigned IGRchar        text string
     *me_ActiveDisplay  struct IGRdisplay       'active' display parameters
     *me_ActiveAngle    IGRdouble               'active' angle
     me_viewind         IGRint                  type of view independence;
                                                -1 if not view independent

     ON ENTRY:

        NAME       DATA TYPE                    DESCRIPTION
     ----------   ------------        ----------------------------------------
     *info        struct GRdyn_info   information to pass to DPdynamics
     *pnt         EX_button           current cursor position in world
                                      coordinates
     *pnt_flag    IGRboolean          flag is set if cursor has moved
     *character   IGRchar             single character the user has entered
     *num_bytes   IGRint              number of bytes from software queue
     *char_flag   IGRboolean          flag is set if user entered a character
     *rot_matrix  IGRdouble           window rotation matrix
-----
%EX%

     ON EXIT:

        NAME       DATA TYPE               DESCRIPTION
     ----------   ------------   -----------------------------------
     **objects    GRid           objects that are in dynamics
     *num_objects IGRint         number of objects in dynamics
     **buffers    DPele_header   buffered elements in dynamics
     *num_buffers IGRint         number of buffered elements
     *out_flags   IGRint         indicates whether or not text is
                                 view independent and if the text
                                 should be erased
     **viewind  struct DPviewind info to provide if text is view ind 

     VALUE (IGRint) =     MSSUCC    - if successful
                          MSFAIL    - if failure
-----
%MD%

     MODULES AND METHODS INVOKED:

     modules:
               DPtxdynamics
               GRbwd_beg_esc_seq
               GRcreatelbs
               GRfld_ref_pt
               GRjust_field
               OM_BLOCK_MOVE
               dp$build_dis_buffer
               ex$get_objid_from_NOD
               om$realloc
     methods:

-----
%RL%

      RELATIONS REFERENCED:

----- 
%NB%

     NOTES:  
-----

%CH%
     CHANGE HISTORY:
        
        DEK/WBC  06/20/86 : Design date.
        DEK/WBC  06/23/86 : Creation date.
        DEK      07/24/87 : Added interface for field reference
                            point moves and justify field.
        DEK      07/07/88 : Added code for sixteen bit characters and
                            changed method into a function.
-----
%PD%
--------------------------------------------------------------------
               M E T H O D    D E S C R I P T I O N
--------------------------------------------------------------------
        This function is used in text dynamics when the user moves
the cursor or enters a character.
----*/
/*EH*/

class implementation COtext;

#include "coimport.h"
#include "msdef.h"
#include "msmacros.h"
#include "grmessage.h"
#include "igr.h"
#include "gotextdef.h"
#include "exmacros.h"
#include "fontdef.h"
#include "dp.h"
#include "dpmacros.h"
#include "igrdef.h"
#include "dpdef.h"
#include "dpstruct.h"
#include "OMmacros.h"
#include "grdpbmacros.h"
#include "fontmacros.h"
#include "wl.h"

struct GRdyn_info
{
   struct DPele_header  *ele_header;
   struct DPviewind     viewind_info;
   IGRboolean           lbsys_initialized;
   IGRboolean           dyn_all_win;      /* TRUE if dynamics in all windows */
                                          /* FALSE if only in window cursor  */
                                          /* is in                           */
};

#define  UP_MOVE    0x1
#define  DOWN_MOVE  0x2

from GRfm import GRfm_retdata, GRvirt_search;

%safe
int GRtext_dynamics_in_progress = FALSE;
%endsafe

static IGRpoint                tmp_pt;         /* current position of cursor */
static IGRlong                 dimension;      /* length of the text string's
                                                  variable length array      */
static IGRboolean              esc_flag;
static IGRboolean              fraction_flag;  /* true if entering fraction  */
static IGRchar                 input1;
static IGRshort                num_pos;
static IGRshort                num_pos2;
static IGRuchar        	       esc_char[10];
static IGRint                  j;
static IGRshort                just_field_num; /* number of justified fields
                                                  in text string             */
static IGRuchar        	       just_fld[10];   /* field # of justified field */
static IGRboolean              have_just_fld;  /* true if have justifed field*/
static IGRint                  view_ind;       /* type of view independence; */
                                               /* -1 if text is not view ind */
static struct GRid             fontmgr_obj;    /* objid/osnum of font manager*/
static struct vfont_entry      font_info;      /* original font information  */
static struct vfont_entry      cur_font_info;  /* current font information   */
static struct GRcc_info        cc_info;        /* current char info          */
static IGRshort                current_font;   /* current font in string     */
static IGRshort                prev_font;      /* previous font in string    */
static struct GRdpb_text_symb  *text_symb;     /* 'active' text parameters   */
static struct extents          *text_extents;  /* extents of text string     */
static IGRdouble               *ActiveAngle;   /* 'active' angle             */
static struct IGRdisplay       *ActiveDisplay; /* 'active' display attributes*/
static struct IGResintx        text_info;      /* text specific information  */
static struct IGRestx          tx_attr;        /* text specific attributes   */
static struct DPele_header     ele_header;     /* structure for display      */
static enum font_type          cur_font_type;  /* type of font for current
                                                  character (7/8/16)         */
static enum font_type          active_font_type;/* type of font for initial
                                                   string placement          */

IGRint  DYtext(elem,text_attr,lbs_geom,font_id,me_text_symb,me_text_extents,
               me_text_length,me_text_string,me_ActiveDisplay,me_ActiveAngle,
               me_viewind)

struct DPele_header    *elem;             /* struct. with object info.   */
struct IGResintx       *text_attr;        /* text specific attributes    */
struct IGRlbsys        *lbs_geom;         /* LBS geometry                */
IGRshort               *font_id;          /* object space of font mgr.   */
struct GRdpb_text_symb *me_text_symb;     /* 'active' text parameters    */
struct extents         *me_text_extents;  /* extents of text string      */
IGRshort               *me_text_length;   /* length of text string       */
IGRuchar       	       **me_text_string;  /* text string                 */
struct IGRdisplay      *me_ActiveDisplay; /* 'active' display parameters */
IGRdouble              *me_ActiveAngle;   /* 'active' angle              */
IGRint                 me_viewind;        /* type of view independence;  */
                                          /* -1 if not view independent  */
{
   IGRint      DYtextdyn();        /* dynamic function to be called        */
                                   /* by DPtxdynamics                      */

   IGRint      status = 1;         /* return value                         */
   IGRshort    elem_type;          /* element type                         */
   IGRlong     nbytes;
   IGRlong     rc;                 /* OM return code                       */
   IGRlong     temp_msg;
   OM_S_OBJID  cur_mod_id;         /* current module's object id           */
   GRspacenum  cur_mod_osnum;      /* current module's osnum               */
   struct GRdyn_info dyn_info;     /* info to pass to the dynamics fuction */
   IGRboolean  dyn_on,             /* TRUE if dynamics is on                */
               set_inq=1;
   
   GRtext_dynamics_in_progress = TRUE;

   /*
    * initialization for first time dynamics for this string
    */

   esc_flag = 0;
   input1 = 0;
   have_just_fld = 0;
   just_field_num = 0;           /* start with no justified fields */
   fraction_flag = 0;
   text_symb = me_text_symb;
   text_extents = me_text_extents;
   ActiveAngle = me_ActiveAngle;
   ActiveDisplay = me_ActiveDisplay;
   view_ind = me_viewind;
   dyn_info.ele_header = elem;
   dyn_info.lbsys_initialized = FALSE;

   /*
    * determine whether dynamics is on in all windows or only in the window the
    * cursor is in
    */

   nbytes = (IGRlong)sizeof(dyn_info.dyn_all_win);

   gr$get_dynamics_all_windows(msg = &temp_msg,
                               sizbuf = &nbytes,
                               buffer = &dyn_info.dyn_all_win,
                               nret = &nbytes);

   /*
    *  initialize the position of the cursor
    */

   tmp_pt[0] = 0;
   tmp_pt[1] = 0;
   tmp_pt[2] = 0;

   dimension = (IGRlong) *me_text_length;

   /*
    *  get the objid of the font manager using
    *  its named object
    */

   ex$get_cur_mod(osnum = &cur_mod_osnum,
                  id = &cur_mod_id);

   ex$get_super(mod_id = cur_mod_id,
                mod_osnum = cur_mod_osnum,
                super_name = FONTMGR_NO_NAME,
                create = TRUE,
                super_class = "GRfm",
                super_id = &fontmgr_obj.objid,
                super_osnum = &fontmgr_obj.osnum);

   /*
    * get font information about specified font
    */

   rc = om$send(mode = OM_e_wrt_object,
                msg = message GRfm.GRfm_retdata
                      (&temp_msg,&text_symb->Active_font,&font_info),
                senderid = NULL_OBJID,
                targetid = fontmgr_obj.objid,
                targetos = fontmgr_obj.osnum);

   if (font_info.flags & SIXTEEN_BIT)
   {
      active_font_type = sixteen;
   }
   else if (font_info.flags & EIGHT_BIT)
   {
      active_font_type = eight;
   }
   else
   {
      active_font_type = seven;
   }

   cur_font_info = font_info;
   prev_font = -1;                 /* no previous font */
   current_font = text_symb->Active_font;

   elem_type = IGRLB;

   text_attr->font_id = *font_id;
   text_attr->flags = 0;
   text_attr->prev_font = text_symb->Active_font;
   text_attr->estx->font = text_symb->Active_font;
   text_attr->estx->just = text_symb->Active_just;
   text_attr->estx->width = text_symb->Active_width;
   text_attr->estx->height = text_symb->Active_height;
   text_attr->estx->flag = text_symb->Active_flags;
   text_attr->estx->num_char = 0;
   text_attr->estx->line_spac = text_symb->Active_linespac;
   text_attr->estx->char_spac = text_symb->Active_charspac;
   text_attr->estx->text_length = *me_text_length;
   text_attr->text_string = (IGRchar *) *me_text_string;

   /*
    * initialize the structure that contains the current char information;
    * find info at the end of the text string
    */

   GRchar_pos_info(&temp_msg,*me_text_string,*me_text_length,
                   FALSE,text_attr->estx,&font_info,me_ActiveDisplay,&cc_info);

   if (cc_info.font_info.flags & SIXTEEN_BIT)
   {
      cur_font_type = sixteen;
   }
   else if (cc_info.font_info.flags & EIGHT_BIT)
   {
      cur_font_type = eight;
   }
   else
   {
      cur_font_type = seven;
   }

   /* calling marco to set up DPele_header (elem) */

   dp$build_dis_buffer(buffer = elem,
                       type = elem_type,
                       display_att = me_ActiveDisplay,
                       ele_spec_att = text_attr,
                       geometry = lbs_geom);
   
   /* check if dynamics is set on */
   
   DPdynflags(&rc,&set_inq,&dyn_on,NULL);
   
   /* calling dynamic function if dynamics is on */

   if (dyn_on) DPtxdynamics(DYtextdyn,&dyn_info,NULL,NULL,NULL);

   *me_text_string = (IGRuchar *) text_attr->text_string;

   GRtext_dynamics_in_progress = FALSE;

   return(status);
}


#argsused
IGRint DYtextdyn(info,pnt,pnt_flag,character,num_bytes,char_flag,rot_matrix,
                 objects,num_objects,buffers,num_buffers,out_flags,viewind)

struct GRdyn_info   *info;        /* information for DPdynamics          */
struct EX_button    *pnt;         /* current cursor position in world
                                     coordinates                         */
IGRboolean          *pnt_flag;    /* flag is set if cursor was moved     */
IGRuchar    	    *character;   /* character entered by user           */
IGRint              num_bytes;    /* number of bytes from software queue */
IGRboolean          *char_flag;   /* flag is set if user entered a char. */
IGRdouble           *rot_matrix;  /* window view rotation matrix         */
struct GRid         **objects;    /* objects that are in dynamics        */
IGRint              *num_objects; /* number of objects in dynamics       */
struct DPele_header **buffers;    /* buffered elements in dynamics       */
IGRint              *num_buffers; /* number of buffered elements         */
IGRint              *out_flags;   /* indicates whether or not text is    */
                                  /* view independent and if the text    */
                                  /* should be erased                    */
struct DPviewind    **viewind;    /* info to provide if text is view ind */

{
   extern IGRboolean   GRjust_string();
   extern IGRshort     GRbwd_beg_esc_seq();
   extern IGRshort     GRfwd_beg_esc_seq();
   extern IGRboolean   GRfld_ref_pt();
   extern IGRboolean   GRgen_fraction();
   extern IGRboolean   GRcreate_lbs();
   extern IGRboolean   GRjust_field();

   IGRint              rc = 1;            /* function return code            */
   IGRlong             msg;               /* completion code                 */
   IGRdouble           esc_value;         /* escape sequence value as double */
   IGRushort   	       esc_value1;        /* esc seq value as unsigned short */
   IGRint              esc_value2;        /* escape sequence value as an int */
   IGRint              field_type;        /* type of field currently in      */
   IGRint              erase_from;        /* description of where to erase   */
                                          /* from                            */
   IGRint              erase_to;          /* description of where to erase to*/
   IGRint              num_positions;     /* # of positions to update        */
   IGRint              move_type = 0;     /* bitmask indicating up or down
                                             movement                        */
   IGRshort            num_chars;         /* number of characters contained
                                             in the fraction string          */
   IGRshort            text_length;       /* length of text string           */
   IGRdouble           h_move;            /* used to store horizontal move   */
   IGRdouble           v_move;            /* used to store vertical move     */
   IGRdouble           kern_value;        /* kerning pair value              */
   IGRshort            i,k;               /* index counters                  */
   IGRshort            one_char;          /* number of chars to search for   */
   IGRchar             esc_chars[3];      /* char(s) to search for after ESC */
   IGRchar             *esc_nums[1];      /* num to search for after ESC seq */
   IGRshort            start_index;       /* position to start search        */
   IGRshort            beg_esc;           /* position ESC sequence starts    */
   IGRshort            num_bytes_del;     /* num bytes to delete from string */
   IGRuchar    	       fraction[10];      /* string containing fraction code */
   IGRshort            temp_font;         /* temporary storage for font      */
   IGRshort            temp_prev_font;    /* temporary previous font         */
   IGRshort            del_char_index;    /* index of first char to delete   */
   IGRshort            erase_index;       /* index to begin erasing          */
   IGRshort            chars_eol;         /* # chars from current char to    */
                                          /* to the end of the line          */
   IGRshort            *positions[3];     /* position in the text string to  */
                                          /* update during justification     */
   unsigned short      erase_flags;       /* cc_info flags at erase position */
   struct vfont_entry  temp_font_info;    /* font information of temp font   */
   struct IGRdisplay   cur_disp_attr;     /* current display attributes      */
   IGRuchar    	       *info_text_string; /* shortened name of text string   */
   IGRboolean          char_type = FALSE;
   IGRboolean          erase_flag;        /* TRUE if sub-string erased       */
   GRspacenum          cur_mod_osnum;     /* current module's osnum          */
   GRobjid             win_objid = NULL_OBJID; /* objid of window to display in   */
   IGRshort            tmp_short;

   ele_header = *(info->ele_header);
   text_length = info->ele_header->ele_spec_att.text->estx->text_length;
   info_text_string = (IGRuchar *) info->ele_header->ele_spec_att.text->text_string;

   if (*pnt_flag)            /* if cursor position has changed, change point */
   {
      tmp_pt[0] = pnt->x;
      tmp_pt[1] = pnt->y;
      tmp_pt[2] = pnt->z;

      /*
       * initialize the local bounded system geometry's origin point to the
       * current cursor point; must update this so text will be displayed
       * at the correct (current) position
       */

      ele_header.geometry.lbsys->matrix[3] = tmp_pt[0];
      ele_header.geometry.lbsys->matrix[7] = tmp_pt[1];
      ele_header.geometry.lbsys->matrix[11] = tmp_pt[2];
   }
   else  /* may not need to erase whole text string */
   {
      /*
       * if pnt->objid is NULL_OBJID, this indicates the cursor is not
       * currently in a valid graphics window, so the text string does not
       * need to be displayed
       */

      if (pnt->objid != NULL_OBJID)
      {
         *out_flags |= DP_DONT_ERASE;

         /*
          * if dynamics display is in all windows, set win_objid (an argument
          * for dp$display) to NULL_OBJID so the text will be displayed in all
          * of the current modules' windows, otherwise set win_objid to the
          * objid of the window the cursor is currently in so the text will be
          * displayed only in that window
          */

         if (info->dyn_all_win)
         {
            win_objid = NULL_OBJID;
         }
         else  /* dynamics in single window */
         {
            win_objid = pnt->objid;
         }
      }
   }

   if (*char_flag)
   {
      /*
       * if no characters have been entered, must update the local bounded
       * system in case the cursor is not in the original view - the lbsys is
       * not updated if there are no characters to display, even if the cursor
       * is moved
       */

      if (text_length == 0)
      {
   #ifndef IDRAW
         /*
          * if text is view independent, initialize the rotation matrix to the
          * identity matrix  since the view rotation shouldn't be used
          */

         if (view_ind >= 0)
         {
            for (i = 0; i < 15; ++i)
            {
               rot_matrix[i] = 0;
            }

            rot_matrix[0] = 1;
            rot_matrix[5] = 1;
            rot_matrix[10] = 1;
            rot_matrix[15] = 1;
         }
   #endif  /* IDRAW */

         GRcreate_lbs(&msg,ActiveAngle,rot_matrix,tmp_pt,
                      text_extents,ele_header.geometry.lbsys);
      }

      one_char = 1;
      k = 0;

      ex$get_cur_mod(osnum = &cur_mod_osnum);

      text_info.font_id = cur_mod_osnum;
      text_info.estx = &tx_attr;
      text_info.just_moves[0] = ESC;
      text_info.just_moves[1] = 'j';
      text_info.just_moves[10] = ESC;
      text_info.just_moves[11] = 'h';
      ele_header.dis_att = &cur_disp_attr;
      ele_header.ele_spec_att.text = &text_info;

      while (k < num_bytes)
      {
         erase_flag = FALSE;

         if (character[k] == DEL)
         {
            /*
             * delete character has been entered
             */

            if (fraction_flag)
            {
               if (j)
               {
                  --j;
                  esc_char[j] = 0;

                  ex$message (in_buff = (IGRchar *) esc_char,
                              field = KEYIN_FIELD);
               }
               else
               {
                  fraction_flag = FALSE;

                  ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
               }
            }
            else if (text_length > 0)
            {
               /*
                * clear the escape flag and the escape chars index (j)
                * if a delete was entered before completing input
                * for a control sequence; also need to display the prompt
                */

               if (esc_flag)
               {
                  esc_flag = 0;
                  j = 0;
                  ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
               }

               temp_font = text_symb->Active_font;
               temp_font_info = font_info;

               get_num_bytes_delete(&msg,info_text_string,&text_length,
                                    &temp_font,&temp_font_info,
                                    &prev_font,&num_bytes_del);

               if (*out_flags & DP_DONT_ERASE)
               {
                  /*
                   * if the char(s) being deleted are in a field that is
                   * justified or is followed by a move to field
                   * reference point escape sequence, a flag must be set
                   * to indicate this so special actions can be taken
                   * to erase, justify and display the text string
                   */

                  field_type = NO_FLD;

                  if (cc_info.field_delim)  /* currently in a field */
                  {
                      if (cc_info.flags & FIXED_LENGTH_FIELD)
                      {
                          field_type |= FIXED_LENGTH_FLD;
                      }

                      if (cc_info.flags & JUSTIFIED_FIELD)
                      {
                          field_type |= JUSTIFIED_FLD;
                      }
                  }

                  /*
                   * determine if a linefeed, a vertical move escape
                   * sequence, a change vertical scale escape sequence
                   * or a regular char is being deleted
                   */

                  del_char_index = text_length - num_bytes_del;

                  if ((info_text_string[del_char_index] == ESC) &&
                      (info_text_string[del_char_index + 1] == LINEFEED))
                  {
                     char_type = DELETE_LF;
                     move_type = ((info->ele_header->ele_spec_att.text->estx->line_spac >= 0) ? DOWN_MOVE : UP_MOVE);
                  }
                  else
                  {
                     char_type = DELETE_CHAR;
                     esc_chars[0] = 'v';
                     esc_chars[1] = 's';
                     esc_chars[2] = 'y';
                     num_chars = 3;
                     start_index = del_char_index;
                     move_type = 0;

                     while (GRfwd_beg_esc_seq(&msg,info_text_string,
                                              &text_length,&num_chars,
                                              esc_chars,NULL,&start_index,
                                              &prev_font,&temp_font,
                                              &temp_font_info,&beg_esc))
                     {
                        /*
                         * determine the value of the escape sequence
                         */

                        OM_BLOCK_MOVE(&info_text_string[beg_esc + 2],&esc_value,8);

                        if (info_text_string[beg_esc + 1] == 'v')
                        {
                           /*
                            * vertical move escape sequence; determine if
                            * the move is up or down
                            */

                           char_type = DELETE_LF;

                           if (esc_value >= 0)
                           {
                              move_type |= UP_MOVE;
                           }
                           else
                           {
                              move_type |= DOWN_MOVE;
                           }
                        }
                        else  /* change xy-scale or change y-scale */
                        {
                           /*
                            * if the scale value is greater than one, may
                            * have to redisplay part of the text string
                            */

                           if (esc_value > 1.0)
                           {
                              char_type = DELETE_LF;
                              move_type |= UP_MOVE;
                           }
                        }

                        start_index = beg_esc + 10;
                     }
                  }

                  /*
                   * find the text sub-string to erase
                   */

                  GRerase_chars(&msg,info_text_string,
                                info->ele_header->ele_spec_att.text->estx,
                                &font_info,ActiveDisplay,char_type,
                                move_type,field_type,&del_char_index,
                                &cc_info,&text_info,&cur_disp_attr,
                                &erase_from,&erase_to,&erase_index,
                                &chars_eol,&erase_flags,&kern_value);

                  erase_flag = TRUE;

                  /*
                   * always delete from last displayable char to the end of
                   * the text string; the chars_eol will be deleted so there
                   * will be no chars_eol
                   */

                  chars_eol = 0;

                  /*
                   *  erase the specified portion of the text string
                   */

                  if (text_info.estx->text_length)
                  {
                     /*
                      * if only part of the text string needs to be erased,
                      * erase it using dp$display; otherwise erase the
                      * highlight plane which erases the entire text string
                      */

                     if (text_info.estx->text_length != text_length)
                     {
                        DPtxdyn_set_drawing_mode( WL_DYN_ERASE_MODE );
                        dp$display(msg = &msg,
                                   osnum = cur_mod_osnum,
                                   objid = win_objid,
                                   mode = GRhe,
                                   buffer = &ele_header,
                                   view_ind = ((view_ind >= 0) ? TRUE : FALSE),
                                   view_ind_type = view_ind,
                                   view_ind_point = tmp_pt);
                     }
                     else
                     {
                        dp$erase_hilite(msg = &msg);
                     }
                  }
               }

               text_length -= num_bytes_del;

               /*
                * find out if the last character in the string after
                * the delete is seven bit or sixteen bit; search
                * backwards through string for a change font escape
                * sequence to find out the font type
                */

               esc_chars[0] = 'f';

               if (GRbwd_beg_esc_seq(&msg,info_text_string,&one_char,
                                     esc_chars,NULL,&text_length,
                                     font_info.flags,&beg_esc))
               {
                  OM_BLOCK_MOVE(&info_text_string[beg_esc + 2],&temp_font,2);

                  rc = om$send(mode = OM_e_wrt_object,
                               msg = message GRfm.GRfm_retdata(&msg,
                                     &temp_font,&temp_font_info),
                               senderid = NULL_OBJID,
                               targetid = fontmgr_obj.objid,
                               targetos = fontmgr_obj.osnum);
               }
               else
               {
                  temp_font_info.flags = font_info.flags;
               }

               if (temp_font_info.flags & SIXTEEN_BIT)
               {
                  cur_font_type = sixteen;
               }
               else if (temp_font_info.flags & EIGHT_BIT)
               {
                  cur_font_type = eight;
               }
               else
               {
                  cur_font_type = seven;
               }
            }

            ++k;   /* get next character off queue */
         }
         else     /* character, other than a delete character */
         {
            /*
             * if the variable length array for the text string is not
             * large enough (stroke start escape sequences + linefeed
             * escape sequence + character is worst case = 31 bytes),
             * expand it and increment text length and append next
             * character to text string
             */

            if (text_length + 31 > dimension)
            {
               /*
                * enlarging the variable length array
                */

               dimension += TEXT_BUF_SIZE;
               info_text_string = (IGRuchar *)om$realloc(ptr = (char *) info_text_string,
                                                                 size = dimension);
            }

            if (fraction_flag || character[k] == FRACTION_KEY)
            {
               if (character[k] == FRACTION_KEY)
               {
                  /*
                   * check to see if active fraction font
                   */

                  ex$message (msgnumb = GR_P_EnterFraction);

                  fraction_flag = TRUE;
                  j = 0;
                  esc_char[j] = 0;
               }
               else      /* already have fraction key */
               {
                  if (character[k] > 0x2e && character[k] < 0x3a)
                  {
                     esc_char[j] = character[k];
                     ++j;
                     esc_char[j] = 0;

                     ex$message (in_buff = (IGRchar *) esc_char,
                                 field = KEYIN_FIELD);
                  }
                  else       /* nonnumeric character "ends" fraction */
                  {
                     fraction_flag = FALSE;
                     ex$message (in_buff = "",
                                 field = KEYIN_FIELD);

                     ex$message(msgnumb = GR_P_EntTxtDtPtOrg);

                     GRgen_fraction(&msg,esc_char,fraction,&num_chars);

                     if (msg == MSFAIL)
                     {
                        ex$message (msgnumb = GR_E_NoActFracFont);
                     }
                     else
                     {
                        OM_BLOCK_MOVE(fraction,
                                      &info_text_string[text_length],
                                      num_chars);

                        if (character[k] == 0xa || character[k] == 0xd)
                        {
                           info_text_string[text_length + num_chars] = ESC;
                           info_text_string[text_length + num_chars + 1] = LINEFEED;

                           text_length += num_chars + 2;
                           char_type = INSERT_LF;
                           move_type = ((info->ele_header->ele_spec_att.text->estx->line_spac >= 0) ? DOWN_MOVE : UP_MOVE);
                        }
                        else if (character[k] == ESC)
                        {
                           info_text_string[text_length + num_chars] = ESC;
                           info_text_string[text_length + num_chars + 1] = ESC;

                           text_length += num_chars + 2;
                           char_type = INSERT_CHAR;
                        }
                        else
                        {
                           info_text_string[text_length + num_chars] = character[k];

                           text_length += num_chars + 1;
                           char_type = INSERT_CHAR;
                        }

                        if (*out_flags & DP_DONT_ERASE)
                        {
                           /*
                            * if the char(s) being inserted are in a field that
                            * is justified or is followed by a move to field
                            * reference point escape sequence, a flag must be
                            * set to indicate this so special actions can be
                            * taken to erase, justify and display the text
                            * string
                            */

                           field_type = NO_FLD;

                           if (cc_info.field_delim)  /* currently in a field */
                           {
                               if (cc_info.flags & FIXED_LENGTH_FIELD)
                               {
                                   field_type |= FIXED_LENGTH_FLD;
                               }

                               if (cc_info.flags & JUSTIFIED_FIELD)
                               {
                                   field_type |= JUSTIFIED_FLD;
                               }
                           }

                           /*
                            * find the text sub-string to erase
                            */

                           GRerase_chars(&msg,info_text_string,
                                         info->ele_header->ele_spec_att.text->estx,
                                         &font_info,ActiveDisplay,char_type,
                                         move_type,field_type,&del_char_index,
                                         &cc_info,&text_info,&cur_disp_attr,
                                         &erase_from,&erase_to,&erase_index,
                                         &chars_eol,&erase_flags,&kern_value);

                           erase_flag = TRUE;

                           /*
                            *  erase the specified portion of the text string
                            */

                           if (text_info.estx->text_length)
                           {
                              /*
                               * if only part of the text string needs to be
                               * erased, erase it using dp$display; otherwise
                               * erase the highlight plane which erases the
                               * entire text string
                               */

                              if (text_info.estx->text_length != text_length)
                              {
                                 DPtxdyn_set_drawing_mode( 
                                                           WL_DYN_ERASE_MODE );
                                 dp$display(msg = &msg,
                                            osnum = cur_mod_osnum,
                                            objid = win_objid,
                                            mode = GRhe,
                                            buffer = &ele_header,
                                            view_ind = ((view_ind >= 0) ? TRUE : FALSE),
                                            view_ind_type = view_ind,
                                            view_ind_point = tmp_pt);
                              }
                              else
                              {
                                 dp$erase_hilite(msg = &msg);
                              }
                           }
                        }
                     }
                  }
               }

               ++k;   /* get next character off queue */

            }                /* end if FRACTION_KEY or fraction_flag */

            else if (esc_flag || character[k] == 0x14 || character[k] == 0x16 ||
                    character[k] == 0x6 || character[k] == 0x2 ||
                    character[k] == 0x5 || character[k] == 0x13 ||
                    character[k] == 0x18 || character[k] == 0x19 ||
                    character[k] == 0x0f || character[k] == 0xa ||
/*                  character[k] == 0x3 ||  commented out until display supports multi-color text */
                    character[k] == 0x17 ||
                    character[k] == 0x1a || character[k] == 0x11 ||
                    character[k] == 0xd)
            {
               /*
                * if a linefeed, horizontal move or a vertical move is
                * being inserted, need to erase a sub-string
                */

               if ((!esc_flag) &&
                   ((character[k] == 0xa) || (character[k] == 0xd)))
               {
                  erase_flag = TRUE;
                  char_type = INSERT_LF;
                  move_type = ((info->ele_header->ele_spec_att.text->estx->line_spac >= 0) ? DOWN_MOVE : UP_MOVE);
               }
               else if (esc_flag && character[k] == 0xd)
               {
                  if (info_text_string[num_pos - 1] == 'h')
                  {
                     erase_flag = TRUE;    /* move horizontal */
                     char_type = INSERT_CHAR;
                  }
                  else if (info_text_string[num_pos - 1] == 'v')
                  {
                     if (sscanf((char *)esc_char,"%lf",&esc_value))
                     {
                        /*
                         * determine if the vertical move is up or down
                         */

                        erase_flag = TRUE;    /* move vertical */
                        char_type = INSERT_LF;


                        if (esc_value >= 0)
                        {
                           move_type = UP_MOVE;
                        }
                        else
                        {
                           move_type = DOWN_MOVE;
                        }
                     }
                  }
                  else if ((info_text_string[num_pos - 1] == 's') ||
                           (info_text_string[num_pos - 1] == 'y'))
                  {
                     /*
                      * determine if the scale is greater than one or not;
                      * if it is, text height will become greater than it
                      * currently is and a sub-string of the text string
                      * may have to be erased, depending on justification
                      */

                     if (sscanf((char *)esc_char,"%lf",&esc_value) &&
                         (esc_value > 1.0))
                     {
                        erase_flag = TRUE;    /* scaling text */
                        char_type = INSERT_LF;
                        move_type = UP_MOVE;
                     }
                  }
               }

               if ((*out_flags & DP_DONT_ERASE) &&
                   (erase_flag))
               {
                  /*
                   * if the char(s) being inserted are in a field that
                   * is justified or is followed by a move to field
                   * reference point escape sequence, a flag must be
                   * set to indicate this so special actions can be
                   * taken to erase, justify and display the text
                   * string
                   */

                  field_type = NO_FLD;

                  if (cc_info.field_delim)  /* currently in a field */
                  {
                      if (cc_info.flags & FIXED_LENGTH_FIELD)
                      {
                          field_type |= FIXED_LENGTH_FLD;
                      }

                      if (cc_info.flags & JUSTIFIED_FIELD)
                      {
                          field_type |= JUSTIFIED_FLD;
                      }
                  }

                  /*
                   * find the text sub-string to erase
                   */

                  GRerase_chars(&msg,info_text_string,
                                info->ele_header->ele_spec_att.text->estx,
                                &font_info,ActiveDisplay,char_type,
                                move_type,field_type,&del_char_index,
                                &cc_info,&text_info,&cur_disp_attr,
                                &erase_from,&erase_to,&erase_index,
                                &chars_eol,&erase_flags,&kern_value);

                  /*
                   * set erase_flag to TRUE to indicate part of the text
                   * string has been erased; also need to set chars_eol to
                   * zero since GRerase_chars is being called AFTER the
                   * escape sequence has been inserted - 
                   * cc_info.cur_char_index will be incremented to the end
                   * of the text string, so there will be no chars from the
                   * current char index to the end of the current line
                   */

                  erase_flag = TRUE;
                  chars_eol = 0;

                  /*
                   * erase the specified portion of the text string
                   */

                  if (text_info.estx->text_length)
                  {
                     /*
                      * if only part of the text string needs to be erased,
                      * erase it using dp$display; otherwise erase the
                      * highlight plane which erases the entire text string
                      */

                     if (text_info.estx->text_length != text_length)
                     {
                        DPtxdyn_set_drawing_mode( WL_DYN_ERASE_MODE );
                        dp$display(msg = &msg,
                                   osnum = cur_mod_osnum,
                                   objid = win_objid,
                                   mode = GRhe,
                                   buffer = &ele_header,
                                   view_ind = ((view_ind >= 0) ? TRUE : FALSE),
                                   view_ind_type = view_ind,
                                   view_ind_point = tmp_pt);
                     }
                     else
                     {
                        dp$erase_hilite(msg = &msg);
                     }
                  }
               }

               if (!esc_flag)       /* escape not yet inserted in string */
               {
                  /*
                   * insert appropriate escape sequence into string based on
                   * the control sequence
                   */

                  j = 0;
                  if (character[k] == 0x14)       /* horizontal move */
                  {
                     ex$message(msgnumb = GR_P_EntHorMvVal);
                     info_text_string[text_length + 1] = 'h';
                  }
                  else if (character[k] == 0x16)  /* vertical move */
                  {
                     ex$message(msgnumb = GR_P_EntVerMvVal);
                     info_text_string[text_length + 1] = 'v';
                  }
                  else if (character[k] == 0x6)   /* change font */
                  {
                     ex$message(msgnumb = GR_P_NameNumFnt);
                     info_text_string[text_length + 1] = 'f';
                  }
                  else if (character[k] == 0x2)   /* set field */
                  {
                     ex$message(msgnumb = GR_P_EntFldNo);
                     info_text_string[text_length + 1] = 'F';
                  }
                  else if (character[k] == 0x0f)  /* field reference point move */
                  {
                     ex$message(msgnumb = GR_P_EntRefFldNo);
                     info_text_string[text_length + 1] = 'M';
                  }
                  else if (character[k] == 0x5)   /* end field */
                  {
                     info_text_string[text_length + 1] = 'E';
                  }
                  else if (character[k] == 0x13)  /* change scale */
                  {
                     ex$message(msgnumb = GR_P_EntTxtScCh);
                     info_text_string[text_length + 1] = 's';
                  }
                  else if (character[k] == 0x18)  /* change x scale */
                  {
                     ex$message(msgnumb = GR_P_EntTxtXscCh);
                     info_text_string[text_length + 1] = 'x';
                  }
                  else if (character[k] == 0x19)  /* change y scale */
                  {
                     ex$message(msgnumb = GR_P_EntTxtYscCh);
                     info_text_string[text_length + 1] = 'y';
                  }
                  else if (character[k] == 0xa || character[k] == 0xd)
                  {
                     info_text_string[text_length + 1] = LINEFEED;
                  }
		  /* Commented out until display supports multi-color text */
		  /*
                  else if (character[k] == 0x3)
                  {
                     ex$message(msgnumb = GR_P_EnterNewColor);

                     info_text_string[text_length + 1] = 'c';
                  }
		  ** End of removed code.  jjm:1/4/91 */
                  else if (character[k] == 0x17)    /* change weight */
                  {
                     ex$message(msgnumb = GR_P_EnterNewWght);

                     info_text_string[text_length + 1] = 'w';
                  }
                  else if (character[k] == 0x1a)    /* pop font */
                  {
                     info_text_string[text_length + 1] = 'p';
                  }
                  else if (character[k] == 0x11)    /* change char spacing */
                  {
                     ex$message(msgnumb = GR_P_EntChrSp);

                     info_text_string[text_length + 1] = 'C';
                  }

                  /*
                   * update length of text string to include escape sequence
                   */

                  info_text_string[text_length] = ESC;
                  esc_flag = 1;
                  num_pos = text_length + 2;

                  if ((info_text_string[num_pos - 1] == 'f') ||
                      (info_text_string[num_pos - 1] == 'c'))
                  {
                      esc_value1 = 0;
                      OM_BLOCK_MOVE(&esc_value1,&info_text_string[text_length + 2],2);
                      text_length += 4;
                  }
                  else if (info_text_string[num_pos - 1] == 'F')
                  {
                      info_text_string[text_length + 2] = 0;
                      info_text_string[text_length + 3] = 0;
                      text_length += 4;
                  }
                  else if (info_text_string[num_pos - 1] == 'w')
                  {
                      info_text_string[text_length + 2] = 0;
                      text_length += 3;
                  }
                  else if (info_text_string[num_pos - 1] == 'p')
                  {
                      info_text_string[text_length + 2] = POP_FONT;
                      text_length += 3;
                      esc_flag = 0;    /* entire escape sequence inserted */

                      if (prev_font != -1)
                      {
                         current_font = prev_font;

                         om$send(mode = OM_e_wrt_object,
                                 msg = message GRfm.GRfm_retdata(&msg,
                                       &current_font,&cur_font_info),
                                 senderid = NULL_OBJID,
                                 targetid = fontmgr_obj.objid,
                                 targetos = fontmgr_obj.osnum);

                         if (cur_font_info.flags & SIXTEEN_BIT)
                         {
                            cur_font_type = sixteen;
                         }
                         else if (cur_font_info.flags & EIGHT_BIT)
                         {
                            cur_font_type = eight;
                         }
                         else
                         {
                            cur_font_type = seven;
                         }
                      }
                  }
                  else if (info_text_string[num_pos - 1] == 'E')
                  {
                      text_length += 2;
                      esc_flag = 0;    /* entire escape sequence inserted */

                      if (have_just_fld)
                      {
                         --just_field_num;
                      }
                  }
                  else if (info_text_string[num_pos - 1] == LINEFEED)
                  {
                      text_length += 2;
                      esc_flag = 0;    /* entire escape sequence inserted */
                  }
                  else if (info_text_string[num_pos - 1] == 'M')
                  {
                      info_text_string[text_length + 2] = 0;
                      info_text_string[text_length + 3] = 0;

                      esc_value = 0.0;
                      OM_BLOCK_MOVE(&esc_value,&info_text_string[text_length + 4],8);
                      OM_BLOCK_MOVE(&esc_value,&info_text_string[text_length + 12],8);

                      text_length += 20;
                  }
                  else if ((info_text_string[num_pos - 1] == 'h') ||
                           (info_text_string[num_pos - 1] == 'v') ||
                           (info_text_string[num_pos - 1] == 'C'))
                  {
                      esc_value = 0.0;
                      OM_BLOCK_MOVE(&esc_value,&info_text_string[text_length + 2],8);
                      text_length += 10;
                  }
                  else  /* a change scale escape sequence */
                  {
                      esc_value = 1.0;
                      OM_BLOCK_MOVE(&esc_value,&info_text_string[text_length + 2],8);
                      text_length += 10;
                  }
               }
               else if (character[k] == 0xd)       /* carriage return */
               {
                  if (info_text_string[num_pos - 1] == 'f')
                  {
                     /*
                      * call GRvirt_search to get the virtual font
                      * number actually stored in the change font 
                      * escape sequence
                      */

                     temp_font = -1;

                     rc = om$send(mode = OM_e_wrt_object,
                                  msg = message GRfm.GRvirt_search(&msg,
                                        esc_char,&temp_font),
                                  senderid = NULL_OBJID,
                                  targetid = fontmgr_obj.objid,
                                  targetos = fontmgr_obj.osnum);

                     if (msg == MSSUCC)
                     {
                        OM_BLOCK_MOVE(&temp_font,&info_text_string[num_pos],2);

                        om$send(mode = OM_e_wrt_object,
                                msg = message GRfm.GRfm_retdata(&msg,
                                      &temp_font,&cur_font_info),
                                senderid = NULL_OBJID,
                                targetid = fontmgr_obj.objid,
                                targetos = fontmgr_obj.osnum);

                        prev_font = current_font;
                        current_font = temp_font;

                        if (cur_font_info.flags & SIXTEEN_BIT)
                        {
                           cur_font_type = sixteen;
                        }
                        else if (cur_font_info.flags & EIGHT_BIT)
                        {
                           cur_font_type = eight;
                        }
                        else
                        {
                           cur_font_type = seven;
                        }
                     }
                     else      /* virtual font name not found */
                     {
                        text_length -= 4;
                        ex$message(field = ERROR_FIELD,
                                   time = 2,
                                   msgnumb = GR_P_VirtNmNotFnd);
                     }

                     esc_flag = 0;
                     ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                  }
                  else if (info_text_string[num_pos - 1] == 'F')
                  {
                      if ((input1 == 2) ||
                          sscanf((char *)esc_char,"%d",&esc_value2))
                      {
                         if (input1 == 0)
                         {
                             info_text_string[num_pos] = (IGRuchar)esc_value2;           /* field number */
                             j = 0;
                             input1 = 1;
                             ex$message(msgnumb = GR_P_EntFldAttNo);
                         }
                         else if (input1 == 1)
                         {
                             info_text_string[num_pos + 1] = (IGRuchar)esc_value2;       /* attributes */
                             have_just_fld = FALSE;

                             if (just_field_num < 11)
                             {
                                j = 0;
                                ex$message(msgnumb = GR_P_FldJust);
                                input1 = 2;
                             }
                             else
                             {
                                esc_flag = 0;
                                input1 = 0;
                                ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                             }
                         }
                         else if (input1 == 2)
                         {
                             if (esc_char[0] == 'Y' || esc_char[0] == 'y')
                             {
                                num_pos2 = text_length;
                                text_length += 19;

                                info_text_string[num_pos2] = ESC;
                                info_text_string[num_pos2 + 1] = 'm';
                                info_text_string[num_pos2 + 2] = 0;

                                esc_value = 0.0;
                                OM_BLOCK_MOVE(&esc_value,&info_text_string[num_pos2 + 3],8);
                                OM_BLOCK_MOVE(&esc_value,&info_text_string[num_pos2 + 11],8);

                                j = 0;
                                input1 = 3;
                                ex$message(msgnumb = GR_P_EntJust);
                            }
                            else
                            {
                                esc_flag = 0;
                                input1 = 0;
                                ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                            }
                        }
                        else if (input1 == 3)
                        {
                            info_text_string[num_pos2 + 2] = (IGRuchar) esc_value2;     /* justification */
                            have_just_fld = TRUE;
                            ++just_field_num;
                            just_fld[just_field_num - 1] = info_text_string[num_pos];
                            esc_value = 0.0;

                            /*
                             * if there are any justified fields in string,
                             * must cycle through string updating field
                             * justification moves from innermost fields out
                             */

                            start_index = 0;
                            temp_prev_font = -1;
                            temp_font = text_symb->Active_font;
                            temp_font_info = font_info;

                            for (i = just_field_num; i > 0; --i)
                            {
                               /*
                                * first find position of field in string
                                */

                               esc_chars[0] = 'F';
                               esc_nums[0] = (IGRchar *) &(just_fld[i - 1]);

                               if (GRfwd_beg_esc_seq(&msg,info_text_string,
                                                     &text_length,&one_char,
                                                     esc_chars,esc_nums,
                                                     &start_index,
                                                     &temp_prev_font,
                                                     &temp_font,
                                                     &temp_font_info,
                                                     &beg_esc))
                               {
                                  OM_BLOCK_MOVE(&esc_value,&info_text_string[beg_esc + 7],8);
                                  OM_BLOCK_MOVE(&esc_value,&info_text_string[beg_esc + 15],8);

                                  rc = GRjust_field(&msg,info_text_string,
                                                    &(text_length),
                                                    &(just_fld[i - 1]),
                                                    &font_info,ActiveDisplay,
                                                    &text_symb->Active_linespac,
                                                    &text_symb->Active_charspac,
                                                    &text_symb->Active_height,
                                                    &text_symb->Active_width,
                                                    &text_symb->Active_font,
                                                    &h_move,&v_move);

                                  OM_BLOCK_MOVE (&h_move,&(info_text_string[beg_esc + 7]),8);
                                  OM_BLOCK_MOVE(&v_move,&(info_text_string[beg_esc + 15]),8);
                               }
                               else
                               {
                                  printf("Error with fields--GRfwd_beg_esc_seq.");
                               }
                            }

                            esc_flag = 0;
                            input1 = 0;
                            ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                        }
                     }
                     else  /* sscanf failed */
                     {
                        esc_flag = 0;
                        text_length -= 4;
                        ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                     }
                  }
                  else if (info_text_string[num_pos - 1] == 'M')
                  {
                     if (sscanf((char *)esc_char,"%d",&esc_value2))
                     {
                        if (input1 == 0)
                        {
                           info_text_string[num_pos] = (IGRuchar)esc_value2;           /* reference field number */
                           j = 0;
                           input1 = 1;
                           ex$message(msgnumb = GR_P_EntRefFldJust);
                        }
                        else if (input1 == 1)
                        {
                           info_text_string[num_pos + 1] = (IGRuchar)esc_value2;       /* reference field justification */

                            rc = GRfld_ref_pt(&msg,info_text_string,
                                              &(text_length),
                                              &(info_text_string[num_pos]),
                                              &font_info,ActiveDisplay,
                                              &text_symb->Active_linespac,
                                              &text_symb->Active_charspac,
                                              &text_symb->Active_height,
                                              &text_symb->Active_width,
                                              &text_symb->Active_font,
                                              &(info_text_string[num_pos + 1]),
                                              &h_move,&v_move);

                            OM_BLOCK_MOVE (&h_move,&(info_text_string[num_pos + 2]),8);
                            OM_BLOCK_MOVE(&v_move,&(info_text_string[num_pos + 10]),8);

                            esc_flag = 0;
                            input1 = 0;
                            ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                        }
                     }
                     else  /* sscanf failed */
                     {
                        esc_flag = 0;
                        text_length -= 20;
                        ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                     }
                  }
                  else if (info_text_string[num_pos - 1] == 'w')
                  {
                     if (sscanf((char *)esc_char,"%d",&esc_value2))
                     {
                        info_text_string[num_pos] = (IGRuchar)esc_value2;
                     }
                     else  /* sscanf failed */
                     {
                        text_length -= 3;
                     }
                     esc_flag = 0;
                     ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                  }
                  else if (info_text_string[num_pos - 1] == 'c')
                  {
                     if (sscanf((char *)esc_char,"%d",&esc_value1))
                     {
                        OM_BLOCK_MOVE(&esc_value1,&info_text_string[num_pos],2);
                     }
                     else  /* sscanf failed */
                     {
                        text_length -= 4;
                     }
                     esc_flag = 0;
                     ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                  }
                  else              /* move, scale or character spacing */
                  {
                     if (sscanf((char *)esc_char,"%lf",&esc_value))
                     {
                        OM_BLOCK_MOVE(&esc_value,
                                      &info_text_string[num_pos],8);
                     }
                     else  /* sscanf failed */
                     {
                        text_length -= 10;
                     }
                     esc_flag = 0;
                     ex$message(msgnumb = GR_P_EntTxtDtPtOrg);
                  }
               }
               else
               {
                  esc_char[j] = character[k];
                  ++j;
                  esc_char[j] = 0;
               }

               ++k;   /* get next character off queue */
            }
            else        /* insert 'regular' seven bit character */
            {
               if (*out_flags & DP_DONT_ERASE)
               {
                  /*
                   * if the char(s) being inserted are in a field that
                   * is justified or is followed by a move to field
                   * reference point escape sequence, a flag must be
                   * set to indicate this so special actions can be
                   * taken to erase, justify and display the text
                   * string
                   */

                  field_type = NO_FLD;

                  if (cc_info.field_delim)  /* currently in a field */
                  {
                      if (cc_info.flags & FIXED_LENGTH_FIELD)
                      {
                          field_type |= FIXED_LENGTH_FLD;
                      }

                      if (cc_info.flags & JUSTIFIED_FIELD)
                      {
                          field_type |= JUSTIFIED_FLD;
                      }
                  }

                  /*
                   * find the text sub-string to erase
                   */

                  GRerase_chars(&msg,info_text_string,
                                info->ele_header->ele_spec_att.text->estx,
                                &font_info,ActiveDisplay,INSERT_CHAR,
                                DOWN_MOVE,field_type,&del_char_index,
                                &cc_info,&text_info,&cur_disp_attr,
                                &erase_from,&erase_to,&erase_index,
                                &chars_eol,&erase_flags,&kern_value);

                  erase_flag = TRUE;

                  /*
                   *  erase the specified portion of the text string
                   */

                  if (text_info.estx->text_length)
                  {
                     /*
                      * if only part of the text string needs to be erased,
                      * erase it using dp$display; otherwise erase the
                      * highlight plane which erases the entire text string
                      */

                     if (text_info.estx->text_length != text_length)
                     {
                        DPtxdyn_set_drawing_mode( WL_DYN_ERASE_MODE );
                        dp$display(msg = &msg,
                                   osnum = cur_mod_osnum,
                                   objid = win_objid,
                                   mode = GRhe,
                                   buffer = &ele_header,
                                   view_ind = ((view_ind >= 0) ? TRUE : FALSE),
                                   view_ind_type = view_ind,
                                   view_ind_point = tmp_pt);
                     }
                     else
                     {
                        dp$erase_hilite(msg = &msg);
                     }
                  }
               }

               if ((issixteen(character[k])) &&
                   ((num_bytes - k) > 1))  /* must have 2 bytes for 16 bits */
               {
                  if (cur_font_type == seven)
                  {
                     if (active_font_type == eight || active_font_type == sixteen)
                     {
                        /*
                         * if active font is 8 or 16 bit then change font
                         * and add character
                         */

                        info_text_string[text_length] = ESC;
                        info_text_string[text_length + 1] = 'f';

                        OM_BLOCK_MOVE(&text_symb->Active_font,
                                      &info_text_string[text_length + 2],2);

                        info_text_string[text_length + 4] = character[k];

                        if (active_font_type == eight)
                        {
                           text_length += 5;
                           cur_font_type = eight;
                           ++k;
                        }
                        else
                        {
                           info_text_string[text_length + 5] = character[k + 1];
                           text_length += 6;
                           cur_font_type = sixteen;
                           k += 2;
                        }

                        prev_font = current_font;
                        current_font = text_symb->Active_font;
                     }
                     else
                     {
                        /*
                         * cannot place 8 or 16 bit characters with a 7 bit
                         * font active
                         */

                        ex$message(msgnumb = GR_E_ActFntNotSxtnBit);
                        k = num_bytes;
                     }
                  }
                  else if (cur_font_type == eight)
                  {
                     info_text_string[text_length] = character[k];
                     ++text_length;
                     ++k;
                  }
                  else        /* current font is 16 bit */
                  {
                     info_text_string[text_length] = character[k];
                     info_text_string[text_length + 1] = character[k + 1];

                     text_length += 2;
                     k += 2;
                  }
               }
               else  /* 7 or 8 bit character */
               {
                  if (cur_font_type == sixteen)
                  {
                     /*
                      * current font was sixteen bit, change it to the
                      * active ascii font and enter character
                      */

                     info_text_string[text_length] = ESC;
                     info_text_string[text_length + 1] = 'f';

                     OM_BLOCK_MOVE(&text_symb->Active_ascii_font,
                                   &info_text_string[text_length + 2],2);

                     info_text_string[text_length + 4] = character[k];
                     text_length += 5;

                     prev_font = current_font;
                     current_font = text_symb->Active_ascii_font;
                     cur_font_type = seven;
                     ++k;
                  }
                  else
                  {
                     /*
                      * simply add character using current font
                      */

                     info_text_string[text_length] = character[k];
                     ++text_length;
                     ++k;
                  }

		  /*
		   *  must have two consecutive escape characters to represent
		   *  one escape character
		   */

		  if (character[k-1] == ESC)
		  {
		     info_text_string[text_length] = character[k-1];
		     ++text_length;
		  }

	       }
            }
         }       /* end "character other than delete" */

         if (!esc_flag)
         {
            if (just_field_num)
            {
               /*
                * if there are any justified fields in string, must
                * cycle through string updating field justification
                * moves from innermost fields out
                */

               esc_value = 0.0;
               start_index = 0;
               temp_prev_font = -1;
               temp_font = text_symb->Active_font;
               temp_font_info = font_info;

               for (i = just_field_num; i > 0; --i)
               {
                  /*
                   * first find position of field in string
                   */

                  esc_chars[0] = 'F';
                  esc_nums[0] = (IGRchar *) &(just_fld[i - 1]);

                  if (GRfwd_beg_esc_seq(&msg,info_text_string,&text_length,
                                        &one_char,esc_chars,esc_nums,
                                        &start_index,&temp_prev_font,
                                        &temp_font,&temp_font_info,&beg_esc))
                  {
                     OM_BLOCK_MOVE(&esc_value,&info_text_string[beg_esc + 7],8);
                     OM_BLOCK_MOVE(&esc_value,&info_text_string[beg_esc + 15],8);

                     rc = GRjust_field(&msg,info_text_string,&(text_length),
                                       &(just_fld[i - 1]),&font_info,ActiveDisplay,
                                       &text_symb->Active_linespac,
                                       &text_symb->Active_charspac,
                                       &text_symb->Active_height,
                                       &text_symb->Active_width,
                                       &text_symb->Active_font,&h_move,&v_move);

                     OM_BLOCK_MOVE(&h_move,&(info_text_string[beg_esc + 7]),8);
                     OM_BLOCK_MOVE(&v_move,&(info_text_string[beg_esc + 15]),8);
                  }
                  else
                  {
                     printf("Error with fields--GRfwd_beg_esc_seq.");
                  }
               }            /* end for i = just_field_num */
            }            /* end if (just_field_num) */

            /*
             * process (update) text string for justification moves and
             * find extents; also update the current char index and the
             * erase index
             */

            num_positions = 2;
            positions[0] = &cc_info.cur_char_index;
            positions[1] = &erase_index;

            /*
             *  if currently in a field, must adjust the begin
             *  field index if justification moves were removed
             *  or inserted
             */

            if (cc_info.field_delim)
            {
                positions[num_positions] = &cc_info.field_position;
                ++num_positions;
            }
            
            tmp_short = dimension;

            GRjust_string(&msg,&info_text_string,&text_length,&tmp_short,
                          &font_info,ActiveDisplay,text_symb,num_positions,
                          positions,text_extents);

            dimension = tmp_short;

            /*
             * update the current char info (cc_info struct) before displaying
             * the sub-string
             */

            GRchar_pos_info(&msg,info_text_string,text_length,FALSE,
                            info->ele_header->ele_spec_att.text->estx,
                            &font_info,ActiveDisplay,&cc_info);

            /*
             *  update the vertical stroke start move in the cc_info struct
             *  if text length is greater than zero; otherwise GRchar_pos_info
             *  has already updated the value
             */

            if (text_length)
            {
                GRvertical_ss_move(&msg,info_text_string,&text_length,
                                   info->ele_header->ele_spec_att.text->estx->height,
                                   &cc_info.ss_v_move);
            }

            if ((*out_flags & DP_DONT_ERASE) &&
                (erase_flag))
            {
               /*
                *  display the appropriate sub-string
                */

               GRdisplay_chars(&msg,info_text_string,
                               &text_length,erase_from,
                               erase_to,&cc_info.cur_char_index,
                               &erase_index,&chars_eol,font_info.flags,
                               erase_flags,kern_value,&text_info);

               DPtxdyn_set_drawing_mode( WL_DYN_DRAW_MODE );
               dp$display(msg = &msg,
                          osnum = cur_mod_osnum,
                          objid = win_objid,
                          mode = GRhd,
                          buffer = &ele_header,
                          view_ind = ((view_ind >= 0) ? TRUE : FALSE),
                          view_ind_type = view_ind,
                          view_ind_point = tmp_pt);
            }
         }
      }      /* end 'while k < num_bytes' */
   }         /* end 'if char_flag' */

   info->ele_header->ele_spec_att.text->estx->text_length = text_length;
   info->ele_header->ele_spec_att.text->text_string = (IGRchar *) info_text_string;

   if ((text_length > 0) ||
       !(info->lbsys_initialized))
   {
#ifndef IDRAW
      /*
       * if text is view independent, set the appropriate flag and supply
       * the necessary info for view independent display; also need to
       * initialize the rotation matrix to the identity matrix if this is view
       * independent text since the view rotation shouldn't be used
       */

      if (view_ind >= 0)
      {
         *out_flags |= DP_VIEW_IND_BUF;

         info->viewind_info.type = view_ind;
         info->viewind_info.point[0] = tmp_pt[0];
         info->viewind_info.point[1] = tmp_pt[1];
         info->viewind_info.point[2] = tmp_pt[2];
         *viewind = &info->viewind_info;

         for (i = 0; i < 15; ++i)
         {
            rot_matrix[i] = 0;
         }

         rot_matrix[0] = 1;
         rot_matrix[5] = 1;
         rot_matrix[10] = 1;
         rot_matrix[15] = 1;
      }
#endif  /* IDRAW */

      if (GRcreate_lbs(&msg,ActiveAngle,rot_matrix,tmp_pt,
                       text_extents,info->ele_header->geometry.lbsys))
      {

         /*
          * if the whole text string is going to be erase, need to display the
          * entire editted text string; otherwise just display a sub-string
          */

         if (*out_flags & DP_DONT_ERASE)
         {
            *num_buffers = 0;
         }
         else  /* display the entire text string */
         {
            *num_buffers = 1;
            *buffers = info->ele_header;
         }

         info->lbsys_initialized = TRUE;

         /*
          * if text length is zero, don't want to display anything
          */

         if (text_length == 0)
         {
            rc = 0;
         }
      }
      else
      {
         rc = 0;
      }
   }
   else            /* no displayable characters */
   {
      rc = 0;
   }

   return(rc);
}


IGRint get_num_bytes_delete(msg,text_string,text_length,font,font_info,
                            prev_font,num_bytes_del)

IGRlong             *msg;              /* completion code                   */
IGRuchar    	    *text_string;      /* text string                       */
IGRshort            *text_length;      /* length of text string             */
IGRshort            *font;             /* text string's initial font        */
struct vfont_entry  *font_info;        /* initial font information          */
IGRshort            *prev_font;        /* previous font                     */
IGRshort            *num_bytes_del;    /* number bytes to delete from string*/
{
   extern IGRboolean  GRbwd_disp_char();

   IGRshort           disp_pos;         /* position of last displayable char */

   /*
    *  find the position in the text string of the last displayable
    *  character
    */

   GRbwd_disp_char(msg,text_string,text_length,font,font_info,
                   prev_font,&disp_pos);

   /*
    * delete from end of string to last displayable character
    */

   *num_bytes_del = *text_length - disp_pos;

   /*
    * if a fraction character has been deleted, the change
    * font escape sequence in front of it must also be
    * deleted so that 'normal' characters entered now won't
    * come from the fraction font
    */

   if (font_info->flags & FRACTION_FONT)
   {
      *num_bytes_del += 4;
      *font = *prev_font;
      *prev_font = -1;

      font$get_info(msg = &msg,
                    font_num = font,
                    font_info = font_info);
   }

   return(TRUE);
}
end implementation COtext;
