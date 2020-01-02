/******************************************************************************

  Program:      PDFglobal.i
  
  Written By:   Gordon Campbell
  Written On:   January 2004
  
  Description:  Defines the temp-tables and other Global-type requirements
  
  06/03/04  G Campbell  Added res_len to TT_Resource table
  
  06/03/04  G Campbell  Added preprocessor PDFDIR to handle application 
                        directories.  Ensure that the proprocessor has a 
                        forward slash at the end of the directory:
                        
                        eg: GOOD -- /gord/pdfinclude/
                            BAD  -- /gord/pdfinclude
                            
                        Or you can leave it blank to run as is.
                        
  06/15/04  G Campbell  Changed PDFDIR from Scoped to Global preprocessor

  06/15/04  G Campbell  Added  TT_pdf_xml temp-table.
  
  06/16/04  G Campbell  Added fields to TT_Font that will handle the Encoding 
                        and FontFile3 elements in a Font Dictionary.

  06/17/04  G Campbell  Added pdf_id identifier to TT_object.  This allows
                        separation of the Object Pointers by the individual
                        PDF file.

  06/23/04  G Campbell  Added obj_stream index to TT_Object
  
  07/07/04  G Campbell  Added temp-table TT_Widget.  This stores the info
                        pertaining to an Adobe Form Field. 

  07/30/04  G Campbell  Added widget_page to the TT_Widget temp-table.  This 
                        allows us to track which page the widget actually 
                        belongs on.  Useful when using a multi-page PDF 
                        template.

  09/13/04  G Campbell  Added the Rotate field to TT_Object.  This allowed me
                        to store how the PDF template was created (rotated).  A
                        landscape document in Word is typically rotate 90 
                        degrees, while portrait docs are typically rotate = 0.

  10/07/04  G Campbell  Added res_old to TT_Resource table

                        Added obj_mediaN to TT_Object table.

  01/25/05  G Campbell  Added uni_obj and uni_gen for ToUnicode dictionary

                        Added descend_obj and descend_gen for DescendatnFonts
                        dictionary

  04/14/05  G Campbell  Added obj_CropN to accommodate specific object CropBox
                        behaviour

  07/06/05  G Campbell  Added pdf_pre.i to set preprocessor definitions
                        Added h_PDFinc handle -- removed from pdf_inc.i

  09/22/05  G Campbell  Added page_id to TT_Font.  This will track with which
                        external page a Font was added in.

  01/06/06  G Campbell  Added font_base to the TT_Font table.  Indicates 
                        the BaseFont name of the external font.

  03/03/10  JC Cardot   Added a bunch of new fields to TT_pdf_object in order to
                        implement pdfExtract v2

  01/16/11  JC Cardot   Added used_flag to the TT_Font table.  Indicates that
                        the font must be present in the pdf ressources

  06/19/11  JC Cardot   Added TT_Widget.widget_tpos to store the position
                        of the text within the fillin

  08/23/12  JC Cardot   Added various fields to tt_widget to manage checkboxes,
                        radio buttons, combo & list boxes

  10/04/13  JC Cardot   Added fields to TT_pdf_ext to store the array & dict seq used
  
  03/26/15  JC Cardot   Move pdf_pre.i to inc

******************************************************************************/

{ inc/pdf_pre.i }

DEFINE {1} VARIABLE h_PDFinc AS HANDLE NO-UNDO.

/* Used to Return Font List */
DEFINE {1} TEMP-TABLE TT_Font NO-UNDO
  FIELD obj_stream  AS CHARACTER
  FIELD pdf_id      AS CHARACTER
  FIELD obj_id      AS INTEGER
  FIELD gen_id      AS INTEGER
  FIELD page_id     AS INTEGER
  FIELD font_name   AS CHARACTER
  FIELD font_tag    AS CHARACTER
  FIELD font_width  AS CHARACTER
  FIELD font_base   AS CHARACTER
  FIELD used_flag   AS LOGICAL
INDEX ix IS PRIMARY obj_stream pdf_id obj_id gen_id.

/* Used to Return Information Parameters */
DEFINE {1} TEMP-TABLE TT_Info NO-UNDO
  FIELD obj_stream  AS CHARACTER
  FIELD pdf_id      AS CHARACTER
  FIELD info_name   AS CHARACTER
  FIELD info_value  AS CHARACTER
  FIELD info_extra  AS CHARACTER
INDEX ix IS PRIMARY obj_stream pdf_id info_name.

