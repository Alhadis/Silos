#include "35_inc"

// Functions

void FullyRestoreParty();
void DestroyHenchmen();
void DetermineRomanticObligations();
void JumpGreetingParty();
void FadeOut();
void SetUpWallScene();
void ChangeMusic();
void JumpIndividualsToWarroom();
void JumpCompsToWarroom();
void EnterBishop();

//

void main(int nChoice)
{
	object oRegulator = GetTarget("3501_ip_regulator");
	
	switch (nChoice)
	{
		case 1:
			ActionPauseCutscene(1000, FALSE);
			AssignCutsceneActionToObject(oRegulator, ActionWait(1.0f));
			break;			
		case 2:
			ActionPauseCutscene(2000, FALSE);
			AssignCutsceneActionToObject(oRegulator, ActionWait(2.0f));
			break;			
		case 3:
			ActionPauseCutscene(3000, FALSE);
			AssignCutsceneActionToObject(oRegulator, ActionWait(3.0f));
			break;
		case 10:
			ActionPauseCutscene(2000, FALSE);
			AssignCutsceneActionToObject(oRegulator, ActionWait(2.0f));
			FullyRestoreParty();
			DestroyHenchmen();
			break;
		case 15:
			ActionPauseCutscene(3000, FALSE);
			AssignCutsceneActionToObject(oRegulator, ActionWait(3.0f));
			JumpGreetingParty();
			DelayCommand(2.0f, FadeOut());
			break;
		case 20:
			DetermineRomanticObligations();
			break;
		case 25:
			ActionPauseCutscene(3000, FALSE);
			AssignCutsceneActionToObject(oRegulator, ActionWait(3.0f));
			SetUpWallScene();
			break;
		case 30:
			JumpIndividualsToWarroom();
			JumpCompsToWarroom();
			break;			
		case 35:
			ChangeMusic();
			break;
		case 40:
			EnterBishop();
			break;
	}
}

void JumpCompsToWarroom()
{
	object oPCLeader = GetPCLeader( GetFirstPC() );
	
	DespawnRosterMember(TAG_AMMON);
	DespawnRosterMember(TAG_BISHOP);
	DespawnRosterMember(TAG_CASAVIR);
	DespawnRosterMember(TAG_CONSTRUCT);
	DespawnRosterMember(TAG_ELANEE);
	DespawnRosterMember(TAG_GROBNAR);
	DespawnRosterMember(TAG_KHELGAR);
	DespawnRosterMember(TAG_NEESHKA);
	DespawnRosterMember(TAG_QARA);
	DespawnRosterMember(TAG_SAND);
	DespawnRosterMember(TAG_ZHJAEVE);
	
	SpawnRosterMember( TAG_AMMON, GetLocation(GetTarget( TAG_WARROOM_AMMON_WP )) );
	SpawnRosterMember( TAG_BISHOP, GetLocation(GetTarget( TAG_WARROOM_BISHOP_WP )) );
	SpawnRosterMember( TAG_CASAVIR, GetLocation(GetTarget( TAG_WARROOM_CASAVIR_WP )) );
	SpawnRosterMember( TAG_CONSTRUCT, GetLocation(GetTarget( TAG_WARROOM_CONSTRUCT_WP )) );
	SpawnRosterMember( TAG_ELANEE, GetLocation(GetTarget( TAG_WARROOM_ELANEE_WP )) );
	SpawnRosterMember( TAG_GROBNAR, GetLocation(GetTarget( TAG_WARROOM_GROBNAR_WP )) );
	SpawnRosterMember( TAG_KHELGAR, GetLocation(GetTarget( TAG_WARROOM_KHELGAR_WP )) );
	SpawnRosterMember( TAG_NEESHKA, GetLocation(GetTarget( TAG_WARROOM_NEESHKA_WP )) );
	SpawnRosterMember( TAG_QARA, GetLocation(GetTarget( TAG_WARROOM_QARA_WP )) );
	SpawnRosterMember( TAG_SAND, GetLocation(GetTarget( TAG_WARROOM_SAND_WP )) );
	SpawnRosterMember( TAG_ZHJAEVE, GetLocation(GetTarget( TAG_WARROOM_ZHJAEVE_WP )) ); 
}	

void FullyRestoreParty()
{
	object oPC = GetFactionLeader(GetFirstPC());
	
	object oMember = GetFirstFactionMember(oPC, FALSE);
	
	while (GetIsObjectValid(oMember))
	{
		ForceRest(oMember);
		oMember = GetNextFactionMember(oPC, FALSE);
	}
}

void DestroyHenchmen()
{
	object oPC = GetFactionLeader(GetFirstPC());
	
	DestroyAllHenchmenInParty(oPC);
}

