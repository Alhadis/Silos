/*
Script:
Author: brockfanning
Date: Early 2008...
Purpose: This is the main script that gets directly called from the TKL Performer
.xml files.  Most of the key functions can be found in tkl_perormer_include.

5/31/08: Many bugs fixed... brockfanning
6/11/08: rearranged actions to optimize performance, added "rolled offsets" to Quantize, added DCs to transcribing
*/

#include "tkl_performer_include"

void QuantizeNote(object oPC, object oInstrument, int iTrack, int iNote, float fTick, int iSubDivide=1)
{
	string sTrack = IntToString(iTrack);
	string sNote = IntToString(iNote);
	float fNearestBeat;
	if (iSubDivide == 0)
		iSubDivide = 1;
	fTick = fTick / IntToFloat(iSubDivide);
	if (fTick < 0.01)
		fTick = 0.01;
	float fPlayed = GetLocalFloat(oInstrument, "NOTE" + sNote + "PLAYBACK_TRACK" + sTrack);
	int iPitch = GetLocalInt(oInstrument, "NOTE" + sNote + "PITCH_TRACK" + sTrack);
	float fRolledOffset = 0.0f;
	// Apply "rolled" note offsets if necessary
	if (iPitch > 100 && iPitch < 137)
		fRolledOffset = TKL_CHORD_ROLL_OFFSET;
	else if (iPitch == 316 || iPitch == 317 || iPitch == 366 || iPitch == 367)
		fRolledOffset = TKL_DRUM_ROLL_OFFSET;
	fPlayed += fRolledOffset; // For rolled notes, tell the computer which beat it REALLY should be on.
	while (fPlayed > fNearestBeat)
	{
		fNearestBeat += fTick;
	}
	//check to see if the note should was played too early or too late
	float fEarly = fNearestBeat - fPlayed;
	float fLate = fPlayed - (fNearestBeat - fTick);
	if (fEarly <= fLate)
	{
		SetLocalFloat(oInstrument, "NOTE" + sNote + "PLAYBACK_TRACK" + sTrack, fNearestBeat - fRolledOffset);
	}
	else
	{
		SetLocalFloat(oInstrument, "NOTE" + sNote + "PLAYBACK_TRACK" + sTrack, (fNearestBeat - fTick) - fRolledOffset);
	}
}

int TogglePrimaryVariation(int iNote)
{	int iReturn;
	if (iNote >= 1 && iNote <= 24)
		iReturn = iNote + 50;
	else if (iNote >= 51 && iNote <= 74)
		iReturn = iNote - 50;
	else if (iNote >= 101 && iNote <= 136)
		iReturn = iNote + 50;
	else if (iNote >= 151 && iNote <= 186)
		iReturn = iNote - 50;
	else if (iNote >= 201 && iNote <= 224)
		iReturn = iNote + 50;
	else if (iNote >= 251 && iNote <= 274)
		iReturn = iNote - 50;
	else if (iNote >= 301 && iNote <= 335)
		iReturn = iNote + 50;
	else if (iNote >= 351 && iNote <= 385)
		iReturn = iNote - 50;
	else
		iReturn = iNote;		
	return iReturn;
}

int ToggleSecondaryVariation(int iNote)
{
	int iReturn;
	if (iNote >= 101 && iNote <= 112)
		iReturn = iNote + 12;
	else if (iNote >= 113 && iNote <= 124)
		iReturn = iNote + 12;
	else if (iNote >= 125 && iNote <= 136)
		iReturn = iNote - 24;
	else if (iNote >= 151 && iNote <= 162)
		iReturn = iNote + 12;
	else if (iNote >= 163 && iNote <= 174)
		 iReturn = iNote + 12;
	else if (iNote >= 175 && iNote <= 186)
		iReturn = iNote - 24;
	else if (iNote >= 301 && iNote <= 310)
		iReturn = iNote + 10;
	else if (iNote >= 311 && iNote <= 320)
		iReturn = iNote - 10;
	else if (iNote >= 351 && iNote <= 360)
		iReturn = iNote + 10;
	else if (iNote >= 361 && iNote <= 370)
		iReturn = iNote - 10;
	else
		iReturn = iNote;
	return iReturn;
} 

