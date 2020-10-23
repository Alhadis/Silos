//::///////////////////////////////////////////////
//:: Name ars_include
//:: FileName Animation Row System
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A new system for making an object play animations
    that were added to an animation row before.

    All Animations can be played as a cutscene or just
    simply as animations.
*/
//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: September 21. 2008
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
#include "d0_functions_inc"

const int ARS_ANIMATIONSET_END     = -1;
const int ARS_ANIMATIONSET_FAILURE =  0;
const int ARS_ANIMATIONSET_SUCCEED =  1;
const int ARS_ANIMATIONSET_MINING  =  2;
const int ARS_ANIMATIONSET_SMITH   =  3;

const float ARS_ADDITIONAL_ANIMATIONTIME = 4.6;

// *  Add an Animation set to the current Animation row of oObject.
// *  - To play the current Animation row, call the function ARS_PlayAnimationRow()
// *  - To delete the current Animation row, call the function ARS_DeleteAnimationRow()
// *
// *  - iAnimationSet: ARS_ANIMATIONSET_*
void ARS_AddAnimationSetToRow(object oObject, int iAnimationSet);

// *  Add a single Animation to the current Animation row of oObject.
// *  - To play the current Animation row, call the function ARS_PlayAnimationRow()
// *  - To delete the current Animation row, call the function ARS_DeleteAnimationRow()
// *
// *   - iAnimation: ANIMATION_*
// *   - fDelay: The time, the next animation should need to be played
// *   - fDuration: The time, the animation should need to play. Not used for
// *                fire and forget animations
void ARS_AddAnimationToRow(object oObject, int iAnimation, float fDelay, float fDuration=0.0);

// *  Add a pause to the current Animation row of oObject with a duration
// *  of fDuration
void ARS_AddPause(object oObject, float fDuration=1.5f);

// *  Deletes the current Animation row of oObject.
void ARS_DeleteAnimationRow(object oObject);

// *  This function NEEDS to be called after adding all Animations to oObject's current row
// *  - Alternatively you can use the function ARS_AddAnimationToRow(ARS_ANIMATIONSET_END, 0.0, 0.0)
// *    to end the current animation row
// *  - Also with this function you will be able to get the full
// *    Animation delay by calling it with ARS_GetFullAnimationDelay()
//void ARS_EndAnimationRow(object oObject);

// *  Interrupts all following Animations from the current Animation row of oObject
// *  and deletes it.
// *  - NOTE: This function will work only, if you started to play the current
// *          Animation row with ARS_PlayAnimationRow().
void ARS_InterruptAnimationRow(object oObject);

// *  Makes oPlayer play all Animations that were added to his row before
// *  - By calling the function InterruptAnimationRow(), all following
// *    Animations will stop and the Animation row will be deleted.
// *  - nCutscene: If this is TRUE, the whole Animation row will be played
// *               in cutscene mode
void ARS_PlayAnimationRow(object oPlayer, int nCutscene=FALSE);


// *  Remove all Effects from oObject, applied by oCreator
void ARS_RemoveCutsceneEffects(object oObject, object oCreator);

// *  Set Camera to iCameraMode (if don't, use -1), fFacing, fZoom, fPitch and nSpeed
void ARS_SetCamera(object oObject, int iCameraMode, float fFacing, float fZoom, float fPitch, int nTransitionType=CAMERA_TRANSITION_TYPE_SNAP);

// *  Create all Cutscene effects to oSource by oCreator.
// *  If oCreator = OBJECT_INVALID, the object copy of oSource will be used
void ARS_SetCutsceneEffects(object oSource, object oCreator = OBJECT_INVALID);

// *  Get the Control-object of oObject
object ARS_GetCutsceneControlObject(object oObject);

// *  Returns TRUE, if oObject has an Animation row.
int ARS_GetHasAnimationRow(object oObject);

// *  Get the next animation from the current animation row of oObject.
// *  -  This function NEEDS to be used in connection with ARS_GetNextAnimationDelay()
// *     and ARS_GetNextAnimationDuration()
// *  -  bDelete: if this is TRUE, the current entry will be deleted from the row
int ARS_GetNextAnimation(object oObject, int bDelete=TRUE);

// *  current Animation row of oObject.
float ARS_GetFullAnimationDelay(object oObject);

