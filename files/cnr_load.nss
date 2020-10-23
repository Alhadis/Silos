#include "nbde_inc"
#include "cnr_recipe_utils"
void main()
{
object oPC = GetEnteringObject();
// retrieve skill xp values from database
int iSmelt=NBDE_GetCampaignInt("cnr_data", "cnr_Smelt", oPC); // Smelting
int iWeap=NBDE_GetCampaignInt("cnr_data", "cnr_Weap", oPC);  // Weapon Crafting
int iArm=NBDE_GetCampaignInt("cnr_data", "cnr_Arm", oPC); // Armor Crafting
int iAlch=NBDE_GetCampaignInt("cnr_data", "cnr_Alch", oPC); // Alchemy
int iScrib=NBDE_GetCampaignInt("cnr_data", "cnr_Scrib", oPC); // Scribing
int iTink=NBDE_GetCampaignInt("cnr_data", "cnr_Tink", oPC); // Tinkering
int iWood=NBDE_GetCampaignInt("cnr_data", "cnr_Wood", oPC); // Wood Crafting
int iEnch=NBDE_GetCampaignInt("cnr_data", "cnr_Ench", oPC); // Enchanting
int iGem=NBDE_GetCampaignInt("cnr_data", "cnr_Gem", oPC); // Gem Crafting
int iTail=NBDE_GetCampaignInt("cnr_data", "cnr_Tail", oPC); //Tailoring
int iFood=NBDE_GetCampaignInt("cnr_data", "cnr_Food", oPC); // Food Crafting

//set skill xp values
CnrSetTradeskillXPByType(oPC, 1, iSmelt); // Smelting
CnrSetTradeskillXPByType(oPC, 2, iWeap); // Weapon Crafting
CnrSetTradeskillXPByType(oPC, 3, iArm); // Armor Crafting
CnrSetTradeskillXPByType(oPC, 4, iAlch);// Alchemy
CnrSetTradeskillXPByType(oPC, 5, iScrib); // Scribing
CnrSetTradeskillXPByType(oPC, 6, iTink); // Tinkering
CnrSetTradeskillXPByType(oPC, 7, iWood); // Wood Crafting
CnrSetTradeskillXPByType(oPC, 8, iEnch); // Enchanting
CnrSetTradeskillXPByType(oPC, 9, iGem); // Gem Crafting
CnrSetTradeskillXPByType(oPC, 10, iTail);//Tailoring
CnrSetTradeskillXPByType(oPC, 11, iFood); // Food Crafting

 SendMessageToPC(oPC,"Your trade skill progress has been restored");

}
