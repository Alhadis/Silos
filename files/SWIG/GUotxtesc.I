/* #######################    APOGEE COMPILED   ######################## */
class implementation GRvg;

#indlude "exsysdep.h"
#include "grimport.h"
#include "igrtypedef.h"
#include "OMminimum.h"
#include "OMmacros.h"
#include "igr.h"
#include "igetypedef.h"
#include "igrdp.h"
#include "fontdef.h"
#include "font.h"
#ifdef X11
#include "FSX.h"
#else
#include "grdpbdef.h"
#endif
#include "ex.h"
#include "gr.h"
#include "grdpb.h"
#include "gotextdef.h"
#include "gotext.h"
#include "exmacros.h"
#include "transdef.h"
#ifndef X11
#include "FS.h"
#endif

#ifdef  NEVER_DEF  /*added _NOT since new FS fixes call GetTextVec-DLB*/
#include "dpgraphics.h"
#endif


from GRfm import GRfm_retdata;

#argsused
IGRchar GUotxtesc( initial_call, convert, md_env, text_string, matrix,
                   text_attr, fontinfo, symbology, igds_origin, igds_range,
                   igds_string )

IGRboolean          *initial_call;
IGRboolean          *convert;
struct GRmd_env     *md_env;
IGRchar             **text_string;
IGRmatrix           matrix;
struct IGRestx      *text_attr;
struct vfont_entry  *fontinfo;
struct GRsymbology  *symbology;
IGRdouble           *igds_origin;
GRrange             igds_range;
IGRchar             **igds_string;

