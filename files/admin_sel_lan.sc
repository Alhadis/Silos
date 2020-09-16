// $Id: admin_sel_lan.sc 11836 2010-09-30 21:43:10Z e107coders $
//<? 
if (ADMIN && $pref['multilanguage'])
{
	$language = ($pref['sitelanguage'] == e_LANGUAGE) ? ADLAN_133 : e_LANGUAGE;
	return ' <strong>'.ADLAN_132.'</strong> '.$language;
}
