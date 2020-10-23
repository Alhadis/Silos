// gc_check_item
/*
    This script checks to see if the PC has an item in their inventory
        sItem   = The tag name you want to check to see if the PC has
        bCheckParty = TRUE if you want to check the entire party for possession of the item
*/
// FAB 10/5
// EPF 3/13/06 -- second parameter now used to check and see if the item is held by anyone in the party
//				  also checks the PC Speaker instead of the first PC if bCheckParty is FALSE.

int StartingConditional()
{

    object otarget = GetPCSpeaker();
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_winterwolf"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_swpltlynx"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_owlbear"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_leucrotta"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_dweasel"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_displacer"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_gorgon"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_timberwolf"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"003_it_harvest_jaguarpelt"))) return TRUE;
	if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"it_plot_hide_bear_dire"))) return TRUE;
  
   // return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),sItem));
    
    return FALSE;

}