/*
Script:
Author: brockfanning
Date: Early 2008...
Purpose: This script the key functions for the TKL performer that are used in
multiple scripts.  If any of these functions are only used in one script, they
should probably be moved to that script.

5/31/08: Many bugs fixed... brockfanning
6/11/08: added offset constants for rolled notes
*/

// Various color constants for the buttons.
const string sColor = "<color=orange>";
const string sEndColor = "</color>";
const string sMinorEndColor = "m</color>";
const string sDimEndColor = "*</color>";
const string sMinorEnd = "m";

// The name of the main GUI screen
const string TKL_PERFORMER_SCREEN = "TKL_PERFORMER";
// The name of the Obsidian database, which will appear in the server's
// My Documents/Neverwinter Nights 2/database folder.
const string TKL_PERFORMER_DATABASE = "tkl_performer";
// A small time-offset to apply to rolled chords, when using Quantize or Write. 
const float TKL_CHORD_ROLL_OFFSET =	0.25f;
// A small time-offset to apply to drum rolls, when using Quantize or Write.
const float TKL_DRUM_ROLL_OFFSET = 	0.12f;

#include "nwnx_time"
#include "tkl_performer_settings"

// Determine the length of the song, given its current speed.
float GetSongLength(object oInstrument);
// Return the same chord in a different key.
int TransposeChord(int iChord, int iNewKey);
// Play a note in a key, for all PCs to hear.
void PlayNote(int iNote, int iKey);
// Clear certain variables that are used to pass parameters between scripts.
void ClearTKLPerformerVariables(object oPC);
// Refresh the Lyrics buttons on the GUI.
void RefreshLyrics(object oPC, object oInstrument, int bUsePerform = TRUE);
// Refresh the Track and Song names on the GUI.
void RefreshNames(object oPC, object oInstrument);
// Refresh the songlist for the Load and Save buttons on the GUI.
void RefreshSongList(object oPC);
// Assign correct note names, given the major or minor key.
void SetNoteNames(object oPC, int bMinor, string s1, string s2, string s3, string s4, string s5, string s6, string s7);
// Refresh the note names on the GUI.
void RefreshNoteNames(object oPC, object oInstrument);
// Erase one track.
void EraseTrack(object oInstrument, int iTrack, int bEraseName=TRUE);
// Enable Play buttons, for after a song is finished playing.
void EnableButtons(object oPC, object oInstrument);
// Disable Play buttons, for while a song is playing.
void DisableButtons(object oPC, object oInstrument, int bPreview=FALSE);
// Play the "lyric track".
void PlayLyrics(object oPC, object oInstrument, int bPreview=FALSE, int bIgnoreTempo=FALSE);
// Play one track.
void PlayTrack(object oPC, object oInstrument, int iTrack, int bIgnoreKey=FALSE, int bIgnoreTempo=FALSE, int bDisableButtons=FALSE, int bPreview=FALSE);
// Play all tracks.
void PlaySong(object oPC, object oInstrument, int iExcludeTrack=0, int bLyrics=FALSE, int bIgnoreKey=FALSE, int bIgnoreTempo=FALSE, int bPreview=FALSE);
// Record one track.
void RecordTrack(object oPC, object oInstrument, int iTrack);
// Play Metronome clicks.
void PlayMetronome(object oPC, int iTempo, int iSeconds);
// Set up certain variables for passing parameters between scripts.
void PassTKLParameters(object oPC, string sAction, int iOption);
// Erase the "lyric track".
void EraseLyricTrack(object oInstrument);
// Erase all saved lyrics.
void EraseLyrics(object oInstrument);
// Transfer the song from one item to another.
void TransferSong(object oInstrument, object oNew);
// Stop recording.
void StopRecording(object oPC, object oInstrument);
// Refresh the Record windown on the GUI.
void RefreshRecordPane(object oPC, object oInstrument);
// Refresh the Mute buttons on the GUI.
void RefreshMuting(object oPC, object oInstrument);
// Refresh the Mode buttons (Easy, Major/Minor) on the GUI.
void RefreshModes(object oPC, object oInstrument);
// Launch the system, for when a PC equips an instrument.
void LaunchTKLPerformer(object oPC, object oItem, string sGUIFile);
// Shut down the system, for when a PC closes the window.
void ShutDownTKLPerformer(object oPC, object oItem);
// Find the last note (longest delay) on a track, for sorting.
void FindLastNote(object oPC, object oInstrument, int iTrack);
// Clean up track after sorting.
void FinalizeNoteSorting(object oPC, object oInstrument, int iTrack);
// Re-sort all notes in a track from first (shortest delay) to last (longest delay).
void SortNotes(object oPC, object oInstrument, int iTrack);
// Return a name for a pitch number, based on instrument type.
string GetNoteName(int iPitch);
// Refresh the Copy window in the GUI.
void RefreshCopyPane(object oPC, object oInstrument);
// Clear some lingering variables.
void ResetExpiringVariables(object oPC, object oInstrument);
// Refresh the Note window in the GUI.
void RefreshNotePane(object oPC, object oInstrument);
// Delete one note.
void DeleteNote(object oInstrument, int iTrack, int iNote);
// Return the maximum speed a PC can set the song.
int GetMaximumSpeed(object oPC);


float GetSongLength(object oInstrument)
{
	float fSongLength, fTrackLength;
	int iTrack, iTotalNotes;
	int iTempo = GetLocalInt(oInstrument, "TEMPO");
	if (iTempo == 0)
		iTempo = 100;
	float fTempo = IntToFloat(iTempo) * 0.01f;
	string sTrack;
	for (iTrack = 1; iTrack <= 4; iTrack++)
	{
		sTrack = IntToString(iTrack);
		iTotalNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
		if (iTotalNotes > 0)
		{
			fTrackLength = GetLocalFloat(oInstrument, "NOTE" + IntToString(iTotalNotes) +
				"PLAYBACK_TRACK" + sTrack);
			fTrackLength *= fTempo;
			if (fSongLength < fTrackLength)
				fSongLength = fTrackLength;
		}
	}
	iTotalNotes = GetLocalInt(oInstrument, "LYRICS_RECORDED");
	if (iTotalNotes > 0)
	{
		fTrackLength = GetLocalFloat(oInstrument, "LYRIC" + IntToString(iTotalNotes) + "PLAYBACK");
		fTrackLength *= fTempo;
		if (fSongLength < fTrackLength)
			fSongLength = fTrackLength;
	}
	return fSongLength;
}

int TransposeChord(int iChord, int iNewKey)
{
	if (iNewKey == 0)
		return iChord;
	int iNewChord = iChord + iNewKey;
	// get the correct pitch of high chords
	if ((iChord < 113 && iNewChord > 112) || 
		(iChord < 163 && iNewChord > 162) ||
		(iChord < 125 && iNewChord > 124) ||
		(iChord < 175 && iNewChord > 174) ||
		(iChord < 137 && iNewChord > 136) ||
		(iChord < 187 && iNewChord > 186))
		iNewChord -= 12;
	
	return iNewChord;
}

void PlayNote(int iNote, int iKey)
{
	// transpose chords
	if (iNote > 100 && iNote < 200)
		iNote = TransposeChord(iNote, iKey);
	// don't transpose percussion
	else if ((iNote > 300 && iNote < 321) || (iNote > 350 && iNote < 371))
		iKey = 0;
	// transpose everything else
	else
		iNote = iNote + iKey;
	string sNote = "tkl_performer_" + IntToString(iNote);
	PlaySound(sNote);
}

void ClearTKLPerformerVariables(object oPC)
{
	DeleteLocalInt(oPC, "TKL_PERFORMER_OPTION");
	DeleteLocalString(oPC, "TKL_PERFORMER_ACTION");
}

