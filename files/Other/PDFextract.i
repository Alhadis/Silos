/******************************************************************************

  Program:      pdfextract.i
  
  Written By:   Gordon Campbell (rewrite by Jean-Christophe) Cardot)
  Written On:   January 2004 (rewrite on February 2011)
  
  Description:  Common code to extract a PDF formatted document.

  Notes:        - Encrypted PDF files are not supported at this time
                - Works with every pdf, even with version > 1.4 containing
                  XRef streams and Object streams.
                  Should you find a non-working pdf, please report it.
                - Used in PDFExtract.p & FDFExtract.p. The callee must implement:
                  ProcessObjects and extraProcessing.

  History:
  
  05/31/04  G Campbell  Fixed issue with Array processing in ProcessEntry
  
  06/03/04  G Campbell  Add code to handle XObject resource.  This allows us
                        to extract a PDF page that has JPEG and GIF images on
                        it.
  
  06/08/04  G Campbell  Reworked logic to allow for Adobe 6 Distilled documents
                        (the buggers at Adobe changed the output format).
                        
  06/09/04  G Campbell  Added code to handle Shading (Gradient Fill) in PDF
                        Documents (for v5 -- v6 handlies it differently)
  
  06/15/04  G Campbell  Added variable Entry4 and use it in place of 
                        ENTRY(4 ... since we can use the NO-ERROR when 
                        assigning the Entry4 variable.  This was changed 
                        because it was causing an issue with parsing some of
                        the PDF information (on some files).

  06/16/04  G Campbell  Added code to handle /Encoding operator in the Font
                        Dictionary and also the FontFile3 operator

                        Plus added NO-ERROR when using DATE statement (just in
                        case the info is not found)

  06/23/04  G Campbell  Added code to cleanup h_Zlib and h_Zlibbind
  
  07/07/04  G Campbell  Added code to extract the Text Form Fields from a PDF
                        document.  This change was in conjunction with changes
                        made to pdf_inc.p that allow you to use Form fields
                        to place data in .. see the pdf_fill_text procedure 
                        in pdf_inc.p or the FormFill.p sample in the samples
                        directory.

  07/30/04  G Campbell  Updated to allow for usage of multi-page PDF template
                        documents with Form Fields.  Basically, checked for
                        "/P" in the field dictionary to determine which
                        page it belonged to and then assigned the widget it's
                        appropriate page number.

  08/11/04  G Campbell  Added procedure GetListOfFonts to accommodate how
                        OpenOffice defines it's fonts.  Instead of doing:

                        /Fonts <</TTF1 10 0 R>>    like in Distiller

                        it does the following:

                        /Fonts 10 0 R

                        Where 10 0 is a reference to a list of Fonts in another
                        object.

  09/13/04  G Campbell  Added code to handle landscape PDF templates.

                        Plus added code to handle Base Fonts that are defined
                        in the PDF template but are not embedded.

  10/07/04  G Campbell  Added code to set res_old and res_text for an XObject.
                        This was required because if merging Xobjects from more
                        than one document they had to be unique names.

  10/07/04  G Campbell  Added code to determine the MediaBox for Pages or Page.

  10/12/04  G Campbell  Added code to load the Zlib procedure since the call 
                        was removed from zlib.i.

  01/35/05  G Campbell  Added code to handle ToUnicode and DescendantFonts
                        dictionaries -- INCOMPLETE

  04/14/05  G Campbell  Added code to determine the CropBox for Page.

  07/06/05  G Campbell  Removed zlib.i.  Functions etc now defined in 
                        pdf_func.i and pdf_inc.p
                        
  09/22/05  G Campbell  Added code to handle Content when an array object

  10/21/05  G Campbell  Peter Kiss identified an issue regarding a Font not
                        being included in a multi-page template.  Basically
                        what happened was, I added a check in previous version
                        to ensure that multiple instances of the same resource
                        weren't added to the new document.  The find of the
                        resource was missing the Page ID field so it wouldn't 
                        include the same resource onto multiple pages.  This
                        was fixed in the ProcessEntry procedure. See 10/21/05.

  01/06/06  G Campbell  Added TT_Font.font_base to store the BaseFont name
                        which is (potentiall) different from the Font name (or
                        tag).

  02/15/06  G Campbell  Added code to handle CropBox and MediaBox which are
                        defined as objects in the the Pages Dictionary (as per
                        samples sent in by Simon Murrey)

  02/16/10  JC Cardot   Fixed ProcessFontDescriptorDictionary to enable processing
                        of OpenOffice generated pdf files with embedded fonts.

  08/06/10  JC Cardot   When importing the file char by char, must use UNFORMATTED
                        in the IMPORT statement, else a dot followed by a line
                        feed (chr(10)) or NULL (chr(0)) is interpreted as end of file

  01/14/11  JC Cardot   Added support to fill OpenOffice.org generated forms

  01/16/11  JC Cardot   fix: set used_flag to YES for the fonts used in the
                        forms fill-ins. pdf_inc.p catches it to write the font
                        in the ressources of the pdf.

  01/20/11  JC Cardot   fix a lot of bugs in the fonts exportation - this together
                        with the modifications in pdf_inc.p allows to export only
                        once the external fonts in the pdf, resulting in much
                        smaller pdf files.

  02/01/11  JC Cardot   implement support for extracting PDF > 1.4 (Xref streams,
                        object streams). enhance the parsing of fonts (+ support
                        for /CIDSystemInfo) and of shadings (/Functions). See
                        sample/super/adobe-example.p

  02/15/11  JC Cardot   *Almost totally rewritten!*.
                        Now, should supports every pdf even with version > 1.4, 
                        containing XRef streams and/or Object streams (with a few
                        limitations concerning deprecated pdf functionalities).
                        The parser is way much more tolerant to the differences
                        encountered in different pdf file from different producers.
                        The new approach is:
                        * read the file word by word (instead of by line)
                        * read the objects recursively, and store them in an
                          intermediate representation (TT_Object, TT_dict & TT_array)
                        * parse the objects through this intermediate representation
                          instead of parsing the file; parse the minimum needed
                          in order to be able to recreate the objects recursively
                          (on pdf_inc.p side). It is not needed anymore to deeply
                          parse  the objects (like the fonts).
                        The code is much smaller (as is pdf_inc.p) because with
                        the new approach, it is not needed to "understand" what
                        is in the objects (especially fonts).
                        Added filters for /AsciiHexDecode and /Ascii85Decode.
                        TODO: clean-up on variable names (impose a standard naming)

  04/28/11  JC Cardot   Bug fix: mediaBox and cropBox did not work properly when
                        the values were decimal
                        Bug fix: fix error propagation for doc-encrypted

  04/06/12  JC Cardot   When readWord encounters a CHR(0), replace it with \000
                        instead of changing all the string to hexa
                        
  04/12/12  JC Cardot   LoadPointers: bux fix: ensure we do not create twice the
                        same object (same obj)

  08/21/12  JC Cardot   Get from the field definition its justification (left,
                        center, right) and whether the field is multiline or not.

  08/22/12  JC Cardot   Get all the needed info in TT_Widget so that we can fill
                        checkboxes, radio buttons, combo and list boxes (done in pdf_inc.p)

  08/27/12  JC Cardot   Add code to support for retaining the original AcroForm,
                        and any type of annotation (link, popup...)

  09/10/12  JC Cardot   Add "debug" preprocessor, debugLog procedure and add calls to
                        debugLog when "debug" is defined.

  05/14/13  JC Cardot   Create PDFExtract.i
                        Move common code to read a PDF formatted file there.

  10/08/13  JC Cardot   Modified loadDictionary in order to support malformed pdf
                        files where the same key might happen more than once in a dictionary.

  10/11/13  JC Cardot   Moved debug code to pdfdebug.i

  10/30/13  JC Cardot   Bug fix:  in ReadWord(), added UNFORMATTED after each IMPORT
                        (else a simple dot in the file would make the load to stop!)
                        Bug fix: resolveIndirects: do not treat anymore unknow indirect objects
                        as an error as per the PDF spec.

  06/06/14  JC Cardot   Bug fix: added obj_stream & pdf_id fields to TT_ObjStms, and fixed
                        queries for TT_Object & TT_ObjStms which were missing the test for
                        obj_stream = pStream AND pdf_id = pID.

  10/22/14  JC Cardot   * Bug fix: The xref stream was incorrectly extracted in some cases.
                          This has been fixed both in outputStream & LoadObjectPointers.
                        * make LoadObjectPointers respect better the spec (through a modification
                          of extractNumFromXrefStream - see comment there)
                        * Refactoring: the stream decoding code has been refactored, taking
                          properly into account the decode parameters (/DecodeParms) even when more
                          than one filter is defined. This would have not worked in previous version.
                        * Move parseText() to inc/pdf_func_parseText.i so that it can be used by
                          other procedures. The new include is included from pdf_func.i

  03/03/15  JC Cardot   * Bug fix: There was a buffer leak (TT_Object) in LoadObjectPointers which
                          in some cases prevented the following code to work properly.

  05/05/15  JC Cardot   * Bug fix: LoadDictionary: dictionary keys are case-sensitive!
                          E.g. /CA & /ca are 2 different keys in a Graphics State Parameter Dictionary

  09/21/15  JC Cardot   * Bug fix: LoadObjectPointers: XREF streams /Index array was not correctly
                          taken into account when it specified more than one objects range. Also
                          better manage files with many versions of the same object.

  08/08/16  JC Cardot   * Bug fix: LoadObjects: objects were not correctly identified in object streams
                          when the same object occured more than once (different versions) in different
                          streams.

******************************************************************************/
/* &GLOBAL-DEFINE debug YES */
/* &GLOBAL-DEFINE debugComment + "  % " {&callStack} */

&IF DEFINED(unittest) = 0 &THEN
{inc/pdfglobal.i "SHARED" }
&ENDIF

{ inc/pdfdebug.i }

{ inc/pdf_func.i h_PDFinc }

&IF DEFINED(unittest) = 0 &THEN
DEFINE INPUT PARAMETER pStream    AS CHARACTER   NO-UNDO.
DEFINE INPUT PARAMETER pFileName  AS CHARACTER   NO-UNDO.
DEFINE INPUT PARAMETER pID        AS CHARACTER   NO-UNDO.
DEFINE INPUT PARAMETER pcCacheDir AS CHARACTER   NO-UNDO.
&ELSE
DEFINE VARIABLE pStream    AS CHARACTER INITIAL "Spdf"     NO-UNDO.
DEFINE VARIABLE pFileName  AS CHARACTER INITIAL "test.pdf" NO-UNDO.
DEFINE VARIABLE pID        AS CHARACTER INITIAL "test"     NO-UNDO.
DEFINE VARIABLE pcCacheDir AS CHARACTER NO-UNDO.
&ENDIF /* &IF DEFINED(unittest) = 0 */

DEFINE VARIABLE Text-Line   AS CHARACTER NO-UNDO.

/* variables used for seeking points in the document */
DEFINE VARIABLE obj-ctr   AS INTEGER INITIAL  1 NO-UNDO.
DEFINE VARIABLE obj-virt  AS INTEGER INITIAL -1 NO-UNDO.
DEFINE VARIABLE root-obj  AS INTEGER NO-UNDO.
DEFINE VARIABLE root-gen  AS INTEGER NO-UNDO.
/* DEFINE VARIABLE root-dict AS INTEGER NO-UNDO. */ /* 05-NOV-2014 jcc: unused */
DEFINE VARIABLE info-obj  AS INTEGER NO-UNDO.
DEFINE VARIABLE info-gen  AS INTEGER NO-UNDO.
/* DEFINE VARIABLE info-dict AS INTEGER NO-UNDO. */ /* 05-NOV-2014 jcc: unused */
DEFINE VARIABLE xref-ptr  AS INTEGER NO-UNDO.
 
/* Variables used for storage of document information */
DEFINE VARIABLE doc-version   AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-type      AS CHARACTER NO-UNDO. /* 04-MAY-2013 jcc: %PDF or %FDF */
DEFINE VARIABLE doc-pages     AS INTEGER   NO-UNDO.
DEFINE VARIABLE doc-encrypted AS LOGICAL   NO-UNDO.
DEFINE VARIABLE doc-author    AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-createdon AS DATE      NO-UNDO.
DEFINE VARIABLE doc-createdat AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-producer  AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-creator   AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-subject   AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-title     AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-keywords  AS CHARACTER NO-UNDO.
DEFINE VARIABLE doc-moddate   AS DATE      NO-UNDO.
DEFINE VARIABLE doc-modtime   AS CHARACTER NO-UNDO.
/* DEFINE VARIABLE doc-bookmarks AS INTEGER NO-UNDO. */
/* DEFINE VARIABLE doc-annots    AS INTEGER NO-UNDO. */

FUNCTION ReadLine RETURNS CHARACTER():
  DEFINE VARIABLE L_Byte  AS MEMPTR NO-UNDO.
  DEFINE VARIABLE L_Line  AS CHARACTER NO-UNDO.
  DEFINE VARIABLE L_Seek  AS INTEGER NO-UNDO.

  L_Seek = SEEK(INPUT).
  SET-SIZE(L_Byte) = 1.
  Read-Loop:
  DO WHILE TRUE:
    SEEK INPUT TO L_Seek.
    IMPORT UNFORMATTED L_Byte. /* 25-JUN-2010 jcc: must use UNFORMATTED else a dot followed by a line feed (chr(10)) is interpreted as end of file */
    IF (GET-BYTE(L_Byte,1) = 10 OR GET-BYTE(L_Byte,1) = 13) THEN DO:
      IF GET-BYTE(L_Byte,1) = 13 THEN DO:
        IMPORT UNFORMATTED L_Byte. 
        IF GET-BYTE(L_Byte,1) = 10 THEN
          L_Seek = L_Seek + 1.
      END.

      L_Seek = L_Seek + 1.
      IMPORT UNFORMATTED L_Byte.
      IF (GET-BYTE(L_Byte,1) = 10) THEN
        L_Seek = L_Seek + 1.

      SEEK INPUT TO L_Seek.
      LEAVE Read-Loop.
    END.

    ASSIGN L_Seek = L_Seek + 1.
           L_Line = L_Line + CHR(GET-BYTE(L_Byte,1)).
  END.

  SET-SIZE(L_Byte) = 0.

  RETURN TRIM(L_Line).
