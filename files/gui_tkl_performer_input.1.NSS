/*
Author: brockfanning
Date: Early 2008...
Purpose: These are various actions performed after the PC inputs their own text.

--added high C's to Write function -bf, 6/4/08
--added offsets for rolled notes
*/

#include "tkl_performer_include"

int GetPercussionPitch(string sChar2, int iRow)
{
	string sLower = GetStringLowerCase(sChar2);
	int iPitch;
	if (sLower == "a")
		iPitch = 1;
	else if (sLower == "b")
		iPitch = 2;
	else if (sLower == "c")
		iPitch = 3;
	else if (sLower == "d")
		iPitch = 4;
	else if (sLower == "e")
		iPitch = 5;
	else if (sLower == "f")
		iPitch = 6;
	else if (sLower == "g")
		iPitch = 7;
	else if (sLower == "h")
		iPitch = 8;
	else if (sLower == "i")
		iPitch = 9;
	else if (sLower == "j")
		iPitch = 10;
	else
		return -1;
	// add 10 for 2nd row
	if (iRow == 1)
		iPitch += 10;
	// add 50 for uppercase (ie, accent)
	if (sChar2 == GetStringUpperCase(sChar2))
		iPitch += 50;
	// add the Percussion offset
	iPitch += 300;
	return iPitch;
}

int GetMelodyPitch(string sChar, string sChar2, int iRow, int bDrums, int iInstrumentOffset)
{
	int iPitch = 0;
	string sLower = GetStringLowerCase(sChar);
	if (sChar2 == "#")
		iPitch++;
	else if (sChar2 == "b")
		iPitch--;
	
	if (sLower == "c")
		iPitch += 1;
	else if (sLower == "d")
		iPitch += 3;
	else if (sLower == "e")
		iPitch += 5;
	else if (sLower == "f")
		iPitch += 6;
	else if (sLower == "g")
		iPitch += 8;
	else if (sLower == "a")
		iPitch += 10;
	else if (sLower == "b")
		iPitch += 12;
	else
		return -1;
	
	// don't allow B#'s
	if (iPitch > 12)
		iPitch = 12;
	// check for second octave
	if (iRow == 2)
		iPitch += 12;
	// check for third octave, for high C's
	if (iRow == 3)
		iPitch += 24;
	// check for short note
	if (bDrums == TRUE && sChar == GetStringUpperCase(sChar))
		iPitch += 50;
	if (bDrums == FALSE && sChar == GetStringLowerCase(sChar))
		iPitch += 50;
	// add the instrument offset
	iPitch += iInstrumentOffset;
	
	return iPitch;	
}

int GetChordPitch(string sChar, string sChar2, string sQuality)
{
	int iPitch = 0;
	string sLower = GetStringLowerCase(sChar);
	if (sChar2 == "#")
		iPitch++;
	else if (sChar2 == "b")
		iPitch--;
	
	if (sLower == "c")
		iPitch += 1;
	else if (sLower == "d")
		iPitch += 3;
	else if (sLower == "e")
		iPitch += 5;
	else if (sLower == "f")
		iPitch += 6;
	else if (sLower == "g")
		iPitch += 8;
	else if (sLower == "a")
		iPitch += 10;
	else if (sLower == "b")
		iPitch += 12;
	else
		return -1;
	
	// don't allow B#'s
	if (iPitch > 12)
		iPitch = 12;
	// check for minor
	if (sQuality == "m")
	{
		iPitch += 12;
	}
	// check for half-diminished
	else if (sQuality == "*")
	{
		iPitch += 24;
	}
		
	// check for rolled chords
	if (sChar == GetStringUpperCase(sChar))
		iPitch += 50;
	// add the instrument offset for chords
	iPitch += 100;
	
	return iPitch;	
}


