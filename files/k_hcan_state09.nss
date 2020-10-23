////////////////////////////////////////////////////////////////////////////////
/*	Starting conditional for Reply 42 in k_hcan_dialog.dlg

	This is an adjustment for the starting conditional that gates the final
	branch of Canderous' personal quest. In the vanilla game, this is only
	availanle on the Unknown World/Lehon, which makes it very easy to miss.
	This has been changed to any time after escaping the Leviathan, alongside
	the usual +1 level since the last conversation you had with him.
	
	DP 2019-09-06                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = ((GetGlobalNumber("G_CAND_STATE") == 8) && (GetHitDice(GetFirstPC())) > (GetGlobalNumber("T_LEVC")) && (GetGlobalNumber("K_KOTOR_MASTER") >= 20));

    return iResult;
}