END FUNCTION. /* ReadLine */

FUNCTION UpLine RETURNS LOGICAL ():
  DEFINE VARIABLE L_Byte  AS MEMPTR NO-UNDO.
  DEFINE VARIABLE L_Byte2 AS MEMPTR NO-UNDO.
  DEFINE VARIABLE L_Seek  AS INTEGER NO-UNDO.

  DEFINE VARIABLE L_Found AS LOGICAL NO-UNDO.

  L_Seek = SEEK(INPUT) - 1.
  SET-SIZE(L_Byte) = 1.
  SET-SIZE(L_Byte2) = 1.
  Read-Loop:
  DO WHILE TRUE:
    SEEK INPUT TO L_Seek.
    IMPORT UNFORMATTED L_Byte. 

    /* Find the first linefeed */
    IF  NOT L_Found
    AND ((GET-BYTE(L_Byte,1) = 10) 
    OR (GET-BYTE(L_Byte,1) = 13)) THEN DO:
      
      /* If Chr(10) found then determine if a CHR(13) appears before it.
         If it does then skip past it .. if not we need to reset our postion */
      IF GET-BYTE(L_Byte,1) = 10 THEN DO:
        L_Seek = SEEK(INPUT).
        SEEK INPUT TO L_Seek - 2.
        IMPORT UNFORMATTED L_Byte.
        IF GET-BYTE(L_Byte,1) = 13 THEN DO:
          L_Seek = L_Seek - 2.
        END.
        ELSE
          L_Seek = L_Seek - 1.
      END.

      L_Found = TRUE.
    END.

    ELSE IF L_Found
        AND ((GET-BYTE(L_Byte,1) = 10) 
    OR (GET-BYTE(L_Byte,1) = 13)) THEN DO:
      L_seek = SEEK(INPUT).
      LEAVE Read-Loop.
    END.
    
    ASSIGN L_Seek = L_Seek - 1.
    IF L_Seek < 0 THEN RETURN FALSE. /* 05-NOV-2014 jcc: protection against bad pdf files */
  END. /* Read Loop */

  SEEK INPUT TO L_Seek.

  SET-SIZE(L_Byte2) = 0.
  SET-SIZE(L_Byte) = 0.

  RETURN TRUE.
END FUNCTION. /* UpLine */

FUNCTION ReadWord RETURNS CHARACTER():
  DEFINE VARIABLE cChar      AS CHARACTER   NO-UNDO.
  DEFINE VARIABLE cPrevChar  AS CHARACTER   NO-UNDO.
  DEFINE VARIABLE cTmp       AS CHARACTER   NO-UNDO.
  DEFINE VARIABLE cWord      AS CHARACTER   NO-UNDO.
  DEFINE VARIABLE iChar      AS INTEGER     NO-UNDO.
  DEFINE VARIABLE lInString  AS LOGICAL     NO-UNDO.
  DEFINE VARIABLE lHexString AS LOGICAL     NO-UNDO.
  DEFINE VARIABLE lIsName    AS LOGICAL     NO-UNDO.
  DEFINE VARIABLE L_Byte     AS MEMPTR      NO-UNDO.
  DEFINE VARIABLE L_Line     AS CHARACTER   NO-UNDO.
  DEFINE VARIABLE L_NullByte AS LOGICAL     NO-UNDO.
  DEFINE VARIABLE L_Seek     AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iParenLvl  AS INTEGER     NO-UNDO. /* string objects might contain balanced, not backslashed parenthesis */

  L_Seek = SEEK(INPUT).
  SET-SIZE(L_Byte) = 1.
  
  /* skip the word separators */
  Skip-Loop:
  DO WHILE TRUE:
    IMPORT UNFORMATTED L_Byte. 
    iChar = GET-BYTE(L_Byte,1).
    IF iChar = 0 OR iChar = 9 OR iChar = 10 OR iChar = 12 OR iChar = 13 OR iChar = 32 THEN
        NEXT Skip-Loop.
    ELSE
        LEAVE Skip-Loop.
  END.

  cChar = GET-STRING(L_Byte, 1, 1).

  IF cChar = "(" THEN
    lInString = YES.
  ELSE IF cChar = "%" THEN DO: /* ignore comments: skip until end of line */
      iChar = 0.
      DO WHILE iChar <> 10 AND iChar <> 13:
        IMPORT UNFORMATTED L_Byte.
        iChar = GET-BYTE(L_Byte,1).
      END.
      RETURN ReadWord().
  END.
  ELSE IF cChar = "~/" THEN
    lIsName = YES.
  
  Read-Loop:
  DO WHILE TRUE:
    /* cWord = IF L_NullByte THEN cWord + hex2(iChar) ELSE cWord + cChar. */
    cWord = cWord + cChar. /* use with cChar = "~\000" below */
    /* 28-OCT-2014 jcc: protection against very long strings. BUG: the string will be truncated. As I only encountered this problem with a signed pdf (the signature /Contents was a 3Mb string), I do not implement it completely - for the moment. */
    IF LENGTH(cWord) > 29999 THEN DO:
        /* skip the end of the word */
        iChar = 0.
        IF lHexString OR lInString THEN DO WHILE (lHexString AND iChar <> 62 /* ">" */) OR (lInString AND iChar <> 41 /* ")" */) :
          IMPORT UNFORMATTED L_Byte.
          iChar = GET-BYTE(L_Byte,1).
        END.
        /* return the (partial) word */
        RETURN cWord + IF lHexString THEN ">" ELSE IF lInString THEN ")" ELSE "".
    END.

    IF CAN-DO("[,],<<,>>", cWord) THEN
        LEAVE Read-Loop.
    IMPORT UNFORMATTED L_Byte.
    iChar = GET-BYTE(L_Byte,1).
    IF lInString AND iChar = 0 THEN DO: /* If the string contains chr(0) (e.g. unicode) then convert it to hex as we cannot store chr(0) within a string variable */
        /* 02-JUL-2011 jcc: BUG? unicode (utf-16) should be detected by the first 2 chars of the string = chr(254) + chr(255) */
        /* IF NOT L_NullByte THEN */
            /* cWord = "<" + string2Hex(SUBSTRING(cWord, 2)). /* skip leading parenthesis */ */
        /* L_NullByte = YES. */
        cChar = "~\000". /* jcc TODO: check whether we could also do it with \000 ; would be much less intrusive - DONE 06-APR-2012 */
    END.
    ELSE
        cChar = GET-STRING(L_Byte, 1, 1).
    IF cWord = "<" AND cChar <> "<" AND CAN-DO("0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F", cChar) THEN
        lHexString = YES.
    IF lHexString THEN DO:
        IF iChar = 9 OR iChar = 10 OR iChar = 12 OR iChar = 13 OR iChar = 32 THEN DO: /* ignore white-space characters in hexadecimal strings */
            cChar = SUBSTRING(cWord, LENGTH(cWord), 1).
            cWord = SUBSTRING(cWord, 1, LENGTH(cWord) - 1).
        END.
        ELSE IF cChar = ">" THEN DO:
            IF LENGTH(cWord) MODULO 2 = 0 THEN cWord = cWord + "0".
            cWord = cWord + ">".
            LEAVE Read-Loop.
        END.
    END.
    ELSE IF lIsName AND cChar = "#" THEN DO: /* #xx encoded characters: decode A-Z a-z (just in case, as later we search by name) */
        IMPORT UNFORMATTED L_Byte.
        cTmp = GET-STRING(L_Byte, 1, 1).
        IMPORT UNFORMATTED L_Byte.
        cTmp = cTmp + GET-STRING(L_Byte, 1, 1).
        iChar = Hex2Int(cTmp).
        IF (iChar >= 65 AND iChar <= 90) OR (iChar >= 97 AND iChar <= 122) THEN DO:
            cChar = CHR(iChar).
        END.
        ELSE
            SEEK INPUT TO SEEK(INPUT) - 2.
    END.
    ELSE IF NOT lInString THEN DO:
        IF (iChar = 0 OR iChar = 9 OR iChar = 10 OR iChar = 12 OR iChar = 13 OR iChar = 32) THEN
            LEAVE Read-Loop.
        IF (CAN-DO("[,],~/,(,~{", cChar) OR (cChar = "<" AND cWord > "" AND cWord <> "<" )) THEN DO: /* open/closure of array or start of item or string not preceded by a separator or start of dictionary or string */
            SEEK INPUT TO SEEK(INPUT) - 1.
            LEAVE Read-Loop.
        END.
        IF cWord = ">" AND cChar = ">" THEN DO:
            cWord = ">>".
            LEAVE Read-Loop.
        END.
        IF cChar = ">" THEN DO:
            IMPORT UNFORMATTED L_Byte.
            cTmp = GET-STRING(L_Byte, 1, 1).
            IF cTmp = ">" THEN DO: /* closure of dictionary not preceded by a separator */
                SEEK INPUT TO SEEK(INPUT) - 2.
                LEAVE Read-Loop.            
            END.
            ELSE
                SEEK INPUT TO SEEK(INPUT) - 1.
        END.
    END.
    /* string objects ; special cases */
    ELSE IF cPrevChar = "~\" THEN DO:
        /* 02-JUL-2011 jcc: manage splitting of lines accross multiple lines (EOL = \) */
        IF iChar = 10 OR iChar = 13 THEN DO:
            cChar = SUBSTRING(cWord, LENGTH(cWord) - 1, 1). /* last "correct" char, e.g. "bar\" -> "r" */
            cWord = SUBSTRING(cWord, 1, LENGTH(cWord) - 2). /* remove backslash + last char as it will be added again above, e.g. "bar\" -> "ba" */
            IF iChar = 13 THEN DO: /* skip the LF in CRLF */
                IMPORT UNFORMATTED L_Byte.
                IF GET-BYTE(L_Byte, 1) <> 10 THEN
                    SEEK INPUT TO SEEK(INPUT) - 1.
            END.
        END.
        /* we could manage special characters such as \n, \t... here but it is already done by parseText */
    END.
    ELSE DO: /* cPrevChar <> "~\" */
        IF cChar = ")" THEN DO:
            IF iParenLvl = 0 THEN DO:
                /* lInString = NO. */
                cWord = IF L_NullByte THEN cWord + ">" ELSE cWord + ")".
                LEAVE Read-Loop.
            END.
            ELSE /* 02-JUL-2011 jcc: manage balanced parenthesis in strings */
                iParenLvl = iParenLvl - 1.
        END.
        /* 02-JUL-2011 jcc: manage balanced parenthesis in strings */
        ELSE IF cChar = "(" THEN
            iParenLvl = iParenLvl + 1.
        ELSE IF iChar = 13 THEN DO: /* be it CR, LF or CRLF, the result must contain only LF - see pdf specs */
            IMPORT UNFORMATTED L_Byte.
            IF GET-BYTE(L_Byte, 1) = 10 THEN DO:
                iChar = 10.
                cChar = CHR(10).
            END.
            ELSE IF GET-BYTE(L_Byte, 1) = 13 THEN DO:
                iChar = 10.
                cChar = CHR(10).
                SEEK INPUT TO SEEK(INPUT) - 1.
            END.
            ELSE
                SEEK INPUT TO SEEK(INPUT) - 1.
        END.
    END.

    cPrevChar = cChar.
  END. /* Read-Loop */

  /* skip the LF in CRLF */
  IF iChar = 13 THEN DO:
      IMPORT UNFORMATTED L_Byte.
      IF GET-BYTE(L_Byte, 1) <> 10 THEN
          SEEK INPUT TO SEEK(INPUT) - 1.
  END.

  SET-SIZE(L_Byte) = 0.

  RETURN cWord.
END FUNCTION. /* ReadWord */

DEFINE TEMP-TABLE TT_ObjStms NO-UNDO LABEL "Object stream"
 FIELD obj_stream AS CHARACTER  
 FIELD pdf_id     AS CHARACTER  
 FIELD obj_id     AS INTEGER    
 FIELD obj_ptr    AS INTEGER    
 FIELD offset     AS INTEGER     /* offset for the first object */
INDEX ix obj_id
INDEX ixp obj_ptr.

DEFINE STREAM sObjStm.

DEFINE VARIABLE iObjStmOffset AS INTEGER     NO-UNDO.

FUNCTION ReadNumObjStm RETURNS INTEGER ():
  DEFINE VARIABLE iNum AS INTEGER    NO-UNDO.

  SEEK STREAM sObjStm TO iObjStmOffset.
  IMPORT STREAM sObjStm iNum.
  iObjStmOffset = iObjStmOffset + LENGTH(STRING(iNum)) + 1.

  RETURN iNum.
END FUNCTION. /* ReadNumObjStm */

/*********************************** Main block ********************************************/

&IF DEFINED(unittest) = 0 &THEN

&IF DEFINED(debug) &THEN RUN debugLog("starting"). &ENDIF

/* 17-MAY-2014 jcc: implement cache */
/* FILE-INFO:FILE-NAME = RIGHT-TRIM(pcCacheDir, "~/"). */
/* IF FILE-INFO:FULL-PATHNAME <> ? THEN DO: */
    /* MESSAGE "found cache" SKIP pcCacheDir */
        /* VIEW-AS ALERT-BOX INFO BUTTONS OK. */
/* END. */

INPUT FROM VALUE(pFileName) BINARY NO-ECHO NO-CONVERT NO-MAP.

/* Determine Version 
   - this should be on first line of a well-formed PDF document */
Text-Line = ReadLine().
/* doc-version = REPLACE(Text-Line,"%PDF-",""). */
doc-type = ENTRY(1, Text-Line, "-"). /* %PDF or %FDF */
IF doc-type <> "%PDF" AND doc-type <> "%FDF" THEN
    RETURN ERROR "Document type " + QUOTER(doc-type) + " not supported".
doc-version = ENTRY(2, Text-Line, "-") NO-ERROR.
{&adCheckErrorAndReturn}

/* Go To End of File */
SEEK INPUT TO END.

/* 17-JUN-2014 jcc: search for the "startxref" line; just doing two UpLine() is not enough,
                    e.g. if the last %EOF line does not have a cariage return at the end,
                    or if extra comments are appended */
