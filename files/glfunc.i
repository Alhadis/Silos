/*
 * $Id: glfunc.i,v 1.1 2005-09-18 22:07:42 dhmunro Exp $
 * This file connects yorick to the compiled functions in 
 * the OpenGL based 3D graphics package.
 */
/* Copyright (c) 2005, The Regents of the University of California.
 * All rights reserved.
 * This file is part of yorick (http://yorick.sourceforge.net).
 * Read the accompanying LICENSE file for details.
 */

/*
   Several naming conventions have been followed.
   Routines that are callable from the interpreter have names 
   that start with "ygl" and end in "3d". These routines 
   often have an interpreted wrapper routine that validates 
   arguments before calling the "ygl...3d" routine. If there is 
   both an interpreted wrapper and a compiled wrapper, the 
   name of the user callable function will normally be 
   "...3d" and the name of the interpreted routine wrapped 
   by codger will be "...raw3d".

   dlist3d.c contains the drawing routines that are called from
   the interpreter. These routines enter data into yorgl's
   display list (note - this is NOT an OpenGL display list).
   Each routine in dlist3d.c that is callable from the interpreter
   has a companion routine that is called when it is time to 
   render yorgl's display list. Most of these companion routines 
   extract variables from the display list and pass them on to
   routines in other files that actually call OpenGL. The names 
   of companion routines normally start "yglDraw" and end "3d".

   glfunc.c also has routines that are callable from the 
   interpreter. These routines do not draw anything, they 
   change lighting, other GL parameters, the viewpoint, etc.

   The routines that actually call OpenGL normally have names 
   similar to those callable from the interpreter but without 
   the trailing "3d".
*/

require, "cntrfunc.i";
if (!is_void(plug_in)) plug_in, "yorgl";

extern Draw3d;
/* DOCUMENT Draw3d
    Draw both 3D display lists, handling all preparation and clean-up.

   SEE ALSO:  ClearList3d, ClearDirectList3d, ClearCachedList3d
*/
/* PROTOTYPE
   void yglDrawCurr3d(void)
 */

extern ClearList3d;
/* DOCUMENT ClearList3d
    Clear both 3D display lists.

   SEE ALSO: DrawList3d, ClearDirectList3d, ClearCachedList3d
*/
/* PROTOTYPE
   void yglClearList3d(void)
 */

func GetBounds3d(void)
/* DOCUMENT GetBounds3d
    Compute the bounding box for all 3D objects.
    Function returns non-zero if there is at least one object.

   SEE ALSO: DrawList3d, ClearList3d, GetBoundsDirectList3d, GetBoundsCachedList3d
*/
{
  bnd= array(0.0, 2, 3);
  res= GetBounds_raw3d(bnd);
  if(res) return bnd;
  else return [];
}

extern GetBounds_raw3d;
/* PROTOTYPE
   long yglGetBounds3d(double array box)
 */

extern GetBoundsCachedList3d;
/* xxDOCUMENT GetBoundsCachedList3d
    Compute the bounding box for the 3D "cached" display list.
    Function returns non-zero if there was something in the list.

   SEE ALSO: DrawList3d, ClearList3d, ClearDirectList3d, GetBoundsDirectList3d
*/
/* PROTOTYPE
   long yglGetBoundsCachedList3d(double array box)
 */

extern GetBoundsDirectList3d;
/* xxDOCUMENT GetBoundsDirectList3d
    Compute the bounding box for the 3D "direct" display list.
    Function returns non-zero if there was something in the list.

   SEE ALSO: DrawList3d, ClearList3d, ClearDirectList3d, GetBoundsCachedList3d
*/
/* PROTOTYPE
   long yglGetBoundsDirectList3d(double array box)
 */

extern polys3d;
/* xxDOCUMENT polys3d(nx, ny, xyz, norm, color)
    Draw a list of polygons in 3D.

   SEE ALSO: 
*/
/* PROTOTYPE
   void yglPolys3d(long npolys, long array len, double array xyz, 
                   double array norm, double array colr, long edge, 
                   long smooth, long do_light)
 */

