/*

  Copyright (C) 2000, 2001 Silicon Graphics, Inc.  All Rights Reserved.

  This program is free software; you can redistribute it and/or modify it
  under the terms of version 2 of the GNU General Public License as
  published by the Free Software Foundation.

  This program is distributed in the hope that it would be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  

  Further, this software is distributed without any warranty that it is
  free of the rightful claim of any third person regarding infringement 
  or the like.  Any license provided herein, whether implied or 
  otherwise, applies only to this software file.  Patent licenses, if 
  any, provided herein do not apply to combinations of this program with 
  other software, or any other product whatsoever.  

  You should have received a copy of the GNU General Public License along
  with this program; if not, write the Free Software Foundation, Inc., 59
  Temple Place - Suite 330, Boston MA 02111-1307, USA.

  Contact information:  Silicon Graphics, Inc., 1600 Amphitheatre Pky,
  Mountain View, CA 94043, or:

  http://www.sgi.com

  For further information regarding this notice, see:

  http://oss.sgi.com/projects/GenInfo/NoticeExplan

*/


//-*-c++-*-
/**
*** 
*** Revision history:
***
***     21-OCT-94 dkchen - Original Version
***     10-NOV-94 dkchen - Make DIRECTED_GRAPH16 a template class and move
***                        it to graph_template.h.
***
*** Description:
*** 
***     This interface describes vertex and edge classes used in a directed
***     graph class. See "graph_template.h" for details on the directed
***     graph class, DIRECTED_GRAPH16, which assumes the edges and
***     vertices to be derived classes from EDGE16 and VERTEX16 described
***     here.
*** 
*** Exported Types and Functions:
***
***     VINDEX16
***     EINDEX16
***
***         Type of a index to a vertex/edge in the graph
*** 
**/

#ifndef cxx_graph_i_INCLUDED
#define cxx_graph_i_INCLUDED "cxx_graph.i"

#ifdef _KEEP_RCS_ID
#endif /* _KEEP_RCS_ID */

#ifndef defs_INCLUDED
#include "defs.h"
#endif

typedef mUINT16 VINDEX16;
typedef mUINT16 EINDEX16;

extern const VINDEX16 INVALID_VINDEX16;
extern VINDEX16 GRAPH16_CAPACITY;

#endif		// cxx_graph_i_INCLUDED