/* UpLine().  /* Get the %%EOF line */ */
/* UpLine().  /* Before the XREF pointer line */ */
DEFINE VARIABLE cLine AS CHARACTER   NO-UNDO.
DEFINE VARIABLE iSeek AS INTEGER     NO-UNDO.
UpLine().
DO WHILE cLine <> "startxref":
    iSeek = SEEK(INPUT).
    IF iSeek = 1 THEN LEAVE. /* we did not find the startxref line */
    cLine = ReadLine().
    IF cLine <> "startxref" THEN DO:
        SEEK INPUT TO iSeek.
        UpLine().
    END.
END.

xref-ptr = INTEGER(ReadLine()) NO-ERROR.  /* Get the XREF Pointer line */

IF NOT ERROR-STATUS:ERROR AND xref-ptr > 0 THEN DO:
    /* Load objects using the Xref table */
    &IF DEFINED(debug) &THEN RUN debugLog("LoadObjectPointers"). &ENDIF
    RUN LoadObjectPointers(xref-ptr) NO-ERROR.
    {&adCheckErrorAndReturn}
    IF doc-encrypted THEN DO:
        RUN CreateInfo("ERROR", "Document is Encrypted").
        RETURN ERROR "Document is Encrypted".
    END.
    IF root-obj = 0 THEN
        RETURN ERROR "Did not find ~/Root" + CHR(3) + ABLCallStack(0).

    &IF DEFINED(debug) &THEN
        RUN outputCsv(SESSION:TEMP-DIRECTORY + "csv1.txt").
        RUN outputCsvObjects(SESSION:TEMP-DIRECTORY + "objects1.txt").
        RUN debugLog("LoadObjects").
    &ENDIF
    
    RUN LoadObjects NO-ERROR.
    {&adCheckErrorAndReturn}

    &IF DEFINED(debug) &THEN
        RUN outputCsv(SESSION:TEMP-DIRECTORY + "csv2.txt").
        RUN outputCsvObjects(SESSION:TEMP-DIRECTORY + "objects2.txt").
        RUN debugLog("ResolveIndirects").
    &ENDIF
END.
ELSE DO:
    /* 17-APR-2013 jcc: no Xref found. Xref is optional for FDF files, so we will load the objects without relying on it */
    &IF DEFINED(debug) &THEN RUN debugLog("LoadObjectsWithoutXref"). &ENDIF
    RUN LoadObjectsWithoutXref NO-ERROR.
    {&adCheckErrorAndReturn}
    &IF DEFINED(debug) &THEN
        RUN outputCsv(SESSION:TEMP-DIRECTORY + "csv0.txt").
        RUN outputCsvObjects(SESSION:TEMP-DIRECTORY + "objects0.txt").
    &ENDIF
END.

/* 05-NOV-2014 jcc: protection against invalid pdf files */
IF root-obj = 0 THEN
    RETURN ERROR "Invalid pdf template: /Root invalid or missing" + CHR(3) + ABLCallStack(0).

RUN ResolveIndirects NO-ERROR.
{&adCheckErrorAndReturn}

&IF DEFINED(debug) &THEN
    RUN outputCsv(SESSION:TEMP-DIRECTORY + "csv3.txt").
    RUN debugLog("exportStreams").
&ENDIF

RUN exportStreams NO-ERROR.
{&adCheckErrorAndReturn}

/* Uncomment to debug */
/* RUN outputCsv("clipboard"). */
/* RUN outputCsv(SESSION:TEMP-DIRECTORY + "csv.txt"). */
/* RUN outputTree(SESSION:TEMP-DIRECTORY + "tree.txt", root-dict, "dict", ""). */
/* RUN outputTree(SESSION:TEMP-DIRECTORY + "tree.txt", info-dict, "dict", ""). */

&IF DEFINED(debug) &THEN RUN debugLog("ProcessObjects"). &ENDIF

RUN ProcessObjects NO-ERROR.
{&adCheckErrorAndReturn}

INPUT CLOSE.

&IF DEFINED(debug) &THEN
    RUN outputCsvObjects(SESSION:TEMP-DIRECTORY + "objects3.txt").
    RUN debugLog("extraProcessing").
&ENDIF

RUN CreateInfo("pdfVersion", doc-version).

/* 14-MAY-2013 jcc: move the code which is specific to a document type to new procedure extraProcessing */
RUN extraProcessing NO-ERROR.
{&adCheckErrorAndReturn}

&IF DEFINED(debug) &THEN RUN debugLog("end"). &ENDIF

&ENDIF /* IF DEFINED(unittest) = 0 */

/* ----------------------- INTERNAL PROCEDURES ------------------------ */

PROCEDURE LoadDictionary:
    DEFINE OUTPUT PARAMETER opiDictId    AS INTEGER   INITIAL -1 NO-UNDO.
    DEFINE INPUT  PARAMETER ipiObjId     AS INTEGER   NO-UNDO.
    DEFINE INPUT  PARAMETER ipiGenId     AS INTEGER   NO-UNDO.
    DEFINE OUTPUT PARAMETER opiStreamPtr AS INTEGER   NO-UNDO.
    
    DEFINE VARIABLE cWord      AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE cWord2     AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE iDictId    AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj       AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj2      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iSeek      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iStreamPtr AS INTEGER     NO-UNDO.
    DEFINE VARIABLE lIndirect  AS LOGICAL     NO-UNDO.
    DEFINE VARIABLE lLength    AS LOGICAL     NO-UNDO.
    DEFINE VARIABLE mByte      AS MEMPTR      NO-UNDO.

    DEFINE BUFFER TT_dict  FOR TT_dict.
    DEFINE BUFFER bTT_dict FOR TT_dict.

    dict_seq = dict_seq + 1.
    iDictId  = dict_seq.

    DO WHILE TRUE:
        cWord = readWord().

        IF cWord = ? THEN LEAVE. /* 04-NOV-2013 jcc: EOF; should not happen */

        CASE cWord:
            WHEN "<<" THEN NEXT.
            WHEN ">>" THEN DO:
                IF NOT lLength THEN LEAVE.
                ELSE NEXT.
            END.
            WHEN "endobj" THEN LEAVE.
            WHEN "stream" THEN DO: /* extract the stream */
                IF lLength THEN opiStreamPtr = SEEK(INPUT).
                LEAVE.
            END.
        END CASE.

        /* 08-OCT-2013 jcc: make it tolerant to dictionaries with a doubled key */
        FIND TT_dict WHERE TT_dict.dict_id  = iDictId
                       AND TT_dict.obj_id   = ipiObjId
                       AND TT_dict.gen_id   = ipiGenId
                       AND TT_dict.dict_key = cWord NO-ERROR.
        /* 05-MAY-2015 jcc: dictionary keys are case-sensitive! e.g. /CA & /ca are 2 different keys in a Graphics State Parameter Dictionary */
        IF NOT AVAILABLE TT_dict OR COMPARE(TT_dict.dict_key, "<>", cWord, "CASE-SENSITIVE") THEN DO:
            CREATE TT_dict.
            ASSIGN
                TT_dict.dict_id = iDictId
                TT_dict.obj_id  = ipiObjId
                TT_dict.gen_id  = ipiGenId.
            TT_dict.dict_key = cWord.
        END.
        opiDictId = iDictId.

        /* key */
        IF cWord = "~/Length" THEN
            lLength = YES.

        /* value */
        cWord = readWord().
        CASE cWord:
            WHEN "<<" THEN DO:
                RUN loadDictionary (OUTPUT TT_dict.value_dict_id, -1, -1, OUTPUT iStreamPtr) NO-ERROR. /* iStreamPtr will be zero as a stream must be an indirection, thus an object */
                {&adCheckErrorAndReturn}
                TT_dict.value_type = "DICT".
            END.
            WHEN "[" THEN DO:
                RUN loadArray (OUTPUT TT_dict.value_array_id, -1, -1) NO-ERROR.
                {&adCheckErrorAndReturn}
                TT_dict.value_type = "ARRAY".
            END.
            OTHERWISE DO: /* scalar or indirection */
                iObj = INTEGER(cWord) NO-ERROR.
                IF NOT ERROR-STATUS:ERROR THEN DO:
                    iSeek = SEEK(INPUT).
                    cWord2 = readWord().
                    iObj2 = INTEGER(cWord2) NO-ERROR.
                    IF NOT ERROR-STATUS:ERROR THEN DO:
                        cWord2 = readWord().
                        IF cWord2 = "R" THEN
                            lIndirect = YES.
                        ELSE
                            SEEK INPUT TO iSeek.
                    END.
                    ELSE
                        SEEK INPUT TO iSeek.
                END.
                IF lIndirect THEN
                    ASSIGN
                        TT_dict.value_type        = "INDIRECT"
                        TT_dict.value_indirect[1] = iObj
                        TT_dict.value_indirect[2] = iObj2
                        lIndirect                 = NO.
                ELSE DO:
                    ASSIGN
                        TT_dict.value_type        = "SCALAR"
                        TT_dict.value_scalar      = cWord.
                END.
            END.
        END.
    END.
END PROCEDURE. /* LoadDictionary */

PROCEDURE LoadArray: 
    DEFINE OUTPUT PARAMETER opiArrayId AS INTEGER   INITIAL -1 NO-UNDO.
    DEFINE INPUT  PARAMETER ipiObjId   AS INTEGER   NO-UNDO.
    DEFINE INPUT  PARAMETER ipiGenId   AS INTEGER   NO-UNDO.

    DEFINE VARIABLE cWord      AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE cWord2     AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE iArrayId   AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj       AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj2      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iSeek      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iStreamPtr AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iValueId   AS INTEGER     INITIAL 1 NO-UNDO.
    DEFINE VARIABLE lIndirect  AS LOGICAL     NO-UNDO.

    DEFINE BUFFER TT_array FOR TT_array.

    array_seq = array_seq + 1.
    iArrayId  = array_seq.

    DO WHILE TRUE:
        cWord = readWord().
        IF cWord = "]" OR cWord = "endobj" OR cWord = "stream" THEN LEAVE.
        CREATE TT_array.
        ASSIGN
            TT_array.array_id = iArrayId
            TT_array.VALUE_id = iValueId
            TT_array.obj_id   = ipiObjId
            TT_array.gen_id   = ipiGenId
            opiArrayId        = iArrayId
            iValueId          = iValueId + 1.

        CASE cWord:
            WHEN "<<" THEN DO:
                RUN loadDictionary (OUTPUT TT_array.value_dict_id, -1, -1, OUTPUT iStreamPtr) NO-ERROR. /* iStreamPtr will be zero as a stream must be an indirection, thus an object */
                {&adCheckErrorAndReturn}
                TT_array.value_type = "DICT".
            END.
            WHEN "[" THEN DO:
                RUN loadArray (OUTPUT TT_array.value_array_id, -1, -1) NO-ERROR.
                {&adCheckErrorAndReturn}
                TT_array.value_type = "ARRAY".
            END.
            OTHERWISE DO: /* scalar or indirection */
                iObj = INTEGER(cWord) NO-ERROR.
                IF NOT ERROR-STATUS:ERROR THEN DO:
                    iSeek = SEEK(INPUT).
                    cWord2 = readWord().
                    iObj2 = INTEGER(cWord2) NO-ERROR.
                    IF NOT ERROR-STATUS:ERROR THEN DO:
                        cWord2 = readWord().
                        IF cWord2 = "R" THEN
                            lIndirect = YES.
                        ELSE
                            SEEK INPUT TO iSeek.
                    END.
                    ELSE
                        SEEK INPUT TO iSeek.
                END.
                IF lIndirect THEN
                    ASSIGN
                        TT_array.value_type        = "INDIRECT"
                        TT_array.value_indirect[1] = iObj
                        TT_array.value_indirect[2] = iObj2
                        lIndirect                  = NO.
                ELSE
                    ASSIGN
                        TT_array.value_type        = "SCALAR"
                        TT_array.value_scalar     = cWord.
            END.
        END.
    END.
END PROCEDURE. /* LoadArray */

PROCEDURE LoadObjectContents:
    DEFINE PARAMETER BUFFER TT_Object FOR TT_Object.

    DEFINE VARIABLE cWord     AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE cWord2    AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE iObj      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj2     AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iSeek     AS INTEGER     NO-UNDO.
    DEFINE VARIABLE lIndirect AS LOGICAL     NO-UNDO.

    &IF DEFINED(debug) &THEN RUN debugLog("Load Object Contents " + STRING(TT_Object.obj_id) + " " + STRING(TT_Object.gen_id) + " (" + STRING(TT_Object.obj_seq) + ")"). &ENDIF

    cWord = readWord().
    CASE cWord:
        WHEN "<<" THEN DO:
            RUN loadDictionary (OUTPUT TT_Object.obj_dict_id, TT_Object.obj_id, TT_Object.gen_id, OUTPUT TT_Object.stream_ptr) NO-ERROR.
            {&adCheckErrorAndReturn}
            TT_Object.obj_value_type = "DICT".
            /* IF TT_Object.obj_id = root-obj AND TT_Object.gen_id = root-gen THEN */
                /* root-dict = TT_Object.obj_dict_id. */
            /* IF TT_Object.obj_id = info-obj AND TT_Object.gen_id = info-gen THEN */
                /* info-dict = TT_Object.obj_dict_id. */
        END.
        WHEN "[" THEN DO:
            RUN loadArray (OUTPUT TT_Object.obj_array_id, TT_Object.obj_id, TT_Object.gen_id) NO-ERROR.
            {&adCheckErrorAndReturn}
        TT_Object.obj_value_type = "ARRAY".
        END.
        OTHERWISE DO: /* scalar or indirection */
            iObj = INTEGER(cWord) NO-ERROR.
            IF NOT ERROR-STATUS:ERROR THEN DO:
                iSeek = SEEK(INPUT).
                cWord2 = readWord().
                iObj2 = INTEGER(cWord2) NO-ERROR.
                IF NOT ERROR-STATUS:ERROR THEN DO:
                    cWord2 = readWord().
                    IF cWord2 = "R" THEN
                        lIndirect = YES.
                    ELSE
                        SEEK INPUT TO iSeek.
                END.
                ELSE
                    SEEK INPUT TO iSeek.
            END.
            IF lIndirect THEN
                ASSIGN
                    TT_Object.obj_value_type        = "INDIRECT"
                    TT_Object.obj_value_indirect[1] = iObj
                    TT_Object.obj_value_indirect[2] = iObj2
                    lIndirect                       = NO.
            ELSE
                ASSIGN
                    TT_Object.obj_value_type = "SCALAR"
                    TT_Object.obj_scalar     = cWord.
        END.
    END CASE.