void RefreshLyrics(object oPC, object oInstrument, int bUsePerform = TRUE)
{
	int iPerform = GetPerform(oPC);
	if (TKL_PERFORM_AFFECTS_LYRICS && bUsePerform)
		iPerform *= TKL_LYRICS_PER_PERFORM_POINT;
	else
		iPerform = 65;
	int i;
	string sButton;
	string sText;
	for (i = 1; i <= 64; i++)
	{
		sButton = IntToString(i);
		if (i > iPerform)
		{
			SetGUIObjectText(oPC, "TKL_PERFORMER_LYRICS", "Lyric" + sButton + "Button", 0, "[Unavailable Slot]");	
			SetGUIObjectDisabled(oPC, "TKL_PERFORMER_LYRICS", "Lyric" + sButton + "Button", TRUE);
		}
		else
		{
			sText = GetStringLeft(GetLocalString(oInstrument, "LYRIC" + sButton), 15);
			if (sText == "")
				sText = "[Empty Slot]";
			SetGUIObjectText(oPC, "TKL_PERFORMER_LYRICS", "Lyric" + sButton + "Button", 0, sText);	
			SetGUIObjectDisabled(oPC, "TKL_PERFORMER_LYRICS", "Lyric" + sButton + "Button", FALSE);		
		}
	} 

}

void RefreshNames(object oPC, object oInstrument)
{
	string sSongName = GetLocalString(oInstrument, "SONG_NAME");
	if (sSongName == "")
	{
		sSongName = "Untitled";
		SetLocalString(oInstrument, "SONG_NAME", "Untitled");
	}
	string sTrack1Name = GetLocalString(oInstrument, "TRACK_1_NAME");
	if (sTrack1Name == "")
	{
		sTrack1Name = "Track 1";
		SetLocalString(oInstrument, "TRACK_1_NAME", "Track 1");
	}
	string sTrack2Name = GetLocalString(oInstrument, "TRACK_2_NAME");
	if (sTrack2Name == "")
	{
		sTrack2Name = "Track 2";
		SetLocalString(oInstrument, "TRACK_2_NAME", "Track 2");
	}
	string sTrack3Name = GetLocalString(oInstrument, "TRACK_3_NAME");
	if (sTrack3Name == "")
	{
		sTrack3Name = "Track 3";
		SetLocalString(oInstrument, "TRACK_3_NAME", "Track 3");
	}
	string sTrack4Name = GetLocalString(oInstrument, "TRACK_4_NAME");
	if (sTrack4Name == "")
	{
		sTrack4Name = "Track 4";
		SetLocalString(oInstrument, "TRACK_4_NAME", "Track 4");
	}
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "SongButton", -1, sSongName);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorSongButton", -1, sSongName);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasySongButton", -1, sSongName);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LiveSongButton", -1, sSongName);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorSongButton", -1, sSongName);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyLiveSongButton", -1, sSongName);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorLiveSongButton", -1, sSongName);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorLiveSongButton", -1, sSongName);
	
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Track1Button", -1, sTrack1Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorTrack1Button", -1, sTrack1Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyTrack1Button", -1, sTrack1Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LiveTrack1Button", -1, sTrack1Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorTrack1Button", -1, sTrack1Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyLiveTrack1Button", -1, sTrack1Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorLiveTrack1Button", -1, sTrack1Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorLiveTrack1Button", -1, sTrack1Name);
	
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Track2Button", -1, sTrack2Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorTrack2Button", -1, sTrack2Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyTrack2Button", -1, sTrack2Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LiveTrack2Button", -1, sTrack2Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorTrack2Button", -1, sTrack2Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyLiveTrack2Button", -1, sTrack2Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorLiveTrack2Button", -1, sTrack2Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorLiveTrack2Button", -1, sTrack2Name);
	
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Track3Button", -1, sTrack3Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorTrack3Button", -1, sTrack3Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyTrack3Button", -1, sTrack3Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LiveTrack3Button", -1, sTrack3Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorTrack3Button", -1, sTrack3Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyLiveTrack3Button", -1, sTrack3Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorLiveTrack3Button", -1, sTrack3Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorLiveTrack3Button", -1, sTrack3Name);
	
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Track4Button", -1, sTrack4Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorTrack4Button", -1, sTrack4Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyTrack4Button", -1, sTrack4Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LiveTrack4Button", -1, sTrack4Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorTrack4Button", -1, sTrack4Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyLiveTrack4Button", -1, sTrack4Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "EasyMinorLiveTrack4Button", -1, sTrack4Name);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorLiveTrack4Button", -1, sTrack4Name);
}

void RefreshSongList(object oPC)
{
	int iMaxSongs = GetPerform(oPC);
	if (TKL_PERFORM_AFFECTS_SONGS)
		iMaxSongs = FloatToInt(IntToFloat(iMaxSongs) * TKL_SONGS_PER_PERFORM_POINT);
	else
		iMaxSongs = 11;
	string sName, sSong;
	int i, bDisable;
	for (i=1; i<=10; i++)
	{
		if (i > iMaxSongs)
		{
			bDisable = TRUE;
			sName = "[Unavailable Slot: You need more Perform ranks]";
		}
		else
		{
			bDisable = FALSE;
			sName = GetCampaignString(TKL_PERFORMER_DATABASE, "TKL_PERFORMER_SONG_NAME" + IntToString(i), oPC);
			if (sName == "")
				sName = "[Empty Slot]";
		}
		sSong = IntToString(i);
		SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Load" + sSong + "Button", bDisable);
		SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Save" + sSong + "Button", bDisable);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Load" + sSong + "Button", -1, sName);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Save" + sSong + "Button", -1, sName);
	}
}

void SetNoteNames(object oPC, int bMinor, string s1, string s2, string s3, string s4, string s5, string s6, string s7)
{
	string sPrefix;
	object oInstrument = GetLocalObject(oPC, "TKL_PERFORMER_INSTRUMENT");
	if (GetLocalInt(oInstrument, "EASY_MODE"))
		sPrefix += "Easy";
	if (GetLocalInt(oInstrument, "MINOR_MODE"))
		sPrefix += "Minor";
	if (!GetLocalInt(oInstrument, "RECORD_MODE"))
		sPrefix += "Live";			

	// Set names for Major keys	
	if (bMinor == FALSE)
	{
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note1", -1, s1);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note2", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note3", -1, s2);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note4", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note5", -1, s3);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note6", -1, s4);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note7", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note8", -1, s5);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note9", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note10", -1, s6);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note11", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note12", -1, s7);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note12b", -1, s1);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note13", -1, s1);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note14", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note15", -1, s2);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note16", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note17", -1, s3);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note18", -1, s4);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note19", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note20", -1, s5);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note21", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note22", -1, s6);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note23", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note24", -1, s7);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note24b", -1, s1);
		
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord1", -1, sColor + s1 + sEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord2", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord3", -1, s2);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord4", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord5", -1, s3);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord6", -1, sColor + s4 + sEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord7", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord8", -1, sColor + s5 + sEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord9", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord10", -1, s6);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord11", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord12", -1, s7);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord13", -1, s1 + sMinorEnd);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord14", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord15", -1, sColor + s2 + sMinorEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord16", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord17", -1, sColor + s3 + sMinorEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord18", -1, s4 + sMinorEnd);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord19", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord20", -1, s5 + sMinorEnd);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord21", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord22", -1, sColor + s6 + sMinorEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord23", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord24", -1, sColor + s7 + sDimEndColor);
	}
	// Or set names for Minor keys
	else
	{	
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note1", -1, s1);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note2", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note3", -1, s2);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note4", -1, s3);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note5", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note6", -1, s4);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note7", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note8", -1, s5);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note9", -1, s6);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note10", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note11", -1, s7);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note12", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note12b", -1, s1);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note13", -1, s1);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note14", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note15", -1, s2);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note16", -1, s3);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note17", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note18", -1, s4);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note19", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note20", -1, s5);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note21", -1, s6);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note22", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note23", -1, s7);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note24", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Note24b", -1, s1);
		
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord1", -1, s1);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord2", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord3", -1, s2);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord4", -1, sColor + s3 + sEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord5", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord6", -1, s4);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord7", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord8", -1, sColor + s5 + sEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord9", -1, sColor + s6 + sEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord10", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord11", -1, sColor + s7 + sEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord12", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord13", -1, sColor + s1 + sMinorEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord14", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord15", -1, sColor + s2 + sDimEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord16", -1, s3 + sMinorEnd);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord17", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord18", -1, sColor + s4 + sMinorEndColor);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord19", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord20", -1, s5 + sMinorEnd);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord21", -1, s6 + sMinorEnd);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord22", -1, "");
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord23", -1, s7 + sMinorEnd);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, sPrefix + "Chord24", -1, "");
	}
}