extern glyphs3d;
/* xxDOCUMENT glyphs3d(nglyph, xyz, scal, theta, phi, color)
    Draw a set of glyphs in 3D.

   SEE ALSO: points3d
*/
/* PROTOTYPE
   void yglGlyphs3d(long nglyph, double array origin, double array scal,
                     double array theta, double array phi, double array colr)
*/

extern cells3d;
/* xxDOCUMENT cells3d(nx, ny, xyz, norm, color, do_alpha)
    Draw a planar cell array in 3D.

   SEE ALSO: 
*/
/* PROTOTYPE
   void yglCells3d(long nx, long ny, double array corners,
                    double array norm, double array colr, long do_alpha)
*/

extern plm3d_raw;
/* xxDOCUMENT plm3d_raw(nx, ny, xyz, color)
    Draw a curvilinear "2D" mesh in 3D.

   SEE ALSO: 
*/
/* PROTOTYPE
   void yglPlm3d(long nx, long ny, double array xyz, double array colr)
*/

extern plf3d_raw;
/* xxDOCUMENT plf3d_raw(do_alpha, nx, ny, xyz, color)
    Fill a curvilinear "2D" mesh in 3D.

   SEE ALSO: 
*/
/* PROTOTYPE
   void yglPlf3d(long nx, long ny, double array xyz, double array colr)
*/

extern surf3d;
/* xxDOCUMENT surf3d(nx, ny, xyz, norm, color)
    Draw a surface in 3D.

   SEE ALSO: 
*/
/* PROTOTYPE
   void yglSurf3d(long do_alpha, long nx, long ny, double array xyz, 
                  double array norm, double array colr)
*/

extern colrsurf3d;
/* xxDOCUMENT colrsurf3d(nx, ny, xyz, norm, color)
    Draw a surface in 3D.

   SEE ALSO: 
*/
/* PROTOTYPE
   void yglColrsurf3d(long do_alpha, long nx, long ny, double array xyz, 
                      double array norm, double array colr)
*/

extern lines3d;
/* xxDOCUMENT lines3d(nvert, xyz, color)
    Draw a polyline in the current 3D window.
    Arguments are the number of vertices, an array of
    coordinate triples, and a single color triple.

   SEE ALSO: points3d
*/
/* PROTOTYPE
   void yglLines3d(long nvert, double array xyz, double array colr)
*/

extern points3d;
/* xxDOCUMENT points3d(nvert, xyz, color)
    Draw a set of points in the current 3D window.
    Arguments are the number of vertices, an array of
    coordinate triples, and a single color triple.

   SEE ALSO: lines3d, glyphs3d
*/
/* PROTOTYPE
   void yglPoints3d(long nvert, double array xyz, double array colr)
*/

extern tstrips3d;
/* xxDOCUMENT tstrips3d(nvert, xyz, color)
    Draw a set of triangle strips in 3D.

   SEE ALSO: qstrips3d, tarray3d, qarray3d
*/
/* PROTOTYPE
   void yglTstrips3d(long nstrips, long array len, double array xyz,
                  double array norm, double array colr, long edge,
                  long smooth, long do_light, long do_alpha)
*/

extern qstrips3d;
/* xxDOCUMENT qstrips3d(nvert, xyz, color)
    Draw a set of quadrilateral strips in 3D.

   SEE ALSO: tstrips3d, tarray3d, qarray3d
*/
/* PROTOTYPE
   void yglQstrips3d(long nstrips, long array len, double array xyz,
                  double array norm, double array colr, long edge,
                  long smooth, long do_light, long do_alpha)
*/