END PROCEDURE. /* LoadObjectContents */

PROCEDURE LoadObject:
    DEFINE PARAMETER BUFFER TT_Object FOR TT_Object.

    DEFINE VARIABLE cWord     AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE cWord2    AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE iObj      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj2     AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iSeek     AS INTEGER     NO-UNDO.
    DEFINE VARIABLE lIndirect AS LOGICAL     NO-UNDO.

    SEEK INPUT TO TT_Object.obj_ptr.
    /* read object number */
    TT_Object.obj_id = INTEGER(ReadWord()) .
    {&adCheckErrorAndReturn}
    TT_Object.gen_id = INTEGER(ReadWord()) .
    {&adCheckErrorAndReturn}

    cWord = ReadWord().
    IF cWord <> "obj" THEN
        RETURN ERROR "Not an object!" + CHR(3) + ABLCallStack(0).
    &IF DEFINED(debug) &THEN RUN debugLog("Load Object " + STRING(TT_Object.obj_id) + " " + STRING(TT_Object.gen_id) + " (" + STRING(TT_Object.obj_seq) + ")"). &ENDIF

    RUN LoadObjectContents (BUFFER TT_Object) NO-ERROR.
    {&adCheckErrorAndReturn}

END PROCEDURE. /* LoadObject */

/* 04-MAY-2013 jcc: new for FDF files */
PROCEDURE LoadObjectsWithoutXref:
    DEFINE VARIABLE cWord          AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE iGen           AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj           AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iPtr           AS INTEGER     NO-UNDO.
    DEFINE VARIABLE IStreamPtr     AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iTrailerDictId AS INTEGER     NO-UNDO.

    DEFINE VARIABLE cLine AS CHARACTER   NO-UNDO.

    DEFINE BUFFER TT_Object FOR TT_Object.


    /* We will start from the start of the file and try to read the objects one after each other */
    SEEK INPUT TO 0.
    ReadLine(). /* skip first line %PDF-version */
    cLine = ReadLine(). /* skip second line %éèçà */
    IF SUBSTRING(cLine,1,1) <> "%" THEN UpLine().

    readFile:
    DO WHILE TRUE:
        iObj = 0.
        DO WHILE iObj = 0 OR iGen < 0 OR cWord <> "obj":
            ASSIGN
             iObj  = 0
             iGen  = -1.
            iPtr = SEEK(INPUT).
            cWord = ReadWord().
            IF cWord = "trailer" THEN LEAVE.
            iObj = INTEGER(cWord) NO-ERROR.
            IF iObj > 0 THEN DO:
                iGen = INTEGER(ReadWord()) NO-ERROR.
                IF NOT ERROR-STATUS:ERROR THEN
                    cWord = ReadWord(). /* obj */
            END.
        END.
        CASE cWord:
            WHEN "obj" THEN DO:
                FIND TT_Object
                    WHERE TT_Object.obj_stream = pStream
                      AND TT_Object.pdf_id     = pID
                      AND TT_Object.obj_id     = iObj
                      AND TT_Object.gen_id     = iGen NO-ERROR.
                IF NOT AVAILABLE TT_Object THEN DO:
                    CREATE TT_Object.
                    ASSIGN
                        TT_Object.obj_stream = pStream
                        TT_Object.pdf_id     = pID
                        TT_Object.cache_dir  = pcCacheDir
                        TT_Object.obj_id     = iObj
                        TT_Object.gen_id     = iGen.
                END.
                TT_Object.obj_ptr = iPtr.
                RUN LoadObjectContents(BUFFER TT_Object) NO-ERROR.
                {&adCheckErrorAndReturn}
            END.
            WHEN "trailer" THEN DO:
                RUN LoadDictionary (OUTPUT iTrailerDictId, 0, 0, OUTPUT iStreamPtr).
    
                {getDict TT_dict iTrailerDictId "~/Root"}.
                IF AVAILABLE TT_dict THEN ASSIGN
                     root-obj = TT_dict.value_indirect[1]
                     root-gen = TT_dict.value_indirect[2].
    
                LEAVE.
            END.
        END CASE. /* cWord */    
    END. /*readFile: DO WHILE TRUE*/
END PROCEDURE. /* LoadObjectsWithoutXref */

PROCEDURE LoadObjects:
    DEFINE VARIABLE iGen           AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObj           AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObject        AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iObjId         AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iStreamPtr     AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_First        AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_Length       AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_N            AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_ObjectOffset AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_Offset       AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_PrevPtr      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_StreamSize   AS INTEGER     NO-UNDO.
    DEFINE VARIABLE L_Type         AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE m              AS MEMPTR      NO-UNDO.

    DEFINE VARIABLE inflated-stream AS MEMPTR   NO-UNDO.
    DEFINE VARIABLE stream-content  AS MEMPTR   NO-UNDO.

    DEFINE BUFFER TT_Object  FOR TT_Object.
    DEFINE BUFFER bTT_Object FOR TT_Object.
    DEFINE BUFFER TT_dict    FOR TT_dict.
    DEFINE BUFFER TT_ObjStms FOR TT_ObjStms.

    /* First, load "normal" objects */
    &IF DEFINED(debug) &THEN RUN debugLog("Load normal objects"). &ENDIF
    FOR EACH TT_Object
        WHERE TT_Object.obj_stream = pStream
          AND TT_Object.pdf_id     = pID
          AND TT_Object.stream_obj = 0:
        RUN LoadObject(BUFFER TT_Object) NO-ERROR.
        {&adCheckErrorAndReturn}
    END.

    /* 26-JAN-2011 jcc: implementation of PDF >= 1.5 */
    /* Then, process object streams (if any) */
    /* Determine object id and offset (obj_ptr) for objects within object streams,
       then create a dummy pdf file containing these objects plus the normal ones,
       update the obj_ptr of these objects and redirect the input from pFileName
       (original pdf file) to the dummy file. */
    IF CAN-FIND(FIRST TT_ObjStms WHERE TT_ObjStms.obj_stream = pStream AND TT_ObjStms.pdf_id = pID) THEN DO:
      &IF DEFINED(debug) &THEN RUN debugLog("Load objects within streams"). &ENDIF
    /* 1. Export and decompress the object streams */
      FOR EACH TT_ObjStms WHERE TT_ObjStms.obj_stream = pStream AND TT_ObjStms.pdf_id = pID:
        &IF DEFINED(debug) &THEN RUN debugLog("Loading objects from stream " + STRING( TT_ObjStms.obj_id)). &ENDIF
        FIND TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID AND TT_Object.obj_id = TT_ObjStms.obj_id NO-ERROR.
        IF AVAILABLE TT_Object THEN DO:
          ASSIGN
            TT_ObjStms.obj_ptr = TT_Object.obj_ptr
            L_Type   = ""
            L_Length = 0
            L_First  = 0
            L_N      = 0.
          SEEK INPUT TO TT_object.obj_ptr.
          /* skip (and check) the object header */
          iObj = INTEGER(ReadWord()) NO-ERROR.
          IF ERROR-STATUS:ERROR THEN
              RETURN ERROR "Invalid object" + {&adReturnValueAndStack}.
          iGen = INTEGER(ReadWord()) NO-ERROR.
          IF ERROR-STATUS:ERROR THEN
              RETURN ERROR "Invalid object" + {&adReturnValueAndStack}.
          IF ReadWord() <> "obj" THEN
              RETURN ERROR "Invalid object" + CHR(3) + ABLCallStack(0).
          /* read Object stream's dictionary */
          RUN LoadDictionary (OUTPUT TT_Object.obj_dict_id, TT_Object.obj_id, TT_Object.gen_id, OUTPUT iStreamPtr).

          {getDict TT_dict TT_Object.obj_dict_id "SCALAR" "~/Type"}.
          IF AVAILABLE TT_dict THEN
              L_Type = TT_dict.value_scalar.
          IF L_Type <> "~/ObjStm" THEN
              RETURN ERROR "Object stream wrong or missing ~/Type: " + QUOTER(L_Type) + CHR(3) + ABLCallStack(0).

          {getDict TT_dict TT_Object.obj_dict_id "SCALAR" "~/Length"}.
          IF AVAILABLE TT_dict THEN
              L_Length = INTEGER(TT_dict.value_scalar).
          IF L_Length = 0 THEN NEXT.
            
          {getDict TT_dict TT_Object.obj_dict_id "SCALAR" "~/N"}.
          IF AVAILABLE TT_dict THEN
              L_N = INTEGER(TT_dict.value_scalar).
            
          {getDict TT_dict TT_Object.obj_dict_id "SCALAR" "~/First"}.
          IF AVAILABLE TT_dict THEN DO:
              L_First = INTEGER(TT_dict.value_scalar).
              TT_ObjStms.offset = L_First.
          END.
            
          RUN outputStream (TT_Object.stream_ptr, TT_Object.obj_dict_id, YES,
                            pID + "-" + STRING(TT_ObjStms.obj_id) + "-ObjStm.txt", NO, OUTPUT m) NO-ERROR.
          {&adCheckErrorAndReturn}

        END. /* IF AVAILABLE TT_Object */
        ELSE /* 17-SEP-2015 jcc: sanity check */
            RETURN ERROR "Bug: missing object " + QUOTER(TT_ObjStms.obj_id) + " for object stream".

        /* Get the objects pointers within the object stream */
        &IF DEFINED(debug) &THEN RUN debugLog("Get objects' offsets within streams"). &ENDIF
        iObjStmOffset = 0.
        INPUT STREAM sObjStm FROM VALUE(pcCacheDir + pID + "-" + STRING(TT_ObjStms.obj_id) + "-ObjStm.txt") BINARY NO-ECHO NO-MAP NO-CONVERT.

        /* 08-AUG-2016 jcc: rewrote this part */
        DO iObject = 1 TO L_N:
            iObjId = ReadNumObjStm().
            FIND bTT_Object WHERE bTT_Object.obj_stream = pStream AND bTT_Object.pdf_id = pID
                AND bTT_Object.stream_obj = TT_ObjStms.obj_id
                AND bTT_Object.obj_id     = iObjId NO-ERROR.
            IF AVAILABLE bTT_Object THEN
                bTT_Object.obj_ptr = ReadNumObjStm() + TT_ObjStms.offset.
            ELSE ReadNumObjStm(). /* skip */
        END.
        /* FOR EACH bTT_Object WHERE bTT_Object.obj_stream = pStream AND bTT_Object.pdf_id = pID
          AND bTT_Object.stream_obj = TT_ObjStms.obj_id
            /* BY bTT_Object.obj_seq: */
            BY bTT_Object.obj_id: /* jcc */

          ASSIGN
            bTT_Object.obj_id = ReadNumObjStm()
            bTT_Object.gen_id  = 0.
          bTT_Object.obj_ptr = ReadNumObjStm() + TT_ObjStms.offset.
        END. */

        /* Compute the objects size */
        &IF DEFINED(debug) &THEN RUN debugLog("Get objects' sizes"). &ENDIF
        FILE-INFO:FILE-NAME = pcCacheDir + pID + "-" + STRING(TT_ObjStms.obj_id) + "-ObjStm.txt".
        L_PrevPtr = FILE-INFO:FILE-SIZE.
        FOR EACH TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID
          AND TT_Object.stream_obj = TT_ObjStms.obj_id
            BY TT_Object.obj_ptr DESCENDING:
            TT_Object.obj_size = L_PrevPtr - TT_Object.obj_ptr.
            L_PrevPtr = TT_Object.obj_ptr.
        END.
      END. /* FOR EACH TT_ObjStms */
      INPUT STREAM sObjStm CLOSE.

      /* 2. build a dummy pdf file with everything uncompressed so that we can process it as a regular 1.4 pdf */
      &IF DEFINED(debug) &THEN RUN debugLog("Build dummy pdf file " + QUOTER(pcCacheDir + pID + "-ObjStm.pdf.txt")). &ENDIF
      /* 2.1. copy the original file */
      OS-COPY VALUE(pFileName) VALUE(pcCacheDir + pID + "-ObjStm.pdf.txt").
      /* 2.2. Append the objects that were in the object stream and set their obj_ptr */
      OUTPUT TO VALUE(pcCacheDir + pID + "-ObjStm.pdf.txt") BINARY NO-MAP NO-CONVERT NO-ECHO APPEND.
      PUT UNFORMATTED " " {&pdfSKIP}.
      FOR EACH TT_ObjStms WHERE TT_ObjStms.obj_stream = pStream AND TT_ObjStms.pdf_id = pID,
          EACH TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID AND TT_Object.stream_obj = TT_ObjStms.obj_id:
        L_ObjectOffset = SEEK(OUTPUT).
        PUT UNFORMATTED TT_Object.obj_id " " TT_Object.gen_id " obj" {&pdfSkip}.
        SET-SIZE(stream-content) = TT_Object.obj_size.
        INPUT STREAM sObjStm FROM VALUE(pcCacheDir + pID + "-" + STRING(TT_ObjStms.obj_id) + "-ObjStm.txt") BINARY NO-MAP NO-CONVERT NO-ECHO. /* 05-OCT-2015 jcc: added BINARY NO-MAP NO-CONVERT NO-ECHO */
        SEEK STREAM sObjStm TO TT_Object.obj_ptr.
        IMPORT STREAM sObjStm stream-content.
        INPUT STREAM sObjStm CLOSE.
        EXPORT stream-content.
        SET-SIZE(stream-content) = 0.
        PUT UNFORMATTED {&pdfSkip} "endobj" {&pdfSkip}.
        TT_Object.obj_ptr = L_ObjectOffset.
      END.
      PUT UNFORMATTED "%EOF object streams" {&pdfSkip}.
      OUTPUT CLOSE.

      /* 3. Redirect the input to the dummy pdf file */
      INPUT CLOSE.
      /* MESSAGE pcCacheDir + pID + "-ObjStm.pdf.txt" */
          /* VIEW-AS ALERT-BOX INFO BUTTONS OK. */
      INPUT FROM VALUE(pcCacheDir + pID + "-ObjStm.pdf.txt") BINARY NO-ECHO NO-CONVERT NO-MAP.

      /* 4. Load the objects */
      &IF DEFINED(debug) &THEN RUN debugLog("Load the remaining objects"). &ENDIF
      FOR EACH TT_Object
          WHERE TT_Object.obj_stream = pStream
            AND TT_Object.pdf_id     = pID
            AND TT_Object.stream_obj > 0:
          RUN LoadObject(BUFFER TT_Object) NO-ERROR.
          {&adCheckErrorAndReturn}
      END.

    END. /* IF CAN-FIND(FIRST TT_ObjStms) */