void WriteNote(object oInstrument, int iTrack, int iPitch, float fDelay)
{
	string sTrack = IntToString(iTrack);
	int iNotesRecorded = GetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack);
	iNotesRecorded++;
	SetLocalInt(oInstrument, "NOTES_RECORDED_TRACK" + sTrack, iNotesRecorded);
	string sID = "NOTE" + IntToString(iNotesRecorded);
	// Apply "rolled" note offsets if necessary
	if (iPitch > 100 && iPitch < 137)
		fDelay -= TKL_CHORD_ROLL_OFFSET;
	else if (iPitch == 316 || iPitch == 317 || iPitch == 366 || iPitch == 367)
		fDelay -= TKL_DRUM_ROLL_OFFSET;
	SetLocalFloat(oInstrument, sID + "PLAYBACK_TRACK" + sTrack, fDelay);
	SetLocalInt(oInstrument, sID + "PITCH_TRACK" + sTrack, iPitch);
	SendMessageToPC(OBJECT_SELF, sID + " pitch " + IntToString(iPitch) + " at " + FloatToString(fDelay));
}

void main(string sInput)
{
	object oPC = OBJECT_SELF;
	string sAction = GetLocalString(oPC, "TKL_PERFORMER_ACTION");
	int iOption = GetLocalInt(oPC, "TKL_PERFORMER_OPTION");
	string sOption = IntToString(iOption);
	object oInstrument = GetLocalObject(oPC, "TKL_PERFORMER_INSTRUMENT");
	
	if (sAction == "LYRIC_LEARN")
	{
		if (sInput == "")
		{
			SendMessageToPC(oPC, "Input is blank for lyric learning");
			return;
		}
		SetLocalString(oInstrument, "LYRIC" + sOption, sInput);
		SetGUIObjectText(oPC, "TKL_PERFORMER_LYRICS", "Lyric" + sOption + "Button", 0, GetStringLeft(sInput, 20));	
		ClearTKLPerformerVariables(oPC);
	}
	/*
	// recording with metronome
	else if (sAction == "TRACK_RECORD")
	{
		int iSeconds = StringToInt(sInput);
		SendMessageToPC(oPC, "Metronome will play for " + IntToString(iSeconds) + " seconds.");
		int iTempo = GetLocalInt(oInstrument, "METRONOME");
		if (iTempo == 0)
			iTempo = 60;
		PlayMetronome(oPC, iTempo, iSeconds);
		//SendMessageToPC(oPC, "Metronome playing...");
		PlaySong(oPC, oInstrument, iOption, TRUE, TRUE, TRUE);
		//SendMessageToPC(oPC, "Song playing...");
		RecordTrack(oPC, oInstrument, iOption);
		//SendMessageToPC(oPC, "Track recording...");
		ClearTKLPerformerVariables(oPC);
	}*/
	
	else if (sAction == "RENAME")
	{
		if (iOption > 0)
		{
			SetLocalString(oInstrument, "TRACK_" + sOption + "_NAME", sInput);	
		}
		else
			SetLocalString(oInstrument, "SONG_NAME", sInput);
		RefreshNames(oPC, oInstrument);
		ClearTKLPerformerVariables(oPC);
	}
	
	else if (sAction == "WRITE")
	{
		string sOldWrite = GetLocalString(oInstrument, "WRITE_TRACK" + sOption);
		if (sInput == "")
		{
			SendMessageToPC(oPC, "The track was not changed.");
			return;
		}
		EraseTrack(oInstrument, iOption, FALSE);
		SetLocalString(oInstrument, "WRITE_TRACK" + sOption, sInput);

		int iTempo = GetLocalInt(oInstrument, "METRONOME");
		if (iTempo == 0)
			iTempo = 60;
		float fTick = 60.0f / IntToFloat(iTempo);
		float fDelay;
		int iNotesWritten;
		int iPosition, iPitch;
		string sChar = GetSubString(sInput, iPosition, 1);
		string sChar2 = GetSubString(sInput, iPosition + 1, 1);
		string sChar3 = GetSubString(sInput, iPosition + 2, 1);
		int iRow;
		string sGUIFile = GetLocalString(oInstrument, "GUI_FILE");
		int iInstrumentOffset = 0;
		int bDrums = FALSE;
		if (sGUIFile == "tkl_performer_flute.xml")
			iInstrumentOffset = 200;
		else if (sGUIFile == "tkl_performer_drum.xml")
		{
			iInstrumentOffset = 323;
			bDrums = TRUE;
		}
		while (sChar != "")
		{
			string sLowerChar = GetStringLowerCase(sChar);
			// check for _ or |, which are ignored
			if (sChar == "_" || sChar == "|" || sChar == " " || sChar == "/" || sChar == ";")
			{
				iPosition++;
			}
			// check for rest
			else if (sChar == "-" || sChar == ">")
			{
				fDelay += fTick;
				iPosition++;
			}
			// check for percussion
			else if (sLowerChar == "p")
			{
				if (sGUIFile != "tkl_performer_drum.xml")
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": You can only write percussion sounds while holding a drum.");
					return;
				}
				iRow = StringToInt(sChar3);
				if (iRow != 1 && iRow != 2)
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition + 2) + ": Percussion hits must end with 1 or 2, to indicate which row to use.");
					return;
				}
				iPitch = GetPercussionPitch(sChar2, iRow);
				if (iPitch == -1)
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": Percussion 'p' must be followed by one of the letters 'a' through 'j', indicating which percussion sound to use.");
					return;
				}
				WriteNote(oInstrument, iOption, iPitch, fDelay);
				fDelay += fTick;
				iPosition += 3;	
				iNotesWritten++;	
			}
			// check for melody
			else if ((sLowerChar == "a" || sLowerChar == "b" || sLowerChar == "c" || sLowerChar == "d" || sLowerChar == "e" || sLowerChar == "f" || sLowerChar == "g")
						&& (sChar2 != "m" && sChar2 != "M")
						&& (sChar3 != "m" && sChar3 != "M"))
			{
				// check for sharp or flat
				if (sChar2 == "#" || sChar2 == "b")
				{
					iRow = StringToInt(sChar3);
					iPosition++;
				}
				else
				{
					iRow = StringToInt(sChar2);
				}
				if (iRow != 1 && iRow != 2 && iRow != 3)
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": Melody notes must end with a 1 or 2 (or 3 for a high C) to indicate which row to use.");
					return;
				}
				if (sGUIFile == "tkl_performer_drum.xml" && iRow != 1)
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": Drum melody notes must end with a 1.");
					return;
				}
				if (iRow == 3 && sLowerChar != "c")
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": The only note that can use the '3' row is C.");
					return;
				}
				
				iPitch = GetMelodyPitch(sChar, sChar2, iRow, bDrums, iInstrumentOffset);
				if (iPitch == -1)
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": Invalid melody note.");
					return;
				}
				WriteNote(oInstrument, iOption, iPitch, fDelay);
				fDelay += fTick;
				iPosition += 2;	
				iNotesWritten++;
			}
			
			// check for chords
			else if ((sLowerChar == "a" || sLowerChar == "b" || sLowerChar == "c" || sLowerChar == "d" || sLowerChar == "e" || sLowerChar == "f" || sLowerChar == "g")
						&& ((sChar2 == "m" || sChar2 == "M")
						|| (sChar3 == "m" || sChar3 == "M")))
			{
				if (sGUIFile != "tkl_performer_lute.xml")
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": You can only write harmony sounds (chords) while holding a lute.");
					return;
				}
			
				string sQuality;
				// check for sharp or flat
				if (sChar2 == "#" || sChar2 == "b")
				{
					iPosition++;
					sQuality = sChar3;
				}
				else
					sQuality = sChar2;
				
	
				iPitch = GetChordPitch(sChar, sChar2, sQuality);
				if (iPitch == -1)
				{
					SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": Invalid chord note.");
					return;
				}
				WriteNote(oInstrument, iOption, iPitch, fDelay);
				fDelay += fTick;
				iPosition += 2;	
				iNotesWritten++;
			}
			else
			{
				SendMessageToPC(oPC, "Error at character " + IntToString(iPosition) + ": Invalid note.");
				return;
			}
			
			sChar = GetSubString(sInput, iPosition, 1);
			sChar2 = GetSubString(sInput, iPosition + 1, 1);
			sChar3 = GetSubString(sInput, iPosition + 2, 1);		
		}
		SetLocalFloat(oInstrument, "SONG_LENGTH", GetSongLength(oInstrument));
		ClearTKLPerformerVariables(oPC);
		SendMessageToPC(oPC, IntToString(iNotesWritten) + " notes written.");
	}	
}