// *  Get the next delay from the current animation row of oObject.
// *  -  This function NEEDS to be used in connection with ARS_GetNextAnimation()
// *     and ARS_GetNextAnimationDuration()
// *  -  bDelete: if this is TRUE, the current entry will be deleted from the row
float ARS_GetNextAnimationDelay(object oObject, int bDelete=TRUE);

// *  Get the full Animation delay, that is needed for working off the
// *  Get the next duration from the current animation row of oObject
// *  -  This function NEEDS to be used in connection with ARS_GetNextAnimation()
// *     and ARS_GetNextAnimationDelay()
// *  -  bDelete: if this is TRUE, the current entry will be deleted from the row
float ARS_GetNextAnimationDuration(object oObject, int bDelete=TRUE);

//*--------------------------------------------------------------------------*\\
//*                             IMPLEMENTATION                               *\\
//*--------------------------------------------------------------------------*\\

void ARS_SetCutsceneMode(object oTarget, int iSwitch)
{
    SetLocalInt(oTarget, "ARS_CutsceneMode", iSwitch);
}

//*--------------------------------------------------------------------------*\\

int ARS_GetCutsceneMode(object oTarget)
{
    return GetLocalInt(oTarget, "ARS_CutsceneMode");
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_CreatePCCutsceneControl(location lLoc, string sTag)
{
    object oControl = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lLoc, FALSE, sTag);
    SetPlotFlag(oControl, TRUE);
    SetUseableFlag(oControl, FALSE);
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

float ARS_ConvertFacing(float fFacing)
{
    while (fFacing >= 360.0)
    {
        fFacing -= 360.0;
    }

    return fFacing;
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_SetCamera(object oObject, int iCameraMode, float fFacing, float fZoom, float fPitch, int nTransitionType=CAMERA_TRANSITION_TYPE_SNAP)
{
    if(iCameraMode != -1)
    SetCameraMode(oObject, iCameraMode);

    DelayCommand(0.1, AssignCommand(oObject, SetCameraFacing(ARS_ConvertFacing(fFacing), fZoom, fPitch, nTransitionType)));
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

object ARS_GetCutsceneControlObject(object oObject)
{
    return GetNearestObjectByTag("CutPCControl_"+GetName(oObject), oObject);
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_RemoveCutsceneEffects(object oObject, object oCreator)
{
    effect eEffect = GetFirstEffect(oObject);

    while(GetIsEffectValid(eEffect))
    {
         if(GetEffectCreator(eEffect) == oCreator)
         RemoveEffect(oObject, eEffect);

         eEffect = GetNextEffect(oObject);
    }
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_SetCutsceneEffects(object oSource, object oCreator = OBJECT_INVALID)
{
    if(!GetIsObjectValid(oCreator))
    oCreator = ARS_GetCutsceneControlObject(oSource);

    AssignCommand(oCreator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oSource, 9999.0f));
    AssignCommand(oCreator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneGhost(), oSource, 9999.0f));
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

float ARS_GetFullAnimationDelay(object oObject)
{
    return GetLocalFloat(oObject, "ARS_GET_ANIMATION_DELAY");
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

float ARS_GetNextAnimationDelay(object oObject, int bDelete=TRUE)
{
    string AnimationDelay = GetLocalString(oObject, "ARS_ANIMATION_DELAY");
    string Spacer         = ";";
    int    SubString      = FindSubString(AnimationDelay, Spacer);
    int    StringLength   = GetStringLength(AnimationDelay);
    float  NextDelay      = StringToFloat(GetStringLeft(AnimationDelay, SubString));

    if(bDelete)
    SetLocalString(oObject, "ARS_ANIMATION_DELAY", GetStringRight(AnimationDelay, StringLength-SubString-1));

    return NextDelay;
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

float ARS_GetNextAnimationDuration(object oObject, int bDelete=TRUE)
{
    string AnimationDur   = GetLocalString(oObject, "ARS_ANIMATION_DURATION");
    string Spacer         = ";";
    int    SubString      = FindSubString(AnimationDur, Spacer);
    int    StringLength   = GetStringLength(AnimationDur);
    float  NextDuration   = StringToFloat(GetStringLeft(AnimationDur, SubString));

    if(bDelete)
    SetLocalString(oObject, "ARS_ANIMATION_DURATION", GetStringRight(AnimationDur, StringLength-SubString-1));

    return NextDuration;
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

int ARS_GetNextAnimation(object oObject, int bDelete=TRUE)
{
    string AnimationRow   = GetLocalString(oObject, "ARS_ANIMATION_ROW");
    string Spacer         = ";";
    int    SubString      = FindSubString(AnimationRow, Spacer);
    int    StringLength   = GetStringLength(AnimationRow);
    int    NextAnimation  = StringToInt(GetStringLeft(AnimationRow, SubString));

    if(bDelete)
    SetLocalString(oObject, "ARS_ANIMATION_ROW", GetStringRight(AnimationRow, StringLength-SubString-1));

    return NextAnimation;
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

int ARS_GetHasAnimationRow(object oObject)
{
    return GetLocalString(oObject, "ARS_ANIMATION_ROW") != "";
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void IncreaseAnimationDelay(object oObject, float fIncreaseBy)
{
    float FullDelay = GetLocalFloat(oObject, "ARS_GET_ANIMATION_DELAY");
    SetLocalFloat(oObject, "ARS_GET_ANIMATION_DELAY", FullDelay+fIncreaseBy);
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_AddAnimationToRow(object oObject, int iAnimation, float fDelay, float fDuration=0.0)
{
    string AnimationRow   = GetLocalString(oObject, "ARS_ANIMATION_ROW");
    string AnimationDelay = GetLocalString(oObject, "ARS_ANIMATION_DELAY");
    string AnimationDur   = GetLocalString(oObject, "ARS_ANIMATION_DURATION");
    string AddAnim        = IntToString(iAnimation)+";";
    string AddDelay       = FloatToString(fDelay)+";";
    string AddDuration    = FloatToString(fDuration)+";";

    IncreaseAnimationDelay(oObject, fDelay);
    SetLocalString(oObject, "ARS_ANIMATION_ROW", AnimationRow+AddAnim);
    SetLocalString(oObject, "ARS_ANIMATION_DELAY", AnimationDelay+AddDelay);
    SetLocalString(oObject, "ARS_ANIMATION_DURATION", AnimationDur+AddDuration);
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_AddPause(object oObject, float fDuration=1.5f)
{
    ARS_AddAnimationToRow(oObject, 0, fDuration);
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_AddAnimationSetToRow(object oObject, int iAnimationSet)
{
    switch(iAnimationSet)
    {
            case ARS_ANIMATIONSET_SUCCEED:
                    ARS_AddAnimationToRow(oObject, ANIMATION_FIREFORGET_VICTORY3, 2.0);
            break;

            case ARS_ANIMATIONSET_FAILURE:
                    ARS_AddAnimationToRow(oObject, ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 2.0);
            break;

            case ARS_ANIMATIONSET_MINING:

            break;

            case ARS_ANIMATIONSET_SMITH:
                    ARS_AddAnimationToRow(oObject, ANIMATION_LOOPING_GET_MID, 0.5, 3.2);
                    ARS_AddAnimationToRow(oObject, ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 4.5);
                    ARS_AddAnimationToRow(oObject, ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
                    ARS_AddAnimationToRow(oObject, ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 4.0);
                    ARS_AddAnimationToRow(oObject, ANIMATION_FIREFORGET_DRINK, 1.6);
                    ARS_AddAnimationToRow(oObject, ANIMATION_LOOPING_GET_MID, 0.7, 3.0);
                    ARS_AddAnimationToRow(oObject, ANIMATION_LOOPING_PAUSE_TIRED, 0.6, 4.0);
                    ARS_AddAnimationToRow(oObject, ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 2.5);
            break;
    }
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_EndAnimationRow(object oObject)
{
    if(FindSubString(GetLocalString(oObject, "ARS_ANIMATION_ROW"), IntToString(ARS_ANIMATIONSET_END)) != -1)
    ARS_AddAnimationToRow(oObject, ARS_ANIMATIONSET_END, 0.0);
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_DeleteAnimationRow(object oObject)
{
    DeleteLocalInt(oObject, "ARS_ANIMATION_INTERRUPT");
    DeleteLocalInt(oObject, "ARS_PLAYING_ANIMATION_ROW");

    DeleteLocalString(oObject, "ARS_ANIMATION_ROW");
    DeleteLocalString(oObject, "ARS_ANIMATION_DURATION");
    DeleteLocalString(oObject, "ARS_ANIMATION_ANIM_DURATION");

    DeleteLocalFloat(oObject,  "ARS_GET_ANIMATION_DELAY");
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_InterruptAnimationRow(object oObject)
{
    if(GetLocalInt(oObject, "ARS_PLAYING_ANIMATION_ROW"))
    SetLocalInt(oObject, "ARS_ANIMATION_INTERRUPT", TRUE);
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

void ARS_StopPlayAnimationRow(object oPlayer, int nCutscene)
{
    ARS_DeleteAnimationRow(oPlayer);

    if(nCutscene)
    {
        object oControl = ARS_GetCutsceneControlObject(oPlayer);

        DestroyObject(oControl);
        DeleteLocalInt(oPlayer, "ARS_CUTSCENE_STARTED");

        DelayCommand(0.1, ARS_SetCamera(oPlayer, -1, GetFacing(oPlayer), 15.0, 60.0, CAMERA_TRANSITION_TYPE_FAST));
        DelayCommand(0.5, FadeToBlack(oPlayer, FADE_SPEED_FAST));
        DelayCommand(1.4, SetCutsceneMode(oPlayer, FALSE, TRUE));
        DelayCommand(1.8, FadeFromBlack(oPlayer, FADE_SPEED_FAST));
    }
}

void ARS_PlayAnimationRow(object oPlayer, int nCutscene=FALSE)
{
    ARS_EndAnimationRow(oPlayer);

    object oPCControl;
    int    nAnimation;
    int    nPlaying    = GetLocalInt(oPlayer, "ARS_PLAYING_ANIMATION_ROW");
    int    nInterrupt  = GetLocalInt(oPlayer, "ARS_ANIMATION_INTERRUPT");
    int    nCutStarted = GetLocalInt(oPlayer, "ARS_CUTSCENE_STARTED");
    float  fFullDelay  = ARS_GetFullAnimationDelay(oPlayer);
    float  fAnimDelay, fDelay, fDuration;

    if(!nInterrupt)
    {
        if(!nPlaying)SetLocalInt(oPlayer, "ARS_PLAYING_ANIMATION_ROW", TRUE);

        fDelay     = ARS_GetNextAnimationDelay(oPlayer);
        fDuration  = ARS_GetNextAnimationDuration(oPlayer);
        nAnimation = ARS_GetNextAnimation(oPlayer);

        // Start playing the animation, if oPlayer has an Animation row and
        // it's not the end of the Animation row.
        if(ARS_GetHasAnimationRow(oPlayer) && nAnimation != ARS_ANIMATIONSET_END)
        {
            if(nCutscene && !nCutStarted)
            {
                SetLocalInt(oPlayer, "ARS_CUTSCENE_STARTED", TRUE);
                FadeToBlack(oPlayer, FADE_SPEED_FAST);
                DelayCommand(0.9, SetCutsceneMode(oPlayer));
                DelayCommand(1.3, FadeFromBlack(oPlayer, FADE_SPEED_FAST));
                DelayCommand(1.5, ARS_SetCamera(oPlayer, CAMERA_MODE_TOP_DOWN, GetFacing(oPlayer)+135.0, 10.0, 35.0, CAMERA_TRANSITION_TYPE_FAST));
                DelayCommand(fFullDelay / 2.0, ARS_SetCamera(oPlayer, -1, GetFacing(oPlayer)-70.0, 14.0, 50.0, CAMERA_TRANSITION_TYPE_FAST));

                fAnimDelay = 1.7;
            }

            if(!nAnimation) // Pause
            AssignCommand(oPlayer, PlayAnimation(nAnimation, 1.0, fDuration));
            DelayCommand(fDuration+fDelay+fAnimDelay, ARS_PlayAnimationRow(oPlayer, nCutscene));
        }
        else
        {
            ARS_StopPlayAnimationRow(oPlayer, nCutscene);
            AdvDebug(oPlayer, "Animation Row Finished", TRUE);
        }
    }
    else
    {
        ARS_StopPlayAnimationRow(oPlayer, nCutscene);
        AdvDebug(oPlayer, "Animation Row Interrupted", TRUE);
    }
}

//*--------------------------------------------------------------------------*\\
//*--------------------------------------------------------------------------*\\

//void main(){}