void RefreshNoteNames(object oPC, object oInstrument)
{
	int iKey = GetLocalInt(oInstrument, "KEY");
	int iMinorMode = GetLocalInt(oInstrument, "MINOR_MODE");
	switch (iKey)
	{
		case 0:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "C", "D", "E", "F", "G", "A", "B");
			else
				SetNoteNames(oPC, TRUE, "C", "D", "Eb", "F", "G", "Ab", "Bb");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "C");
			break;
		case 1:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "Db", "Eb", "F", "Gb", "Ab", "Bb", "C");
			else
				SetNoteNames(oPC, TRUE, "C#", "D#", "E", "F#", "G#", "A", "B");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "Db");
			break;
		case 2:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "D", "E", "F#", "G", "A", "B", "C#");
			else
				SetNoteNames(oPC, TRUE, "D", "E", "F", "G", "A", "Bb", "C");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "D");
			break;
		case 3:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "Eb", "F", "G", "Ab", "Bb", "C", "D");
			else
				SetNoteNames(oPC, TRUE, "Eb", "F", "Gb", "Ab", "Bb", "Cb", "Db");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "Eb");
			break;
		case 4:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "E", "F#", "G#", "A", "B", "C#", "D#");
			else
				SetNoteNames(oPC, TRUE, "E", "F#", "G", "A", "B", "C", "D");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "E");
			break;
		case 5:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "F", "G", "A", "Bb", "C", "D", "E");
			else
				SetNoteNames(oPC, TRUE, "F", "G", "Ab", "Bb", "C", "Db", "Eb");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "F");
			break;
		case 6:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "Gb", "Ab", "Bb", "Cb", "Db", "Eb", "F");
			else
				SetNoteNames(oPC, TRUE, "F#", "G#", "A", "B", "C#", "D", "E");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "Gb");
			break;
		case 7:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "G", "A", "B", "C", "D", "E", "F#");
			else
				SetNoteNames(oPC, TRUE, "G", "A", "Bb", "C", "D", "Eb", "F");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "G");
			break;
		case 8:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "Ab", "Bb", "C", "Db", "Eb", "F", "G");
			else
				SetNoteNames(oPC, TRUE, "Ab", "Bb", "Cb", "Db", "Eb", "Fb", "Gb");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "Ab");
			break;
		case 9:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "A", "B", "C#", "D", "E", "F#", "G#");
			else
				SetNoteNames(oPC, TRUE, "A", "B", "C", "D", "E", "F", "G");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "A");
			break;
		case 10:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "Bb", "C", "D", "Eb", "F", "G", "A");
			else
				SetNoteNames(oPC, TRUE, "Bb", "C", "Db", "Eb", "F", "Gb", "Ab");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "Bb");
			break;
		case 11:
			if (iMinorMode == FALSE)
				SetNoteNames(oPC, FALSE, "B", "C#", "D#", "E", "F#", "G#", "A#");
			else
				SetNoteNames(oPC, TRUE, "B", "C#", "D", "E", "F#", "G", "A");
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "KeyButton", -1, "B");
			break;
			
	}
}

void EraseTrack(object oInstrument, int iTrack, int bEraseName=TRUE)
{
	string sTrack = IntToString(iTrack);
	int iTotalNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	string sID;
	while (iTotalNotes > 0)
	{
		sID = "NOTE" + IntToString(iTotalNotes);
		DeleteLocalInt(oInstrument, sID + "PITCH_TRACK" + sTrack);
		DeleteLocalFloat(oInstrument, sID + "PLAYBACK_TRACK" + sTrack);
		iTotalNotes--;
	}
	DeleteLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	if (bEraseName)
		DeleteLocalString(oInstrument, "TRACK_" + sTrack + "_NAME");
	DeleteLocalFloat(oInstrument, "OFFSET" + sTrack);
	DeleteLocalInt(oInstrument, "METRONOME_RECORDED_TRACK" + sTrack);
	DeleteLocalString(oInstrument, "WRITE_TRACK" + sTrack);
	SetLocalFloat(oInstrument, "SONG_LENGTH", GetSongLength(oInstrument));
}

void EnableButtons(object oPC, object oInstrument)
{
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "SongPlayButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track1PlayButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track2PlayButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track3PlayButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track4PlayButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "SongPreviewButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track1RecordButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track2RecordButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track3RecordButton", FALSE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track4RecordButton", FALSE);
}

void DisableButtons(object oPC, object oInstrument, int bPreview=FALSE)
{
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "SongPlayButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track1PlayButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track2PlayButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track3PlayButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track4PlayButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "SongPreviewButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track1RecordButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track2RecordButton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track3Recordutton", TRUE);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "Track4RecordButton", TRUE);
	float fDelay = GetLocalFloat(oInstrument, "SONG_LENGTH");
	if (bPreview && fDelay > TKL_PREVIEW)
		fDelay = TKL_PREVIEW;
	DelayCommand(fDelay, EnableButtons(oPC, oInstrument));
}

void PlayLyrics(object oPC, object oInstrument, int bPreview=FALSE, int bIgnoreTempo=FALSE)
{
	if (GetLocalInt(oInstrument, "LYRICS_MUTED"))
	{
		SendMessageToPC(oPC, "Lyrics muted.");
		return;
	}
	int iLyricsRecorded = GetLocalInt(oInstrument, "LYRICS_RECORDED");
	int iLyricsSang = 1;
	int iTempo = GetLocalInt(oInstrument, "TEMPO");
	if (iTempo == 0)
		iTempo = 100;
	float fDelay;
	float fTempo;
	if (bIgnoreTempo == FALSE)
		fTempo = IntToFloat(iTempo) * 0.01f;
	else
		fTempo = 1.0f;
	string sText;
	int iLyric;
	while (iLyricsSang <= iLyricsRecorded)
	{
		fDelay = GetLocalFloat(oInstrument, "LYRIC" + IntToString(iLyricsSang) + "PLAYBACK");
		fDelay *= fTempo;
		if (bPreview == TRUE && fDelay > TKL_PREVIEW)
			iLyricsSang = iLyricsRecorded + 1;
		iLyric = GetLocalInt(oInstrument, "LYRIC" + IntToString(iLyricsSang) + "TEXT");
		sText = GetLocalString(oInstrument, "LYRIC" + IntToString(iLyric));
		DelayCommand(fDelay, SpeakString(sText));
		iLyricsSang++;
	}
}

