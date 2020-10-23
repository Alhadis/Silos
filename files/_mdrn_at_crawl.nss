// Start/Stop Crawling

#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    int nPheno = GetPhenoType(oPC);
    if (nPheno==5)
    {
        SetPhenoType(GetLocalInt(oPC, "nMdrnPhenoSize"), oPC);
        effect eCrawl = GetFirstEffect(oPC);
        while (GetIsEffectValid(eCrawl))
        {
            if (GetEffectType(eCrawl)==EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
                RemoveEffect(oPC, eCrawl);

            eCrawl = GetNextEffect(oPC);
        }

    }
    else if (nPheno == PHENOTYPE_BIG || nPheno == PHENOTYPE_NORMAL)
    {
        SetLocalInt(oPC, "nMdrnPhenoSize", nPheno);
        ExecuteScript("_mdrn_exe_crawl", oPC);
        SetPhenoType(5, oPC);

    }
}
