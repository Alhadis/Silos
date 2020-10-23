/*
Author: brockfanning
Date: Early 2008...
Purpose: These are various actions performed after the PC clicks "OK" on a confirmation window.
*/

#include "tkl_performer_include"

int GetHighestNote(int iNote)
{
	if (iNote >= 1 && iNote <= 24)
		return 24;
	else if (iNote >= 51 && iNote <= 74)
		return 74;
	else if (iNote >= 101 && iNote <= 112)
		return 112;
	else if (iNote >= 113 && iNote <= 124)
		return 124;
	else if (iNote >= 125 && iNote <= 136)
		return 136;
	else if (iNote >= 151 && iNote <= 162)
		return 162;
	else if (iNote >= 163 && iNote <= 174)
		return 174;
	else if (iNote >= 175 && iNote <= 186)
		return 186;
	else if (iNote >= 201 && iNote <= 224)
		return 224;
	else if (iNote >= 251 && iNote <= 274)
		return 274;
	else if (iNote >= 301 && iNote <= 310)
		return 310;
	else if (iNote >= 311 && iNote <= 320)
		return 320;
	else if (iNote >= 324 && iNote <= 335)
		return 335;
	else if (iNote >= 351 && iNote <= 360)
		return 360;
	else if (iNote >= 361 && iNote <= 370)
		return 370;
	else if (iNote >= 374 && iNote <= 385)
		return 385;
	else
		return 0;
}

int GetLowestNote(int iNote)
{
	if (iNote >= 1 && iNote <= 24)
		return 1;
	else if (iNote >= 51 && iNote <= 74)
		return 51;
	else if (iNote >= 101 && iNote <= 112)
		return 101;
	else if (iNote >= 113 && iNote <= 124)
		return 113;
	else if (iNote >= 125 && iNote <= 136)
		return 125;
	else if (iNote >= 151 && iNote <= 162)
		return 151;
	else if (iNote >= 163 && iNote <= 174)
		return 163;
	else if (iNote >= 175 && iNote <= 186)
		return 175;
	else if (iNote >= 201 && iNote <= 224)
		return 201;
	else if (iNote >= 251 && iNote <= 274)
		return 251;
	else if (iNote >= 301 && iNote <= 310)
		return 301;
	else if (iNote >= 311 && iNote <= 320)
		return 311;
	else if (iNote >= 324 && iNote <= 335)
		return 324;
	else if (iNote >= 351 && iNote <= 360)
		return 351;
	else if (iNote >= 361 && iNote <= 370)
		return 361;
	else if (iNote >= 374 && iNote <= 385)
		return 374;
	else
		return 0;
}

