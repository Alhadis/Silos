#include "dcs_inc_main"

/*
    Handwerksvorlage
    Beruf: xxx
    Stufe: xx
    Rang:  xx
    Spezialisierung: xxxxx

    Handwerksdetails:
    · Anzahl:   xx
    · SG:       xx
    · Kritisch: xx

    · Material:
       · MatA x00
       · MatB x00
       · MatC x00

    string sRecipeCrit = DCS_GetRecipeEntry(DCS_COL_RECIPE_CRITICAL, RecipeID);

    string sDC     = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, RecipeID) > 0 ? "· SG:       "+ColorText(inStr(DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, RecipeID)), nwcYellow)+nwCrLf : "";
    string sAmount = "· Anzahl:   "+ColorText(inStr(DCS_GetRecipeEntryInt(DCS_COL_RECIPE_AMOUNT, RecipeID)), nwcYellow);
    string sCrit   = (sRecipeCrit == ? "" : "· Kritisch: "+(stInt(sRecipeCrit) == 0 ? ColorText(DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeCrit), nwcYellow)+nwCrLf : ColorText("+"+sRecipeCrit+(stInt(sRecipeCrit) == 1 ? " Gegenstand" : " Gegenstände"), nwcYellow)+nwCrLf));

*/
/*
     for(iCount=1; iCount <= iSize; iCount++)
        {
            iSizeAlt = DCS_ArrayGetInt(sID, "size", 1, 1, "alt"+inStr(iCount));
            //AdvDebug(oPC, "iSizeAlt: "+inStr(iSizeAlt));

            // Alternative way for single resources having multple choices (ResC and (ResD or ResE))
            if(iSizeAlt)
            {
                int iCountAlt;
                for(iCountAlt=1; iCountAlt <= iSizeAlt; iCountAlt++)
                {
                    iValue = DCS_ArrayGetInt(sID, "value", iCountAlt, 1, "alt"+inStr(iCount));
                    sResource = DCS_ArrayGetString(sID, "resource", iCountAlt, 1, "alt"+inStr(iCount));
                    sResourceDisplay += DCS_ResourceNeeded(sResource, iValue * iObjects);

                    //AdvDebug(oPC, "sResource: "+sResource+", iValue: "+inStr(iValue));

                    if(iCountAlt+1 <= iSizeAlt)
                    sResourceDisplay += ColorText(" oder ", nwcOrange);
                }
                sResourceDisplay += nwCrLf;
            }
            // Default way from DCS_HasRecipeResources()
            else
            {
                iValue = DCS_ArrayGetInt(sID, "value", iCount, 1);
                sResource = DCS_ArrayGetString(sID, "resource", iCount, 1);
                sResourceDisplay += DCS_ResourceNeeded(sResource, iValue * iObjects)+nwCrLf;
            }

*/

string GetResourcesNeeded(string sRecipeID)
{
    int iSize = DCS_ArrayGetInt(sRecipeID, "size");
    int iCount, iValue;
    string sNeed, sResource;

    for(iCount=1; iCount <= iSize; iCount++)
    {
        // There are multiple/alternative resources, so loop through those first
        int iSizeAlt = DCS_ArrayGetInt(sRecipeID, "size", 1, 1, "alt"+inStr(iCount));
        if(iSizeAlt)
        {
            //iUsedAlt++;

            // id, subarray, value (iCountMRes), dimension (1), alt+(iCountRes)
            int iCountAlt;
            for(iCountAlt=1; iCountAlt <= iSizeAlt; iCountAlt++)
            {
                // Go through all alternative resources and their values
                iValue = DCS_ArrayGetInt(sRecipeID, "value", iCountAlt, 1, "alt"+inStr(iCount)); //+inStr(iUsedAlt));
                sResource = DCS_ArrayGetString(sRecipeID, "resource", iCountAlt, 1, "alt"+inStr(iCount));

                sNeed += "   · "+DCS_ResourceNeeded(sResource, iValue);
                //sNeed += "   · "+DCS_ResourceNeeded(DCS_ArrayGetString(sRecipeID, "resource", iCountAlt, 1, "alt"+inStr(iUsedAlt)),DCS_ArrayGetInt(sRecipeID, "value", iCountAlt, 1,"alt"+inStr(iUsedAlt)));

                if(iCountAlt + 1 <= iSizeAlt)
                sNeed += ColorText(" oder ", nwcOrange);
            }
            sNeed += nwCrLf;
        }
        // Default way from DCS_HasRecipeResources()
        else
        {
            sNeed += "   · "+DCS_ResourceNeeded(DCS_ArrayGetString(sRecipeID, "resource", iCount, 1), DCS_ArrayGetInt(sRecipeID, "value", iCount, 1))+nwCrLf;
        }
    }

    return sNeed;
}