{
    
    IGRint           j;
    IGRint           one = 1;
    IGRint           subflags;
    IGRint           font_type;
    IGRint           num_bytes;
    IGRuchar 	     num_chars = 0;
    IGRuchar 	     weight;
    IGRuchar 	     new_char;
    IGRuchar 	     *newcharptr;
    IGRuchar 	     one16bitchar[2];
    IGRuchar 	     *swapped_string;
    IGRlong          msg;
    IGRlong          status;
    IGRshort         font;
    IGRshort         num_sub_chars;
    IGRshort         substring_length;
    IGRdouble        scale;
    IGRdouble        h_move;
    IGRdouble        v_move;
    IGRdouble        x_coord, y_coord;
    IGRboolean       bstat;
    IGRboolean       diffont;
    IGRboolean       invalid = FALSE;
    static IGRshort  prevfont;
    static IGRdouble line_spacing;
    static IGRdouble baseline;
    static IGRdouble startx;
    static IGRdouble starty;
    static IGRdouble startz;
    static GRobjid   fontid;
    static struct vfont_entry prevfontinfo;
    static IGRuchar  fractionbit;
    static IGRuchar  prevfractbit;

#ifdef  NEVER_DEF
	Display		*display;
	int		window;
	GC		gc;
#endif

/*
    extern char *memcpy();
 */
    extern IGRint GRgetfontchar();
    extern IGRint GUotextjust();
    extern IGRboolean GUget_text_substring();
    extern IGRboolean GUgetfontnum();


    /*
     * Initialization.
     */
    
    if ( *initial_call )
    {
        /*
         *  Get the object id of the font manager.
         */

        ex$get_objid_from_NOD ( NODname = FONTMGR_NOD,
                                objname = FONTMGR_NO_NAME,
                                pobjid = &fontid,
                                modid = md_env->md_id.objid,
                                mod_osnum = md_env->md_id.osnum );

        /*
         *  Get the font data of the font that initiates the text string.
         */

        if ( !GUgetfontnum ( fontinfo, &text_attr->font, &fontid,
                              &fractionbit, md_env ) )
        {
            num_chars = 0;
            goto wrapup;
        }  

        if (! *convert)
        {
            /*
             * if converting to an IGDS plotting meta file, dont't want
             * the fraction char codes changed to IGDS fraction codes
             */

            fractionbit = 0x0;
        }

        /*
         * Initialize the values of the prevfont so that if an 
         * invalid escape sequence ( suchas a string with an <esc>p
         * without an <esc>f before it) occurs, the initial font is
         * is used.
         */ 

        prevfont = text_attr->font;
        prevfractbit = fractionbit;
        prevfontinfo = *fontinfo;

        /*
         *  Calculate the line spacing for use in line feeds.
         */

        line_spacing = (text_attr->height/(fontinfo->bodysize - fontinfo->descent)) * 
                   fontinfo->bodysize * text_attr->line_spac;

        /*
         *  Set up the start origin and the baseline of the text.
         */

        startx = matrix[3];
        starty = matrix[7];
        startz = matrix[11];
        baseline = 0;

        /*
         *  Map IGE justification to the IGDS equivalent.
         */

        status = GUotextjust ( &(text_attr->just) );
    }  /*  end if initial call  */

    /*
     *  Process IGDS substrings of the text string by
     *  interpreting escape sequences and line feeds in the string.
     *  Blanks in the text string must be removed and the
     *  origin adjusted accordingly.
     */

    *igds_string = 0;

    while ( text_attr->text_length > 0  &&  !*igds_string )
    {
        if (fractionbit == 0x61)
        {
           font_type = FRACTION_FONT;
        }
        else
        {
           font_type = TEXT_FONT;
        }

        /*
         *  If the inter-character spacing is one, the text substring
         *  should be treated as a group so that kerning pairs are used
         *  by Font Server when FSGetTextVect is called (calling FSGetTextVect
         *  sending one char at a time would not include kerning pairs);
         *  otherwise, each character must be translated separately, so
         *  that the origin of each character falls in the correct place
         *  (a char spacing other than one indicates additional moves must
         *  be made between each char).
         */
        
        if ( text_attr->char_spac == 1.0 )
        {
            substring_length = text_attr->text_length;
        }
        else  /* only process the next character */
        {
            substring_length = 1;
        }

        bstat = GUget_text_substring ( &msg, *text_string,
                                       &substring_length, fontinfo,
                                       convert, font_type, &subflags,
                                       &num_sub_chars );

        if ( num_sub_chars > 0 )
        {
            /*
             * The IGDS string will begin with the 'normal'
             * characters from the string.
             */

            h_move = 0;
            num_chars = 0;

            *igds_string = *text_string;            
            igds_origin[0] = matrix[3];
            igds_origin[1] = matrix[7];
            igds_origin[2] = matrix[11];

            /*
             *  Process the substring of the text string.
             */

            if (subflags & SIXTEEN_BIT)
            {
                /*
                 *  This is a sixteen bit font.  If we are converting to a
                 *  plotting meta file, the sixteen bit characters will be
                 *  used as is; otherwise the function GRgetfontchar will be
                 *  used to translate a 16 bit character into an eight bit
                 *  character from the appropriate font (IGDS can't handle
                 *  16 bit characters, so the 16 bit font must be split into
                 *  several eight bit fonts).
                 */

                if (*convert)
                {
                    diffont = FALSE;
                    newcharptr = (IGRuchar *) *igds_string;

                    for (j = 0; j < num_sub_chars && !diffont; j++)
                    {
                        /*
                         *  Get font number and char code for next char.
                         */

                        GRgetfontchar ( &msg, fontinfo, *text_string,
                                        &font, &new_char );

                        if (j == 0)
                        {
                            text_attr->font = font;
                        }

                        if ( font == text_attr->font )
                        {
                            /*
                             *  Calculate the origin of the next character.
                             */
        
                            one16bitchar[0] = *(*text_string+1);
                            one16bitchar[1] = **text_string;

                            /*
                             *  Calculate the origin of the next character.
                             */
        
#ifdef  NEVER_DEF
                            FSXGetTextVect( display,window,gc,fontinfo->fontid,
			     one16bitchar, one, 0.0, 0.0, &x_coord, &y_coord );
#else

                            FSGetTextVect ( fontinfo->fontid, one16bitchar, one,
                                            0.0, 0.0, &x_coord, &y_coord );
#endif
                
                            h_move += ((text_attr->width/(fontinfo->bodysize -
                                        fontinfo->descent) * x_coord ) 
                                        + (text_attr->width * (text_attr->char_spac - 1.0)));

                            num_chars++;
                            *newcharptr++ = new_char;
                            (*text_string) += 2;
                            text_attr->text_length -= 2;
                        }
                        else
                        {
                            diffont = TRUE;
                        }
                    }
                }
                else  /* creating a plotting meta file */
                {
                    /*
                     *  Calculate the origin of the next text substring.
                     *  The bytes of the 16 bit chars in the substring must be
                     *  swapped since Font Server expects the chars as
                     *  unsigned shorts and they're stored in the string in
                     *  the reverse order.
                     */

                    num_bytes = num_sub_chars * 2;
                    swapped_string = (IGRuchar *) om$malloc(size = num_bytes);
#ifdef LITTLE_ENDIAN
                    swab(*text_string, swapped_string, num_bytes);
#else
                    memcpy((char *)swapped_string, *text_string, num_bytes);
#endif

#ifdef  NEVER_DEF
                    FSXGetTextVect ( display,window,gc,fontinfo->fontid,
		              swapped_string, (IGRint) num_sub_chars, 0.0, 0.0,
                                    &x_coord, &y_coord );
#else
                    FSGetTextVect ( fontinfo->fontid, swapped_string,
                                    (IGRint) num_sub_chars, 0.0, 0.0,
                                    &x_coord, &y_coord );
#endif
                    om$dealloc(ptr = swapped_string);                
                    h_move += ((text_attr->width/(fontinfo->bodysize -
                                fontinfo->descent) * x_coord ) 
                                + (text_attr->width * (text_attr->char_spac - 1.0)));

                    num_chars += num_bytes;
                    (*text_string) += num_bytes;
                    text_attr->text_length -= num_bytes;
                }
            }
            else
            {
                /*
                 *  This is a seven bit font (can be a
                 *  'regular' font or a fraction font).
                 */

                if (*convert)
                {
                    for ( j = 0; j < num_sub_chars; j++ )
                    {
                        /*
                         *  Calculate the origin of the next character.
                         */
        
#ifdef  NEVER_DEF
                        FSXGetTextVect ( display,window,gc,fontinfo->fontid,
			*text_string, one, 0.0, 0.0, &x_coord, &y_coord );
#else
                        FSGetTextVect ( fontinfo->fontid, *text_string, one,
			0.0, 0.0, &x_coord, &y_coord );
#endif                
                        h_move += ((text_attr->width/(fontinfo->bodysize -
                                        fontinfo->descent) * x_coord ) 
                                    + (text_attr->width * (text_attr->char_spac - 1.0)));
        
                        num_chars++;
                        **text_string += fractionbit;
                        (*text_string)++;
                        text_attr->text_length--;
                    }  /*  end for num_sub_chars  */
                }
                else  /* creating a plotting meta file */
                {
#ifdef  NEVER_DEF
                    FSXGetTextVect ( display,window,gc,fontinfo->fontid,
		    *text_string, (IGRint) num_sub_chars, 0.0, 0.0,
                                    &x_coord, &y_coord );
#else
                    FSGetTextVect ( fontinfo->fontid, *text_string,
                                    (IGRint) num_sub_chars, 0.0, 0.0,
                                    &x_coord, &y_coord );
#endif
                    h_move += ((text_attr->width/(fontinfo->bodysize -
                                fontinfo->descent) * x_coord ) 
                                + (text_attr->width * (text_attr->char_spac - 1.0)));

                    num_chars += num_sub_chars;
                    (*text_string) += num_sub_chars;
                    text_attr->text_length -= num_sub_chars;
                }
            } /* end else 7/8 bit */

            /*
             *        Adjust the origin for the next portion of
             *        the text string.
             */

            matrix[3] += ( matrix[0] * h_move );
            matrix[7] += ( matrix[4] * h_move );
            matrix[11] += ( matrix[8] * h_move );
        }
        else
        {
            /*
             *  This is an escape sequence, a blank, or
             *  another special character that requires
             *  special handling.
             */
        
            switch ( msg )
            {
                case GUBLANK_TYPE:
                
                    /*
                     *  Remove the blank and adjust the origin.
                     *  This is done because I/DRAFT blanks have their
                     *  own character width while IGDS blanks are
                     *  interpreted to be the size of the previous
                     *  character.  Therefore all blanks must be removed
                     *  from the string and new elements formed.
                     */

                    if ( subflags & SIXTEEN_BIT )
                    {
#ifdef LITTLE_ENDIAN
                        one16bitchar[0] = *(*text_string+1);
                        one16bitchar[1] = **text_string;
#else
                        one16bitchar[1] = *(*text_string+1);
                        one16bitchar[0] = **text_string;
#endif
#ifdef  NEVER_DEF
                        FSXGetTextVect ( display,window,gc,fontinfo->fontid,
			one16bitchar, one, 0.0, 0.0, &x_coord, &y_coord );
#else
                        FSGetTextVect ( fontinfo->fontid, one16bitchar, one, 
                                        0.0, 0.0, &x_coord, &y_coord );
#endif
                        (*text_string)++;
                        text_attr->text_length--;
                    }
                    else
                    {
#ifdef  NEVER_DEF
                        FSXGetTextVect ( display,window,gc,fontinfo->fontid,
			*text_string, one, 0.0, 0.0, &x_coord, &y_coord );
#else
                        FSGetTextVect ( fontinfo->fontid, *text_string, one, 
                                        0.0, 0.0, &x_coord, &y_coord );
#endif
                    }
                
                    h_move = ((text_attr->width/(fontinfo->bodysize -
                                   fontinfo->descent) * x_coord ) 
                               + (text_attr->width * (text_attr->char_spac - 1.0)));
        
                    /*
                     *  Adjust the origin for the next portion of
                     *  the text string.
                     */

                    matrix[3] += ( matrix[0] * h_move );
                    matrix[7] += ( matrix[4] * h_move );
                    matrix[11] += ( matrix[8] * h_move );

                    (*text_string)++;
                    text_attr->text_length--;
                    break;

                case GUESCAPE_TYPE:

                    (*text_string)++;
                    text_attr->text_length--;
                    switch ( **text_string )
                    {
                            case ESC:
                
                                /*
                                 *  Double escapes are ignored.
                                 */
                
                                (*text_string)++;
                                text_attr->text_length--;
                                break;
                
                            case LINEFEED:
        
                                (*text_string)++;
                                text_attr->text_length--;
    
                                /*
                                 *  Set up a new baseline origin for text string.
                                 */
                
                                baseline -= line_spacing;
        
                                /*
                                 *  The origin of the next character following a
                                 *  line feed becomes the new start position.
                                 */
    
                                matrix[3] = startx + (matrix[1] * baseline);
                                matrix[7] = starty + (matrix[5] * baseline);
                                matrix[11] = startz + (matrix[9] * baseline);
                                break;        
                
                            case 'J':
                            case 'h':
                            case 'H':
        
                                 /*
                                  *  Horizontal move and horizontal justification move.
                                  */
                
                                 ( *text_string )++;
                                 memcpy((char *)&h_move, *text_string, sizeof(IGRdouble));
                                 *text_string += 8;
                                 h_move *= text_attr->width;

                                 matrix[3] += ( matrix[0] * h_move );
                                 matrix[7] += ( matrix[4] * h_move );
                                 matrix[11] += ( matrix[8] * h_move );
                                 text_attr->text_length -= 9;
                                 break;

                            case 'j':

                                /*
                                 *  Vertical justification move.
                                 */
                
                                ( *text_string )++;
                                memcpy((char *)&v_move, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                v_move = (- v_move ) * text_attr->height;

                                matrix[3] += ( matrix[1] * v_move );
                                matrix[7] += ( matrix[5] * v_move );
                                matrix[11] += ( matrix[9] * v_move );

                                startx += ( matrix[1] * v_move );
                                starty += ( matrix[5] * v_move );
                                startz += ( matrix[9] * v_move );

                                text_attr->text_length -= 9;
                                break;

                              case 'v' :

                                /*
                                 *  Vertical move.
                                 */
                
                                ( *text_string )++;
                                memcpy((char *)&v_move, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                v_move *= text_attr->height;

                                matrix[3] += ( matrix[1] * v_move );
                                matrix[7] += ( matrix[5] * v_move );
                                matrix[11] += ( matrix[9] * v_move );
                                text_attr->text_length -= 9;
                                break;

                            case 'm':
        
                                /*
                                 *  Justify field.
                                 */
                
                                *text_string += 2;
                                memcpy((char *)&h_move, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                memcpy((char *)&v_move, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                h_move *= text_attr->width;
                                v_move *= text_attr->height;

                                matrix[3] += (( matrix[0] * h_move ) + (matrix[1] * v_move));
                                matrix[7] += (( matrix[4] * h_move ) + (matrix[5] * v_move));
                                matrix[11] += (( matrix[8] * h_move ) + (matrix[9] * v_move));
                                text_attr->text_length -= 18;
                                break;

                            case 'M':
        
                                /*
                                 *  Field reference point move.
                                 */
                
                                *text_string += 3;
                                memcpy((char *)&h_move, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                memcpy((char *)&v_move, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                h_move *= text_attr->width;
                                v_move *= text_attr->height;

                                matrix[3] += (( matrix[0] * h_move ) + (matrix[1] * v_move));
                                matrix[7] += (( matrix[4] * h_move ) + (matrix[5] * v_move));
                                matrix[11] += (( matrix[8] * h_move ) + (matrix[9] * v_move));
                                text_attr->text_length -= 19;
                                break;

                            case 'f':
                    
                                /*
                                 *  Change font.
                                 */

                                prevfont = text_attr->font;                
                                prevfractbit = fractionbit;
                                prevfontinfo = *fontinfo;
                                (*text_string)++;
                                memcpy((char *)&(text_attr->font), *text_string, sizeof(IGRshort));
                                *text_string += 2;

                                /*
                                 *  Get the font data of the new font.
                                 */
                        
                                if (!GUgetfontnum( fontinfo, &text_attr->font, 
                                                   &fontid, &fractionbit, md_env ))
                                {
                                    num_chars = 0;
                                    goto wrapup;
                                }

                                if (! *convert)
                                {
                                    /*
                                     * if converting to an IGDS plotting meta
                                     * file, dont't want the fraction char
                                     * codes changed to IGDS fraction codes
                                     */

                                    fractionbit = 0x0;
                                }

                                text_attr->text_length -= 3;
                                break;
        
                            case 'x':

                                /*
                                 *  Change X scale.
                                 */
                
                                (*text_string)++;
                                memcpy((char *)&scale, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                text_attr->width *= scale;
                                text_attr->text_length -= 9;
                                break;
                
                            case 'y':

                                /*
                                 *  Change Y scale.
                                 */
                
                                (*text_string)++;
                                memcpy((char *)&scale, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                text_attr->height *= scale;
                                line_spacing = (text_attr->height/(fontinfo->bodysize - fontinfo->descent)) * 
                                fontinfo->bodysize * text_attr->line_spac;
                                text_attr->text_length -= 9;
                                break;
                
                            case 's':
        
                                /*
                                 *  Change X & Y scale.
                                 */
                
                                (*text_string)++;
                                memcpy((char *)&scale, *text_string, sizeof(IGRdouble));
                                *text_string += 8;
                                text_attr->width *= scale;
                                text_attr->height *= scale;
                                line_spacing = (text_attr->height/(fontinfo->bodysize - fontinfo->descent)) * 
                                fontinfo->bodysize * text_attr->line_spac;
                                text_attr->text_length -= 9;
                                break;
        
                            case 'p':
        
                                /*
                                 *  Return to previous font.
                                 */
                
                                text_attr->font = prevfont;
                                fractionbit = prevfractbit;
                                *fontinfo = prevfontinfo;
                                ( *text_string ) += 2;
                                text_attr->text_length -= 2;
                                break;

                            case 'w':
                
                                /*
                                 *  Change weight.
                                 */
                
                                (*text_string)++;
                                memcpy((char *)&weight, *text_string, sizeof(IGRuchar ));
                                (*text_string)++;
                                symbology->display_attr.weight = weight;
                                text_attr->text_length -= 2;
                                break;
        
                            case 'F':
                
                                /*
                                 *   Set field is ignored.
                                 */
                
                                *text_string += 3;
                                text_attr->text_length -= 3;
                                break;
        
                            case 'E':
        
                                /*
                                 *  End field is ignored.
                                 */
                
                                ( *text_string )++;
                                text_attr->text_length--;
                                break;

                            case 'C':

                                /* 
                                 *  Change character spacing.
                                 */

                                (*text_string) ++;
                                memcpy((char *)&text_attr->char_spac,
                                       *text_string, sizeof(IGRdouble) );
                                *text_string += 8;
                                text_attr->text_length -= 9;
                                break;

                            default:
                                break;
                    } /* end switch ESCAPE_TYPE */
                    break;

                case GUINVALID_TYPE :

                    (*text_string) ++;
                    text_attr->text_length --;
                    invalid = TRUE;
                    while (text_attr->text_length > 0 && invalid)
                    {
#ifdef  NEVER_DEF
                        FSXGetTextVect ( display,window,gc,fontinfo->fontid,
			*text_string, one, 0.0, 0.0, &x_coord, &y_coord);
#else
                        FSGetTextVect ( fontinfo->fontid, *text_string,
                                        one, 0.0, 0.0, &x_coord, &y_coord);
#endif
                        if ((!x_coord) && (!y_coord))
                        {
                            if (**text_string == ESC)
                            {
                                invalid = FALSE;
                            }
                            else
                            {
                                (*text_string) ++;
                                text_attr->text_length --;
                            }
                        }
                        else
                        {
                            invalid = FALSE;
                        }
                    }
                    break;


                default:
                    break;

            }  /*  end switch msg */

        } /* end else special character */

    }  /*  end while textln & !igds_string */



wrapup:

    *initial_call = FALSE;

    return ( num_chars );


}


end implementation GRvg;