void PlayTrack(object oPC, object oInstrument, int iTrack, int bIgnoreKey=FALSE, int bIgnoreTempo=FALSE, int bDisableButtons=FALSE, int bPreview=FALSE)
{
	int iKey = GetLocalInt(oInstrument, "KEY");
	if (bIgnoreKey == TRUE)
		iKey = 0;
	int iTempo = GetLocalInt(oInstrument, "TEMPO");
	if (iTempo == 0)
		iTempo = 100;
	float fTempo;
	if (bIgnoreTempo == FALSE)
		fTempo = IntToFloat(iTempo) * 0.01f;
	else
		fTempo = 1.0f;
	float fDelay;
	string sTrack = IntToString(iTrack);
	if (GetLocalInt(oInstrument, "TRACK" + sTrack + "MUTE"))
	{
		SendMessageToPC(oPC, "Track " + sTrack + " muted.");
		return;
	}
	int iTotalNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	int iNotesPlayed = 1;
	int iNote;
	while (iNotesPlayed <= iTotalNotes)
	{
		fDelay = GetLocalFloat(oInstrument, "NOTE" + IntToString(iNotesPlayed) + 
			"PLAYBACK_TRACK" + sTrack);
		iNote = GetLocalInt(oInstrument, "NOTE" + IntToString(iNotesPlayed) +
			"PITCH_TRACK" + sTrack);
		fDelay *= fTempo;
		if (bPreview == TRUE && fDelay > TKL_PREVIEW)
			iNotesPlayed = iTotalNotes + 1;
		DelayCommand(fDelay, PlayNote(iNote, iKey));
		iNotesPlayed++;
	}
	if (bDisableButtons)
	{
		DisableButtons(oPC, oInstrument, bPreview);
	}
		
}

void PlaySong(object oPC, object oInstrument, int iExcludeTrack=0, int bLyrics=FALSE, int bIgnoreKey=FALSE, int bIgnoreTempo=FALSE, int bPreview=FALSE)
{
	int i;
	for (i=1; i<=4; i++)
	{
		if (i != iExcludeTrack) PlayTrack(oPC, oInstrument, i, bIgnoreKey, bIgnoreTempo, FALSE, bPreview);
	}
	if (bLyrics)
		PlayLyrics(oPC, oInstrument, bPreview, bIgnoreTempo);
	DisableButtons(oPC, oInstrument, bPreview);
}

void RecordTrack(object oPC, object oInstrument, int iTrack)
{
	if (GetLocalString(oInstrument, "ORIGINAL_COMPOSER") == "")
		SetLocalString(oInstrument, "ORIGINAL_COMPOSER", GetName(oPC));
	EraseTrack(oInstrument, iTrack, FALSE);
	SetLocalInt(oInstrument, "RECORD_MODE", TRUE);
	RefreshModes(oPC, oInstrument);
	StartTimer(oInstrument, "PLAYBACK");		
	DeleteLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + IntToString(iTrack));
	SendMessageToPC(oPC, "Recording started.");
	SetLocalInt(oInstrument, "RECORDING_TRACK", iTrack);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "StopRecordingPane", FALSE);
}

void PlayMetronome(object oPC, int iTempo, int iSeconds)
{
	float fTick = 60.0f / IntToFloat(iTempo);
	float fDelay;
	while (fDelay < IntToFloat(iSeconds))
	{
		DelayCommand(fDelay, PlaySound("tkl_performer_metronome"));
		fDelay += fTick;	
	}
}

void PassTKLParameters(object oPC, string sAction, int iOption)
{
	SetLocalInt(oPC, "TKL_PERFORMER_OPTION", iOption);
	SetLocalString(oPC, "TKL_PERFORMER_ACTION", sAction);
}

void EraseLyricTrack(object oInstrument)
{
	int iTotalLyrics = GetLocalInt(oInstrument, "LYRICS_RECORDED");
	while (iTotalLyrics > 0)
	{
		DeleteLocalInt(oInstrument, "LYRIC" + IntToString(iTotalLyrics) + "TEXT");
		DeleteLocalFloat(oInstrument, "LYRIC" + IntToString(iTotalLyrics) + "PLAYBACK");
		iTotalLyrics--;
	}
	SetLocalFloat(oInstrument, "SONG_LENGTH", GetSongLength(oInstrument));
	DeleteLocalInt(oInstrument, "LYRICS_RECORDED");
}

void EraseLyrics(object oInstrument)
{
	int i;
	for (i=1; i<=64; i++)
	{
		DeleteLocalString(oInstrument, "LYRIC" + IntToString(i));
	}
	object oPC = GetItemPossessor(oInstrument);
	if (GetIsObjectValid(oPC))
		RefreshLyrics(oPC, oInstrument);
}

