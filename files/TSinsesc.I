class implementation COtext;

#include <stdio.h>
#include "OMmacros.h"
#include <alloca.h>
#define control(c) (toupper(c)-64)
#define err_print(string) fprintf(stderr,"Error in %s line %i: %s\n",__FILE__,__LINE__,string)
#define TEXT_LENGTH 300

main()
{
   /*                                                                         */
   /* Check if control sequences are correctly converted into escape sequences*/
   /*                                                                         */
   
   char *text_string;
   short text_buf_size,position;
   int text_length;
   enum font_type cur_font_type;
   struct GRdpb_text_symb text_symb;
   struct IGRdisplay disp_attr;
   long msg,rc;
   double h_move;
   char esc_seq[2];
   unsigned short font_id;


   text_string=(char *)alloca(TEXT_LENGTH);
   text_buf_size=TEXT_LENGTH;
   position=0;
   disp_attr.color=disp_attr.weight=disp_attr.style=0;
   cur_font_type=seven;
   memset((char *)&text_symb,'\0',sizeof(struct GRdpb_text_symb));

   /* horizontal move */

#ifdef SUNOS   
   text_length= strlen(sprintf(text_string,"this is a text string%c%f", control('t'),1.25));
#else
   text_length= sprintf(text_string,"this is a text string%c%f", control('t'),1.25);
#endif

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='h')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

#ifdef SUNOS 
   text_length= strlen(sprintf(text_string,"this is %c%ftext", control('t'),1.25));
#else
   text_length= sprintf(text_string,"this is %c%ftext", control('t'),1.25);
#endif

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='h')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%c%fthis is text", control('t'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='h')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* move vertical */
   
   text_length= sprintf(text_string,"this is a text string%c%f", control('v'),1.44);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='v')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.44)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %c%ftext", control('v'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='v')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%c%fthis is text", control('v'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='v')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* move vertical */
   
   text_length= sprintf(text_string,"this is a text string%c%f", control('v'),1.44);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='v')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.44)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* change x-scale */
   
   text_length= sprintf(text_string,"this is a text string%c%f", control('x'),1.44);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='x')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.44)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %c%ftext", control('x'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='x')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%c%fthis is text", control('x'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='x')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* change y-scale */
   
   text_length= sprintf(text_string,"this is a text string%c%f", control('y'),1.44);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='y')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.44)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %c%ftext", control('y'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='y')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%c%fthis is text", control('y'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='y')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* change x and y scale */
   
   text_length= sprintf(text_string,"this is a text string%c%f", control('s'),1.44);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='s')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.44)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %c%ftext", control('s'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='s')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%c%fthis is text", control('s'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='s')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* change weight */
   
   text_length= sprintf(text_string,"this is a text string%c%i", control('w'),2);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='w')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (text_string[23]!=2)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %c%itext", control('w'),2);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2",esc_seq);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='w')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (text_string[10]!=2)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%c%ithis is text", control('w'),2);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='w')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (text_string[2]!=2)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* change character spacing */
   
   text_length= sprintf(text_string,"this is a text string%c%f", control('q'),1.44);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='C')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.44)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %c%ftext", control('q'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='C')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%c%fthis is text", control('q'),1.25);

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&h_move,8);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='C')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (h_move!=1.25)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   /* change font */

   
   text_length= sprintf(text_string,"this is a text string%cdeffrac,", control('f'));

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&font_id,2);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='f')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (font_id!=1)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %cdeffrac,text", control('f'));

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&font_id,2);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='f')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (font_id!=1)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%cdeffrac,this is text", control('f'));

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&font_id,2);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='f')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (font_id!=1)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }


   
   text_length= sprintf(text_string,"this is a text string%cdefault,", control('f'));

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is a text string%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[23],&font_id,2);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='f')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (font_id!=0)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"this is %cdefault,text", control('f'));

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"this is %2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[10],&font_id,2);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='f')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (font_id!=0)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }

   
   text_length= sprintf(text_string,"%cdefault,this is text", control('f'));

   rc = COinsert_escape(&msg,&text_string,&text_length,&text_buf_size,
		       &position, &cur_font_type,&text_symb,&disp_attr);
   if (!(1&rc))
   {
      err_print("COinsert failed");
      goto wrapup;
   }
   sscanf(text_string,"%2c",esc_seq);
   OM_BLOCK_MOVE(&text_string[2],&font_id,2);

   if (esc_seq[0]!=27)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (esc_seq[1]!='f')
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }
   else if (font_id!=0)
   {
      err_print("escape sequence not correctly inserted");
      goto wrapup;
   }



   wrapup:
   return 1;
}

end implementation COtext;
