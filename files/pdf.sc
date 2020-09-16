/*
+ ----------------------------------------------------------------------------+
|     e107 website system
|
|     Copyright (C) 2001-2002 Steve Dunstan (jalist@e107.org)
|     Copyright (C) 2008-2010 e107 Inc (e107.org)
|
|
|     Released under the terms and conditions of the
|     GNU General Public License (http://gnu.org).
|
|     $URL: https://e107.svn.sourceforge.net/svnroot/e107/trunk/e107_0.7/e107_plugins/pdf/pdf.sc $
|     $Revision: 12289 $
|     $Id: pdf.sc 12289 2011-06-29 01:07:28Z e107coders $
|     $Author: e107coders $
+----------------------------------------------------------------------------+
*/

if (defined("ICONPRINTPDF") && file_exists(THEME."images/".ICONPRINTPDF)) 
{
	$icon = THEME_ABS."images/".ICONPRINTPDF;
}
else
{
	$icon = e_PLUGIN_ABS."pdf/images/pdf_16.png";
}
$parms = explode("^",$parm);

//core		//return "<a href='".e_BASE."pdf.php?{$parms[1]}'><img src='".$icon."' style='border:0' alt='{$parms[0]}' title='{$parms[0]}' /></a>";
//plugin	//return "<a href='".e_PLUGIN."pdf/pdf.php?{$parms[1]}'><img src='".$icon."' style='border:0' alt='{$parms[0]}' title='{$parms[0]}' /></a>";

return " <a href='".e_PLUGIN_ABS."pdf/pdf.php?{$parms[1]}'><img src='".$icon."' style='border:0' alt='{$parms[0]}' title='{$parms[0]}' /></a>";
