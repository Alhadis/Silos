void LoadBallista(object oPC, int secondsLeft, vector startLoc)
{
	int act = GetCurrentAction(oPC);
	if (act == ACTION_ANIMALEMPATHY ||
        act == ACTION_ATTACKOBJECT ||
        act == ACTION_CASTSPELL ||
        act == ACTION_CLOSEDOOR ||
        act == ACTION_COUNTERSPELL ||
        act == ACTION_DIALOGOBJECT ||
        act == ACTION_DROPITEM ||
        act == ACTION_EXAMINETRAP ||
        act == ACTION_FLAGTRAP ||
        act == ACTION_FOLLOW ||
        act == ACTION_HEAL ||
        act == ACTION_ITEMCASTSPELL ||
        act == ACTION_KIDAMAGE ||
        act == ACTION_LOCK ||
        act == ACTION_MOVETOPOINT ||
        act == ACTION_OPENDOOR ||
        act == ACTION_OPENLOCK ||
        act == ACTION_PICKPOCKET ||
        act == ACTION_PICKUPITEM ||
        act == ACTION_RANDOMWALK ||
        act == ACTION_RECOVERTRAP ||
        act == ACTION_REST ||
        act == ACTION_SETTRAP ||
        act == ACTION_SIT ||
        act == ACTION_SMITEGOOD ||
        act == ACTION_TAUNT ||
        act == ACTION_USEOBJECT)
    {
		DeleteLocalInt(OBJECT_SELF, "RELOADING");
		SendMessageToPC(oPC, "You've stopped winding the ballista.");
		return;
	}
	if(fabs(GetPosition(oPC).x - startLoc.x) > 0.5 ||
	   fabs(GetPosition(oPC).y - startLoc.y) > 0.5)
	{
		DeleteLocalInt(OBJECT_SELF, "RELOADING");	
		SendMessageToPC(oPC, "You've stopped winding the ballista.");
		return;
	}
	secondsLeft--;
	if(secondsLeft <= 0)
	{
		DeleteLocalInt(OBJECT_SELF, "RELOADING");	
		SendMessageToPC(oPC, "You have finished loading the ballista, and it is ready to fire.");
		SetLocalInt(OBJECT_SELF, "ROUNDS_TO_LOAD", 0);
		return;
	}
	DelayCommand(1.0f, LoadBallista(oPC, secondsLeft, startLoc));
}

void WindBallista(object oPC, int secondsLeft, vector startLoc)
{
	int act = GetCurrentAction(oPC);
	if (act == ACTION_ANIMALEMPATHY ||
        act == ACTION_ATTACKOBJECT ||
        act == ACTION_CASTSPELL ||
        act == ACTION_CLOSEDOOR ||
        act == ACTION_COUNTERSPELL ||
        act == ACTION_DIALOGOBJECT ||
        act == ACTION_DROPITEM ||
        act == ACTION_EXAMINETRAP ||
        act == ACTION_FLAGTRAP ||
        act == ACTION_FOLLOW ||
        act == ACTION_HEAL ||
        act == ACTION_ITEMCASTSPELL ||
        act == ACTION_KIDAMAGE ||
        act == ACTION_LOCK ||
        act == ACTION_MOVETOPOINT ||
        act == ACTION_OPENDOOR ||
        act == ACTION_OPENLOCK ||
        act == ACTION_PICKPOCKET ||
        act == ACTION_PICKUPITEM ||
        act == ACTION_RANDOMWALK ||
        act == ACTION_RECOVERTRAP ||
        act == ACTION_REST ||
        act == ACTION_SETTRAP ||
        act == ACTION_SIT ||
        act == ACTION_SMITEGOOD ||
        act == ACTION_TAUNT ||
        act == ACTION_USEOBJECT)
    {
		DeleteLocalInt(OBJECT_SELF, "RELOADING");
		SendMessageToPC(oPC, "You've stopped winding the ballista.");
		return;
	}
	if(fabs(GetPosition(oPC).x - startLoc.x) > 0.5 ||
	   fabs(GetPosition(oPC).y - startLoc.y) > 0.5)
	{
		DeleteLocalInt(OBJECT_SELF, "RELOADING");
		SendMessageToPC(oPC, "You've stopped winding the ballista.");
		return;
	}
	secondsLeft--;
	if(secondsLeft <= 0)
	{
		SendMessageToPC(oPC, "You have finished winding the ballista, and start loading it.");
		SetLocalInt(OBJECT_SELF, "ROUNDS_TO_LOAD", 1);
		DelayCommand(1.0f, LoadBallista(oPC, 5, startLoc));
		return;
	}
	DelayCommand(1.0f, WindBallista(oPC, secondsLeft, startLoc));
}

void main()
{
	object oPC = GetLastUsedBy();
	
	int roundsToLoad = GetLocalInt(OBJECT_SELF, "ROUNDS_TO_LOAD");
	if(GetLocalInt(OBJECT_SELF, "RELOADING"))
	{
		SendMessageToPC(oPC, "The ballista is already reloading. You can't do anything with it right now.");
		return;
	}
	if(roundsToLoad <= 0)
	{
		string spawnUI = "target_single.xml";
	    string spawnUIScreenName = "TARGET_SINGLE";
	    SetGlobalGUIVariable(oPC, 199, "gui_ballistashot");
	    SetGlobalGUIVariable(oPC, 200, IntToString(ObjectToInt(OBJECT_SELF)));
		SetGlobalGUIVariable(oPC, 198, "creature,ground,placeable");
	    SetGlobalGUIVariable(oPC, 201, "");
		DisplayGuiScreen(oPC, spawnUIScreenName, 0, spawnUI, 0);
	}
	else if(roundsToLoad == 1)
	{
		SetLocalInt(OBJECT_SELF, "RELOADING", 1);
		SendMessageToPC(oPC, "You begin loading the ballista.");
		vector loc = GetPosition(oPC);
		DelayCommand(1.0f, LoadBallista(oPC, 5, loc));
	}
	else
	{
		SetLocalInt(OBJECT_SELF, "RELOADING", 1);	
		SendMessageToPC(oPC, "You begin winding the ballista.");
		vector loc = GetPosition(oPC);
		DelayCommand(1.0f, WindBallista(oPC, 5, loc));
	}
}