extern tstripsndx3d;
/* xxDOCUMENT tstripsndx3d(nstrips, numedg, ntri, len, ndx, xyz, 
                         norm, colr, edge, do_alpha;
    Draw a set of triangle strips in 3D.
    Coordinates and normals are accessed via an index array.

   SEE ALSO: tstrips3d, qstrips3d, tarray3d, qarray3d
*/
/* PROTOTYPE
   void yglTstripsndx3d(long nstrips, long numedg, long ntri,
                     long array len, long array ndx, double array xyz,
                     double array norm, double array colr, long edge, 
                     long do_alpha)
*/

extern tarray3d;
/* xxDOCUMENT tarray3d(nvert, xyz, color)
    Draw an array of triangles in the current 3D window.

   SEE ALSO: tstrips3d, qstrips3d, qarray3d
*/
/* PROTOTYPE
   void yglTarray3d(long ntri, double array xyz, double array norm, double array colr, 
                 long edge, long smooth, long do_light, long do_alpha,
                 long cpervrt, long cubemap, long emit)
*/

extern qarray3d;
/* xxDOCUMENT qarray3d(nquad, xyz, norm, colr, edge, cpervrt, smooth, do_light, 
                     do_alpha, cpervrt)
    Draw an array of quadrilaterals to the current 3D window.
*/
/* PROTOTYPE
   void yglQarray3d(long nquad, double array xyz, double array norm, double array colr, 
                  long edge, long smooth, long do_light, long do_alpha,
                  long cpervrt)
 */

extern tivarray3d;
/* xxDOCUMENT tivarray3d(ntri, nvert, ptndx, xyz, norm, color)
    Draw an array of triangles in 3D.
    Triangles are specified using indices into arrays of
    points and normals. One RGBA color is used for all triangles.

   SEE ALSO: tstrips3d, qstrips3d, tarray3d, qarray3d
*/
/* PROTOTYPE
   void yglTivarray3d(long ntri, long nvert, long array ptndx, double array xyz, 
                   double array norm, double array colr)
*/

extern tvarray3d;
/* xxDOCUMENT tvarray3d(ntri, nvert, do_alpha, ptndx, xyz, norm, color)
    Draw an array of triangles in 3D.
    Triangles are specified using indices into arrays of
    points and normals. One color for each triangle.

   SEE ALSO: tivarray3d, tstrips3d, qstrips3d, tarray3d, qarray3d
*/
/* PROTOTYPE
   void yglTvarray3d(long ntri, long nvert, long do_alpha, long cpervrt, long array ptndx, 
                     double array xyz, double array norm, double array colr)
*/

extern tex3d;
/* xxDOCUMENT tex3d(ds, origin, znsiz)
    Draw a volume visualization in 3D.

   SEE ALSO: texcell2d
*/
/* PROTOTYPE
   void yglTex3d(float ds, double array origin, double array boxsiz)
*/

extern texcell2d;
/* xxDOCUMENT texcell2d(nx, ny, nz, znsiz, texval)
    Draw a volume visualization in 3D.

   SEE ALSO: tex3d
*/
/* PROTOTYPE
   void yglTexcell2d(long nx, long ny, long nz, double array znsiz, char array texval)
*/

extern plpix3d;
/* xxDOCUMENT plpix3d(pix)
    Draw an array of pixels in an OpenGL window.
    Each pixel contains one RGB triple.
    The data type of pix is character.

   SEE ALSO: clear3
*/
/* PROTOTYPE
   void yglPlpix3d(long nx, long ny, char array pix)
*/

func _event_handler
/* Redraw the screen using the new coordinate transform.
 */
{
  draw3_trigger;
  draw3,1;
}

func _toggle_handler
/* the navigation sphere has been toggled on or off.
   force a redraw.
 */
{
  draw3_trigger;
  draw3,1;
}

GL_NDEVS= 7;

func win3d(num, width, height)
/* DOCUMENT win3d(num, width, height)
    Create OpenGL output window number num.
    Window will have specified width and height (in pixels).
*/
{
  if(is_void(num)) num= 0;
  ASSERT, (num >= 0 && num <= GL_NDEVS), "3D window number must be 0 through 7.";
  if(is_void(width)) width= 500;
  if(is_void(height)) height= 500;
  err= win3d_raw(num, width, height);
  if(!err) return;
  ASSERT, (err != 1), "REBUILD Yorick - compiled and interpreted code disagree on maximum window number";
  ASSERT, (err != 2), "failed to create 3D window - should not happen";
}