DEFINE {1} TEMP-TABLE TT_Object NO-UNDO
  FIELD obj_stream  AS CHARACTER
  FIELD pdf_id      AS CHARACTER
  FIELD pdf_id_orig AS CHARACTER /* 23-SEP-2015 jcc: added - see pdf_open_pdf */
  FIELD obj_ptr     AS INTEGER
  FIELD stream_obj  AS INTEGER /* 24-JAN-2011 jcc: added for xref streams + object streams (PDF >= 1.5) */
  FIELD stream_idx  AS INTEGER /* 24-JAN-2011 jcc: idem */
  FIELD obj_size    AS INTEGER /* 25-JAN-2011 jcc: size of the object in the object stream */
  FIELD obj_id      AS INTEGER
  FIELD gen_id      AS INTEGER
  FIELD obj_seq     AS INTEGER
  /* FIELD obj_ver     AS INTEGER /* 03-MAR-2010 jcc: there may be different versions of the same object */ /* 16-DEC-2014 jcc: not used anymore */ */
  FIELD obj_type    AS CHARACTER
  FIELD page_id     AS INTEGER
  FIELD Rotate      AS INTEGER
  FIELD obj_Media1  AS DECIMAL DECIMALS 5
  FIELD obj_Media2  AS DECIMAL DECIMALS 5
  FIELD obj_Media3  AS DECIMAL DECIMALS 5
  FIELD obj_Media4  AS DECIMAL DECIMALS 5
  FIELD obj_Crop1   AS DECIMAL DECIMALS 5
  FIELD obj_Crop2   AS DECIMAL DECIMALS 5
  FIELD obj_Crop3   AS DECIMAL DECIMALS 5
  FIELD obj_Crop4   AS DECIMAL DECIMALS 5
  /* 03-MAR-2010 jcc: new fields for pdfextract v2 */
  FIELD obj_value_type     AS CHARACTER  
  FIELD obj_scalar         AS CHARACTER  
  FIELD obj_dict_id        AS INTEGER     INITIAL -1
  FIELD obj_array_id       AS INTEGER     INITIAL -1
  FIELD obj_value_indirect AS INTEGER     EXTENT 2
  FIELD stream_ptr         AS INTEGER
  FIELD is_dirty           AS LOGICAL     INITIAL YES /* dirty = has not yet been written in the pdf */
  FIELD new_obj            AS INTEGER
  FIELD cache_dir          AS CHARACTER /* 19-MAY-2014 jcc */
  /* 03-MAR-2010 jcc: end */
/* 16-DEC-2014 jcc: reworked the indices */
/*
INDEX ix
    obj_stream pdf_id obj_id gen_id
INDEX obj_id-gen AS PRIMARY
      obj_id
      gen_id /* 04-MAR-2010 jcc */
      obj_seq
INDEX obj_id-ver
      obj_id
      obj_ver DESCENDING /* 04-MAR-2010 jcc */
INDEX pdf_id
      pdf_id
INDEX gen_id
      gen_id
INDEX obj_seq
      obj_seq 
INDEX obj_type
      obj_type
INDEX obj_stream
      obj_stream
INDEX obj_dict_id
      obj_dict_id.
*/
INDEX ixp AS PRIMARY
            obj_stream pdf_id obj_id gen_id
INDEX ix1   obj_stream pdf_id obj_type page_id
INDEX ix2   obj_dict_id
INDEX ix3   obj_array_id
INDEX ix4   obj_stream pdf_id stream_obj obj_seq
INDEX ix5   obj_stream pdf_id stream_ptr stream_idx
INDEX ix6   obj_stream is_dirty
.

/******** Temp-tables which will hold the pdf objects contents ********/

/* global sequences for TT_array & TT_dict id creation */
DEFINE {1} VARIABLE array_seq AS INTEGER   NO-UNDO.
DEFINE {1} VARIABLE dict_seq  AS INTEGER   NO-UNDO.

DEFINE {1} TEMP-TABLE TT_dict NO-UNDO LABEL "dictionary temp-table"
  FIELD dict_id        AS INTEGER
  FIELD obj_id         AS INTEGER     INITIAL -1 /* id of the corresponding object in the pdf file */
  FIELD gen_id         AS INTEGER     INITIAL -1
  FIELD dict_key       AS CHARACTER   /*CASE-SENSITIVE*/
  FIELD value_type     AS CHARACTER
  FIELD value_scalar   AS CHARACTER
  FIELD value_indirect AS INTEGER     EXTENT 2
  FIELD value_dict_id  AS INTEGER     INITIAL -1
  FIELD value_array_id AS INTEGER     INITIAL -1
  INDEX ixDict
        dict_id
        dict_key
        value_type.