void main()
{
	object oPC = OBJECT_SELF;
	string sAction = GetLocalString(oPC, "TKL_PERFORMER_ACTION");
	int iOption = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
	string sOption = IntToString(iOption);
	object oInstrument = GetLocalObject(oPC, "TKL_PERFORMER_INSTRUMENT");

	if (sAction == "LYRIC_RECORD")
	{
		StartTimer(oInstrument, "PLAYBACK");
		SetLocalInt(oInstrument, "RECORDING_LYRICS", TRUE);
		DeleteLocalInt(oInstrument, "LYRICS_RECORDED");
		SetGUIObjectHidden(oPC, "TKL_PERFORMER_LYRICS", "StopRecordingPane", FALSE);
		PlaySong(oPC, oInstrument, 0, FALSE);
		ClearTKLPerformerVariables(oPC);	
	}
	
	else if (sAction == "SONG_LOAD")
	{
		object oNewInstrument = RetrieveCampaignObject(TKL_PERFORMER_DATABASE, "TKL_PERFORMER_INSTRUMENT_" +
			IntToString(iOption), GetLocation(oPC), oPC, oPC);
		if (GetIsObjectValid(oNewInstrument) == FALSE)
		{
			SendMessageToPC(oPC, "Error: Sorry, there is no song saved in this slot.");
			return;
		}
		TransferSong(oNewInstrument, oInstrument);
		DestroyObject(oNewInstrument);
		ClearTKLPerformerVariables(oPC);
		SendMessageToPC(oPC, "Song loaded.");
	}
	
	else if (sAction == "SONG_SAVE")
	{
		StoreCampaignObject(TKL_PERFORMER_DATABASE, "TKL_PERFORMER_INSTRUMENT_" + IntToString(iOption),
			oInstrument, oPC);
		string sName = GetLocalString(oInstrument, "SONG_NAME");
		if (sName == "")
			sName = "Untitled";
		SetCampaignString(TKL_PERFORMER_DATABASE, "TKL_PERFORMER_SONG_NAME" + IntToString(iOption), sName, oPC);
		RefreshSongList(oPC);
		ClearTKLPerformerVariables(oPC);
		SendMessageToPC(oPC, "Song saved.");
	}
	
	else if (sAction == "NEW")
	{
		if (iOption == 0)
		{
			EraseTrack(oInstrument, 4);
			EraseTrack(oInstrument, 3);
			EraseTrack(oInstrument, 2);
			EraseTrack(oInstrument, 1);
			DeleteLocalString(oInstrument, "SONG_NAME");
			EraseLyrics(oInstrument);
			EraseLyricTrack(oInstrument);
			DeleteLocalInt(oInstrument, "KEY");
			DeleteLocalInt(oInstrument, "TEMPO");
			RefreshNoteNames(oPC, oInstrument);	
			DeleteLocalString(oInstrument, "ORIGINAL_COMPOSER");
		}
		else
		{
			EraseTrack(oInstrument, iOption);
		}
		RefreshNames(oPC, oInstrument);
		ClearTKLPerformerVariables(oPC);
		SendMessageToPC(oPC, "Current song erased.");
	}
	
	else if (sAction == "DELETE_NOTE")
	{
		int iNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sOption);
		DeleteNote(oInstrument, iOption, iNote);
		RefreshNotePane(oPC, oInstrument);
	}
	
	else if (sAction == "NOTE_EDIT_PITCH")
	{
		int iNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sOption);
		int iEditPitch = GetLocalInt(oInstrument, "EDIT_PITCH");
		if (iNote == 0 || iEditPitch == 0)
		{
			SendMessageToPC(oPC, "Pitch unchanged.");
			return;
		}
		string sID = "NOTE" + IntToString(iNote) + 	"PITCH_TRACK" + sOption;
		int iCurrent = GetLocalInt(oInstrument, sID);
		int iLowestNote = GetLowestNote(iCurrent);
		int iHighestNote = GetHighestNote(iCurrent);
		if (iCurrent + iEditPitch < iLowestNote)
		{
			iCurrent = iLowestNote;
			SendMessageToPC(oPC, "Lowest note reached.");
		}
		else if (iCurrent + iEditPitch > iHighestNote)
		{
			iCurrent = iHighestNote;
			SendMessageToPC(oPC, "Highest note reached.");
		}
		else
			iCurrent += iEditPitch;
		SetLocalInt(oInstrument, sID, iCurrent);
		RefreshNotePane(oPC, oInstrument);
	}
	
	else if (sAction == "NOTE_EDIT_TIME")
	{
		int iNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sOption);
		float fEditTime = GetLocalFloat(oInstrument, "EDIT_TIME");
		if (iNote == 0 || fEditTime == 0.0f)
		{
			SendMessageToPC(oPC, "Time unchanged.");
			return;
		}
		string sID = "NOTE" + IntToString(iNote) + 	"PLAYBACK_TRACK" + sOption;
		float fCurrent = GetLocalFloat(oInstrument, sID);
		if (fCurrent + fEditTime < 0.0f)
			fCurrent = 0.0f;
		else
			fCurrent += fEditTime;
		SetLocalFloat(oInstrument, sID, fCurrent);
		SendMessageToPC(oPC, "Time changed to " + FloatToString(fCurrent));
		SortNotes(oPC, oInstrument, iOption);
		RefreshNotePane(oPC, oInstrument);
	}
}