extern win3d_raw;
/* PROTOTYPE
   int yglWin3d(int num, int w, int h)
 */

extern get_currwin3d;
/* DOCUMENT get_currwin3d()
	Return the number of the current 3D window.
*/
/* PROTOTYPE
   int yglCurrWin3d(void)
 */

func winkill3d(num)
/* DOCUMENT winkill3d(num)
    Close OpenGL output window number num.
*/
{
  if(is_void(num)) {
    num= get_currwin3d();
  }
  ASSERT, (num >= 0 && num <= GL_NDEVS), "window number must be 0 through 7.";
  err= winkill3d_raw(num);
  if(!err) return;
  ASSERT, (err != 1), "REBUILD Yorick - compiled and interpreted code disagree on maximum window number";
  ASSERT, (err != 2), "Cannot close a non-existent 3D window";
}

extern winkill3d_raw;
/* PROTOTYPE
   int yglWinKill3d(int num)
 */

extern grabpix3d;
/* xxDOCUMENT grabpix3d(void)
    Read pixels from the curent 3D window.
	Always starts from the (1,1) pixel in the window.
*/
/* PROTOTYPE
   void yglGetPixels(long nx, long ny, char array pix);
*/

extern drawpix3d;
/* xxDOCUMENT drawpix3d(void)
    send pixels to the current 3D window.
*/
/* PROTOTYPE
   void yglPutPixels(long nx, long ny, char array pix)
*/

extern mousefunc3d;
/* DOCUMENT mousefunc3d(val)
    controls the efect of mouse motion in an OpenGL window.
    val==1 means rotate, val==2 means zoom, and val==3 means pan.
*/
/* PROTOTYPE
   void yglMouseFunc3d(long val)
*/

extern get_width3d;
/* DOCUMENT get_width3d(void)
    return the width of the current OpenGL window in pixels.
*/
/* PROTOTYPE
   long yglGetWidth3d(void)
*/

extern get_hite3d;
/* DOCUMENT get_hite3d(void)
    return the height of the current OpenGL window in pixels.
*/
/* PROTOTYPE
   long yglGetHite3d(void)
*/

extern always_show_obj3d;
/* DOCUMENT gl_always_show_obj(flag)
    Draw objects while rotating if flag is non-zero.
*/
/* PROTOTYPE
   void yglAlwaysShowObj3d(long flag)
*/

extern use_list3d;
/* DOCUMENT use_list3d(flag)
    Use an OpenGL display list if flag is non-zero.
*/
/* PROTOTYPE
   void yglUseList3d(long flag)
*/

extern use_array3d;
/* DOCUMENT use_array3d(flag)
    Use OpenGL arrays if flag is non-zero.
*/
/* PROTOTYPE
   void yglUseArray3d(long flag)
*/

extern lookat_raw3d;
/* xxDOCUMENT lookat_raw3d(eye, center, up)
    OpenGL utility routine to set view parameters.
	Users should call lookat3d() instead.
*/
/* PROTOTYPE
   void yglLookat3d(double array eye, double array center, double array up)
*/

extern getbackrgb_raw3d;
/* xxDOCUMENT getbackrgb_raw3d(rgb)
    Returns the RGB background color of the OpenGL window 
    Normally the user calls gl_getback_rgb3d(), which 
    allocates room for the result.
    See also: back_rgb3d, back_rgba3d
*/
/* PROTOTYPE
   void yglGetBackRGB3d(double array rgb)
*/

extern back_rgb3d;
/* xxDOCUMENT back_rgb3d(rgb)
    OpenGL utility routine to set the red, green, and blue
    component of the background color (range zero to one).
    See also: getback_rgb3d, back_rgba3d
*/
/* PROTOTYPE
   void yglBackRGB3d(double array rgb)
*/

