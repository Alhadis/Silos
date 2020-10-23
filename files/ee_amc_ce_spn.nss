
#include "ee_fn_log"

const int EE_AMC_MUSIC_LENGTH = 180;
const int EE_AMC_PAUSE_LENGTH = 15;

void ee_AMC_MusicChangeHandler(object oMusicController);
void ee_AMC_MusicPauseHandler(object oMusicController);

void ee_AMC_MusicChangeHandler(object oMusicController)
{
    object oArea = GetArea(oMusicController);
    //DEBUG6("ee_asctrl_pe_hrt: Changing music track for area ["+GetName(oArea)+"]");

    int iMaxTrack = GetLocalInt(oMusicController,"ee_MaxTrack");
    //DEBUG6("ee_asctrl_pe_hrt: Area ["+GetName(oArea)+"], MaxTrack["+IntToString(iMaxTrack)+"]");

    int iNewTrackIndex = Random(iMaxTrack)+1;
    //DEBUG6("ee_asctrl_pe_hrt: Area ["+GetName(oArea)+"], NewTrackIndex["+IntToString(iNewTrackIndex)+"]");

    string sTrackIndex = "T";
    if (iNewTrackIndex < 10) sTrackIndex += "0";
    sTrackIndex += IntToString(iNewTrackIndex);
    //DEBUG6("ee_asctrl_pe_hrt: Area ["+GetName(oArea)+"], MaxTrackIndex["+sTrackIndex+"]");

    int iNewTrack = GetLocalInt(oMusicController,sTrackIndex);
    if (iNewTrack <= 0) {
        WARNING("ee_asctrl_pe_hrt: Area["+GetName(oArea)+"], MusicController["+GetName(oMusicController)+"], NewTrack["+IntToString(iNewTrack)+"], Bad track selected.");
    }
    //DEBUG6("ee_asctrl_pe_hrt: Changing music track, Area["+GetName(oArea)+"], MusicController["+GetName(oMusicController)+"], NewTrack["+IntToString(iNewTrack)+"]");

    if (GetIsDay()) {
        MusicBackgroundChangeDay(oArea,iNewTrack);
    } else {
        MusicBackgroundChangeNight(oArea,iNewTrack);
    }

    MusicBackgroundPlay(oArea);

    float fDelay = IntToFloat((EE_AMC_MUSIC_LENGTH-(EE_AMC_MUSIC_LENGTH/3)) + Random((2*EE_AMC_MUSIC_LENGTH)/3));
    //DEBUG6("ee_asctrl_pe_hrt: Delay["+FloatToString(fDelay)+"]");

    DB_HB("ee_asctrl_pe_hrt: Changing music, Area["+GetName(oArea)+"], MusicController["+GetName(oMusicController)+"], NewTrack["+IntToString(iNewTrack)+"], PlayTime["+FloatToString(fDelay,5,1)+"]");
    DelayCommand(fDelay,ee_AMC_MusicPauseHandler(oMusicController));
}

void ee_AMC_MusicPauseHandler(object oMusicController)
{
    object oArea = GetArea(oMusicController);
    //DEBUG6("ee_asctrl_pe_hrt: Pausing music track for area ["+GetName(oArea)+"]");

    MusicBackgroundStop(oArea);

    float fDelay = IntToFloat((EE_AMC_PAUSE_LENGTH-(EE_AMC_PAUSE_LENGTH/3)) + Random((2*EE_AMC_PAUSE_LENGTH)/3));
    //DEBUG6("ee_asctrl_pe_hrt: Delay["+FloatToString(fDelay)+"]");

    DB_HB("ee_asctrl_pe_hrt: Pausing music, Area["+GetName(oArea)+"], MusicController["+GetName(oMusicController)+"], PauseTime["+FloatToString(fDelay,5,1)+"]");
    DelayCommand(fDelay,ee_AMC_MusicChangeHandler(oMusicController));
}

void main()
{
    object oMusicController = OBJECT_SELF;
    DelayCommand(30.0f,ee_AMC_MusicChangeHandler(oMusicController));
}

