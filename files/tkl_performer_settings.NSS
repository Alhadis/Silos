/*
Author: brockfanning
Date: Early 2008...
Purpose: This is the script that can be modified to customize the behavior of
TKL Performer.  Server admins can use this to disable/enable certain features.
*/

// AL: ALFA settings.  Perform affects songs, lyrics = FALSE.  Perform speed factor to 5

const int TKL_NWNX4_NOT_INSTALLED =				FALSE;
	// IMPORTANT! If your server does NOT have NWNX4 installed (with the 'Timer' plugin)
	// you will NEED to set this to TRUE.  Without the NWNX4 Timer plugin,
	// some functions of TKL Performer are not possible, and using them could have bad results.
	// Setting this to TRUE will disable those functions, so you don't have to worry.

const int TKL_MINIMUM_PERFORM_TO_USE =			0;
	// This is the minimum Perform skill needed to use the system.

const float TKL_PREVIEW = 						10.0f;
	// This is the number of seconds played when a player clicks on 'Preview'.

const int TKL_ALLOW_DISABLE_MUSIC =				TRUE;
	// If TRUE, players will have the ability to turn NWN2 music on and off (for everyone in the area).
	
const int TKL_ALLOW_DISABLE_SOUNDS = 			TRUE;
	// If TRUE, players will have the ability to turn NWN2 ambient sounds on and off (for everyone in the area).

const int TKL_USE_ADJUSTED_PERFORM = 			TRUE;
	// If TRUE, Perform checks will include all adjustments for Charisma, spells, items, etc.
	// If FALSE, only the Base Ranks will be used.

const int TKL_PERFORM_AFFECTS_SONGS =			FALSE;
	// If TRUE, the players' Perform skill will determine how many Songs they can have saved at a time.
const float TKL_SONGS_PER_PERFORM_POINT =		0.5;
	// If TKL_PERFORM_AFFECTS_SONGS is TRUE, this fraction determines the number of Songs that can be saved, per point of Perform.
	// Example: If set at 0.5, a player with 8 Perform will be able to save 4 songs.

const int TKL_PERFORM_AFFECTS_LYRICS = 			FALSE;
	// If TRUE, the players' Perform skill will determine how many Lyric slots they can edit in a song.
const int TKL_LYRICS_PER_PERFORM_POINT =		2;
	// If TKL_PERFORM_AFFECTS_LYRICS is TRUE, this determines the number of Lyrics slots that can be edited, per point of Perform.
	// Example: If set at 2, a player with 8 Perform will be able to edit 16 Lyrics slots.

const int TKL_PERFORM_AFFECTS_SPEED =			TRUE;
	// If TRUE, the players' Perform skill will determine how much they can speed up a song.
const int TKL_SPEED_PER_PERFORM_POINT =			4;
	// If TKL_PERFORM_AFFECTS_SPEED is TRUE, this determines the percentage a player can speed up a song, per point of Perform.
	// Example: If set at 2, a player with 8 Perform will be able to speed up songs by 16%.

const int TKL_TRANSCRIPTIONS_PER_RESET =		0;
	// If set to 1 or more, this is the number of times per server reset that a PC can create a transcription.
	// If set to 0, there is no limit per reset.
const int TKL_ONE_TRANSCRIPTION_PER_HOUR =		TRUE;
	// If set to TRUE, this limits the transcription feature to once per game-hour.
	// If set to FALSE, PCs can Transcribe as often as they like.
const int TKL_TRANSCRIPTION_DC =				14;
	// If set to 1 or more, this is the base DC for a Perform skill check, whenever a PC attempts transcription.
	// If set to 0, Transcription will always be successful.
const int TKL_TRANSCRIPTION_LENGTH_PENALTY =	50;
	// If set to 1 or more, this is the number of notes that causes the Transcription DC to go up by 1.
	// For example, if set to 50, every 50 notes in a song causes the base DC to go up by 1.
	// (ie, a song with 100 notes would have its base Transcription DC increased by 2)
	// Note: This is not used if TKL_TRANSCRIPTION_DC is set to 0.
const int TKL_TRANSCRIPTION_CHARGES =			10;
	// This is the number of charges that will be given to the Musical Score items.
	

// Modify the script below to control the way that Perform is checked.  For example,
// you might want to check only base ranks, or you might want to give a special bonus
// for having the Artist feat, or you might want to give a bonus to DMs, etc...

int GetPerform(object oPC)
{
	int iSkill = GetSkillRank(SKILL_PERFORM, oPC);
	// PLACE CHANGES HERE
	return iSkill;
}