END PROCEDURE. /* LoadObjects */

PROCEDURE exportStreams:
    DEFINE VARIABLE iLength     AS INTEGER   NO-UNDO.
    DEFINE VARIABLE m           AS MEMPTR    NO-UNDO. /* Dummy */

    DEFINE BUFFER TT_Object FOR TT_Object.

    FOR EACH TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID
      AND TT_Object.stream_ptr > 0
      AND TT_Object.stream_idx = 0:
        /* RUN outputStream (TT_Object.stream_ptr, TT_Object.obj_dict_id, NO, pID + "-" + STRING(TT_Object.obj_dict_id) + ".stm", NO, OUTPUT m) NO-ERROR. */
        RUN outputStream (TT_Object.stream_ptr, TT_Object.obj_dict_id, NO, pID + "-" + STRING(TT_Object.obj_id) + ".stm", NO, OUTPUT m) NO-ERROR. /* 24-SEP-2015 jcc: better use obj_id: because of the new cache, the dict_id might change */
        {&adCheckErrorAndReturn}
    END.

END PROCEDURE.

PROCEDURE ResolveIndirects:
    DEFINE BUFFER TT_dict  FOR TT_dict.
    DEFINE BUFFER TT_array FOR TT_array.

    FOR EACH TT_dict WHERE TT_dict.value_type = "INDIRECT":
        FIND LAST TT_Object
            WHERE TT_Object.obj_stream = pStream
              AND TT_Object.pdf_id     = pID
              AND TT_Object.obj_id     = tt_dict.value_indirect[1]
              AND TT_Object.gen_id     = tt_dict.value_indirect[2]
            /*USE-INDEX obj_id-gen*/ NO-ERROR.
        /* {&adCheckErrorAndReturn} */
        /* 31-OCT-2013 jcc: PDF Spec: An indirect reference to an undefined object shall not be considered an error by a conforming reader; it shall be treated as a reference to the null object. */
        /* IF ERROR-STATUS:ERROR THEN RETURN ERROR "Cannot find tt_object using " + pStream + "/" + pID + "/" + STRING(tt_dict.value_indirect[1]) + "/" + STRING(tt_dict.value_indirect[2]) + {&adReturnValueAndStack}. */
        IF AVAILABLE tt_object THEN ASSIGN
            TT_dict.value_type     = TT_Object.obj_value_type
            TT_dict.value_array_id = TT_Object.obj_array_id
            TT_dict.value_dict_id  = TT_Object.obj_dict_id
            TT_dict.value_scalar   = TT_Object.obj_scalar.
        ELSE ASSIGN
            TT_dict.value_type     = "SCALAR"
            TT_dict.value_scalar   = "null".
    END.
    FOR EACH TT_array WHERE TT_array.value_type = "INDIRECT":
        FIND LAST TT_Object
            WHERE TT_Object.obj_stream = pStream
              AND TT_Object.pdf_id     = pID
              AND TT_Object.obj_id     = TT_array.value_indirect[1]
              AND TT_Object.gen_id     = TT_array.value_indirect[2]
            /*USE-INDEX obj_id-gen*/ NO-ERROR.
        /* {&adCheckErrorAndReturn} */
        /* 31-OCT-2013 jcc: PDF Spec: An indirect reference to an undefined object shall not be considered an error by a conforming reader; it shall be treated as a reference to the null object. */
        /* IF ERROR-STATUS:ERROR THEN RETURN ERROR "Cannot find tt_object using " + pStream + "/" + pID + "/" + STRING(tt_array.value_indirect[1]) + "/" + STRING(tt_array.value_indirect[2]) + {&adReturnValueAndStack}. */
        IF AVAILABLE tt_object THEN ASSIGN
            TT_array.value_type     = TT_Object.obj_value_type
            TT_array.value_array_id = TT_Object.obj_array_id
            TT_array.value_dict_id  = TT_Object.obj_dict_id
            TT_array.value_scalar   = TT_Object.obj_scalar.
        ELSE ASSIGN
            TT_array.value_type     = "SCALAR"
            TT_array.value_scalar   = "null".
    END.
END PROCEDURE. /* ResolveIndirects */

PROCEDURE extractNumFromXRefStream:
  DEFINE INPUT  PARAMETER stream-content AS MEMPTR    NO-UNDO.
  DEFINE INPUT  PARAMETER pPosition      AS INTEGER   NO-UNDO.
  DEFINE INPUT  PARAMETER pSize1         AS INTEGER   NO-UNDO.
  DEFINE INPUT  PARAMETER pSize2         AS INTEGER   NO-UNDO.
  DEFINE INPUT  PARAMETER pSize3         AS INTEGER   NO-UNDO.
  DEFINE OUTPUT PARAMETER pNum1          AS INTEGER   NO-UNDO.
  DEFINE OUTPUT PARAMETER pNum2          AS INTEGER   NO-UNDO.
  DEFINE OUTPUT PARAMETER pNum3          AS INTEGER   NO-UNDO.

  DEFINE VARIABLE i AS INTEGER     NO-UNDO.

  /* 23-OCT-2014 jcc: pSize1 might be zero, in which case, the field is not present and its value defaults to 1 */
  IF pSize1 = 0 THEN
      pNum1 = 1.
  ELSE DO i = 1 TO pSize1:
    pNum1 = pNum1 + GET-BYTE(stream-content, pPosition + i - 1) * EXP(256, pSize1 - i).
  END.
  pPosition = pPosition + pSize1.
  DO i = 1 TO pSize2:
    pNum2 = pNum2 + GET-BYTE(stream-content, pPosition + i - 1) * EXP(256, pSize2 - i).
  END.
  pPosition = pPosition + pSize2.
  IF pSize3 = 0 THEN
      pNum3 = 0.
  ELSE DO i = 1 TO pSize3:
    pNum3 = pNum3 + GET-BYTE(stream-content, pPosition) * EXP(256, pSize3 - i).
  END.
END PROCEDURE.