void main(string sAction, int iOption)
{
	object oPC = OBJECT_SELF;
	object oInstrument = GetLocalObject(oPC, "TKL_PERFORMER_INSTRUMENT");
	
	if (sAction == "RECORD_NOTE")
	{
		int iTrack = GetLocalInt(oInstrument, "RECORDING_TRACK");
		if (iTrack > 0)
		{
			string sTrack = IntToString(iTrack);
			float fSecondsIn = StringToFloat(QueryTimer(oInstrument, "PLAYBACK")) / 1000000.0f;
			int iNotesRecorded = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
			iNotesRecorded++;
			SetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack, iNotesRecorded);
			string sID = "NOTE" + IntToString(iNotesRecorded);
			SetLocalFloat(oInstrument, sID + "PLAYBACK_TRACK" + sTrack, fSecondsIn);
			SetLocalInt(oInstrument, sID + "PITCH_TRACK" + sTrack, iOption);
			SendMessageToPC(oPC, "Note recorded at time: " + FloatToString(fSecondsIn) + " on Track " + sTrack);
		}
	}
	
	else if (sAction == "PLAY_LIVE")
	{
		int iKey = GetLocalInt(oInstrument, "KEY");
		PlayNote(iOption, iKey);
	}
	
	else if (sAction == "LYRIC_SING")
	{
		// check to see if someone is just holding a score, instead of any instrument
		if (GetIsObjectValid(oInstrument) == FALSE)
			oInstrument = GetLocalObject(oPC, "TKL_PERFORMER_SCORE");
		string sLyric = GetLocalString(oInstrument, "LYRIC" + IntToString(iOption));
		if (sLyric == "")
		{
			SendMessageToPC(oPC, "There is no lyric in that slot.");
			return;
		}
		SpeakString(sLyric);
		if (GetLocalInt(oInstrument, "RECORDING_LYRICS"))
		{
			float fSecondsIn = StringToFloat(QueryTimer(oInstrument, "PLAYBACK")) / 1000000.0f;
			int iLyricsRecorded = GetLocalInt(oInstrument, "LYRICS_RECORDED");
			iLyricsRecorded++;
			SetLocalInt(oInstrument, "LYRICS_RECORDED", iLyricsRecorded);
			string sID = "LYRIC" + IntToString(iLyricsRecorded);
			SetLocalFloat(oInstrument, sID + "PLAYBACK", fSecondsIn);
			SetLocalInt(oInstrument, sID + "TEXT", iOption);
			SendMessageToPC(oPC, "Lyric recorded at time: " + FloatToString(fSecondsIn) + ".");	
		}	
	}
	
	else if (sAction == "LAG_CHECK")
	{
		string sStop;
		if (TKL_NWNX4_NOT_INSTALLED)
		{
			SendMessageToPC(oPC, "This function is disabled on this server.");
			return;
		}
		if (iOption == 0)
		{
			sStop = StopTimer(oInstrument, "PLAYBACK");
			StartTimer(oInstrument, "PLAYBACK");
			PlaySound("tkl_performer_lag_check");
			SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "LagCheckPane", FALSE);
		}
		else if (iOption == 1)
		{
			sStop = StopTimer(oInstrument, "PLAYBACK");
			SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "LagCheckPane", TRUE);
			float fSecondsIn = StringToFloat(sStop) / 1000000.0f;
			fSecondsIn -= 9.089f;
			if (fSecondsIn <= 0.0f)
			{
				SendMessageToPC(oPC, "Lag check unsuccessful: You clicked too early.  Please try again.");
			}
			else
			{
				SendMessageToPC(oPC, "Lag check successful: Result = " + FloatToString(fSecondsIn, 4, 2));
				SendMessageToPC(oPC, "This amount will be deducted from all recording times.");
				SendMessageToPC(oPC, "If you feel you didn't click at the right time, please try again.");
				SetLocalFloat(oPC, "LAG_CHECK", fSecondsIn);
				SetCampaignFloat(TKL_PERFORMER_DATABASE, "LAG_CHECK", fSecondsIn, oPC);
				RefreshRecordPane(oPC, oInstrument);
			}			
		}
		else
		{
			DeleteLocalFloat(oPC, "LAG_CHECK");
			SendMessageToPC(oPC, "Lag Check reset succesfully.");
		}
	}	
	
	else if (sAction == "EASY_MODE")
	{
		if (GetLocalInt(oInstrument, "EASY_MODE"))
			DeleteLocalInt(oInstrument, "EASY_MODE");
		else
			SetLocalInt(oInstrument, "EASY_MODE", TRUE);
		RefreshNoteNames(oPC, oInstrument);
		RefreshModes(oPC, oInstrument);
	}
	
	else if (sAction == "MINOR_MODE")
	{
		if (GetLocalInt(oInstrument, "MINOR_MODE"))
			DeleteLocalInt(oInstrument, "MINOR_MODE");
		else
			SetLocalInt(oInstrument, "MINOR_MODE", TRUE);
		RefreshNoteNames(oPC, oInstrument);
		RefreshModes(oPC, oInstrument);
	}
	
	else if (sAction == "PREVIOUS_NOTE")
	{
		int bGoToBeginning = FALSE;
		if (iOption >= 5)
		{
			iOption -= 4;
			bGoToBeginning = TRUE;
		}
		int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
		string sTrack = IntToString(iTrack);
		int iCurrentNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack);
		if (iCurrentNote == 0)
			iCurrentNote = 1;
		
		if (bGoToBeginning)
			iCurrentNote = 1;
		else
			iCurrentNote--;
		
		if (iCurrentNote < 1)
			iCurrentNote = 1;
		SetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack, iCurrentNote);
		PlayNote(GetLocalInt(oInstrument, "NOTE" + IntToString(iCurrentNote) + "PITCH_TRACK" + sTrack),
			GetLocalInt(oInstrument, "KEY"));
		RefreshNotePane(oPC, oInstrument);
	}
	
	else if (sAction == "NEXT_NOTE")
	{
		int bGoToEnd = FALSE;
		if (iOption >= 5)
		{
			iOption -= 4;
			bGoToEnd = TRUE;
		}
		int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
		string sTrack = IntToString(iTrack);
		int iCurrentNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack);
		if (iCurrentNote == 0)
			iCurrentNote = 1;
		int iEnd = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
		if (bGoToEnd)
			iCurrentNote = iEnd;
		else
			iCurrentNote++;
		
		if (iCurrentNote > iEnd)
			iCurrentNote = iEnd;
		SetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack, iCurrentNote);
		PlayNote(GetLocalInt(oInstrument, "NOTE" + IntToString(iCurrentNote) + "PITCH_TRACK" + sTrack),
			GetLocalInt(oInstrument, "KEY"));
		RefreshNotePane(oPC, oInstrument);
	}
	
	else if (sAction == "CURRENT_NOTE")
	{
		int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
		string sTrack = IntToString(iTrack);
		int iCurrentNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack);
		if (iCurrentNote == 0)
			iCurrentNote = 1;
		PlayNote(GetLocalInt(oInstrument, "NOTE" + IntToString(iCurrentNote) + "PITCH_TRACK" + sTrack),
			GetLocalInt(oInstrument, "KEY"));
	}
	
	
	else if (sAction == "HELP")
	{
		DisplayGuiScreen(oPC, "TKL_PERFORMER_HELP", FALSE, "tkl_performer_help.xml");	
	}
	
	else if (sAction == "TRACK_PLAY")
	{
		PlayTrack(oPC, oInstrument, iOption, FALSE, FALSE, TRUE);
	}
	
	else if (sAction == "DISABLE_MUSIC")
	{
		object oArea = GetArea(oPC);
		if (iOption == 0)
		{
			if (TKL_ALLOW_DISABLE_MUSIC)
			{
				MusicBackgroundStop(oArea);
				SendMessageToPC(oPC, "Background music in this area is now OFF.");
				SendMessageToPC(oPC, "Right-click this button to turn it back on.");
			}
			else
				SendMessageToPC(oPC, "This function is disabled on this server.");
		}
		else if (iOption == 1)
		{
			MusicBackgroundPlay(oArea);
			SendMessageToPC(oPC, "Background music ON.");
		}
		else if (iOption == 2)
		{
			if (TKL_ALLOW_DISABLE_SOUNDS)
			{
				AmbientSoundStop(oArea);
				SendMessageToPC(oPC, "Background sounds in this area are now OFF.");
				SendMessageToPC(oPC, "Right-click this button to turn them back on.");
			}
			else
				SendMessageToPC(oPC, "This function is disabled on this server.");
		}
		else
		{
			AmbientSoundPlay(oArea);
			SendMessageToPC(oPC, "Background sounds ON.");
		}					
	}
	
	else if (sAction == "LYRIC_RECORD")
	{
		if (TKL_NWNX4_NOT_INSTALLED)
		{
			SendMessageToPC(oPC, "This function is disabled on this server.");
			return;
		}
		SetLocalString(oPC, "TKL_PERFORMER_ACTION", "LYRIC_RECORD");
		string sMessage = "Are you sure you want to record a new Lyric Track? (The current Lyric Track will be overwritten.)";
		DisplayMessageBox(oPC, 0, sMessage, "gui_tkl_performer_message", "gui_tkl_performer_cancel", TRUE); 		
	}
	
	else if (sAction == "LYRIC_LEARN")
	{
		if (GetIsObjectValid(oInstrument) == FALSE)
			return;
		SetLocalInt(oPC, "TKL_PERFORMER_OPTION", iOption);
		SetLocalString(oPC, "TKL_PERFORMER_ACTION", "LYRIC_LEARN");
		DisplayInputBox(oPC, 0, "Please type your lyric:", "gui_tkl_performer_input", "gui_tkl_performer_cancel", TRUE);	
	}
	
	else if (sAction == "NEW")
	{
		PassTKLParameters(oPC, sAction, iOption);
		string sMessage;
		string sTrack = IntToString(iOption);
		if (iOption == 0)
			sMessage = "Are you sure you want to erase this song? (Unsaved recordings will be lost.)";
		else
			sMessage = "Are you sure you want to erase Track " + sTrack + "?";
		DisplayMessageBox(oPC, 0, sMessage, "gui_tkl_performer_message", "gui_tkl_performer_cancel", TRUE); 
	}
	
	else if (sAction == "TRANSCRIBE")
	{
		if (TKL_ONE_TRANSCRIPTION_PER_HOUR && GetLocalInt(oPC, "TKL_PERFORMER_LAST_SCORE") == GetTimeHour())
		{
			SendMessageToPC(oPC, "You need to wait a while before you transcribe again.");
			return;
		}
		if (TKL_TRANSCRIPTIONS_PER_RESET > 0 && GetLocalInt(oPC, "TKL_TRANSCRIPTIONS_DONE") >= TKL_TRANSCRIPTIONS_PER_RESET)
		{
			SendMessageToPC(oPC, "You must wait until the next server-reset before transcribing more.");
			return;
		}
		if (TKL_ONE_TRANSCRIPTION_PER_HOUR)
			SetLocalInt(oPC, "TKL_PERFORMER_LAST_SCORE", GetTimeHour());
		if (TKL_TRANSCRIPTIONS_PER_RESET > 0)
			SetLocalInt(oPC, "TKL_TRANSCRIPTIONS_DONE", GetLocalInt(oPC, "TKL_TRANSCRIPTIONS_DONE") + 1);
		if (TKL_TRANSCRIPTION_DC > 0)
		{
			int iDC = TKL_TRANSCRIPTION_DC;
			if (TKL_TRANSCRIPTION_LENGTH_PENALTY > 0)
			{
				int iTotalNotes = 
					GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK1") +
					GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK2") +
					GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK3") +
					GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK4") +
					GetLocalInt(oInstrument, "LYRICS_RECORDED");
				iDC += iTotalNotes / TKL_TRANSCRIPTION_LENGTH_PENALTY;
			}
			int iRoll = d20();
			int iSkill = GetPerform(oPC);
			SendMessageToPC(oPC, 
				"Perform check: " + 
				IntToString(iSkill) +
				" + " +
				IntToString(iRoll) +
				" = " +
				IntToString(iRoll + iSkill) +
				" vs. DC " +
				IntToString(iDC));
			if (iSkill + iRoll >= iDC)
			{
				SendMessageToPC(oPC, "Transcription Succeeded.");
			}
			else
			{
				SendMessageToPC(oPC, "Transcription Failed.");
				return;
			}	
		}
		object oScore = CreateItemOnObject("tkl_performer_score", oPC);
		string sComposer = GetLocalString(oInstrument, "ORIGINAL_COMPOSER");
		if (sComposer == "")
			sComposer = GetName(oPC);
		string sName = GetLocalString(oInstrument, "SONG_NAME");
		SetFirstName(oScore, sName + " <i>(by " + sComposer + ")</i>");
		TransferSong(oInstrument, oScore);
		SetItemCharges(oScore, TKL_TRANSCRIPTION_CHARGES);
	}
	
	else if (sAction == "STOP_RECORDING")
	{
		if (GetLocalInt(oInstrument, "RECORDING_TRACK") > 0 || GetLocalInt(oInstrument, "RECORDING_LYRICS") == TRUE)
			StopRecording(oPC, oInstrument);
	}
	
	else if (sAction == "TRACK_AHEAD")
	{
		float fAdjust;
		string sMessage;
		if (iOption > 4)
		{
			fAdjust = -3.0f;
			iOption -= 4;
		}
		else
			fAdjust = -0.1f;
		string sTrack = IntToString(iOption);
		
		float fDelay = GetLocalFloat(oInstrument, "NOTE1PLAYBACK_TRACK" + sTrack);
		if (fDelay + fAdjust < 0.0f)
		{
			sMessage = "Sorry, track " + sTrack + " can't be moved ahead any further.";
			SendMessageToPC(oPC, sMessage);
			return;
		}

		float fOffset = GetLocalFloat(oInstrument, "OFFSET" + sTrack);
		fOffset += fAdjust;
		sMessage = "Track " + sTrack + " will be adjusted by " + FloatToString(fOffset, 4, 1) + " seconds.";
		SetLocalFloat(oInstrument, "OFFSET" + sTrack, fOffset);
		
		int iTotalNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
		while (iTotalNotes > 0)
		{
			SetLocalFloat(oInstrument, "NOTE" + IntToString(iTotalNotes) + "PLAYBACK_TRACK" + sTrack,
				GetLocalFloat(oInstrument, "NOTE" + IntToString(iTotalNotes) + "PLAYBACK_TRACK" + sTrack) + fAdjust);
			iTotalNotes--;
		}
		
		SendMessageToPC(oPC, sMessage);		
	}
	
	else if (sAction == "TRACK_BEHIND")
	{
		float fAdjust;
		string sMessage;
		if (iOption > 4)
		{
			fAdjust = 3.0f;
			iOption -= 4;
		}
		else
			fAdjust = 0.1f;
		string sTrack = IntToString(iOption);
		float fOffset = GetLocalFloat(oInstrument, "OFFSET" + sTrack);
		fOffset += fAdjust;
		sMessage = "Track " + sTrack + " will be adjusted by " + FloatToString(fOffset, 4, 1) + " seconds.";
		SetLocalFloat(oInstrument, "OFFSET" + sTrack, fOffset);
		int iTotalNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
		while (iTotalNotes > 0)
		{
			SetLocalFloat(oInstrument, "NOTE" + IntToString(iTotalNotes) + "PLAYBACK_TRACK" + sTrack, 
				GetLocalFloat(oInstrument, "NOTE" + IntToString(iTotalNotes) + "PLAYBACK_TRACK" + sTrack) + fAdjust);
			iTotalNotes--;
		}
		
		SendMessageToPC(oPC, sMessage);		
	}
	
	else if (sAction == "TRACK_ADJUST")
	{
		string sTrack = IntToString(iOption);
		float fOffset = GetLocalFloat(oInstrument, "OFFSET" + sTrack);
		SendMessageToPC(oPC, "Click - or + to adjust the timing of this track.");
		SendMessageToPC(oPC, "Currently, Track " + sTrack + " has an offset of: " + FloatToString(fOffset, 4, 1) + " seconds.");		
	}
	
	else if (sAction == "SONG_PLAY")
	{		
		PlaySong(oPC, oInstrument, 0, TRUE);
	}
	
	else if (sAction == "CLOSE")
	{
		CloseGUIScreen(oPC, TKL_PERFORMER_SCREEN);
		CloseGUIScreen(oPC, "TKL_PERFORMER_LYRICS");
	}
	
	else if (sAction == "TRACK_RECORD")
	{
		if (TKL_NWNX4_NOT_INSTALLED)
		{
			SendMessageToPC(oPC, "This function is disabled on this server.");
			return;
		}
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "RecordPane", TRUE);
		int iOption = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
		if (GetLocalInt(oInstrument, "METRONOME_ON"))
		{
			int iSeconds = GetLocalInt(oInstrument, "METRONOME_DURATION");
			SendMessageToPC(oPC, "Metronome will play for " + IntToString(iSeconds) + " seconds.");
			int iTempo = GetLocalInt(oInstrument, "METRONOME");
			if (iTempo == 0)
				iTempo = 60;
			PlayMetronome(oPC, iTempo, iSeconds);
			PlaySong(oPC, oInstrument, iOption, TRUE, TRUE, TRUE);
			RecordTrack(oPC, oInstrument, iOption);
		}
		else
		{
			PlaySong(oPC, oInstrument, iOption, TRUE, TRUE, TRUE);
			RecordTrack(oPC, oInstrument, iOption);		
		}
		ClearTKLPerformerVariables(oPC);		
	}
	
	else if (sAction == "RENAME")
	{
		string sOption, sOldName;
		if (iOption > 0)
		{
			sOption = IntToString(iOption);
			sOldName = GetLocalString(oInstrument, "TRACK_" + sOption + "_NAME");
			if (sOldName == "")
				sOldName = "Track " + sOption;
		}
		else
		{
			sOldName = GetLocalString(oInstrument, "SONG_NAME");
			if (sOldName == "")
				sOldName = "Opus #1";
		}
		PassTKLParameters(oPC, sAction, iOption);
		DisplayInputBox(oPC, 0, "What would you like to name this track?", "gui_tkl_performer_input", "gui_tkl_performer_cancel", TRUE, "", 0, "Rename", 0, "Cancel", sOldName);	
	}
	
	else if (sAction == "WRITE")
	{
		if (GetLocalInt(oInstrument, "METRONOME_ON") == FALSE)
		{
			SendMessageToPC(oPC, "Sorry, you can only input tracks if you have the Metronome on.");
			return;
		}
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "RecordPane", TRUE);
		int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
		string sOldWrite = GetLocalString(oInstrument, "WRITE_TRACK" + IntToString(iTrack));
		PassTKLParameters(oPC, sAction, iTrack);
		DisplayInputBox(oPC, 0, "Please write the notes for this track. (WARNING: This will overwrite the track. See the help file for instructions)", "gui_tkl_performer_input", "gui_tkl_performer_cancel", TRUE, "", 0, "Write", 0, "Cancel", sOldWrite);	
	}
	
	else if (sAction == "SONG_TEMPO")
	{
		int iTempo = GetLocalInt(oInstrument, "TEMPO");
		if (iTempo < 1)
			iTempo = 100;
		int iAdjust;
		if (iOption == 0)
			iAdjust = -1;
		else if (iOption == 1)
			iAdjust = -5;
		else if (iOption == 2)
			iAdjust = 1;
		else if (iOption == 3)
			iAdjust = 5;
		else if (iOption == 4)
		{
			SendMessageToPC(oPC, "Click + or - to adjust the speed of this song.");
			SendMessageToPC(oPC, "The current speed is " + IntToString(100 + (100-iTempo)) + "%.");
			return;
		}
	
		iTempo += iAdjust;
		int iMaxSpeed = GetMaximumSpeed(oPC);
		if (iTempo < (100 - iMaxSpeed))
		{
			SendMessageToPC(oPC, "Until you increase your Perform skill, this is as fast as you can play.");
			iTempo = 100 - iMaxSpeed;
		}
		if (iTempo < 1)
			iTempo == 1;
		SetLocalInt(oInstrument, "TEMPO", iTempo);
		SendMessageToPC(oPC, "Speed changed to  " + IntToString(100 + (100-iTempo)) + "%.");
		SetLocalFloat(oInstrument, "SONG_LENGTH", GetSongLength(oInstrument));
	}
	
	else if (sAction == "METRONOME")
	{
		int iTempo = GetLocalInt(oInstrument, "METRONOME");
		if (iTempo < 1)
			iTempo = 60;
		int iAdjust;
		if (iOption == 0)
			iAdjust = 1;
		else if (iOption == 1)
			iAdjust = 5;
		else if (iOption == 2)
			iAdjust = -1;
		else if (iOption == 3)
			iAdjust = -5;
		else if (iOption == 4)
		{
			SetLocalInt(oInstrument, "METRONOME_ON", TRUE);
			RefreshRecordPane(oPC, oInstrument);
			return;
		}
		else if (iOption == 5)
		{
			DeleteLocalInt(oInstrument, "METRONOME_ON");
			RefreshRecordPane(oPC, oInstrument);
			return;
		}
			
		iTempo += iAdjust;
		if (iTempo < 1)
			iTempo = 1;
		SetLocalInt(oInstrument, "METRONOME", iTempo);
		RefreshRecordPane(oPC, oInstrument);
	}
	
	else if (sAction == "METRONOME_DURATION")
	{
		int iDuration = GetLocalInt(oInstrument, "METRONOME_DURATION");
		if (iDuration < 1)
			iDuration = 60;
		int iAdjust;
		if (iOption == 0)
			iAdjust = 1;
		else if (iOption == 1)
			iAdjust = 5;
		else if (iOption == 2)
			iAdjust = -1;
		else if (iOption == 3)
			iAdjust = -5;
				
		iDuration += iAdjust;
		if (iDuration < 1)
			iDuration = 1;
		if (iDuration > 300)
			iDuration = 300;
		SetLocalInt(oInstrument, "METRONOME_DURATION", iDuration);
		RefreshRecordPane(oPC, oInstrument);
	}
	
	else if (sAction == "QUANTIZE")
	{
		if (iOption == 0)
		{
			int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
			string sTrack = IntToString(iTrack);
			int iTempo = GetLocalInt(oInstrument, "METRONOME_RECORDED_TRACK" + sTrack);
			
			float fTick = 60.0f / IntToFloat(iTempo);
			int iSubdivide = GetLocalInt(oInstrument, "QUANTIZE_SUBDIVIDE");
			if (iSubdivide == 0)
				iSubdivide = 1;
			int iTotalNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
			SendMessageToPC(oPC, "Quantizing " + IntToString(iTotalNotes) + " notes.");
			while (iTotalNotes > 0)
			{
				QuantizeNote(oPC, oInstrument, iTrack, iTotalNotes, fTick, iSubdivide);
				iTotalNotes--;
			}
			SendMessageToPC(oPC, "Quantize successful.");
			SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "QuantizePane", TRUE);
		}
		else
			SetLocalInt(oInstrument, "QUANTIZE_SUBDIVIDE", iOption);
	}
		
	else if (sAction == "SONG_LOAD")
	{
		string sName = GetCampaignString(TKL_PERFORMER_DATABASE, "TKL_PERFORMER_SONG_NAME" + IntToString(iOption), oPC);
		if (sName == "")
		{
			SendMessageToPC(oPC, "There is not a song in that slot.");
			return;
		}
		else
		{
			RefreshSongList(oPC);
			PassTKLParameters(oPC, sAction, iOption);
			DisplayMessageBox(oPC,0,"Are you sure you want to load " + sName + "? (Any unsaved changes will be lost)",
				"gui_tkl_performer_message", "gui_tkl_performer_cancel", TRUE);
		}		
	}
	
	else if (sAction == "SONG_SAVE")
	{
		string sText;
		string sName = GetCampaignString(TKL_PERFORMER_DATABASE, "TKL_PERFORMER_SONG_NAME" + IntToString(iOption), oPC);
		if (sName == "")
			sText = "Click 'Ok' to save this song.";
		else
			sText = "Saving this song will overwrite " + sName + ".  Are you sure?";
		PassTKLParameters(oPC, sAction, iOption);
		DisplayMessageBox(oPC,0, sText,
				"gui_tkl_performer_message", "gui_tkl_performer_cancel", TRUE);
	}
	
	else if (sAction == "SONG_PREVIEW")
	{		
		PlaySong(oPC, oInstrument, 0, TRUE, FALSE, FALSE, TRUE);
	}
	
	else if (sAction == "TRACK_PREVIEW")
	{		
		PlayTrack(oPC, oInstrument, iOption, FALSE, FALSE, TRUE, TRUE);
	}
		
	else if (sAction == "KEY_CHANGE")
	{
		SetLocalInt(oInstrument, "KEY", iOption);
		RefreshNoteNames(oPC, oInstrument);	
	}
	
	else if (sAction == "TRACK_MUTE")
	{
		string sOption = IntToString(iOption);
		if (GetLocalInt(oInstrument, "TRACK" + sOption + "MUTE"))
			DeleteLocalInt(oInstrument, "TRACK" + sOption + "MUTE");
		else
			SetLocalInt(oInstrument, "TRACK" + sOption + "MUTE", TRUE);
		RefreshMuting(oPC, oInstrument);
	}
	
	else if (sAction == "LYRIC_MUTE")
	{
		if (GetLocalInt(oInstrument, "LYRICS_MUTED"))
			DeleteLocalInt(oInstrument, "LYRICS_MUTED");
		else
			SetLocalInt(oInstrument, "LYRICS_MUTED", TRUE);
		RefreshMuting(oPC, oInstrument);
	}
	
	else if (sAction == "LAG_TOGGLE")
	{
		if (TKL_NWNX4_NOT_INSTALLED)
		{
			SendMessageToPC(oPC, "This function is disabled on this server.");
			return;
		}
		if (iOption == 1)
		{
			SetLocalInt(oPC, "LAG_CHECK_ON", TRUE);
			float fLagCheck = GetLocalFloat(oPC, "LAG_CHECK");
			if (fLagCheck <= 0.01f)
			{
				RefreshRecordPane(oPC, oInstrument);
				string sStop = StopTimer(oInstrument, "PLAYBACK");
				StartTimer(oInstrument, "PLAYBACK");
				PlaySound("tkl_performer_lag_check");
				SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "LagCheckPane", FALSE);
			}
			RefreshRecordPane(oPC, oInstrument);
		}
		else if (iOption == 0)
		{
			DeleteLocalInt(oPC, "LAG_CHECK_ON");
			RefreshRecordPane(oPC, oInstrument);
		}		
	}

	else if (sAction == "RECORD_PANE")
	{
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "RecordPane", FALSE);
		PassTKLParameters(oPC, sAction, iOption);
		RefreshRecordPane(oPC, oInstrument);
	}
	
	else if (sAction == "QUANTIZE_PANE")
	{
		string sTrack = IntToString(iOption);
		int iTempo = GetLocalInt(oInstrument, "METRONOME_RECORDED_TRACK" + sTrack);
		if (iTempo == 0)
		{
			SendMessageToPC(oPC, "Sorry, you can only quantize tracks that were recorded with the metronome on.");
			return;
		}
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "QuantizePane", FALSE);
		PassTKLParameters(oPC, sAction, iOption);
	}
	
	else if (sAction == "LYRIC_PANE")
	{
		DisplayGuiScreen(oPC, "TKL_PERFORMER_LYRICS", FALSE, "tkl_performer_lyrics.xml");
		RefreshLyrics(oPC, oInstrument);
	}
	
	else if (sAction == "COPY")
	{
		int iDestinationTrack = GetLocalInt(oInstrument, "COPY_TO_TRACK");
		if (iDestinationTrack == 0)
			iDestinationTrack = 1;
		
		int iSourceTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
		int bDeleteSource = GetLocalInt(oInstrument, "DELETE_SOURCE");
		float fCopyFrom = GetLocalFloat(oInstrument, "COPY_FROM");
		float fPasteTo = GetLocalFloat(oInstrument, "PASTE_TO");
		string sSourceTrack = IntToString(iSourceTrack);
		string sDestinationTrack = IntToString(iDestinationTrack);
		int iSourceNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sSourceTrack);
		int iDestinationNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sDestinationTrack);
		SetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sDestinationTrack, iSourceNotes + iDestinationNotes);
		float fDelay;
		
		while (iSourceNotes > 0)
		{
			fDelay = GetLocalFloat(oInstrument, "NOTE" + IntToString(iSourceNotes) + "PLAYBACK_TRACK" + sSourceTrack);
			if (fDelay >= fCopyFrom)
			{
				SetLocalInt(oInstrument, "NOTE" + IntToString(iSourceNotes + iDestinationNotes) + "PITCH_TRACK" + sDestinationTrack,
					GetLocalInt(oInstrument, "NOTE" + IntToString(iSourceNotes) + "PITCH_TRACK" + sSourceTrack));
				SetLocalFloat(oInstrument, "NOTE" + IntToString(iSourceNotes + iDestinationNotes) + "PLAYBACK_TRACK" + sDestinationTrack,
					fDelay + fPasteTo);
				if (bDeleteSource)
					DeleteNote(oInstrument, iSourceTrack, iSourceNotes);
			}
			else
				DeleteNote(oInstrument, iDestinationTrack, iSourceNotes);
			iSourceNotes--;
		}
		SortNotes(oPC, oInstrument, iDestinationTrack);
		ClearTKLPerformerVariables(oPC);
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "CopyPane", TRUE);
		SetLocalFloat(oInstrument, "SONG_LENGTH", GetSongLength(oInstrument));
		SendMessageToPC(oPC, "Copy successful.");
	}
	
	else if (sAction == "COPY_PANE")
	{
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "CopyPane", FALSE);
		PassTKLParameters(oPC, sAction, iOption);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "CopyTopText", -1, "Copy Track " + IntToString(iOption) + " to:");
		int iTrack;
		string sTrack, sName;
		for (iTrack=1; iTrack<=4; iTrack++)
		{
			sTrack = IntToString(iTrack);
			sName = GetLocalString(oInstrument, "TRACK_" + sTrack + "_NAME");
			if (sName == "")
				sName = "Track " + sTrack;
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "CopyTrackText" + sTrack, -1, "(" + sName + ")");
		}
		RefreshCopyPane(oPC, oInstrument);
	}
	
	else if (sAction == "NOTE_PANE")
	{
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "NotePane", FALSE);
		PassTKLParameters(oPC, sAction, iOption);
		RefreshNotePane(oPC, oInstrument);
	}
	
	else if (sAction == "COPY_SETTINGS")
	{
		if (iOption > 0 && iOption < 5)
		{
			SetLocalInt(oInstrument, "COPY_TO_TRACK", iOption);
			return;
		}
		else if (iOption == 5)
		{
			SetLocalInt(oInstrument, "DELETE_SOURCE", TRUE);
		}
		else if (iOption == 6)
		{
			DeleteLocalInt(oInstrument, "DELETE_SOURCE");
		}
		else
		{
			float fAdjust;
			string sSetting;
			switch (iOption)
			{
				case 7:	fAdjust = 0.1f; sSetting = "COPY_FROM"; break;
				case 8:	fAdjust = 3.0f;	sSetting = "COPY_FROM"; break;
				case 9:	fAdjust = -0.1f; sSetting = "COPY_FROM"; break;
				case 10:	fAdjust = -3.0f; sSetting = "COPY_FROM"; break;
				case 11:fAdjust = 0.1f; sSetting = "PASTE_TO"; break;
				case 12:fAdjust = 3.0f; sSetting = "PASTE_TO"; break;
				case 13:fAdjust = -0.1f; sSetting = "PASTE_TO"; break;
				case 14:fAdjust = -3.0f; sSetting = "PASTE_TO"; break;
			}
			float fCurrent = GetLocalFloat(oInstrument, sSetting);
			if (fCurrent + fAdjust < 0.0f)
			{
				fAdjust = 0.0f;
				fCurrent = 0.0f;
			}
			SetLocalFloat(oInstrument, sSetting, fCurrent + fAdjust);
			RefreshCopyPane(oPC, oInstrument);
		}
	}
	
	else if (sAction == "NOTE_SETTINGS")
	{
		int iCurrentAdjust;
		float fCurrentAdjust;
		switch (iOption)
		{
			case 1:
				iCurrentAdjust = GetLocalInt(oInstrument, "EDIT_PITCH");
				SetLocalInt(oInstrument, "EDIT_PITCH", iCurrentAdjust + 1);
				break;
			case 2:
				iCurrentAdjust = GetLocalInt(oInstrument, "EDIT_PITCH");
				SetLocalInt(oInstrument, "EDIT_PITCH", iCurrentAdjust + 3);
				break;
			case 3:
				iCurrentAdjust = GetLocalInt(oInstrument, "EDIT_PITCH");
				SetLocalInt(oInstrument, "EDIT_PITCH", iCurrentAdjust - 1);
				break;
			case 4:
				iCurrentAdjust = GetLocalInt(oInstrument, "EDIT_PITCH");
				SetLocalInt(oInstrument, "EDIT_PITCH", iCurrentAdjust - 3);
				break;
			case 5:
				fCurrentAdjust = GetLocalFloat(oInstrument, "EDIT_TIME");
				SetLocalFloat(oInstrument, "EDIT_TIME", fCurrentAdjust + 0.1f);
				break;
			case 6:
				fCurrentAdjust = GetLocalFloat(oInstrument, "EDIT_TIME");
				SetLocalFloat(oInstrument, "EDIT_TIME", fCurrentAdjust + 3.0f);
				break;
			case 7:
				fCurrentAdjust = GetLocalFloat(oInstrument, "EDIT_TIME");
				SetLocalFloat(oInstrument, "EDIT_TIME", fCurrentAdjust - 0.1f);
				break;
			case 8:
				fCurrentAdjust = GetLocalFloat(oInstrument, "EDIT_TIME");
				SetLocalFloat(oInstrument, "EDIT_TIME", fCurrentAdjust - 3.0f);
				break;
		}
		RefreshNotePane(oPC, oInstrument);
	}
	
	else if (sAction == "NOTE_EDIT")
	{
		int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
		string sTrack = IntToString(iTrack);
		int iNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack);
		string sID = "NOTE" + IntToString(iNote) + "PITCH_TRACK" + sTrack;
		int iPitch = GetLocalInt(oInstrument, sID);
		int iNewPitch;
		int iKey = GetLocalInt(oInstrument, "KEY");
		switch (iOption)
		{
			// Delete note
			case 1:
				PassTKLParameters(oPC, "DELETE_NOTE", iTrack);
				DisplayMessageBox(oPC, 0, "Are you sure you want to delete this note?", "gui_tkl_performer_message", "gui_tkl_performer_cancel", TRUE);
				break;
			// Edit pitch
			case 2:
				PassTKLParameters(oPC, "NOTE_EDIT_PITCH", iTrack);
				DisplayMessageBox(oPC, 0, "Are you sure you want to adjust this note's pitch?", "gui_tkl_performer_message", "", TRUE);
				break;
			// Edit time
			case 3:
				PassTKLParameters(oPC, "NOTE_EDIT_TIME", iTrack);
				DisplayMessageBox(oPC, 0, "Are you sure you want to adjust this note's time?", "gui_tkl_performer_message", "", TRUE);
				break;
			// Toggle primary variation (short/long soft/loud etc.)
			case 4:
				iNewPitch = TogglePrimaryVariation(iPitch);
				PlayNote(iNewPitch, iKey);
				SetLocalInt(oInstrument, sID, iNewPitch);
				RefreshNotePane(oPC, oInstrument);
				break;
			// Toggle secondary variation (major/minor/half-diminished, percussion variations)
			case 5:
				iNewPitch = ToggleSecondaryVariation(iPitch);
				PlayNote(iNewPitch, iKey);
				SetLocalInt(oInstrument, sID, iNewPitch);
				RefreshNotePane(oPC, oInstrument);
				break;
		}
	}	
}