void main()
{
    object oPC        = OBJECT_SELF;
    object oItem      = GetSpellCastItem();
    string SpecialID  = GetSubString(GetTag(oItem), 11, GetStringLength(GetTag(oItem))-11);
    string RecipeID   = DCS_GetSpecialIDRecipe(SpecialID);
    int    Profession = DCS_GetProfessionFromRecipe(RecipeID);
    int    Level      = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_LEVEL, RecipeID);
    int    Rank       = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_RANK, RecipeID);
    int    Spec       = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_SPECIAL, RecipeID);
    string RecipeCrit = DCS_GetRecipeEntry(DCS_COL_RECIPE_CRITICAL, RecipeID);
    string sRecName   = DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, RecipeID);

    if(SQLGetDatabaseConnection())
    {
        string sDisplay = GetLocalString(GetModule(), "Exam_"+RecipeID);

        if(sDisplay == "")
        {
            DCS_SetCraftingPlayer(oPC);
            DCS_SetOption(DCS_OPTION_INFORMATION_MODE, TRUE, oPC);

            string sProf    = "Beruf: "+ColorText(DCS_GetProfessionName(Profession), nwcYellow)+nwCrLf;
            string sLevel   = "Stufe: "+ColorText(inStr(Level), nwcYellow)+nwCrLf;
            string sRank    = "Rang:  "+ColorText(DCS_GetRankName(Rank), nwcYellow)+nwCrLf;
            string sSpec    = Spec == 0 ? "" : "Spezialisierung: "+ColorText(DCS_GetSpecialisationName(Spec), nwcYellow)+nwCrLf;
            string sDC      = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, RecipeID) > 0 ? "· SG:    "+ColorText(inStr(DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, RecipeID)), nwcYellow)+nwCrLf : "";
            string sAmount  = "· Anzahl: "+ColorText(inStr(DCS_GetRecipeEntryInt(DCS_COL_RECIPE_AMOUNT, RecipeID)), nwcYellow)+nwCrLf;
            string sCrit    = RecipeCrit == "" ? "" : "· Kritisch: "+(stInt(RecipeCrit) == 0 ? ColorText(DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, RecipeCrit), nwcYellow)+nwCrLf : ColorText("+"+RecipeCrit+(stInt(RecipeCrit) == 1 ? " Gegenstand" : " Gegenstände"), nwcYellow)+nwCrLf);
            string sMat     = nwCrLf+"Benötigtes Material: "+nwCrLf+GetResourcesNeeded(RecipeID);

            sDisplay = sProf+sLevel+sRank+sSpec+nwCrLf+"Handwerksdetails:"+nwCrLf+sDC+sAmount+sCrit+sMat;

            DCS_DeleteCraftingPlayer();
            DCS_SetOption(DCS_OPTION_INFORMATION_MODE, FALSE, oPC);

            SetLocalString(GetModule(), "Exam_"+RecipeID, sDisplay);
        }

        // Title: (sRecName == dcsEmpty ? DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, RecipeID) : sRecName)
        DCS_PopupWindow(oPC, GetName(oItem), sDisplay);
    }
}
