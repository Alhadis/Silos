/* $Id: VDdrw_mvRows.I,v 1.1.1.1 2001/01/04 21:09:27 cvs Exp $  */

/* I/VDS
 * -------------------------------------------------------------------------
 *
 * File:        vdtbl/func / VDdrw_mvRows.I
 *
 * Description:
 *	Function for moving specified rows, header or trailer of a given 
 *	VDdrwTblHdr object.
 *
 * Dependencies:
 *
 * History:
 *
 *	04/14/95	R. Manem	Creation
 *
 * -------------------------------------------------------------------------
 */

class implementation Root;

/*
#define vdsDEBUG
#define vdserrDEBUG
*/

#include <stdio.h>

#include "igrtypedef.h"
#include "OMerrordef.h"
#include "OMminimum.h"
#include "OMprimitives.h"
#include "igetypedef.h"
#include "gr.h"

#include "godef.h"
#include "grdpbdef.h"
#include "grdpbmacros.h"

#include "v_miscmacros.h"
#include "v_dbgmacros.h"
#include "v_datamacros.h"

from VDdrwTblRow	import	VDgetRowNumber,
				VDputRowNumber,
				VDmoveRow;
from NDmacro		import	ACreturn_foot;
from GRgraphics		import	GRxform;
from GRconnector	import	GRrigidconn,
				GRdisconn;


/*+fe
 -------------------------------------------------------------------------
  Function VD_drwtb_moveRowsOfTbl

  Macro Name
        None

  Abstract
	Function moves the given range of rows and the trailer of a 
	header object, according to the input transformation matrix

  Arguments

	IGRlong		*msg	    O	return code
	IGRint		fromRowNo   I	first row number to move
	IGRint		toRowNo     I	last row number to move
	IGRint		stepSize    I	step size (number of rows) by which 
					the rows are moved
					eg. +1 means one number more, 
					    -2 means 2 numbers less. 
					positive values when inserting rows,
					negative when deleting rows
	IGRshort	moveHdrFlag I	1 = move header, 0 = don't move
	IGRshort	moveTrlFlag I	1 = move trailer, 0 = don't move 
	IGRshort	moveMiscFlag I	1 = move misc, 0 = don't move
	struct GRid	hdrId       I   id of the VDdrwTblHdr object
	IGRshort	matType	    I   Matrix type
	IGRmatrix	tMatrix     I	Transformation matrix
	
  Notes/Remarks
	All rows in the given range (fromRowNo - ToRowNo) will be moved
	The trailer components will also be moved if moveTrlFlag = 1
	The stepSize is used to update the instance data of the row objects
	being moved.
	No update of the rowHeights instance data is done.  Caller must
	handle this.

  Returns
	OM_S_SUCCESS	= if success
	OM_E_ABORT	= if error
 -------------------------------------------------------------------------
-fe*/