PROCEDURE LoadObjectPointers:
  DEFINE INPUT  PARAMETER pPointer AS INTEGER     NO-UNDO.
  
  DEFINE VARIABLE curr-ptr  AS INTEGER NO-UNDO.
  DEFINE VARIABLE prev-ptr  AS INTEGER NO-UNDO.

  DEFINE VARIABLE text-ptr  AS CHARACTER NO-UNDO.
  DEFINE VARIABLE text-temp AS CHARACTER NO-UNDO.

  DEFINE VARIABLE cWord            AS CHARACTER   NO-UNDO.
  DEFINE VARIABLE iFirstObjInRange AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iLastObjInRange  AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iIndexArrayId    AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iNbRangesInIndex AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iCurrentRange    AS INTEGER     INITIAL 1 NO-UNDO.
  DEFINE VARIABLE iGen             AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iObj             AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iOffset          AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iStreamPtr       AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iTrailerDictId   AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iXrefDictId      AS INTEGER     NO-UNDO.
  DEFINE VARIABLE iXrefStmSize     AS INTEGER     NO-UNDO.
  DEFINE VARIABLE L_Length         AS INTEGER     NO-UNDO.
  DEFINE VARIABLE L_ScanLineSize   AS INTEGER     NO-UNDO.
  DEFINE VARIABLE L_StreamNum      AS INTEGER     EXTENT 3 NO-UNDO.
  DEFINE VARIABLE L_StreamNumSize  AS INTEGER     EXTENT 3 NO-UNDO.

  DEFINE VARIABLE stream-content  AS MEMPTR   NO-UNDO.

  DEFINE BUFFER TT_Object FOR TT_Object.
  DEFINE BUFFER TT_array  FOR TT_array.
  DEFINE BUFFER TT_dict   FOR TT_dict.
  DEFINE BUFFER bTT_dict  FOR TT_dict.

  SEEK INPUT TO pPointer.

    cWord = ReadWord().
    &IF DEFINED(debug) &THEN RUN debugLog("xref: " + cWord). &ENDIF
    IF cWord = "xref" THEN
    blkXref:
    DO WHILE TRUE: /* legacy xref */
        text-ptr = ReadLine().
        /* 12-APR-2012 jcc: compute the object id (iObj) in order to prevent creation of two tt_object with the same ids (see below) */
        IF NUM-ENTRIES(text-ptr, " ") = 2 THEN DO: /* new subsection of the xref */
            iObj = INTEGER(ENTRY(1, text-ptr, " ")) NO-ERROR.
            IF ERROR-STATUS:ERROR THEN RETURN ERROR "Invalid XRef" + CHR(3) + ABLCallStack(0).
            NEXT. /* next line */
        END.
        ELSE IF LENGTH(text-ptr) > 2
        AND SUBSTR(text-ptr,LENGTH(text-ptr) - 1, 2) = " f" THEN DO: /* free object */
            iObj = iObj + 1.
            NEXT. /* next line */
        END.
        ELSE IF LENGTH(text-ptr) > 2
        AND SUBSTR(text-ptr,LENGTH(text-ptr) - 1, 2) = " n" THEN DO: /* normal object */
            iGen = INTEGER(ENTRY(2, text-ptr, " ")) NO-ERROR.
            IF ERROR-STATUS:ERROR THEN RETURN ERROR "Invalid XRef" + CHR(3) + ABLCallStack(0).
            /* 12-APR-2012 jcc: create only once a given object with same obj/gen; the first time being the good one, as the last version of an object will appear first in the different xrefs */
            IF NOT CAN-FIND(TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID
                                        AND TT_Object.obj_id = iObj AND TT_Object.gen_id = iGen) THEN DO:
                &IF DEFINED(debug) &THEN RUN debugLog("create normal object id " + STRING(iObj) + " from classic xref"). &ENDIF
                CREATE TT_Object.
                ASSIGN TT_Object.obj_stream = pStream
                       TT_Object.pdf_id     = pID
                       TT_Object.cache_dir  = pcCacheDir
                       TT_Object.obj_ptr    = INTEGER(ENTRY(1,text-ptr," "))
                       TT_Object.obj_id     = iObj
                       TT_Object.gen_id     = iGen
                       TT_Object.obj_seq    = obj-ctr
                       obj-ctr              = obj-ctr + 1.
            END.
            iObj = iObj + 1.
            NEXT. /* 03-FEB-2011 jcc: no need to continue here */
        END.
        ELSE IF text-ptr = "trailer" THEN DO:
            /* read trailer dictionary */
            RUN LoadDictionary (OUTPUT iTrailerDictId, 0, 0, OUTPUT iStreamPtr).

            {getDict TT_dict iTrailerDictId "~/Encrypt"}.
            IF AVAILABLE TT_dict THEN DO:
                doc-encrypted = YES.
                RETURN.
            END.

            {getDict TT_dict iTrailerDictId "~/Root"}.
            IF AVAILABLE TT_dict THEN ASSIGN
                root-obj = TT_dict.value_indirect[1]
                root-gen = TT_dict.value_indirect[2].

            {getDict TT_dict iTrailerDictId "~/Info"}.
            IF AVAILABLE TT_dict THEN ASSIGN
                info-obj = TT_dict.value_indirect[1]
                info-gen = TT_dict.value_indirect[2].

            /* 23-JAN-2011 jcc: implementation of PDF >= 1.5
               extract the xref stream, if any */
            {getDict TT_dict iTrailerDictId "SCALAR" "~/XRefStm"}.
            IF AVAILABLE TT_dict THEN DO:
                curr-ptr = SEEK(input).
                RUN LoadObjectPointers(TT_dict.value_scalar) NO-ERROR.
                {&adCheckErrorAndReturn}
                SEEK INPUT TO curr-ptr.
            END.

            {getDict TT_dict iTrailerDictId "SCALAR" "~/Prev"}.
            IF AVAILABLE TT_dict THEN DO:
                curr-ptr = SEEK(input).
                RUN LoadObjectPointers(TT_dict.value_scalar) NO-ERROR.
                {&adCheckErrorAndReturn}
                SEEK INPUT TO curr-ptr.
            END.

            LEAVE blkXref.
        END.
    END. /* blkXref: IF cWord = "xref" THEN DO WHILE TRUE */
    ELSE DO: /* Xref stream */
        &IF DEFINED(debug) &THEN RUN debugLog("processing Xref stream"). &ENDIF
        iObj = INTEGER(cWord) NO-ERROR.
        IF ERROR-STATUS:ERROR THEN
            RETURN ERROR "Invalid XRef" + CHR(3) + ABLCallStack(0).
        cWord = ReadWord().
        iGen = INTEGER(cWord) NO-ERROR.
        IF ERROR-STATUS:ERROR THEN
            RETURN ERROR "Invalid XRef" + CHR(3) + ABLCallStack(0).
        cWord = ReadWord().
        IF cWord <> "obj" THEN
            RETURN ERROR "Invalid XRef" + CHR(3) + ABLCallStack(0).
        &IF DEFINED(debug) &THEN RUN debugLog("Xref stream: " + STRING(iObj) + " " + STRING(iGen) + " obj" ). &ENDIF
        /* read Xref dictionary */
        RUN LoadDictionary (OUTPUT iXrefDictId, iObj, iGen, OUTPUT iStreamPtr).

        {getDict TT_dict iXrefDictId "SCALAR" "~/Type"}.
        IF (AVAILABLE TT_dict AND TT_dict.value_scalar <> "/XRef") OR NOT AVAILABLE TT_dict THEN
            RETURN ERROR "Xref dictionary /Type should be /XRef (instead found " + (IF AVAILABLE TT_dict THEN QUOTER(TT_dict.value_scalar) ELSE "no ~/Type") + ")" + CHR(3) + ABLCallStack(0).

        {getDict TT_dict iXrefDictId "~/Encrypt"}.
        IF AVAILABLE TT_dict THEN DO:
            doc-encrypted = YES.
            RETURN.
        END.

        IF root-obj = 0 THEN DO: /* 21-SEP-2015 jcc: only consider the last Root, i.e. the first we find in the pdf file */
            {getDict TT_dict iXrefDictId "~/Root"}.
            IF AVAILABLE TT_dict THEN ASSIGN
                root-obj = TT_dict.value_indirect[1]
                root-gen = TT_dict.value_indirect[2].
        END.

        IF info-obj = 0 THEN DO: /* 21-SEP-2015 jcc: only consider the last Info, i.e. the first we find in the pdf file */
            {getDict TT_dict iXrefDictId "~/Info"}.
            IF AVAILABLE TT_dict THEN ASSIGN
                info-obj = TT_dict.value_indirect[1]
                info-gen = TT_dict.value_indirect[2].
        END.

        {getDict TT_dict iXrefDictId "ARRAY" "~/W"}.
        IF AVAILABLE TT_dict THEN DO:
            FOR EACH TT_array WHERE TT_array.array_id = TT_dict.value_array_id:
                L_StreamNumSize[TT_array.value_id] = INTEGER(TT_array.value_scalar).
                L_ScanLineSize = L_ScanLineSize + L_StreamNumSize[TT_array.value_id].
            END.
        END.

        /* get the first, the last object number and the number of objects' ranges in the section, plus the /Index array */
        {getDict TT_dict iXrefDictId "ARRAY" "~/Index"}.
        IF AVAILABLE TT_dict THEN DO:
            iIndexArrayId = TT_dict.value_array_id.
            FOR EACH TT_array WHERE TT_array.array_id = TT_dict.value_array_id
                BY TT_array.value_id DESCENDING:
                iNbRangesInIndex = TT_array.value_id.
                LEAVE.
            END.
            iNbRangesInIndex = iNbRangesInIndex / 2.
            FIND TT_array WHERE TT_array.array_id = TT_dict.value_array_id
                AND TT_array.value_id = 1.
            iFirstObjInRange = INTEGER(TT_array.value_scalar).
            FIND TT_array WHERE TT_array.array_id = TT_dict.value_array_id
                AND TT_array.value_id = 2.
            iLastObjInRange = iFirstObjInRange + INTEGER(TT_array.value_scalar) - 1.
        END.
        ELSE DO: /* /Index defaults to [0 Size] */
            {getDict TT_dict iXrefDictId "SCALAR" "~/Size"}.
            ASSIGN
                iNbRangesInIndex = 1
                iFirstObjInRange = 0
                iLastObjInRange  = INTEGER(TT_dict.value_scalar) - 1.
        END.

        {getDict TT_dict iXrefDictId "SCALAR" "~/Length"}.
        IF AVAILABLE TT_dict THEN
            L_Length = INTEGER(TT_dict.value_scalar).

        &IF DEFINED(debug) &THEN RUN debugLog("Xref stream dict " + STRING(iXrefDictId) + " parsed. Length: " + STRING(L_Length) ). &ENDIF
        /* if next word is "stream" and we have found a length, then extract the xref stream */
        IF L_Length > 0 THEN DO:
            RUN outputStream (iStreamPtr, iXrefDictId, YES, "", NO, OUTPUT stream-content) NO-ERROR.
            {&adCheckErrorAndReturn}
            &IF DEFINED(debug) &THEN RUN debugLog("Xref stream content extracted (Length: " + STRING(GET-SIZE(stream-content)) + ")"). RUN debugLog("The xref stream will be decoded using these widths: " + STRING(L_StreamNumSize[1]) + "/" + STRING(L_StreamNumSize[2]) + "/" + STRING(L_StreamNumSize[3])).  &ENDIF

            /* decode the xref stream and create the corresponding TT_Object records */
            iXrefStmSize = GET-SIZE(stream-content).
            iOffset = 1.
            blkXrefStm:
            DO WHILE iOffset < iXrefStmSize:
              RUN extractNumFromXRefStream(
                  stream-content, iOffset,
                  L_StreamNumSize[1], L_StreamNumSize[2], L_StreamNumSize[3],
                  OUTPUT L_StreamNum[1], OUTPUT L_StreamNum[2], OUTPUT L_StreamNum[3]).
              &IF DEFINED(debug) &THEN RUN debugLog("StreamNum: " + STRING(L_StreamNum[1]) + "/" + STRING(L_StreamNum[2]) + "/" + STRING(L_StreamNum[3])). &ENDIF

              CASE L_StreamNum[1]: /* Type */
                  WHEN 0 THEN DO: /* free objects */
                      /* ignore */
                      &IF DEFINED(debug) &THEN RUN debugLog("ignore free object id " + STRING(iFirstObjInRange)). &ENDIF
                  END.
                  WHEN 1 THEN DO: /* "normal" objects */
                      &IF DEFINED(debug) &THEN RUN debugLog("create normal object id " + STRING(iFirstObjInRange)). &ENDIF
                      /* 21-SEP-2015 jcc: test if the object already exist, in which case we ignore it (we only consider the last version of the object) */
                      IF NOT CAN-FIND(TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID
                                                  AND TT_Object.obj_id = iFirstObjInRange AND TT_Object.gen_id = 0) THEN DO:
                          &IF DEFINED(debug) &THEN RUN debugLog("create object id " + STRING(iFirstObjInRange) + " from xref stream"). &ENDIF
                          CREATE TT_Object.
                          ASSIGN TT_Object.obj_stream = pStream
                                 TT_Object.pdf_id     = pID
                                 TT_Object.obj_id     = iFirstObjInRange
                                 TT_Object.obj_seq    = obj-ctr
                                 TT_Object.cache_dir  = pcCacheDir
                                 TT_Object.obj_ptr    = L_StreamNum[2]
                                 obj-ctr              = obj-ctr + 1.
                      END.
                  END.
                  WHEN 2 THEN DO: /* objects stored within other streams */
                      &IF DEFINED(debug) &THEN RUN debugLog("create object id " + STRING(iFirstObjInRange) + " stored in other stream"). &ENDIF
                      /* 21-SEP-2015 jcc: test if the object already exist, in which case we ignore it (we only consider the last version of the object) */
                      IF NOT CAN-FIND (TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID
                                       AND TT_Object.obj_id = iFirstObjInRange AND TT_Object.gen_id = 0) THEN DO:
                          &IF DEFINED(debug) &THEN RUN debugLog("create object id " + STRING(iFirstObjInRange) + " from xref stream"). &ENDIF
                          CREATE TT_Object.
                          ASSIGN TT_Object.obj_stream = pStream
                                 TT_Object.pdf_id     = pID
                                 TT_Object.obj_id     = iFirstObjInRange
                                 TT_Object.obj_seq    = obj-ctr
                                 TT_Object.cache_dir  = pcCacheDir
                                 TT_Object.stream_obj = L_StreamNum[2] /* id of the object where the object stream is located */
                                 TT_Object.stream_idx = L_StreamNum[3] /* index of the object within the stream */
                                 obj-ctr              = obj-ctr + 1.
                          /* remember the object stream in TT_ObjStms */
                          IF NOT CAN-FIND(TT_ObjStms WHERE TT_ObjStms.obj_id = L_StreamNum[2]) THEN DO:
                            &IF DEFINED(debug) &THEN RUN debugLog("create TT_ObjStms for " + STRING(L_StreamNumSize[2])). &ENDIF
                            CREATE TT_ObjStms.
                            ASSIGN
                              TT_ObjStms.obj_stream = pStream
                              TT_ObjStms.pdf_id     = pID
                              TT_ObjStms.obj_id     = L_StreamNum[2].
                          END.
                      END.
                  END.
                  OTHERWISE DO:
                      /* ignore: "Any other value shall be interpreted as a reference to the null object, thus permitting new entry types to be defined in the future." */
                      &IF DEFINED(debug) &THEN RUN debugLog("ignore null object id " + STRING(iFirstObjInRange)). &ENDIF
                  END.
              END CASE.
              iOffset = iOffset + L_ScanLineSize.
              iFirstObjInRange = iFirstObjInRange + 1.
              /* 21-SEP-2015 jcc: when the /Index array has got more than one objects range... */
              IF iFirstObjInRange > iLastObjInRange THEN DO:
                  IF iCurrentRange = iNbRangesInIndex THEN LEAVE blkXrefStm. /* 'cause we've read it all */
                  /* get first and last object id in next range */
                  iCurrentRange = iCurrentRange + 1.
                  FIND TT_array WHERE TT_array.array_id = iIndexArrayId
                      AND TT_array.value_id = iCurrentRange * 2 - 1.
                  iFirstObjInRange = INTEGER(TT_array.value_scalar).
                  FIND TT_array WHERE TT_array.array_id = iIndexArrayId
                      AND TT_array.value_id = iCurrentRange * 2.
                  iLastObjInRange = iFirstObjInRange + INTEGER(TT_array.value_scalar) - 1.
              END. /* 21-SEP-2015 jcc: end */
            END. /* DO WHILE iOffset < iXrefStmSize */
            SET-SIZE(stream-content) = 0.
        END. /* IF L_Length > 0 */

        {getDict TT_dict iXrefDictId "SCALAR" "~/Prev"}.
        IF AVAILABLE TT_dict THEN DO:
            curr-ptr = SEEK(input).
            RUN LoadObjectPointers(TT_dict.value_scalar) NO-ERROR.
            {&adCheckErrorAndReturn}
            SEEK INPUT TO curr-ptr.
        END.

    END.  
END. /* LoadObjectPointers */

/* 06-JUL-2011 jcc: rewrite parseText */
/* FUNCTION parseFirstChar RETURNS INTEGER ( cText AS CHARACTER, OUTPUT iChars AS INTEGER ): */
/*     DEFINE VARIABLE i AS INTEGER    NO-UNDO.                                              */
/*     IF SUBSTRING(cText,1,1) = "~\" THEN DO:                                               */
/*         i = INTEGER(SUBSTRING(cText,2,3)) NO-ERROR.                                       */
/*         IF NOT ERROR-STATUS:ERROR THEN DO:                                                */
/*             iChars = 4.                                                                   */
/*             RETURN oct2int(SUBSTRING(cText,2,3)).                                         */
/*         END.                                                                              */
/*         ELSE DO:                                                                          */
/*             iChars = 2.                                                                   */
/*             CASE SUBSTRING(cText,1,2):                                                    */
/*                 WHEN "~\n" THEN RETURN ASC("~n").                                         */
/*                 WHEN "~\r" THEN RETURN ASC("~r").                                         */
/*                 WHEN "~\t" THEN RETURN ASC("~t").                                         */
/*                 WHEN "~\b" THEN RETURN ASC("~b").                                         */
/*                 WHEN "~\f" THEN RETURN ASC("~f").                                         */
/*                 OTHERWISE RETURN ASC(SUBSTRING(cText,2,1)).                               */
/*             END CASE.                                                                     */
/*         END.                                                                              */
/*     END.                                                                                  */
/*     ELSE DO:                                                                              */
/*         iChars = 1.                                                                       */
/*         RETURN ASC(SUBSTRING(cText,1,1,'RAW'), 'iso8859-1', 'iso8859-1').                 */
/*     END.                                                                                  */
/* END FUNCTION.                                                                             */


PROCEDURE CreateVirtualObject:
    DEFINE INPUT PARAMETER ipcValueType AS CHARACTER   NO-UNDO.
    DEFINE INPUT PARAMETER ipiId        AS INTEGER     NO-UNDO.
    DEFINE INPUT PARAMETER ipcScalar    AS CHARACTER   NO-UNDO.
    DEFINE PARAMETER BUFFER TT_Object FOR TT_Object.

    CREATE TT_Object.
    ASSIGN TT_Object.obj_stream     = pStream
           TT_Object.pdf_id         = pID
           TT_Object.cache_dir      = pcCacheDir
           TT_Object.obj_ptr        = -1
           TT_Object.obj_id         = obj-virt
           TT_Object.obj_seq        = obj-ctr
           TT_Object.obj_value_type = ipcValueType
           obj-ctr                  = obj-ctr + 1
           obj-virt                 = obj-virt - 1.

    CASE ipcValueType:
        WHEN "DICT" THEN
            TT_Object.obj_dict_id = ipiId.
        WHEN "ARRAY" THEN
            TT_Object.obj_array_id = ipiId.
        WHEN "SCALAR" THEN
            TT_Object.obj_scalar = ipcScalar.
        OTHERWISE
            RETURN ERROR "CreateVirtualObject called with unknown data type " + QUOTER(ipcValueType) + CHR(3) + ABLCallStack(0).
    END CASE.

END. /* CreateVirtualObject */


PROCEDURE outputDictStream:
    DEFINE INPUT PARAMETER ipiDictId  AS INTEGER     NO-UNDO.
    DEFINE INPUT PARAMETER plDecode   AS LOGICAL     NO-UNDO.
    DEFINE INPUT PARAMETER pcFileName AS CHARACTER   NO-UNDO.
    DEFINE INPUT PARAMETER plAppend   AS LOGICAL     NO-UNDO.

    /* DEFINE VARIABLE iLength  AS INTEGER     NO-UNDO. */
    DEFINE VARIABLE m        AS MEMPTR      NO-UNDO. /* Dummy */.
    DEFINE VARIABLE text-ptr AS CHARACTER   NO-UNDO.

    DEFINE BUFFER TT_Object FOR TT_Object.
    /* DEFINE BUFFER TT_dict   FOR TT_dict. */

    /* 29-OCT-2014 jcc: commented out: iLength value is not used */
    /* {getDict TT_dict ipiDictId "SCALAR" "~/Length"}. */
    /* IF AVAILABLE TT_dict THEN */
        /* iLength = INTEGER(TT_dict.value_scalar). */
    /* IF iLength = 0 THEN */
        /* RETURN ERROR "Did not find stream ~/Length" + CHR(3) + ABLCallStack(0). */

    FIND LAST TT_Object WHERE TT_Object.obj_stream = pStream AND TT_Object.pdf_id = pID
        AND TT_Object.obj_dict_id = ipiDictId NO-ERROR.
    {&adCheckErrorAndReturn}

    /* Find file offset */
    SEEK INPUT TO TT_Object.obj_ptr.
    DO WHILE TRUE:
      text-ptr = ReadLine().

      IF LENGTH(text-ptr) > 5
        AND SUBSTRING(text-ptr, LENGTH(text-ptr) - 5) = "stream" THEN
          LEAVE.

      /* Somehow we misssed the content? */
      IF text-ptr = "endstream" OR text-ptr = "endobj" THEN
          RETURN ERROR "Could not find stream" + CHR(3) + ABLCallStack(0).
    END. /* While True */

    RUN outputStream (SEEK(INPUT), ipiDictId, plDecode, pcFileName, plAppend, OUTPUT m) NO-ERROR.
    {&adCheckErrorAndReturn}