extern back_rgba3d;
/* xxDOCUMENT back_rgba3d(rgba)
    OpenGL utility routine to set the red, green, blue, and
	"opacity" component of the background color (range zero to one).
	See also: getback_rgb3d, back_rgb3d
*/
/* PROTOTYPE
   void yglBackRGBA3d(double array rgb)
*/

extern cage_style3d;
/* DOCUMENT cage_style3d(style)
    If style is zero, the limits for the "cage" surrounding the
    "interesting" data volume will be the bounds of all
    objects in the scene.
    See also: cage_limits3d, getcage_limits3d
*/
/* PROTOTYPE
   void yglCageStyle3d(long style)
*/

extern cage_limits3d;
/* xxDOCUMENT cage_limits3d(lims)
    Set the limits for the "cage" surrounding the "interesting" 
    data volume. lims=[xmin,xmax,ymin,ymax,zmin,zmax].
    See also: cage_style3d, getcage_limits3d
*/
/* PROTOTYPE
   void yglCageLimits3d(double array lims)
*/

extern getcage_limits3d;
/* xxDOCUMENT getcage_limits3d()
    Returns the limits for the "cage" surrounding
    the "interesting" data volume.
    See also: cage_style3d, cage_limits3d
*/
/* PROTOTYPE
   void yglGetCageLimits3d(double array lims)
*/

extern gl_getcagergb_raw;
/* xxDOCUMENT gl_getcagergb_raw(rgb)
    Returns the RGB color of the "cage" (backdrop) 
    Normally the user calls gl_getcage_rgb(), which 
    allocates room for the result.
    See also: gl_cage_rgb, gl_cage_rgba
*/
/* PROTOTYPE
   void yglGetCageRGB3d(double array rgb)
*/

extern cage_rgb3d;
/* xxDOCUMENT cage_rgb3d(rgb)
    OpenGL utility routine to set the red, green, and blue
    component of the "cage" (range zero to one).
    See also: getcage_rgb3d, cage_rgba3d
*/
/* PROTOTYPE
   void yglCageRGB3d(double array rgb)
*/

extern cage_rgba3d;
/* xxDOCUMENT cage_rgba3d(rgba)
    OpenGL utility routine to set the red, green, blue, and
	"opacity" component of the "cage" (range zero to one).
	See also: getcage_rgb3d, cage_rgb3d
*/
/* PROTOTYPE
   void yglCageRGBA3d(double array rgb)
*/

extern getgridrgb_raw3d;
/* xxDOCUMENT getgridrgb_raw3d(rgb)
    Returns the RGB color of the "grid" (backdrop) 
    Normally the user calls getgrid_rgb3d(), which 
    allocates room for the result.
    See also: grid_rgb3d, grid_rgba3d
*/
/* PROTOTYPE
   void yglGetGridRGB3d(double array rgb)
*/

extern grid_rgb3d;
/* xxDOCUMENT grid_rgb3d(rgb)
    OpenGL utility routine to set the red, green, and blue
    component of the "grid" (range zero to one).
    See also: getgrid_rgb3d, grid_rgba3d
*/
/* PROTOTYPE
   void yglGridRGB3d(double array rgb)
*/

extern grid_rgba3d;
/* xxDOCUMENT grid_rgba3d(rgba)
    OpenGL utility routine to set the red, green, blue, and
	"opacity" component of the "grid" (range zero to one).
	See also: getgrid_rgb3d, grid_rgb3d
*/
/* PROTOTYPE
   void yglGridRGBA3d(double array rgb)
*/

extern yglMap2ColorRaw3d;
/* xxDOCUMENT yglMap2ColorRaw3d(ncolr, red, green, blue, 
              vmin, vmax, var, colr)
    Map indexed data values into RGB colors.
    Normally used with slicing planes or iso-surfaces.
*/
/* PROTOTYPE
   void yglMap2ColorRaw3d(long ncolr, char array red, char array green, 
        char array blue, double vmin, double vmax, double array var,
		long ntri, long array cellids, float array colr)
 */