IGRlong VD_drwtb_moveRowsOfTbl(	IGRlong		*msg,
				IGRint		fromRowNo,
				IGRint		toRowNo,
				IGRint		stepSize,
				IGRshort	moveHdrFlag,
				IGRshort	moveTrlFlag,
				IGRshort	moveMiscFlag,
				struct GRid	hdrId,
				IGRshort	matType,
				IGRmatrix	tMatrix )
{
    IGRint		i,
			size = sizeof( struct GRmd_env ),
			curRowNo;
    IGRlong		status = OM_S_SUCCESS;
    struct GRid		rowObj,
			headerOwner,
			trailerOwner;
    GRobjid		newObjid;
    struct GRmd_env	mod_env;
    OM_S_CHANSELECT	toRowsChan;

    SetProc( VD_drwtb_moveRowsOfTbl ); Begin

    *msg = MSSUCC;

    __DBGpr_com("\n");
    __DBGpr_obj( "Header object id", hdrId );
    __DBGpr_mat( "Transformation matrix", tMatrix );
    __DBGpr_int( "From row number", fromRowNo );
    __DBGpr_int( "To row number", toRowNo );
    __DBGpr_int( "step size", stepSize );

    headerOwner.objid = trailerOwner.objid = NULL_OBJID;

    /* select the to_tblRows */

    status =
    om$make_chanselect( channame        = "VDdrwTblHdr.to_tblRows",
                        p_chanselect    = &toRowsChan );
    __CheckRC( status, 1, "selecting to_tblRows channel", wrapup );

    /* 
     *	for each row object on the channel, get its row number
     *	if row number is in the given range
     *		update its row number
     *		move the row
     */

    for( i = 0 ; i < OM_K_MAXINT ; i++ )
    {
	__DBGpr_int( "Index i", i );

        status =
        om$get_objid_at_index(	osnum		= hdrId.osnum,
				objid		= hdrId.objid,
				p_chanselect	= &toRowsChan,
				index		= i,
				objidaddr	= &rowObj.objid,
				osnumaddr	= &rowObj.osnum );

        if( !(status & 1) )
        {
            status = OM_S_SUCCESS;
            break;
        }

        status =
        _VD_SEND_OBJN( rowObj, VDdrwTblRow.VDgetRowNumber( 	msg, 
								&curRowNo ) );
        CheckRC( status, *msg );
	__DBGpr_int( "Current row number", curRowNo );
    
        /* 
         * check if within range
	 * 	update row number and move row object 
         */

        if( curRowNo >= fromRowNo && curRowNo <= toRowNo )
        {
            status =
            _VD_SEND_OBJN( rowObj, VDdrwTblRow.VDputRowNumber( 	
							msg, 
							curRowNo+stepSize) );
            CheckRC( status, *msg );
		
            status =
            _VD_SEND_OBJN( rowObj, VDdrwTblRow.VDmoveRow( 	msg, 
								&matType,
								tMatrix ) );
            CheckRC( status, *msg );
        }
    }
		
    /* get current module environment : for GRxform */

    status =
    gr$get_module_env(  msg     = msg,
                        sizbuf  = &size,
                        buffer  = &mod_env );
    CheckRC( status, *msg );

    /* 
     * move the header if specified 
     *		get the feet for header 
     *		send GRxform message to the GRowner which will pass the
     *		message to the individual components.
     */

    if( !moveHdrFlag )
        goto MOVE_TRAILER;

    status =
    _VD_SEND_OBJN( hdrId, NDmacro.ACreturn_foot(msg,
                                                "header",
                                                &headerOwner,
                                                NULL, NULL ) );
    __CheckRC( status, *msg, "NDmacro.ACreturn_foot", MOVE_TRAILER );

    if( headerOwner.objid == NULL_OBJID )
    {
        __DBGpr_com( "header does not exist" );
        goto MOVE_TRAILER;
    }

    __DBGpr_obj( "\n\tHeader owner id", headerOwner );

    /* transform the foot */

    status =
    _VD_SEND_OBJN( headerOwner, GRgraphics.GRxform(    	msg,
                                                        &mod_env,
                                                        &matType,
                                                        tMatrix,
                                                        &newObjid ) );
    __CheckRC( status, *msg, "GRgraphics.GRxform", MOVE_TRAILER );


MOVE_TRAILER :
    /* 
     * move the trailer if specified 
     *		get the feet for trailer 
     *		send GRxform message to the GRowner which will pass the
     *		message to the individual components.
     */

    if( !moveTrlFlag )
        goto MOVE_MISC;

    status =
    _VD_SEND_OBJN( hdrId, NDmacro.ACreturn_foot(msg,
						"trailer",
						&trailerOwner,
						NULL, NULL ) );
    __CheckRC( status, *msg, "NDmacro.ACreturn_foot", MOVE_MISC );

    if( trailerOwner.objid == NULL_OBJID )
    {
        __DBGpr_com( "trailer does not exist" );
        goto MOVE_MISC;
    }

    status = 
    _VD_SEND_OBJN( trailerOwner, GRgraphics.GRxform(	msg,
							&mod_env,
							&matType,
							tMatrix,
							&newObjid ) );
    CheckRC( status, *msg );

MOVE_MISC :

    if( !moveMiscFlag )
	goto wrapup;

wrapup :

    /* 
     * status could fail when trying to return a non-existing
     * foot like trailer.  Must not return error message for that 
     * Moving of rows does not seem critical, so always return OM_S_SUCCESS
     */
    End
    *msg = MSSUCC;
    return OM_S_SUCCESS;
}

end implementation Root;