END PROCEDURE. /* outputDictStream */

PROCEDURE FlateDecode:
    DEFINE INPUT  PARAMETER pmStream          AS MEMPTR      NO-UNDO.
    DEFINE INPUT  PARAMETER piDecodeParmsDict AS INTEGER     NO-UNDO.
    DEFINE OUTPUT PARAMETER pmFiltStream      AS MEMPTR      NO-UNDO.
    DEFINE OUTPUT PARAMETER piStreamSize      AS INTEGER     NO-UNDO.

    DEFINE VARIABLE cColumns      AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE i             AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iNbLines      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iOffset       AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iPredictor    AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iRetCode      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iScanLineSize AS INTEGER     NO-UNDO.
    DEFINE VARIABLE mStream       AS MEMPTR      NO-UNDO.

    DEFINE BUFFER TT_dict FOR TT_dict.


    iRetCode = DeCompressBuffer(pmStream, OUTPUT pmFiltStream, OUTPUT piStreamSize).
    IF iRetCode <> 0 THEN DO:
        &IF DEFINED(debug) &THEN RUN debugLog("zlib error: " + STRING(iRetCode)). &ENDIF
        RETURN ERROR "zlib error: " + STRING(iRetCode) + CHR(3) + ABLCallStack(0).
    END.
    &IF DEFINED(debug) &THEN RUN debugLog("Zlib returned " + STRING(GET-SIZE(pmFiltStream)) + " bytes: " + HEX-ENCODE(pmFiltStream)). &ENDIF
    /* 23-OCT-2014 jcc: take into account /DecodeParms; for /FlateDecode, apply the PNG predictor */
    IF piDecodeParmsDict <> ? THEN DO:
        {getDict TT_dict piDecodeParmsDict "SCALAR" "~/Columns"}.
        IF AVAILABLE TT_dict THEN
            iScanLineSize = INTEGER(TT_dict.value_scalar) + 1. /* 22-OCT-2014 jcc: add one byte for the predictor line type */
        {getDict TT_dict piDecodeParmsDict "SCALAR" "~/Predictor"}.
        IF AVAILABLE TT_dict THEN
            iPredictor = INTEGER(TT_dict.value_scalar).
        /* Apply the f*** reverse PNG filter to the stream (if any). Could not this be more complicated??? */
        &IF DEFINED(debug) &THEN RUN debugLog("about to filter the stream with predictor " + STRING(iPredictor) + " / columns " + STRING(iScanLineSize - 1)). &ENDIF
        IF piStreamSize > 0 AND iPredictor > 0 THEN DO:
            CASE iPredictor:
                WHEN 10 THEN. /* nothing */
                WHEN 11 THEN DO i = 2 TO piStreamSize:
                    IF i MOD iScanLineSize = 1 THEN NEXT. /* skip first bit of scan line */
                    PUT-BYTE(pmFiltStream, i) = GET-BYTE(pmFiltStream, i) + GET-BYTE(pmFiltStream, i - 1). /* MODULO 256 automatically done by put-bytes */
                END.
                WHEN 12 THEN DO i = iScanLineSize + 1 TO piStreamSize:
                    IF i MOD iScanLineSize = 1 THEN NEXT. /* skip first bit of scan line */
                    PUT-BYTE(pmFiltStream, i) = GET-BYTE(pmFiltStream, i) + GET-BYTE(pmFiltStream, i - iScanLineSize).
                END.
                OTHERWISE
                    RETURN ERROR "Unsupported FlateDecode /Predictor" + CHR(3) + ABLCallStack(0).
            END CASE.
            /* 22-OCT-2014 jcc: we now have to remove the predictor line type which is inserted before each line.
            e.g. 02 00 000000 00        00 000000 00
                 02 01 010636 00   ->   01 010636 00
                 02 01 01094b 00        01 01094b 00
                 02 01 010b0b 00        01 010b0b 00  */
            iNbLines = piStreamSize / iScanLineSize.
            &IF LENGTH(ENTRY(1,PROVERSION,".")) > 1 OR PROVERSION >= "9.1" &THEN
                mStream = pmFiltStream. /* copy the data */
                SET-SIZE(pmFiltStream) = 0.
                SET-SIZE(pmFiltStream) = piStreamSize - iNbLines.
            &ELSE
                mStream = pmFiltStream. /* copy the pointer to the data */
                pmFiltStream = ?. /* so that we can reuse it */
                SET-SIZE(pmFiltStream) = 0.
                SET-SIZE(pmFiltStream) = piStreamSize - iNbLines.
            &ENDIF
            iOffset = 1.
            i = 1.
            DO WHILE i < piStreamSize:
                PUT-BYTES(pmFiltStream, iOffset) = GET-BYTES(mStream, i + 1, iScanLineSize - 1).
                i       = i       + iScanLineSize.
                iOffset = iOffset + iScanLineSize - 1.
            END.
            IF LENGTH(ENTRY(1,PROVERSION,".")) > 1 OR PROVERSION >= "9.1" THEN SET-SIZE(mStream) = 0.
            piStreamSize = piStreamSize - iNbLines.
            /* 22-OCT-2014 jcc: end */
        END.
        &IF DEFINED(debug) &THEN RUN debugLog("Filtered stream content: " + HEX-ENCODE(pmFiltStream)). &ENDIF
    END.
END PROCEDURE. /* FlateDecode */

PROCEDURE AsciiHexDecode:
    DEFINE INPUT  PARAMETER pmInputBuffer  AS MEMPTR      NO-UNDO.
    DEFINE INPUT  PARAMETER piParamsDictId AS INTEGER     NO-UNDO.
    DEFINE OUTPUT PARAMETER pmOutputBuffer AS MEMPTR      NO-UNDO.
    DEFINE OUTPUT PARAMETER piOutputSize   AS INTEGER     NO-UNDO.

    DEFINE VARIABLE i          AS INTEGER   NO-UNDO.
    DEFINE VARIABLE iByte      AS INTEGER   NO-UNDO.
    DEFINE VARIABLE iInputSize AS INTEGER   NO-UNDO.
    DEFINE VARIABLE iValue1    AS INTEGER   NO-UNDO.
    DEFINE VARIABLE iValue2    AS INTEGER   NO-UNDO.
    DEFINE VARIABLE j          AS INTEGER   NO-UNDO.
    DEFINE VARIABLE mTmp       AS MEMPTR    NO-UNDO.

    ASSIGN
        iInputSize   = GET-SIZE(pmInputBuffer)
        piOutputSize = INTEGER(iInputSize / 2) - 1.

    SET-SIZE(pmOutputBuffer) = piOutputSize.

    ASSIGN
        iValue1 = ?
        iValue2 = ?.
    main:
    DO WHILE i < iInputSize:
        i = i + 1.
        iByte = GET-BYTE(pmInputBuffer, i).

        IF iByte = ? OR iByte = 62 THEN LEAVE main. /* EOD = ">" = chr(62) */
        ELSE IF iByte = 0 OR iByte = 9 OR iByte = 10 OR iByte = 12 OR iByte = 13 OR iByte = 32 THEN NEXT main.

        IF iValue1 = ? THEN DO:
            iValue1 = iByte - 48.
            IF iValue1 > 16 THEN iValue1 = iValue1 - 7.
        END.
        ELSE DO:
            iValue2 = iByte - 48.
            IF iValue2 > 16 THEN iValue2 = iValue2 - 7.
            j = j + 1.
            PUT-BYTE(pmOutputBuffer, j) = iValue1 * 16 + iValue2.
            ASSIGN
                iValue1 = ?
                iValue2 = ?.
        END.
    END. /* DO WHILE i < iInputSize */
    IF iValue1 <> ? AND iValue2 = ? THEN DO:
        j = j + 1.
        PUT-BYTE(pmOutputBuffer, j) = iValue1 * 16.
    END.

    IF piOutputSize > j THEN DO:
        SET-SIZE(mTmp) = j.
        PUT-BYTES(mTmp, 1) = GET-BYTES(pmOutputBuffer, 1, j).
        SET-SIZE(pmOutputBuffer) = 0.
        SET-SIZE(pmOutputBuffer) = j.
        PUT-BYTES(pmOutputBuffer, 1) = GET-BYTES(mTmp, 1, j).
        SET-SIZE(mTmp) = 0.
        piOutputSize = j.
    END.
END PROCEDURE. /* AsciiHexDecode */

PROCEDURE Ascii85Decode:
    DEFINE INPUT  PARAMETER pmInputBuffer  AS MEMPTR      NO-UNDO.
    DEFINE INPUT  PARAMETER piParamsDictId AS INTEGER     NO-UNDO.
    DEFINE OUTPUT PARAMETER pmOutputBuffer AS MEMPTR      NO-UNDO.
    DEFINE OUTPUT PARAMETER piOutputSize   AS INTEGER     NO-UNDO.

    DEFINE VARIABLE i          AS INTEGER   NO-UNDO.
    DEFINE VARIABLE ib         AS INTEGER   NO-UNDO.
    DEFINE VARIABLE iByte      AS INTEGER   NO-UNDO.
    DEFINE VARIABLE ic         AS INTEGER   EXTENT 5 NO-UNDO.
    DEFINE VARIABLE iInputSize AS INTEGER   NO-UNDO.
    DEFINE VARIABLE j          AS INTEGER   NO-UNDO.
    DEFINE VARIABLE k          AS INTEGER   NO-UNDO.
    DEFINE VARIABLE mTmp       AS MEMPTR    NO-UNDO.

    ASSIGN
        iInputSize   = GET-SIZE(pmInputBuffer)
        piOutputSize = INTEGER(iInputSize * .8). /* .8 because 5 input chars give 4 output bytes */

    SET-SIZE(pmOutputBuffer) = piOutputSize.

    ASSIGN
        ic[1] = 0
        ic[2] = 0
        ic[3] = 0
        ic[4] = 0
        ic[5] = 0.
    main:
    DO WHILE i < iInputSize:
        i = i + 1.
        iByte = GET-BYTE(pmInputBuffer, i).

        IF iByte = ?
          OR (iByte = 126 AND GET-BYTE(pmInputBuffer, i + 1) = 62) /* EOD = "~>" = chr(126) + chr(62) */ THEN
            LEAVE main.
        ELSE IF iByte = 60 /* "<" */ AND GET-BYTE(pmInputBuffer, i + 1) = 126 /* "~" */ THEN DO:
            i = i + 1.
            NEXT main.
        END.
        ELSE IF iByte = 0 OR iByte = 9 OR iByte = 10 OR iByte = 12 OR iByte = 13 OR iByte = 32 THEN NEXT main.
        ELSE IF iByte = 122 /* "z" */ THEN DO:
            j = j + 1.
            PUT-BYTE(pmOutputBuffer, j)     = 0.
            PUT-BYTE(pmOutputBuffer, j + 1) = 0.
            PUT-BYTE(pmOutputBuffer, j + 2) = 0.
            PUT-BYTE(pmOutputBuffer, j + 3) = 0.
            j = j + 3.
        END.
        ELSE DO:
            iByte = iByte - 33.
            /* TODO: iByte must be >= 0 and < 85 */
            k = k + 1.
            ic[k] = iByte.
            IF k = 5 THEN DO:
                ib = ic[1] * 52200625 /* 85^4 */ +
                     ic[2] * 614125 /* 85^3 */ +
                     ic[3] * 7225 /* 85^2 */ +
                     ic[4] * 85 +
                     ic[5].
                /* TODO: ib must be < EXP(2,32) - 1 */
                j = j + 1.
                PUT-BYTE(pmOutputBuffer, j)     = INTEGER(ib / 16777216 /* 2^24 */).
                PUT-BYTE(pmOutputBuffer, j + 1) = INTEGER(ib / 65536 /* 2^16 */).
                PUT-BYTE(pmOutputBuffer, j + 2) = INTEGER(ib / 256 /* 2^8 */).
                PUT-BYTE(pmOutputBuffer, j + 3) = ib.
                j = j + 3.
                ASSIGN
                    k     = 0
                    ic[1] = 0
                    ic[2] = 0
                    ic[3] = 0
                    ic[4] = 0
                    ic[5] = 0.
            END.
        END.
    END. /* DO WHILE i < iInputSize */
    IF k > 1 THEN DO:
        DO i = k + 1 TO 5:
            ic[i] = 85.
        END.
        ib = ic[1] * 52200625 /* 85^4 */ +
             ic[2] * 614125 /* 85^3 */ +
             ic[3] * 7225 /* 85^2 */ +
             ic[4] * 85 +
             ic[5].
        /* TODO: ib must be < EXP(2,32) - 1 */
        PUT-BYTE(pmOutputBuffer, j + 1) = INTEGER(ib / 16777216 /* 2^24 */). /* MODULO 256: automaticaly done by PUT-BYTES */
        PUT-BYTE(pmOutputBuffer, j + 2) = INTEGER(ib / 65536 /* 2^16 */).
        PUT-BYTE(pmOutputBuffer, j + 3) = INTEGER(ib / 256 /* 2^8 */).
        PUT-BYTE(pmOutputBuffer, j + 4) = ib.
        j = j + k - 1.
    END.

    IF piOutputSize > j THEN DO:
        SET-SIZE(mTmp) = j.
        PUT-BYTES(mTmp, 1) = GET-BYTES(pmOutputBuffer, 1, j).
        SET-SIZE(pmOutputBuffer) = 0.
        SET-SIZE(pmOutputBuffer) = j.
        PUT-BYTES(pmOutputBuffer, 1) = GET-BYTES(mTmp, 1, j).
        SET-SIZE(mTmp) = 0.
        piOutputSize = j.
    END.
