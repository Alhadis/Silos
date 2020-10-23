//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
#include "x0_i0_position"
void main()
{
    // Standard vehicle script for D20 Modern
    if (GetUserDefinedEventNumber()==1006)
    // Damaged event - damage based on AC of vehicle.
    {
        object oPC = GetFirstPC();
        int nDamage = GetTotalDamageDealt()/4;
        if (GetLocalInt(OBJECT_SELF, "COVER")==1)       // Cars can have armor plating
            nDamage = 0;
        if (GetLocalInt(OBJECT_SELF, "COVER")==2)
            nDamage = nDamage*4;
        while (GetIsObjectValid(oPC))
        {
             if (GetLocalObject(oPC, "oRide")==OBJECT_SELF)
             {
                if (ReflexSave(oPC, 15)>0)
                    nDamage = nDamage/2;
                AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING), oPC));

             }
            oPC = GetNextPC();

        }
        oPC = GetLocalObject(OBJECT_SELF, "oPilot");
            AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING), oPC));


    }

    // enter desired behaviour here
    if (GetUserDefinedEventNumber()==1001)
        {

            SetLocalInt(OBJECT_SELF, "nMdrnTurn", 0);
            SetLocalInt(OBJECT_SELF, "nMdrnAccel", 0);
            SetLocalInt(OBJECT_SELF, "nMdrnDecel", 0);
            SetLocalInt(OBJECT_SELF, "nMdrnSwerve", 0);
            SetLocalInt(OBJECT_SELF, "nMdrnDash", 0);
            SetLocalInt(OBJECT_SELF, "nMdrnBrake", 0);
            // Who's driving this thing?!
            if (GetIsObjectValid(GetLocalObject(OBJECT_SELF, "oPilot"))==FALSE && GetLocalInt(OBJECT_SELF, "nMdrnTran")==0)
            {

                int nSpeed = GetLocalInt(OBJECT_SELF, "nSpeed");
                int nComm = GetLocalInt(OBJECT_SELF, "nComm");
                int nDir = GetLocalInt(OBJECT_SELF, "nDir");
                int nHead = GetLocalInt(OBJECT_SELF, "nHead");
                float fFace = GetFacing(OBJECT_SELF);
                float fGoodFace = GetLocalFloat(OBJECT_SELF, "fGoodFace");
                object oCar = OBJECT_SELF;
                int nCrash = 0;
                if (GetLocalInt(oCar, "nPilotBail")==0 && (GetDistanceBetweenLocations(GetLocalLocation(OBJECT_SELF, "nMdrnCarLoc"), GetLocation(OBJECT_SELF))<0.2  && GetLocalInt(OBJECT_SELF, "nLanded")==0) || (fFace - fGoodFace > 1.0 || fGoodFace - fFace > 1.0))
               {
                    // Potential crash
                     int nSpeed = GetLocalInt(oCar, "nSpeed");
                    if (nSpeed>0)
                    {
                        // It's a moving vehicle - time for a crash!
                        int nDice = GetLocalInt(oCar, "CRASHDICE");
                        if (nDice==0)
                            nDice = 4;
                        int nDam = d8(nDice);
                        if (nSpeed < 8)
                            nDam = d4(nDice);
                        if (nSpeed < 5)
                            nDam = d2(nDice);
                        if (nSpeed < 3 )
                            nDam = 0;
                        AssignCommand(oCar, ClearAllActions());
                        if (nDam > 0)
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam, DAMAGE_TYPE_BLUDGEONING), oCar);
                            SetLocalInt(oCar, "nSpeed", 0);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_CALTROPS), oCar);

                            object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oCar));
                            if (GetLocalInt(oCar, "COVER")==1)
                                DelayCommand(0.5, AssignCommand(oSound, PlaySound("sca_dragfire")));
                            else
                                DelayCommand(0.5, AssignCommand(oSound, PlaySound("as_cv_glasbreak3")));
                            DelayCommand(2.0, DestroyObject(oSound));
                        }
                        else
                             SetLocalInt(oCar, "nSpeed", 0);
                        nCrash = 1;
                    }


                }



                if (nComm==1)
                         nHead = 1;

                if (nComm==2)
                   nHead = 2;
                if (nComm==3)
                    nHead = 0;

                   if (nSpeed > 0 || nDir == 1 && nCrash == 0)
                    {
                        effect eRem = GetFirstEffect(oCar);
                        while (GetIsEffectValid(eRem))
                        {
                           if (GetEffectType(eRem)==EFFECT_TYPE_MOVEMENT_SPEED_DECREASE || GetEffectType(eRem)==EFFECT_TYPE_MOVEMENT_SPEED_INCREASE)
                                RemoveEffect(oCar, eRem);

                            eRem = GetNextEffect(oCar);
                        }
                         AssignCommand(oCar, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedIncrease(99), oCar));
                         AssignCommand(oCar, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedDecrease(99-10*nSpeed), oCar));

                        vector vNew = GetChangedPosition(GetPosition(OBJECT_SELF), 20.0, fFace);
                        vector vOld =GetPositionFromLocation(GetLocation(OBJECT_SELF));
                        SetLocalInt(OBJECT_SELF, "nFullStop", 0);
                        location lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPosition(OBJECT_SELF), 20.0, fFace), fFace);
                        //if (LineOfSightVector(vOld, vNew)==TRUE)
                       //{
                            if (nDir == 1)
                            {
                                SetLocalInt(OBJECT_SELF, "nDir", 0);
                            }
                            else
                            {
                                AssignCommand(OBJECT_SELF, ClearAllActions());
                                AssignCommand(OBJECT_SELF, ActionMoveToLocation(lNew));
                            }
                       // }
                       /* else
                        {
                             if (nDir == 1)
                            {
                                  SetLocalInt(OBJECT_SELF, "nDir", 0);
                            }
                            else
                            {
                                lNew =  Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPosition(OBJECT_SELF), 4.0, fFace), fFace);

                                AssignCommand(OBJECT_SELF, ClearAllActions());
                                AssignCommand(OBJECT_SELF, ActionMoveToLocation(lNew));
                            }



                        } */
                    }
                    else if (GetLocalInt(OBJECT_SELF, "nFullStop")==0)
                    {
                        AssignCommand(OBJECT_SELF, ClearAllActions());
                        SetLocalInt(OBJECT_SELF, "nFullStop", 1);
                    }
                    SetLocalLocation(OBJECT_SELF, "nMdrnCarLoc", GetLocation(OBJECT_SELF));
                    SetLocalFloat(OBJECT_SELF, "fGoodFace", fFace);
                    SetLocalInt(OBJECT_SELF, "nHead", nHead);
                    SetLocalInt(OBJECT_SELF, "nComm", 0);
                 }
    }
    return;

}