extern get_center3d;
/* xxDOCUMENT get_center3d(center)
    Return the current "center of attention" for lookat.
*/
/* PROTOTYPE
   void yglGetCenter3d(double array center)
 */

extern get_eye3d;
/* xxDOCUMENT get_eye3d(eye)
    Return the current "viewer location" for lookat.
*/
/* PROTOTYPE
   void yglGetEye3d(double array eye)
 */

extern get_up3d;
/* xxDOCUMENT get_up3d(up)
    Return the current up vector for lookat.
*/
/* PROTOTYPE
   void yglGetUp3d(double array up)
 */

extern set_fov3d;
/* DOCUMENT set_fov3d(fov)
    Set the field of view (in degrees) for the current 3D window.
*/
/* PROTOTYPE
   void yglSetFov3d(float fov)
 */

extern get_fov3d;
/* DOCUMENT get_fov3d
    Returns the field of view (in degrees) for the current 3D window.
*/
/* PROTOTYPE
   float yglGetFov3d(void)
 */

extern getGLvers;
/* DOCUMENT getGLvers
    Get the version number for OpenGL.
*/
/* PROTOTYPE
   float yglGetVers3d(void)
 */

extern preptex3d;
/* DOCUMENT preptex3d(void)
    prepare an OpenGL state suitable for the use of 3D textures.
*/
/* PROTOTYPE
   void yglPrepTex3d(void)
 */

extern endtex3d;
/* DOCUMENT endtex3d(void)
    finish using a 3D texture.
*/
/* PROTOTYPE
   void yglEndTex3d(void)
 */

extern ldtex3d;
/* xxDOCUMENT ldtex3d(nx, ny, nz, tex)
    set the 3D texture (used with all 3D windows).
*/
/* PROTOTYPE
   void yglLdTex3d(long nx, long ny, long nz, char array tex)
 */

extern texbox3d;
/* xxDOCUMENT texbox3d(ds, origin, deltas)
    Perform a volume visualization of a 3D "box" of data.
*/
/* PROTOTYPE
   int yglTex3dbox(double ds, double array origin, double array deltas)
 */

extern has_tex3d;
/* DOCUMENT has_tex3d()
    result is non-zero if 3D textures are supported.
*/
/* PROTOTYPE
   int yglHasTex3d(void)
 */

extern has_texcube3d;
/* DOCUMENT has_texcube3d()
    result is non-zero if cube map textures are supported.
*/
/* PROTOTYPE
   int yglHasTexcube3d(void)
 */

extern line_width3d;
/* DOCUMENT line_width3d(void)
    Set the width in pixels for a polyline in OpenGL.
*/
/* PROTOTYPE
   void yglLineWidth(double width)
 */

extern msmov_val3d;
/* DOCUMENT msmov_val3d(void)
    set the number of pixels the mouse must move before
    the model should be rotated.
*/
/* PROTOTYPE
   void yglMsmovVal3d(double val)
 */

extern set_light3d;
/* xxDOCUMENT set_light3d(void)
    set values describing the light sources used by OpenGL.
*/
/* PROTOTYPE
   void yglSetLight3d(double ambient, double diffuse, double specular, 
                      double spower, double array sdir)
 */


extern out_ccw3d;
/* DOCUMENT out_ccw3d(dir_flag)
    set the direction (zero for clockwise, else CCW) for the
    front face of polygons.
*/
/* PROTOTYPE
   void yglFrontFace3d(long dir)
 */

extern update_list3d;
/* DOCUMENT update_list3d(void)
    update an existing OpenGL display list.
*/
/* PROTOTYPE
   int yglUpdateList3d(void)
 */