void TransferSong(object oInstrument, object oNew)
{
	if (!GetIsObjectValid(oInstrument) || !GetIsObjectValid(oNew))
	{
		return;
	}
	
	EraseTrack(oNew, 4);
	EraseTrack(oNew, 3);
	EraseTrack(oNew, 2);
	EraseTrack(oNew, 1);
	DeleteLocalString(oNew, "SONG_NAME");
	//EraseLyrics(oNew);
	EraseLyricTrack(oNew);
	//DeleteLocalInt(oNew, "KEY");
	//DeleteLocalInt(oNew, "TEMPO");
	//DeleteLocalString(oNew, "ORIGINAL_COMPOSER");
	
	SetLocalInt(oNew, "EASY_MODE", GetLocalInt(oInstrument, "EASY_MODE"));
	SetLocalInt(oNew, "MINOR_MODE", GetLocalInt(oInstrument, "MINOR_MODE"));
	SetLocalInt(oNew, "RECORD_MODE", GetLocalInt(oInstrument, "RECORD_MODE"));
	SetLocalInt(oNew, "KEY", GetLocalInt(oInstrument, "KEY"));
	SetLocalInt(oNew, "RECORDING_TRACK", GetLocalInt(oInstrument, "RECORDING_TRACK"));
	SetLocalInt(oNew, "NOTES_RECORDED_TRACK1", GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK1"));
	SetLocalInt(oNew, "NOTES_RECORDED_TRACK2", GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK2"));
	SetLocalInt(oNew, "NOTES_RECORDED_TRACK3", GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK3"));
	SetLocalInt(oNew, "NOTES_RECORDED_TRACK4", GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK4"));	
	SetLocalInt(oNew, "METRONOME_RECORDED_TRACK1", GetLocalInt(oInstrument, "METRONOME_RECORDED_TRACK1"));
	SetLocalInt(oNew, "METRONOME_RECORDED_TRACK2", GetLocalInt(oInstrument, "METRONOME_RECORDED_TRACK2"));
	SetLocalInt(oNew, "METRONOME_RECORDED_TRACK3", GetLocalInt(oInstrument, "METRONOME_RECORDED_TRACK3"));
	SetLocalInt(oNew, "METRONOME_RECORDED_TRACK4", GetLocalInt(oInstrument, "METRONOME_RECORDED_TRACK4"));
	SetLocalInt(oNew, "TEMPO", GetLocalInt(oInstrument, "TEMPO"));
	SetLocalInt(oNew, "OFFSET1", GetLocalInt(oInstrument, "OFFSET1"));
	SetLocalInt(oNew, "OFFSET2", GetLocalInt(oInstrument, "OFFSET2"));
	SetLocalInt(oNew, "OFFSET3", GetLocalInt(oInstrument, "OFFSET3"));
	SetLocalInt(oNew, "OFFSET4", GetLocalInt(oInstrument, "OFFSET4"));
	SetLocalString(oNew, "TRACK_1_NAME", GetLocalString(oInstrument, "TRACK_1_NAME"));
	SetLocalString(oNew, "TRACK_2_NAME", GetLocalString(oInstrument, "TRACK_2_NAME"));
	SetLocalString(oNew, "TRACK_3_NAME", GetLocalString(oInstrument, "TRACK_3_NAME"));
	SetLocalString(oNew, "TRACK_4_NAME", GetLocalString(oInstrument, "TRACK_4_NAME"));
	SetLocalString(oNew, "SONG_NAME", GetLocalString(oInstrument, "SONG_NAME"));
	SetLocalInt(oNew, "METRONOME", GetLocalInt(oInstrument, "METRONOME"));
	SetLocalInt(oNew, "METRONOME_ON", GetLocalInt(oInstrument, "METRONOME_ON"));
	SetLocalInt(oNew, "LYRICS_RECORDED", GetLocalInt(oInstrument, "LYRICS_RECORDED"));
	SetLocalFloat(oNew, "SONG_LENGTH", GetLocalFloat(oInstrument, "SONG_LENGTH"));
	SetLocalString(oNew, "ORIGINAL_COMPOSER", GetLocalString(oInstrument, "ORIGINAL_COMPOSER"));
	SetLocalInt(oNew, "CURRENT_NOTE_TRACK1", GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK1"));
	SetLocalInt(oNew, "CURRENT_NOTE_TRACK2", GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK2"));
	SetLocalInt(oNew, "CURRENT_NOTE_TRACK3", GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK3"));
	SetLocalInt(oNew, "CURRENT_NOTE_TRACK4", GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK4"));
	SetLocalString(oNew, "WRITE_TRACK1", GetLocalString(oInstrument, "WRITE_TRACK1"));
	SetLocalString(oNew, "WRITE_TRACK2", GetLocalString(oInstrument, "WRITE_TRACK2"));
	SetLocalString(oNew, "WRITE_TRACK3", GetLocalString(oInstrument, "WRITE_TRACK3"));
	SetLocalString(oNew, "WRITE_TRACK4", GetLocalString(oInstrument, "WRITE_TRACK4"));
	int i;
	string s;
	i = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK1");
	while (i > 0)
	{
		s = IntToString(i);
		SetLocalInt(oNew, "NOTE" + s + "PITCH_TRACK1", GetLocalInt(oInstrument, "NOTE" + s + "PITCH_TRACK1"));
		SetLocalFloat(oNew, "NOTE" + s + "PLAYBACK_TRACK1", GetLocalFloat(oInstrument, "NOTE" + s + "PLAYBACK_TRACK1"));
		i--;
	}
	
	i = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK2");
	while (i > 0)
	{
		s = IntToString(i);
		SetLocalInt(oNew, "NOTE" + s + "PITCH_TRACK2", GetLocalInt(oInstrument, "NOTE" + s + "PITCH_TRACK2"));
		SetLocalFloat(oNew, "NOTE" + s + "PLAYBACK_TRACK2", GetLocalFloat(oInstrument, "NOTE" + s + "PLAYBACK_TRACK2"));
		i--;
	}
	
	i = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK3");
	while (i > 0)
	{
		s = IntToString(i);
		SetLocalInt(oNew, "NOTE" + s + "PITCH_TRACK3", GetLocalInt(oInstrument, "NOTE" + s + "PITCH_TRACK3"));
		SetLocalFloat(oNew, "NOTE" + s + "PLAYBACK_TRACK3", GetLocalFloat(oInstrument, "NOTE" + s + "PLAYBACK_TRACK3"));
		i--;
	}
	
	i = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK4");
	while (i > 0)
	{
		s = IntToString(i);
		SetLocalInt(oNew, "NOTE" + s + "PITCH_TRACK4", GetLocalInt(oInstrument, "NOTE" + s + "PITCH_TRACK4"));
		SetLocalFloat(oNew, "NOTE" + s + "PLAYBACK_TRACK4", GetLocalFloat(oInstrument, "NOTE" + s + "PLAYBACK_TRACK4"));
		i--;
	}
	
	i = GetLocalInt(oInstrument, "LYRICS_RECORDED");
	while (i > 0)
	{
		s = IntToString(i);
		SetLocalInt(oNew, "LYRIC" + s + "TEXT", GetLocalInt(oInstrument, "LYRIC" + s + "TEXT"));
		SetLocalFloat(oNew, "LYRIC" + s + "PLAYBACK", GetLocalFloat(oInstrument, "LYRIC" + s + "PLAYBACK"));
		i--;
	}
	
	for (i=1; i<=64; i++)
	{
		s = IntToString(i);
		SetLocalString(oNew, "LYRIC" + s, GetLocalString(oInstrument, "LYRIC" + s));
	}
	
	object oPC = GetItemPossessor(oNew);
	if (GetIsObjectValid(oPC) && GetIsObjectValid(GetLocalObject(oPC, "TKL_PERFORMER_INSTRUMENT")))
	{
		RefreshLyrics(oPC, oNew);
		RefreshNames(oPC, oNew);
		RefreshNoteNames(oPC, oNew);
		RefreshModes(oPC, oNew);
		int iTempo = GetLocalInt(oNew, "TEMPO");
		if (iTempo == 0)
		{
			SetLocalInt(oNew, "TEMPO", 100);
			iTempo = 100;
		}
		int iMaxSpeed = GetMaximumSpeed(oPC);
		if (iTempo < (100 - iMaxSpeed))
			SetLocalInt(oNew, "TEMPO", 100 - iMaxSpeed);
		SetLocalFloat(oNew, "SONG_LENGTH", GetSongLength(oNew));
	}
}

void StopRecording(object oPC, object oInstrument)
{
	string sStop = StopTimer(oInstrument, "PLAYBACK");
	int iTrack = GetLocalInt(oInstrument, "RECORDING_TRACK");
	DeleteLocalInt(oInstrument, "RECORDING_TRACK");
	int bRecordingLyrics = GetLocalInt(oInstrument, "RECORDING_LYRICS");
	DeleteLocalInt(oInstrument, "RECORDING_LYRICS");
	string sTrack = IntToString(iTrack);
	float fLagCheck = GetLocalFloat(oPC, "LAG_CHECK");
	int bLagCheckOn = GetLocalInt(oPC, "LAG_CHECK_ON");
	float fCurrent;
	if (bLagCheckOn)
	{
		string sID;
		int iNotesRecorded;
		if (iTrack > 0)
			iNotesRecorded = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
		else if (bRecordingLyrics)
			iNotesRecorded = GetLocalInt(oInstrument, "LYRICS_RECORDED");
		while (iNotesRecorded > 0)
		{
			if (iTrack > 0)
			{
				sID = "NOTE" + IntToString(iNotesRecorded) + "PLAYBACK_TRACK" + sTrack;
				fCurrent = GetLocalFloat(oInstrument, sID);
				SetLocalFloat(oInstrument, sID, fCurrent - fLagCheck);
			}
			else if (bRecordingLyrics)
			{
				sID = "LYRIC" + IntToString(iNotesRecorded) + "PLAYBACK";
				fCurrent = GetLocalFloat(oInstrument, sID);
				SetLocalFloat(oInstrument, sID, fCurrent - fLagCheck);				
			}
			iNotesRecorded--;
		}
	}
	if (GetLocalInt(oInstrument, "METRONOME_ON") && iTrack > 0)
	{
		int iMetronome = GetLocalInt(oInstrument, "METRONOME");
		if (iMetronome == 0)
			iMetronome = 60;
		SetLocalInt(oInstrument, "METRONOME_RECORDED_TRACK" + sTrack, iMetronome);
	}
	else
		DeleteLocalInt(oInstrument, "METRONOME_RECORDED_TRACK" + sTrack);
		
	SendMessageToPC(oPC, "Recording stopped.");
	// check to see if the last note is the final note of the song
	SetLocalFloat(oInstrument, "SONG_LENGTH", GetSongLength(oInstrument));
	if (bRecordingLyrics)
		SetGUIObjectHidden(oPC, "TKL_PERFORMER_LYRICS", "StopRecordingPane", TRUE);
	else
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "StopRecordingPane", TRUE);
		
	DeleteLocalInt(oInstrument, "RECORD_MODE");
	RefreshModes(oPC, oInstrument);
}

void RefreshRecordPane(object oPC, object oInstrument)
{
	int bMetronomeOn = GetLocalInt(oInstrument, "METRONOME_ON");
	int bLagCheckOn = GetLocalInt(oPC, "LAG_CHECK_ON");
	int iMetronomeDuration = GetLocalInt(oInstrument, "METRONOME_DURATION");
	if (iMetronomeDuration == 0)
	{
		iMetronomeDuration = 60;
		SetLocalInt(oInstrument, "METRONOME_DURATION", 60);
	}
	int iMetronomeTempo = GetLocalInt(oInstrument, "METRONOME");
	if (iMetronomeTempo == 0)
	{
		iMetronomeTempo = 60;
		SetLocalInt(oInstrument, "METRONOME", 60);
	}
	float fLagCheck = GetLocalFloat(oPC, "LAG_CHECK");
	int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
	string sTrackName = GetLocalString(oInstrument, "TRACK_" + IntToString(iTrack) + "_NAME");
	if (sTrackName == "")
		sTrackName = "Track " + IntToString(iTrack);
	sTrackName = "<color=grey>" + sTrackName + "</color>";
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "RecordTrackName", -1, sTrackName);
	int bSwitch;
	if (bMetronomeOn)
	{
		bSwitch = FALSE;
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MetronomeStatus", -1, "<color=grey>(enabled)</color>");
	}
	else
	{
		bSwitch = TRUE;
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MetronomeStatus", -1, "<color=grey>(disabled)</color>");
	}	
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MetronomeTempoField", bSwitch);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MetronomeDurationField", bSwitch);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "MetronomeTempoUp", bSwitch);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "MetronomeTempoDown", bSwitch);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "MetronomeDurationUp", bSwitch);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "MetronomeDurationDown", bSwitch);
	if (bLagCheckOn)
	{
		bSwitch = FALSE;
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LagFixStatus", -1, "<color=grey>(enabled)</color>");
	}
	else
	{
		bSwitch = TRUE;
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LagFixStatus", -1, "<color=grey>(disabled)</color>");
	}
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "LagCheckInstructions", bSwitch);
	SetGUIObjectDisabled(oPC, TKL_PERFORMER_SCREEN, "LagCheckButton", bSwitch);
	
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MetronomeTempoField", -1, IntToString(iMetronomeTempo));
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MetronomeDurationField", -1, IntToString(iMetronomeDuration));
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "LagCheckButton", -1, FloatToString(fLagCheck, 4, 3));
}