void JumpGreetingParty()
{
	object oKana = GetTarget("kana");
	object oKanaWP = GetTarget("wp_3501_kana");
	object oNevalle = GetTarget("nevalle");
	object oNevalleWP = GetTarget("wp_3501_nevalle");
	object oDaeghun = GetTarget("3510_daeghun");
	object oDeaghunWP = GetTarget("wp_3501_daeghun");

	SetScriptHidden(oDaeghun, FALSE);
	AssignCommand(oKana, ClearAllActions(TRUE));
	AssignCommand(oNevalle, ClearAllActions(TRUE));
	AssignCommand(oDaeghun, ClearAllActions(TRUE));
	AssignCommand(oKana, JumpToObject(oKanaWP));
	AssignCommand(oNevalle, JumpToObject(oNevalleWP));
	AssignCommand(oDaeghun, JumpToObject(oDeaghunWP));
}

void FadeOut()
{
	object oPC = GetFactionLeader(GetFirstPC());
	object oPCFacMem = GetFirstFactionMember(oPC);	
	float fFadeSpeed = 1.0f;
	float fSafeDelay = 10.0f;
	int nColor = 0;
	
	while(GetIsObjectValid(oPCFacMem))
    {
		FadeToBlack(oPCFacMem, fFadeSpeed, fSafeDelay, nColor);
		
        oPCFacMem = GetNextFactionMember(oPC);
    } 
}

void DetermineRomanticObligations()
{
	object oPC = GetFactionLeader(GetFirstPC());
	object o3501 = GetObjectByTag("3501_ckeep");
	object oCasavir = GetTarget("3500_casavir");
	object oElanee = GetTarget("3500_elanee"); 
	object oBishop = GetTarget("3500_bishop");
	object oNeeshka = GetTarget("3500_neeshka");
	string sVarInfluenceCasavir = INFLUENCE_PREFIX + TAG_CASAVIR;
	string sVarInfluenceElanee = INFLUENCE_PREFIX + TAG_ELANEE;		
	
	if (GetGender(oPC) == GENDER_MALE) 
	{
		DestroyObject(oCasavir);
		
		if (GetGlobalInt("30_bElaneeLeft") == 1)
		{
			DestroyObject(oElanee);
			return;
		}
	
		if (GetGlobalInt(sVarInfluenceElanee) >= 10 == TRUE)
		{
			if (IsInParty(TAG_ELANEE) == TRUE)
			{
				SetLocalInt(o3501, "ElaneeInParty", 1);
				DespawnRosterMember(TAG_ELANEE);
			}
			
			SetScriptHidden(oElanee, FALSE);
			return;			
		}
		
		else
		{
			DestroyObject(oElanee);
		}
	}
	
	if (GetGender(oPC) == GENDER_FEMALE) 
	{
		DestroyObject(oElanee);
		DestroyObject(oNeeshka);
	
		if (GetGlobalInt(sVarInfluenceCasavir) >= -1000)
		{
			if (IsInParty(TAG_CASAVIR) == TRUE)
			{
				SetLocalInt(o3501, "CasavirInParty", 1);
				DespawnRosterMember(TAG_CASAVIR);			
			}

			if (IsInParty(TAG_BISHOP) == TRUE)
			{
				SetLocalInt(o3501, "BishopInParty", 1);
				DespawnRosterMember(TAG_BISHOP);			
			}
			
			SetScriptHidden(oCasavir, FALSE);
			return;
		}
		
		else
		{
			DestroyObject(oCasavir);
		}
	}
}

void SetUpWallScene()
{
	object oPC = GetFactionLeader(GetFirstPC());
	object oCasavir = GetTarget("3500_casavir");
	object oElanee = GetTarget("3500_elanee");
	object oWP = GetTarget("wp_3501_loveinterest_wall");

	if (GetGender(oPC) == GENDER_MALE)
	{
		AssignCommand(oElanee, JumpToObject(oWP));
		SetScriptHidden(oElanee, FALSE);
	}

	if (GetGender(oPC) == GENDER_FEMALE)
	{
		AssignCommand(oCasavir, JumpToObject(oWP));
		SetScriptHidden(oCasavir, FALSE);
	}
	
}

void ChangeMusic()
{
	object oArea = GetObjectByTag("3501_ckeep");
	
	MusicBackgroundChangeDay(oArea, 49);
	MusicBackgroundChangeNight(oArea, 49);
}

void JumpIndividualsToWarroom()
{
	object oKana = GetTarget("kana");
	object oKanaWP = GetTarget("wp_3500_wrkana");
	object oNevalle = GetTarget("nevalle");
	object oNevalleWP = GetTarget("wp_3500_wrnevalle");
	object oDaeghun = GetTarget("3510_daeghun");

	AssignCommand(oKana, JumpToObject(oKanaWP));
	AssignCommand(oNevalle, JumpToObject(oNevalleWP));
	DestroyObject(oDaeghun, 1.0f);
}

void EnterBishop()
{
	object oPC = GetFactionLeader(GetFirstPC());
	object oBishop = GetTarget("3500_bishop");
	object oWP = GetTarget("wp_3501_loveinterest_wall");

	if (GetGender(oPC) == GENDER_FEMALE)
	{
		AssignCommand(oBishop, JumpToObject(oWP));
		SetScriptHidden(oBishop, FALSE);
	}
	
}