extern inc_seq3d;
/* DOCUMENT inc_seq3d(void)
    increment the OpenGL sequence number. Not a user routine.
*/
/* PROTOTYPE
   void yglIncSeq3d(void)
 */

extern arrlim3d;
/* xxDOCUMENT  arrlim3d(nverts, arr, lims)
    compute the limits in x, y, and z for a regular 3D grid.
*/
/* PROTOTYPE
   int yglArrlim3d(long nverts, double array arr, double array lims)
 */

func arsum(nsx, nsy, nsz, vin)
{
  dms= dimsof(vin);
  ASSERT, (dms(1) == 3), "arsum only works for 3D arrays";
  nx0= dms(2);  ny0= dms(3);  nz0= dms(4);
  vout= array(0.0, nx0/nsx, ny0/nsy, nz0/nsz);
  gl_arsum, nx0, ny0, nz0, nsx, nsy, nsz, vin, vout;
  return vout;
}

extern arsum3d;
/* xxDOCUMENT  arsum3d(nx0, ny0, nz0, nsx, nsy, nsz, vin, vout)
    This function sums nsx-by-nsy-by-nsz zone chunks of vin and
    store the result in vout. vin is nx0-by-ny0-by-nz0.
    Users normally call arsum, not gl_arsum.

   SEE ALSO: arsum
*/
/* PROTOTYPE
   void yglArsum3d(long nx0, long ny0, long nz0, long nsx, long nsy, long nsz, 
              double array vin, double array vout)
 */

extern SizeTriArraysNdx3d;
/* xxDOCUMENT  SizeTriArraysNdx3d(tris)
    This function counts the number of triangles in a list of triangle arrays.
    oldtri and newtri must be a pointer to a TriVertexGrp.

   SEE ALSO: pl3dtrilists, SizeTriArraysNdx, CollapseTriArraysNdx, CopyTriArrayNdx, DoSortTriNdx
*/
/* PROTOTYPE
   long yglSizeTriArraysNdx3d(pointer tris)
 */

extern CopyTriArrayNdx3d;
/* xxDOCUMENT  CopyTriArrayNdx3d(oldtris, newtris)
    This function copies a triangle array into another 
    triangle array.
    WARNING!!! it does not copy coolors!!!!!.
    oldtri and newtri must be a pointer to a TriVertexGrp.

   SEE ALSO: pl3dtrilists, SizeTriArraysNdx, CollapseTriArraysNdx, CopyTriArrayNdx, DoSortTriNdx
*/
/* PROTOTYPE
   void yglCopyTriArrayNdx3d(pointer oldtris, pointer newtris)
 */

extern CollapseTriArraysNdx3d;
/* xxDOCUMENT  CollapseTriArraysNdx3d(colrtyp, oldtris, newtris)
    This function merges a list of triangle arrays into a 
    single triangle array.
    abs(colrtyp) is 3 for RGB colors and 4 for RGBA.
    if colrtyp<0, the input list has scalar colors.
    oldtri and newtri must be a pointer to a TriVertexGrp.

   SEE ALSO: pl3dtrilists, SizeTriArraysNdx, CollapseTriArraysNdx, CopyTriArrayNdx, DoSortTriNdx
*/
/* PROTOTYPE
   void yglCollapseTriArraysNdx3d(long colrtyp, pointer oldtris, pointer newtris)
 */

extern DoSortTriNdx3d;
/* xxDOCUMENT  DoSortTriNdx3d(tris, newptndx)
    This function performs a depth sort of a triangle
    array. It uses the current viewpoint.
    The CALLER is responsible for inserting the new point indices
    into the triangle array (because the input tri array uses
    indices into coord, normal, etc. arrays, only the indices must be changed).
    The resulting triangle array should display correctly
    with translucency when viewed with this viewing transform.
    Rotating the scene may lead to incorrect results
    if the triangles are translucent.
    tris must be a pointer to a TriVertexGrp.
    newptndx must be a long array of length at least 3*ntri.

   SEE ALSO: pl3dtrilists, SizeTriArraysNdx, CollapseTriArraysNdx, CopyTriArrayNdx, DoSortTriNdx
*/
/* PROTOTYPE
   void yglDoSortTriNdx3d(pointer tris, long array newptndx)
 */