void RefreshMuting(object oPC, object oInstrument)
{
	string s;
	int i;
	for (i=1; i<=4; i++)
	{
		s = IntToString(i);
		if (GetLocalInt(oInstrument, "TRACK" + s + "MUTE"))
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Track" + s + "MuteButton", -1, "Un-Mute");
		else
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "Track" + s + "MuteButton", -1, "Mute");
	}
	
	if (GetLocalInt(oInstrument, "LYRICS_MUTED"))
		SetGUIObjectText(oPC, "TKL_PERFORMER_LYRICS", "LyricMuteButton", -1, "UN-MUTE LYRICS");
	else
		SetGUIObjectText(oPC, "TKL_PERFORMER_LYRICS", "LyricMuteButton", -1, "MUTE LYRICS");
}

void RefreshModes(object oPC, object oInstrument)
{
	int bRecordMode = GetLocalInt(oInstrument, "RECORD_MODE");
	int bMinorMode = GetLocalInt(oInstrument, "MINOR_MODE");
	int bEasyMode = GetLocalInt(oInstrument, "EASY_MODE");
	
	string sPane = "Main";
	
	if (bEasyMode == FALSE)
		SetGUITexture(oPC, TKL_PERFORMER_SCREEN, "EasyButton", "skill_points_container.tga");
	else
	{
		SetGUITexture(oPC, TKL_PERFORMER_SCREEN, "EasyButton", "b_overlay.tga");
		sPane += "Easy";
	}	
			
	if (bMinorMode == FALSE)
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorButton", 0, "MAJOR");	
	else
	{
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "MinorButton", 0, "MINOR");	
		sPane += "Minor";
	}
	
	if (bRecordMode == FALSE)
	{
		SetGUITexture(oPC, TKL_PERFORMER_SCREEN, "LiveButton", "b_overlay.tga");
		sPane+= "Live";
	}
	else
		SetGUITexture(oPC, TKL_PERFORMER_SCREEN, "LiveButton", "skill_points_container.tga");
		
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainPane", TRUE);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainEasyMinorLivePane", TRUE);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainEasyMinorPane", TRUE);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainMinorLivePane", TRUE);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainEasyPane", TRUE);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainMinorPane", TRUE);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainLivePane", TRUE);
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "MainEasyLivePane", TRUE);
	
	SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, sPane + "Pane", FALSE);
}

void LaunchTKLPerformer(object oPC, object oItem, string sGUIFile)
{
	if (GetPerform(oPC) < TKL_MINIMUM_PERFORM_TO_USE)
		return;
	SetLocalObject(oPC, "TKL_PERFORMER_INSTRUMENT", oItem);
	EnableButtons(oPC, oItem);
	DisplayGuiScreen(oPC, TKL_PERFORMER_SCREEN, FALSE, sGUIFile);
	RefreshModes(oPC, oItem);
	RefreshNoteNames(oPC, oItem);
	RefreshSongList(oPC);
	RefreshNames(oPC, oItem);
	string sStop = StopTimer(oItem, "PLAYBACK");
	float fLagCheck = GetCampaignFloat(TKL_PERFORMER_DATABASE, "LAG_CHECK", oPC);
	if (fLagCheck > 0.01f)
		SetLocalFloat(oPC, "LAG_CHECK", fLagCheck);
	SetLocalString(oItem, "GUI_FILE", sGUIFile);
	ResetExpiringVariables(oPC, oItem);
	int iTempo = GetLocalInt(oItem, "TEMPO");
	if (iTempo == 0)
	{
		SetLocalInt(oItem, "TEMPO", 100);
		iTempo = 100;
	}
	int iMaxSpeed = GetMaximumSpeed(oPC);
	if (iTempo < (100 - iMaxSpeed))
		SetLocalInt(oItem, "TEMPO", 100 - iMaxSpeed);
	SetLocalFloat(oItem, "SONG_LENGTH", GetSongLength(oItem));
}

void ShutDownTKLPerformer(object oPC, object oItem)
{
	if (GetLocalInt(oItem, "RECORDING_TRACK") > 0 ||	GetLocalInt(oItem, "RECORDING_LYRICS") == TRUE)
	{
		StopRecording(oPC, oItem);
		DeleteLocalInt(oItem, "RECORD_MODE");
	}
	DeleteLocalObject(oPC, "TKL_PERFORMER_INSTRUMENT");
	CloseGUIScreen(oPC, TKL_PERFORMER_SCREEN);
	CloseGUIScreen(oPC, "TKL_PERFORMER_LYRICS");
}

