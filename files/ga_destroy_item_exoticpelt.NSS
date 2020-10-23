// ga_destroy_item
/*
    This takes an item from a player
        sItemTag    = This is the string name of the item's tag
        nQuantity   = The number of items to destroy. -1 is all of the Player's items of that tag.
        nPCFaction  = Take from the whole PC faction
*/
// FAB 9/30
// DBR 8/10/6

#include "nw_i0_plot"
#include "acr_xp_i"

#define CR_XP_SCALE 1.0f

int Ggold = 0;

void DestroyItems(object oTarget,string sItem,int nNumItems,int gold,int xp)
{
    int nCount = 0;
    int Gxp = 0;
    float cr = 0.0f;
    object oItem = GetFirstItemInInventory(oTarget);

    cr = xp/CR_XP_SCALE;

    while (GetIsObjectValid(oItem) == TRUE && nCount < nNumItems)
    {
        if (GetTag(oItem) == sItem)
        {
			int nStack = GetItemStackSize(oItem);	
			DestroyObject(oItem,0.0f);
			Gxp += xp * nStack;
			Ggold += gold * nStack;
        	nCount++;
        }
        oItem = GetNextItemInInventory(oTarget);
    }

    ACR_AwardStaticQuestXP(oTarget,"Collected: ExoticPelts "+sItem, Gxp, cr); 
}


void main(string sItemTag)
{
    int nTotalItem;
    object oPC = GetPCSpeaker();
    object oItem;       // Items in inventory


	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_winterwolf" ));
    DestroyItems( oPC,"it_plot_hide_winterwolf",nTotalItem,50,50 );

	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_swpltlynx" ));
    DestroyItems( oPC,"it_plot_hide_swpltlynx",nTotalItem,20,20 );
	
	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_owlbear" ));
    DestroyItems( oPC,"it_plot_hide_owlbear",nTotalItem,75,75 );
			
	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_leucrotta" ));
    DestroyItems( oPC,"it_plot_hide_leucrotta",nTotalItem,50,50 );
	
    nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_dweasel" ));
    DestroyItems( oPC,"it_plot_hide_dweasel",nTotalItem,25,20 );	
	
	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_displacer" ));
    DestroyItems( oPC,"it_plot_hide_displacer",nTotalItem,30,75 );	
	
	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_gorgon" ));
    DestroyItems( oPC,"it_plot_hide_gorgon",nTotalItem,50,40 );
	
	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_timberwolf" ));
    DestroyItems( oPC,"it_plot_hide_timberwolf",nTotalItem,1,1 );
	
	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"003_it_harvest_jaguarpelt" ));
    DestroyItems( oPC,"003_it_harvest_jaguarpelt",nTotalItem,20,20 );	
	
	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_bear_dire" ));
    DestroyItems( oPC,"it_plot_hide_bear_dire",nTotalItem,50,50 );	
	
//	nTotalItem = GetNumStackedItems(GetItemPossessedBy( oPC,"it_plot_hide_wolverine" ));
   // DestroyItems( oPC,"it_plot_hide_wolverine",nTotalItem,3,2 );	
	
	GiveGoldToCreature(oPC,Ggold);
}