extern SizeTriArrays3d;
/* xxDOCUMENT  SizeTriArrays3d(pointer tris)
    This function counts the number of triangles in a list of triangle arrays.
    tris must be a pointer to a TriArrayGrp.

   SEE ALSO: pl3dtrilists, SizeTriArrays, CollapseTriArrays, CopyTriArray, DoSortTri
*/
/* PROTOTYPE
   long yglSizeTriArrays3d(pointer tris)
 */

extern CopyTriArray3d;
/* xxDOCUMENT  CopyTriArray3d(long numtri, pointer oldtri, pointer newtri)
    This function copies a triangle array into another 
    triangle array.
    WARNING!!! it does not copy coolors!!!!!.
    oldtri and newtri must be a pointer to a TriArrayGrp.

   SEE ALSO: pl3dtrilists, SizeTriArrays, CollapseTriArrays, CopyTriArray, DoSortTri
*/
/* PROTOTYPE
   void yglCopyTriArray3d(long numtri, pointer oldtri, pointer newtri)
 */

extern CollapseTriArrays3d;
/* xxDOCUMENT  CollapseTriArrays3d(long colrtyp, pointer oldtri, pointer newtri)
    This function merges a list of triangle arrays into a 
    single triangle array.
    abs(colrtyp) is 3 for RGB colors and 4 for RGBA.
    if colrtyp<0, the input list has scalar colors.
    oldtri and newtri must be a pointer to a TriArrayGrp.

   SEE ALSO: pl3dtrilists, SizeTriArrays, CollapseTriArrays, CopyTriArray, DoSortTri
*/
/* PROTOTYPE
   void yglCollapseTriArrays3d(long colrtyp, pointer oldtri, pointer newtri)
 */

extern DoSortTri3d;
/* xxDOCUMENT  DoSortTri3d(long colrtyp, pointer oldtri, pointer newtri)
    This function performs a depth sort of a triangle
    array. It uses the current viewpoint.
    The resulting triangle array should display correctly
    with translucency when viewed with this viewing transform.
    Rotating the scene may lead to incorrect results
    if the triangles are translucent.
    colrtyp is 3 for RGB colors and 4 for RGBA.
    There MUST be one color for every triangle vertex.
    oldtri and newtri must be a pointer to a TriArrayGrp.

   SEE ALSO: pl3dtrilists, SizeTriArrays, CollapseTriArrays, CopyTriArray, DoSortTri
*/
/* PROTOTYPE
   void yglDoSortTri3d(long colrtyp, pointer oldtri, pointer newtri)
 */

extern SliceTris3d;
/* xxDOCUMENT  SliceTris3d(keep, nkeep, dp, oldtri, newtri)
    This function clips triangles against a plane using nkeep,
    the number of vertices from each input triangle that are "above"
    the slicing plane, keep (above the plane for a specific vertex),
    and dp (the distance to the plane for each vertex). 
    A user ordinarily calls slice2, not this function.
*/
/* PROTOTYPE
   void yglSliceTris3d(long array keep, long array nkeep, double array dp, 
                       pointer oldtri, pointer newtri)
 */

extern ygl_fpemask;
/* DOCUMENT ygl_fpemask, -1
 *   resets the SIGFPE mask to yorick's normal state, permitting SIGFPE.
 *   Before calling any OpenGL function, the SIGFPE mask is reset to the
 *   default setting for the platform, usually disabling SIGFPE signals.
 *   If the OpenGL function is asynchronously interrupted, the SIGFPE
 *   mask may not be reset.  This function enables you to restore the
 *   normal yorick floating point environment should this occur.  You
 *   never need to call this in a functioning program.
 */
/* PROTOTYPE
   void ygl_fpemask(int on)
 */