DEFINE {1} TEMP-TABLE TT_array NO-UNDO LABEL "array temp-table"
  FIELD array_id       AS INTEGER
  FIELD obj_id         AS INTEGER     INITIAL -1
  FIELD gen_id         AS INTEGER     INITIAL -1
  FIELD value_id       AS INTEGER
  FIELD value_scalar   AS CHARACTER
  FIELD value_type     AS CHARACTER
  FIELD value_indirect AS INTEGER     EXTENT 2
  FIELD value_dict_id  AS INTEGER     INITIAL -1
  FIELD value_array_id AS INTEGER     INITIAL -1
  INDEX ixArray
        array_id
        value_id
        value_type.

/******************************************************************/

DEFINE {1} TEMP-TABLE TT_Resource NO-UNDO
  FIELD obj_stream  AS CHARACTER
  FIELD pdf_id      AS CHARACTER
  FIELD page_id     AS INTEGER
  FIELD res_type    AS CHARACTER
  FIELD res_obj     AS INTEGER
  FIELD res_gen     AS INTEGER
  FIELD res_text    AS CHARACTER
  FIELD res_old     AS CHARACTER
  FIELD new_obj     AS INTEGER
  FIELD new_gen     AS INTEGER
INDEX page_id AS PRIMARY
      obj_stream page_id
INDEX ix1 obj_stream res_type res_text /* 28-OCT-2014 jcc */
  .

/* This following temp-table is used to store/track XML definitions per stream */
DEFINE {1} TEMP-TABLE TT_pdf_xml NO-UNDO
  FIELD obj_stream  AS CHARACTER
  FIELD xml_parent  AS CHARACTER 
  FIELD xml_pnode   AS INTEGER
  FIELD xml_node    AS CHARACTER
  FIELD xml_value   AS CHARACTER
  FIELD xml_seq     AS INTEGER
INDEX xml_seq AS PRIMARY
      xml_parent
      xml_seq
INDEX xml_pnode 
      xml_pnode .

DEFINE {1} TEMP-TABLE TT_Widget NO-UNDO
  FIELD obj_stream       AS CHARACTER
  FIELD pdf_id           AS CHARACTER
  FIELD widget_type      AS CHARACTER
  FIELD widget_name      AS CHARACTER
  FIELD widget_rect      AS CHARACTER
  FIELD widget_tpos      AS CHARACTER   /* 19-JUN-2011 jcc: position of the text within the fillin */
  FIELD widget_justif    AS CHARACTER   INITIAL "0" /* 20-AUG-2012 jcc: 0: left, 1: center, 2: right */
  FIELD widget_multiline AS LOGICAL     /* 21-AUG-2012 jcc: is the field multiline? */
  FIELD widget_disp      AS CHARACTER
  FIELD widget_on        AS CHARACTER   /* 22-AUG-2012 jcc: "on" appearance stream for checkboxes and radio buttons */
  FIELD widget_off       AS CHARACTER   /* 22-AUG-2012 jcc: "off" appearance stream for checkboxes and radio buttons */
  FIELD widget_on_value  AS CHARACTER   /* 22-AUG-2012 jcc: value for the "on" state */
  FIELD widget_value     AS CHARACTER   /* 22-AUG-2012 jcc: value (/V) of the field */
  FIELD widget_values    AS CHARACTER   /* 23-AUG-2012 jcc: possible values for combos and lists (/Opt) */
  FIELD widget_page      AS INTEGER
INDEX idx1
      obj_stream
      pdf_id
      widget_page
      widget_type
INDEX idx2
      obj_stream
      widget_page
      widget_name
INDEX idx3
      obj_stream
      pdf_id
      widget_page
      widget_value
.

/* 13-MAY-2013 jcc: new TT for FDF extraction */
DEFINE {1} TEMP-TABLE TT_FDF_Widget NO-UNDO LABEL "FDF fields temp-table"
    FIELD obj_stream       AS CHARACTER
    FIELD pdf_id           AS CHARACTER
    FIELD fdf_widget_name  AS CHARACTER
    FIELD fdf_widget_value AS CHARACTER
    /* formatting options can also be present in a FDF file */
    /* FIELD fdf_widget_justif    AS CHARACTER   INITIAL "0" */
    /* FIELD fdf_widget_multiline AS LOGICAL */
    /* FIELD fdf_widget_on        AS CHARACTER */
    /* FIELD fdf_widget_off       AS CHARACTER */
INDEX idx1
    obj_stream
.