END PROCEDURE. /* Ascii85Decode */

/* un-filter (/Filter) a stream */
PROCEDURE decodeStream:
    DEFINE INPUT-OUTPUT PARAMETER pmStream      AS MEMPTR    NO-UNDO.
    DEFINE INPUT        PARAMETER prFilter      AS ROWID     NO-UNDO.
    DEFINE INPUT        PARAMETER prDecodeParms AS ROWID     NO-UNDO.
    DEFINE OUTPUT       PARAMETER piStreamSize  AS INTEGER   NO-UNDO.

    DEFINE BUFFER filter_TT_dict  FOR TT_dict.
    DEFINE BUFFER params_TT_dict  FOR TT_dict.
    DEFINE BUFFER filter_TT_array FOR TT_array.
    DEFINE BUFFER params_TT_array FOR TT_array.

    DEFINE VARIABLE mInflatedStream AS MEMPTR      NO-UNDO.

    piStreamSize = GET-SIZE(pmStream).
    &IF DEFINED(debug) &THEN RUN debugLog("decoding a stream of " + STRING(piStreamSize) + " bytes"). &ENDIF
    FIND filter_TT_dict WHERE ROWID(filter_TT_dict) = prFilter.
    IF prDecodeParms <> ? THEN FIND params_TT_dict WHERE ROWID(params_TT_dict) = prDecodeParms NO-ERROR.

    IF filter_TT_dict.value_type = "SCALAR" THEN DO:
        IF prDecodeParms <> ? AND params_TT_dict.value_type = "ARRAY" THEN RETURN ERROR "Invalid /DecodeParms!" + CHR(3) + ABLCallStack(0).
        RUN unfilterStream(filter_TT_dict.value_scalar,
                           IF prDecodeParms = ? OR params_TT_dict.value_type <> "DICT" THEN ?
                           ELSE params_TT_dict.value_dict_id,
                           pmStream, OUTPUT mInflatedStream, OUTPUT piStreamSize) NO-ERROR.
        SET-SIZE(pmStream) = 0.
        {&adCheckErrorAndReturn}
        &IF DEFINED(debug) &THEN RUN debugLog("got " + STRING(piStreamSize) + " bytes (" + STRING(GET-SIZE(mInflatedStream)) + ") from unfilterStream"). &ENDIF
        pmStream = mInflatedStream.
        /* starting with 9.1, the contents of the MEMPTR is duplicated, so clean it - see help at "MEMPTR data type":
         In Version 9.0, when you copy one MEMPTR (M1) to another MEMPTR (M2), only the MEMPTR address is copied and
         both MEMPTRs point to the same memory location (L1). You can change the data in the single memory location
         and both MEMPTRs will point to the changed data. To clear memory after using the MEMPTRs,
         you can SET-SIZE = 0 on just one of the MEMPTRs.  
         Starting with Version 9.1, when you copy one MEMPTR (M1) to another MEMPTR (M2), the data that M1 points to
         is also copied. Therefore, MEMPTR M1 points to memory location L1, and MEMPTR M2 now points to memory location
         L2 which contains a copy of the data in L1. You must change the data in both memory locations if you want
         both MEMPTRs to reflect the change. To clear memory after using the MEMPTRs, you must execute SET-SIZE = 0
         on both MEMPTRs to be sure that both memory locations are cleared. */
        IF LENGTH(ENTRY(1,PROVERSION,".")) > 1 OR PROVERSION >= "9.1" THEN SET-SIZE(mInflatedStream) = 0.
        &IF DEFINED(debug) &THEN RUN debugLog("pmStream: " + STRING(GET-SIZE(pmStream)) + " bytes - mInflatedStream: " + STRING(GET-SIZE(mInflatedStream)) + " bytes"). &ENDIF
    END.
    ELSE IF filter_TT_dict.value_type = "ARRAY" THEN DO:
        IF prDecodeParms <> ? AND params_TT_dict.value_type <> "ARRAY" THEN RETURN ERROR "Invalid /DecodeParms: must be an array when /Filter is an array" + CHR(3) + ABLCallStack(0).
        FOR EACH filter_TT_array WHERE filter_TT_array.array_id = filter_TT_dict.value_array_id
            BY filter_TT_array.value_id:
            IF prDecodeParms <> ? THEN DO:
                FIND params_TT_array WHERE params_TT_array.array_id = params_TT_dict.value_array_id
                    AND params_TT_array.value_id = filter_TT_array.value_id NO-ERROR.
                IF NOT AVAILABLE params_TT_array THEN RETURN ERROR "Invalid /DecodeParms: must be an array with the same number of elements as the /Filter array" + CHR(3) + ABLCallStack(0).
            END.
            RUN unfilterStream(filter_TT_array.value_scalar,
                               IF prDecodeParms = ? OR params_TT_array.value_type <> "DICT" THEN ?
                               ELSE params_TT_array.value_dict_id,
                               pmStream, OUTPUT mInflatedStream, OUTPUT piStreamSize) NO-ERROR.
            &IF DEFINED(debug) &THEN RUN debugLog("got " + STRING(piStreamSize) + " bytes (" + STRING(GET-SIZE(mInflatedStream)) + ") from unfilterStream"). &ENDIF
            SET-SIZE(pmStream) = 0.
            {&adCheckErrorAndReturn}
            pmStream = mInflatedStream.
            /* starting with 9.1, the contents of the MEMPTR is duplicated, so clean it */
            IF LENGTH(ENTRY(1,PROVERSION,".")) > 1 OR PROVERSION >= "9.1" THEN SET-SIZE(mInflatedStream) = 0.
            &IF DEFINED(debug) &THEN RUN debugLog("pmStream: " + STRING(GET-SIZE(pmStream)) + " bytes - mInflatedStream: " + STRING(GET-SIZE(mInflatedStream)) + " bytes"). &ENDIF
        END.
    END.
END PROCEDURE.

/* un-filter (/Filter) a file */
PROCEDURE decodeFile:
    DEFINE INPUT PARAMETER pcInFile      AS CHARACTER   NO-UNDO.
    DEFINE INPUT PARAMETER prFilter      AS ROWID       NO-UNDO.
    DEFINE INPUT PARAMETER prDecodeParms AS ROWID       NO-UNDO.
    DEFINE INPUT PARAMETER pcOutFile     AS CHARACTER   NO-UNDO.

    DEFINE VARIABLE mStream     AS MEMPTR      NO-UNDO.
    DEFINE VARIABLE iStreamSize AS INTEGER     NO-UNDO.

    FILE-INFO:FILE-NAME = pcInFile.
    SET-SIZE(mStream) = FILE-INFO:FILE-SIZE.
    INPUT FROM VALUE(pcInFile) BINARY NO-MAP NO-CONVERT NO-ECHO.
    IMPORT mStream.
    INPUT CLOSE.

    RUN decodeStream(INPUT-OUTPUT mStream, prFilter, prDecodeParms, OUTPUT iStreamSize) NO-ERROR.
    {&adCheckErrorAndReturn}

    OUTPUT TO VALUE(pcOutFile) BINARY NO-MAP NO-CONVERT NO-ECHO.
    EXPORT mStream.
    OUTPUT CLOSE.
    /* cleanup */
    SET-SIZE(mStream) = 0.
END PROCEDURE.

PROCEDURE unfilterStream:
    DEFINE INPUT  PARAMETER pcFilter          AS CHARACTER   NO-UNDO. /* filter */
    DEFINE INPUT  PARAMETER piDecodeParmsDict AS INTEGER     NO-UNDO. /* filter parameters */
    DEFINE INPUT  PARAMETER pmStream          AS MEMPTR      NO-UNDO.
    DEFINE OUTPUT PARAMETER pmFiltStream      AS MEMPTR      NO-UNDO.
    DEFINE OUTPUT PARAMETER piStreamSize      AS INTEGER     NO-UNDO.


    &IF DEFINED(debug) &THEN RUN debugLog("Unfilter stream with filter " + QUOTER(pcFilter) + " / input size: " + STRING(GET-SIZE(pmStream))). &ENDIF
    CASE pcFilter:
        /* TODO: other filters */
        WHEN "~/FlateDecode" THEN DO:
            RUN FlateDecode(pmStream, piDecodeParmsDict, OUTPUT pmFiltStream, OUTPUT piStreamSize) NO-ERROR.
            {&adCheckErrorAndReturn}
        END.
        WHEN "~/AsciiHexDecode" THEN DO:
            RUN AsciiHexDecode(pmStream, piDecodeParmsDict, OUTPUT pmFiltStream, OUTPUT piStreamSize) NO-ERROR.
            {&adCheckErrorAndReturn}
        END.
        WHEN "~/Ascii85Decode" THEN DO:
            RUN Ascii85Decode(pmStream, piDecodeParmsDict, OUTPUT pmFiltStream, OUTPUT piStreamSize) NO-ERROR.
            {&adCheckErrorAndReturn}
        END.
        OTHERWISE
            RETURN ERROR "Unsupported stream filter " + QUOTER(pcFilter) + CHR(3) + ABLCallStack(0).
    END CASE.
END PROCEDURE.

PROCEDURE outputStream:
    DEFINE INPUT  PARAMETER piPtr      AS INTEGER     NO-UNDO.
    DEFINE INPUT  PARAMETER piDictId   AS INTEGER     NO-UNDO.
    DEFINE INPUT  PARAMETER plDecode   AS LOGICAL     NO-UNDO.
    DEFINE INPUT  PARAMETER pcFileName AS CHARACTER   NO-UNDO.
    DEFINE INPUT  PARAMETER plAppend   AS LOGICAL     NO-UNDO.
    DEFINE OUTPUT PARAMETER pmStream   AS MEMPTR      NO-UNDO.

    DEFINE VARIABLE cFilter          AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE iDecodeParmsDict AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iLength          AS INTEGER     NO-UNDO.
    DEFINE VARIABLE iStreamSize      AS INTEGER     NO-UNDO.
    DEFINE VARIABLE rDecodeParms     AS ROWID       NO-UNDO.
    DEFINE VARIABLE rFilter          AS ROWID       NO-UNDO.

    DEFINE BUFFER TT_dict  FOR TT_dict.
    DEFINE BUFFER bTT_dict FOR TT_dict.
    DEFINE BUFFER TT_array FOR TT_array.

    &IF DEFINED(debug) &THEN RUN debugLog("outputStream for dict " + STRING(piDictId) + IF pcFileName > "" THEN " to file: " + quoter(pcFileName) ELSE " to memptr"). &ENDIF
    
    {getDict TT_dict piDictId "SCALAR" "~/Length"}.
    IF NOT AVAILABLE TT_dict THEN DO:
        MESSAGE PROGRAM-NAME(1)
            VIEW-AS ALERT-BOX INFO BUTTONS OK.
        RETURN ERROR "Invalid pdf template: the stream object has no /Length" + {&adReturnValueAndStack}.
    END.

    iLength = INTEGER(TT_dict.value_scalar).

    IF plDecode THEN DO:
        {getDict TT_dict piDictId "~/Filter"}. /* Filter may be SCALAR or ARRAY */
        IF AVAILABLE TT_dict THEN
            rFilter = ROWID(TT_dict).

        IF rFilter <> ? THEN DO:
            {getDict TT_dict piDictId "~/DecodeParms"}.  /* DecodeParms must be an ARRAY when Filter is one, else a DICT */
            IF AVAILABLE TT_dict AND TT_dict.value_type <> "SCALAR" THEN
                rDecodeParms = ROWID(TT_dict).
            ELSE DO:
                {getDict TT_dict piDictId "~/DP"}.  /* 04-NOV-2015 jcc: pdf 1.7 allows "DP" */
                IF AVAILABLE TT_dict AND TT_dict.value_type <> "SCALAR" THEN
                    rDecodeParms = ROWID(TT_dict).
            END.
        END.
    END. /* IF plDecode */

    SET-SIZE(pmStream) = 0.
    IF iLength > 0 THEN DO:
        SEEK INPUT TO piPtr.
        SET-SIZE(pmStream) = iLength.
        IMPORT pmStream.
        &IF DEFINED(debug) &THEN RUN debugLog("imported " + STRING(GET-SIZE(pmStream)) + " bytes"). &ENDIF

        IF plDecode AND rFilter <> ? THEN DO:
            &IF DEFINED(debug) &THEN RUN debugLog("stream is to be decoded"). &ENDIF
            /* un-filter (/Filter) the stream */
            RUN decodeStream(INPUT-OUTPUT pmStream, rFilter, rDecodeParms, OUTPUT iStreamSize) NO-ERROR.
            {&adCheckErrorAndReturn}
            &IF DEFINED(debug) &THEN RUN debugLog("decoded stream, got " + STRING(GET-SIZE(pmStream)) + " bytes (" + STRING(iStreamSize) + ")"). RUN debugLog("Stream content: " + HEX-ENCODE(pmStream)). &ENDIF
        END. /* IF plDecode AND rFilter <> ? */
    END. /* Length is > 0 */

    IF pcFileName > "" THEN DO:
        &IF DEFINED(debug) &THEN RUN debugLog("write stream to file: " + QUOTER(pcFileName)). &ENDIF
        IF plAppend THEN
            OUTPUT TO VALUE(pcCacheDir + pcFileName) BINARY NO-MAP NO-CONVERT NO-ECHO APPEND.
        ELSE
            OUTPUT TO VALUE(pcCacheDir + pcFileName) BINARY NO-MAP NO-CONVERT NO-ECHO.
        EXPORT pmStream.
        OUTPUT CLOSE.
        SET-SIZE(pmStream) = 0. /* we do not return the stream contents when we write to a file */
    END.

    &IF DEFINED(debug) &THEN RUN debugLog("outputStream done"). &ENDIF

END PROCEDURE. /* OutputStream */