void FindLastNote(object oPC, object oInstrument, int iTrack)
{
	string sTrack = IntToString(iTrack);
	int iPitch, iPitchCompare;
	float fLongestDelay, fDelayCompare;
	string sID, sOldID, sNewID;
	int iTotalNotes =  GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	int iTempNote = iTotalNotes;
	int iLastNote, iFindLastNote;
	// for each number, cycle through all the notes and find the "last" one, then set it temporarily to that number
	iFindLastNote = iTotalNotes;
	while (iFindLastNote > 0)
	{
		sID = "NOTE" + IntToString(iFindLastNote);
		fDelayCompare = GetLocalFloat(oInstrument, sID + "PLAYBACK_TRACK" + sTrack);
		if (fDelayCompare >= fLongestDelay)
		{
			fLongestDelay = fDelayCompare;
			iLastNote = iFindLastNote;
		}
		iFindLastNote--;	
	}
	int iSlotForNewNote = GetLocalInt(oPC, "NOTES_SORTED");
	SetLocalInt(oPC, "NOTES_SORTED", iSlotForNewNote + 1);
	// start from the end, adding notes from last to first
	iSlotForNewNote = iTotalNotes - iSlotForNewNote;
	
	//SendMessageToPC(oPC, "Last note is # " + IntToString(iLastNote));
	sOldID = "NOTE" + IntToString(iLastNote);
	sNewID = "NOTE" + IntToString(iSlotForNewNote);
	//transfer the values from the "last note" to the end of the new temp sequence
	SetLocalInt(oInstrument, sNewID + "PITCH_TEMP", GetLocalInt(oInstrument, sOldID + "PITCH_TRACK" + sTrack));
	SetLocalFloat(oInstrument, sNewID + "PLAYBACK_TEMP", GetLocalFloat(oInstrument, sOldID + "PLAYBACK_TRACK" + sTrack));
	//set the "last note" to -10.0, so it will not be counted again.
	SetLocalFloat(oInstrument, sOldID + "PLAYBACK_TRACK" + sTrack, -10.0f);
}

void FinalizeNoteSorting(object oPC, object oInstrument, int iTrack)
{
	string sTrack = IntToString(iTrack);
	int iTempNote =  GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	string sID;
	while (iTempNote > 0)
	{
		sID = "NOTE" + IntToString(iTempNote);
		SetLocalInt(oInstrument, sID + "PITCH_TRACK" + sTrack, GetLocalInt(oInstrument, sID + "PITCH_TEMP"));
		SetLocalFloat(oInstrument, sID + "PLAYBACK_TRACK" + sTrack, GetLocalFloat(oInstrument, sID + "PLAYBACK_TEMP"));
		DeleteLocalInt(oInstrument, sID + "PITCH_TEMP");
		DeleteLocalFloat(oInstrument, sID + "PLAYBACK_TEMP");
		iTempNote--;
	}
	DeleteLocalInt(oPC, "NOTES_SORTED");
}

void SortNotes(object oPC, object oInstrument, int iTrack)
{
	string sTrack = IntToString(iTrack);
	int iTotalNotes =  GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	AssignCommand(oPC, SendMessageToPC(oPC, "Sorting track " + sTrack + "... Please wait..."));
	while (iTotalNotes > 0)
	{
		AssignCommand(oPC, FindLastNote(oPC, oInstrument, iTrack));
		iTotalNotes--;
	}
	AssignCommand(oPC, FinalizeNoteSorting(oPC, oInstrument, iTrack));
	AssignCommand(oPC, SendMessageToPC(oPC, "Finished sorting track " + sTrack + "."));
}

string GetNoteName(int iPitch)
{
	string sInstrument;
	// is this a melody note?
	if (iPitch < 100 || (iPitch > 200 && iPitch < 300) || (iPitch > 323 && iPitch < 350) || (iPitch > 373 && iPitch < 400))
	{
		if (iPitch < 100)
		{
			sInstrument = "Lute Note: ";
			if (iPitch > 50)
				iPitch -= 50;
		}
		else if (iPitch > 200 && iPitch < 300)
		{
			sInstrument = "Flute Note: ";
			if (iPitch > 250)
				iPitch -= 50;
			iPitch -= 200;
		}
		else if ((iPitch > 323 && iPitch < 350) || (iPitch > 373 && iPitch < 400))
		{
			sInstrument = "Drum Note: ";
			if (iPitch > 373)
				iPitch -= 50;
			iPitch -= 323;
		}
		
		switch (iPitch)
		{
			case 1:	return sInstrument + "C1";
			case 2:	return sInstrument + "Db1";
			case 3:	return sInstrument + "D1";
			case 4:	return sInstrument + "Eb1";
			case 5:	return sInstrument + "E1";
			case 6:	return sInstrument + "F1";
			case 7:	return sInstrument + "Gb1";
			case 8:	return sInstrument + "G1";
			case 9:	return sInstrument + "Ab1";
			case 10:return sInstrument + "A1";
			case 11:return sInstrument + "Bb1";
			case 12:return sInstrument + "B1";
			case 13:return sInstrument + "C2";
			case 14:return sInstrument + "Db2";
			case 15:return sInstrument + "D2";
			case 16:return sInstrument + "Eb2";
			case 17:return sInstrument + "E2";
			case 18:return sInstrument + "F2";
			case 19:return sInstrument + "Gb2";
			case 20:return sInstrument + "G2";
			case 21:return sInstrument + "Ab2";
			case 22:return sInstrument + "A2";
			case 23:return sInstrument + "Bb2";
			case 24:return sInstrument + "B2";
			case 25:return sInstrument + "C3";
		}
	}
	
	// or is this a chord?
	else if (iPitch < 200)
	{
		sInstrument = "Lute Chord: ";
		if (iPitch > 150)
			iPitch -= 50;
		switch (iPitch)
		{
			case 101:return sInstrument + "C Major";
			case 102:return sInstrument + "Db Major";
			case 103:return sInstrument + "D Major";
			case 104:return sInstrument + "Eb Major";
			case 105:return sInstrument + "E Major";
			case 106:return sInstrument + "F Major";
			case 107:return sInstrument + "Gb Major";
			case 108:return sInstrument + "G Major";
			case 109:return sInstrument + "Ab Major";
			case 110:return sInstrument + "A Major";
			case 111:return sInstrument + "Bb Major";
			case 112:return sInstrument + "B Major";
			case 113:return sInstrument + "C minor";
			case 114:return sInstrument + "Db minor";
			case 115:return sInstrument + "D minor";
			case 116:return sInstrument + "Eb minor";
			case 117:return sInstrument + "E minor";
			case 118:return sInstrument + "F minor";
			case 119:return sInstrument + "Gb minor";
			case 120:return sInstrument + "G minor";
			case 121:return sInstrument + "Ab minor";
			case 122:return sInstrument + "A minor";
			case 123:return sInstrument + "Bb minor";
			case 124:return sInstrument + "B minor";
			case 125:return sInstrument + "C half-diminished";
			case 126:return sInstrument + "Db half-diminished";
			case 127:return sInstrument + "D half-diminished";
			case 128:return sInstrument + "Eb half-diminished";
			case 129:return sInstrument + "E half-diminished";
			case 130:return sInstrument + "F half-diminished";
			case 131:return sInstrument + "Gb half-diminished";
			case 132:return sInstrument + "G half-diminished";
			case 133:return sInstrument + "Ab half-diminished";
			case 134:return sInstrument + "A half-diminished";
			case 135:return sInstrument + "Bb half-diminished";
			case 136:return sInstrument + "B half-diminished";	
		}
	}
	// or is this a percussion sound?
	else
	{
		sInstrument = "Percussion Hit: ";
		if (iPitch > 350)
			iPitch -= 50;
		switch (iPitch)
		{
			case 301: return sInstrument + "Bass (a1)";
			case 302: return sInstrument + "Taiko (b1)";
			case 303: return sInstrument + "Udu (c1)";
			case 304: return sInstrument + "Qandahar (d1)";
			case 305: return sInstrument + "Frame Drum (e1)";
			case 306: return sInstrument + "Open Snare (f1)";
			case 307: return sInstrument + "Closed Snare (g1)";
			case 308: return sInstrument + "Tabla (h1)";
			case 309: return sInstrument + "Tambourine (i1)";
			case 310: return sInstrument + "Anvil (j1)";
			case 311: return sInstrument + "Bass (a2)";
			case 312: return sInstrument + "Taiko (b2)";
			case 313: return sInstrument + "Udu (c2)";
			case 314: return sInstrument + "Qandahar (d2)";
			case 315: return sInstrument + "Frame Drum (e2)";
			case 316: return sInstrument + "Open Snare (f2)";
			case 317: return sInstrument + "Closed Snare (g2)";
			case 318: return sInstrument + "Tabla (h2)";
			case 319: return sInstrument + "Tambourine (i2)";
			case 320: return sInstrument + "Anvil (j2)";
		}
	}
	return "Unrecognized Pitch";
}

