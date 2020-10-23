#include "x0_i0_henchman"
void main()
{
object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;
StoreCampaignHenchman(oPC);
}