void RefreshCopyPane(object oPC, object oInstrument)
{
	float fCopyFrom = GetLocalFloat(oInstrument, "COPY_FROM");
	float fPasteTo = GetLocalFloat(oInstrument, "PASTE_TO");
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "CopyFromField", -1, FloatToString(fCopyFrom, 3, 1));
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "PasteToField", -1, FloatToString(fPasteTo, 3, 1));
}

void ResetExpiringVariables(object oPC, object oInstrument)
{
	DeleteLocalFloat(oInstrument, "COPY_FROM");
	DeleteLocalFloat(oInstrument, "PASTE_TO");
	DeleteLocalInt(oInstrument, "COPY_TO_TRACK");
	DeleteLocalInt(oInstrument, "DELETE_SOURCE");
	DeleteLocalInt(oInstrument, "EDIT_PITCH");
	DeleteLocalFloat(oInstrument, "EDIT_TIME");
	DeleteLocalInt(oInstrument, "CURRENT_NOTE_TRACK1");
	DeleteLocalInt(oInstrument, "CURRENT_NOTE_TRACK2");
	DeleteLocalInt(oInstrument, "CURRENT_NOTE_TRACK3");
	DeleteLocalInt(oInstrument, "CURRENT_NOTE_TRACK4");
	DeleteLocalInt(oInstrument, "METRONOME_ON");
	DeleteLocalInt(oInstrument, "LAG_CHECK_ON");
}

void RefreshNotePane(object oPC, object oInstrument)
{
	int iTrack = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
	string sTrack = IntToString(iTrack);
	int iNote = GetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack);
	if (iNote == 0)
	{
		iNote = 1;
		SetLocalInt(oInstrument, "CURRENT_NOTE_TRACK" + sTrack, iNote);
	}
	int iMaxNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	if (iNote > iMaxNotes)
		iNote = iMaxNotes;
	string sNote = IntToString(iNote);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "CurrentNote", -1, "NOTE #" + sNote);
	int iPitch = GetLocalInt(oInstrument, "NOTE" + sNote + "PITCH_TRACK" + sTrack);
	int iKey = GetLocalInt(oInstrument, "KEY");
	// transpose chords
	if (iPitch > 100 && iPitch < 200)
		iPitch = TransposeChord(iPitch, iKey);
	// don't transpose percussion
	else if ((iPitch > 300 && iPitch < 321) || (iPitch > 350 && iPitch < 371))
		iKey = 0;
	// transpose everything else
	else
		iPitch = iPitch + iKey;
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteName", -1, GetNoteName(iPitch));
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteTrackName", -1, "Track " + sTrack);
	int iEditPitch = GetLocalInt(oInstrument, "EDIT_PITCH");
	float fEditTime = GetLocalFloat(oInstrument, "EDIT_TIME");
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePitchField", -1, IntToString(iEditPitch));
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteTimeField", -1, FloatToString(fEditTime, 3, 1));
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteTotalNotes", -1, "(" + IntToString(iMaxNotes) + " Notes)");
	float fTime = GetLocalFloat(oInstrument, "NOTE" + sNote + "PLAYBACK_TRACK" + sTrack);
	SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteTime", -1, "Time: " + FloatToString(fTime, 4, 2));
	// set the primary variation button and text
	
	// for lute notes and flute notes...
	if ((iPitch >= 1 && iPitch <= 99) || (iPitch >= 201 && iPitch <= 299))
	{
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryType", -1, "SUSTAIN");
		if ((iPitch >= 1 && iPitch <= 49) || (iPitch >= 201 && iPitch <= 249))
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryValue", -1, "Normal");
		else
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryValue", -1, "Short");
	}
	// for lute chords...
	if (iPitch >= 101 && iPitch <= 199)
	{
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryType", -1, "ATTACK");
		if (iPitch >= 101 && iPitch <= 149)
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryValue", -1, "Rolled");
		else
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryValue", -1, "Normal");
	}
	
	// for percussion hits
	else if (iPitch >= 301 && iPitch <= 399)
	{
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryType", -1, "VOLUME");
		if (iPitch >= 301 && iPitch <= 349)
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryValue", -1, "Normal");
		else
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NotePrimaryValue", -1, "Loud");	
	}
	
	// set the secondary button and text, if necessary
	
	// for lute chords...
	if (iPitch >= 101 && iPitch <= 199)
	{
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryPane", FALSE);
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryType", -1, "QUALITY");
		if ((iPitch >= 101 && iPitch <= 112) || (iPitch >= 151 && iPitch <= 162))
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryValue", -1, "Major");
		else if ((iPitch >= 113 && iPitch <= 124) || (iPitch >= 163 && iPitch <= 174))
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryValue", -1, "Minor");
		else
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryValue", -1, "Half-Dim.");
	}
	// for percussion variations...
	else if (iPitch >= 301 && iPitch <= 399)
	{
		SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryType", -1, "VARIATION");
		if ((iPitch >= 301 && iPitch <= 310) || (iPitch >= 351 && iPitch <= 360))
		{
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryValue", -1, "1");
			SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryPane", FALSE);
		}
		else if ((iPitch >= 311 && iPitch <= 320) || (iPitch >= 361 && iPitch <= 370))
		{
			SetGUIObjectText(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryValue", -1, "2");
			SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryPane", FALSE);
		}
		else
			SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryPane", TRUE);
	}
	else
		SetGUIObjectHidden(oPC, TKL_PERFORMER_SCREEN, "NoteSecondaryPane", TRUE);	
}

void DeleteNote(object oInstrument, int iTrack, int iNote)
{
	string sTrack = IntToString(iTrack);
	string sID = "NOTE" + IntToString(iNote);
	int iTotalNotes = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	DeleteLocalInt(oInstrument, sID + "PITCH_TRACK" + sTrack);
	DeleteLocalFloat(oInstrument, sID + "PLAYBACK_TRACK" + sTrack);
	iNote++;
	// move all the proceeding notes up by one.
	string sOldNoteID;
	string sNewNoteID;
	while (iNote <= iTotalNotes)
	{
		sOldNoteID = "NOTE" + IntToString(iNote);
		sNewNoteID = "NOTE" + IntToString(iNote - 1);
		SetLocalInt(oInstrument, sNewNoteID + "PITCH_TRACK" + sTrack, 
			GetLocalInt(oInstrument, sOldNoteID + "PITCH_TRACK" + sTrack));
		SetLocalFloat(oInstrument, sNewNoteID + "PLAYBACK_TRACK" + sTrack,
			GetLocalFloat(oInstrument, sOldNoteID + "PLAYBACK_TRACK" + sTrack));
		iNote++;
	}
	// finally delete the one remaining note
	DeleteLocalInt(oInstrument, "NOTE" + IntToString(iNote) + "PITCH_TRACK" + sTrack);
	DeleteLocalFloat(oInstrument, "NOTE" + IntToString(iNote) + "PLAYBACK_TRACK" + sTrack);
	SetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack, iTotalNotes - 1);
}

int GetMaximumSpeed(object oPC)
{
	int iMaxSpeed = 99;
	if (TKL_PERFORM_AFFECTS_SPEED)
	{
		iMaxSpeed = GetPerform(oPC) * TKL_SPEED_PER_PERFORM_POINT;
		if (iMaxSpeed > 99)
			iMaxSpeed = 99;
	}
	return iMaxSpeed;
}