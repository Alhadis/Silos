#include "x0_i0_position"
// Main driving script.  It's a bear; contact Forrestwolf for vague details...

void main()
{
    object oPC = OBJECT_SELF;
    object oShip = GetLocalObject(oPC, "oVehicle");
    location lCur = GetLocation(oShip);
    location lOld = GetLocalLocation(oShip, "nMdrnCarLoc2");
    vector vCur = GetPositionFromLocation(lCur);
    location lGood = GetLocalLocation(oShip, "lMdrnTranLoc");
    vector vGood = GetPositionFromLocation(lGood);
    object oArea = GetArea(oShip);
    object oGoodArea = GetAreaFromLocation(lGood);
    float fFace = GetFacing(oShip);

    if (oArea != oGoodArea)
        lGood = lCur;
    if (GetIsObjectValid(oShip)==FALSE)
        oShip = GetLocalObject(oPC, "oRide");

     if (GetIsObjectValid(oShip) && GetLocalInt(oPC, "nMdrnGetOut")==0)
    {
        float fDist = 5.0;
        float fAngle = 89.0;
        float fMove = 3.0*((GetMovementRate(oShip)-2)*0.5+0.75);
        int nSize = GetLocalInt(oShip, "SIZE");
        if (nSize==2)
            fDist = 10.0;
        if (nSize==3)
            fDist = 20.0;
        if (nSize==1)
            fDist = 7.0;
        int nCamDown=GetLocalInt(oPC, "nCamDown");
        if (nCamDown == 1)
            fAngle = 70.0;
        location lNew;
        int nCamFace=GetLocalInt(oPC, "nCamFace");
        // Start new section
       if (GetLocalInt(oShip, "nMdrnTran")==1)
        {
            if (GetDistanceBetweenLocations(lCur, lGood)<10.0 && GetArea(oShip)==GetArea(oPC))
            {
                SetLocalInt(oShip, "nMdrnTran", 0);
                DeleteLocalLocation(oShip, "lMdrnTranLoc");
            }
        }

        if (GetLocalObject(oShip, "oPilot")==oPC && GetLocalInt(oShip, "nMdrnTran")==0)
        {

            int nDir = GetLocalInt(oShip, "nDir");
            int nComm = GetLocalInt(oShip, "nComm");
            int nSpeed = GetLocalInt(oShip, "nSpeed");


            object oCar = oShip;

                 vector vCurrent;
                    vector vToJump;
                    location lGood = GetLocalLocation(oShip, "lGoodLoc");
                    vector vGood = GetPositionFromLocation(lGood);
                int nDice;
                if (nComm == 2)
                    fFace = GetCustomRightDirection(fFace, 15.0);
                if (nComm == 1)
                    fFace = GetCustomLeftDirection(fFace, 15.0);

                    if (nDir == 1)
                {

                    lNew =  Location(GetArea(oShip), GetChangedPosition(GetPosition(oShip), 0.5, GetOppositeDirection(fFace)), fFace);
                     vCurrent = vCur;
                    vToJump = GetPositionFromLocation(lNew);


                    if ((!LineOfSightVector(vCurrent, vToJump) && GetLocalInt(oShip, "nMdrnGetIn")==0) ||(GetDistanceBetweenLocations(lCur, lGood)>0.2 && vGood.z == vCur.z && GetLocalInt(oShip, "nMdrnGetIn")==0))  // Can't drive where you can't see - crash!
                    {
                        nDice = GetLocalInt(oCar, "CRASHDICE");   // Allow for cars to have specific crash damage amounts.
                        if (nDice==0)
                            nDice = 4;
                        int nDam = d8(nDice);
                        if (nSpeed < 8)
                            nDam = d4(nDice);
                        if (nSpeed < 5)
                            nDam = d2(nDice);
                        if (nSpeed < 3)
                            nDam = 0;
                        SetLocalInt(oCar, "nSpeed", 0);
                        SetLocalFloat(oCar, "fGoodFace", 0.0);
                        SetLocalInt(oShip, "nDir", 0);
                        SetLocalLocation(oShip, "lGoodLoc", lCur);
                        if (nDam > 0)
                        {
                            AssignCommand(oCar, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam, DAMAGE_TYPE_BLUDGEONING), oCar));

                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_CALTROPS), oCar);
                            object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oCar));
                            if (GetLocalInt(oCar, "COVER")==1)
                                DelayCommand(0.5, AssignCommand(oSound, PlaySound("sca_dragfire")));
                            else
                                DelayCommand(0.5, AssignCommand(oSound, PlaySound("as_cv_glasbreak3")));
                            DelayCommand(2.0, DestroyObject(oSound));

                        }
                    }
                    else
                    {
                        lNew =  Location(GetArea(oShip), GetChangedPosition(GetPosition(oShip), 0.15, GetOppositeDirection(fFace)), fFace);
                        AssignCommand(oShip, ClearAllActions());
                        AssignCommand(oShip, ActionJumpToLocation(lNew));
                        SetLocalLocation(oShip, "lGoodLoc", lNew);

                    }
                }
                else if (nSpeed > 0)
                {
                    // SetLocalInt(oShip, "nReverse", 0);
                    lNew =  Location(GetArea(oShip), GetChangedPosition(GetPosition(oShip), (fMove/120.0)*nSpeed, fFace), fFace);
                    // Start crash check
                    vCurrent = vCur;
                    vToJump = GetPositionFromLocation(lNew);


                    if ((!LineOfSightVector(vCurrent, vToJump) && GetLocalInt(oShip, "nMdrnGetIn")==0) || (GetDistanceBetweenLocations(lCur, GetLocalLocation(oShip, "lGoodLoc"))>0.2&& vGood.z == vCur.z && GetLocalInt(oShip, "nMdrnGetIn")==0))  // Can't drive where you can't see - crash!
                    {
                        nDice = GetLocalInt(oCar, "CRASHDICE");   // Allow for cars to have specific crash damage amounts.
                        if (nDice==0)
                            nDice = 4;
                        int nDam = d8(nDice);
                        if (nSpeed < 8)
                            nDam = d4(nDice);
                        if (nSpeed < 5)
                            nDam = d2(nDice);
                        if (nSpeed < 3)
                            nDam = 0;
                        SetLocalInt(oCar, "nSpeed", 0);
                        SetLocalFloat(oCar, "fGoodFace", 0.0);
                        SetLocalLocation(oShip, "lGoodLoc", lCur);
                        if (nDam > 0)
                        {
                            AssignCommand(oCar, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam, DAMAGE_TYPE_BLUDGEONING), oCar));

                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_CALTROPS), oCar);

                           object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oCar));
                           if (GetLocalInt(oCar, "COVER")==1)
                                DelayCommand(0.5, AssignCommand(oSound, PlaySound("sca_dragfire")));
                            else
                                DelayCommand(0.5, AssignCommand(oSound, PlaySound("as_cv_glasbreak3")));
                            DelayCommand(2.0, DestroyObject(oSound));
                        }
                    }
                    else
                    // End check
                    {
                        AssignCommand(oShip, ClearAllActions());
                        AssignCommand(oShip, ActionJumpToLocation(lNew));
                        SetLocalLocation(oShip, "lGoodLoc", lNew);

                    }
                }
                SetLocalInt(oShip, "nComm", 0);

        }
        // End new section

        if (nCamFace==0)
        {
            lNew = Location(GetArea(oShip), GetChangedPosition(GetPosition(oShip), fDist, GetFacing(oShip)), GetFacing(oShip));
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionJumpToLocation(lNew));
            if (nSize==2 || nSize == 3)
            {    if (GetLocalInt(oShip, "nLanded")==0)
                    SetCameraHeight(oPC, 2.75);
                else
                    SetCameraHeight(oPC, 1.25);
            }
            SetCameraFacing(GetFacing(oShip), 4.0, fAngle);
        }
        if (nCamFace==1)
       {
            lNew = Location(GetArea(oShip), GetChangedPosition(GetPosition(oShip), 5.0, GetLeftDirection(GetFacing(oShip))), GetLeftDirection(GetFacing(oShip)));
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionJumpToLocation(lNew));
            if (nSize==2 || nSize == 3)

            {
                if (GetLocalInt(oShip, "nLanded")==0)
                    SetCameraHeight(oPC, 2.75);
                else
                    SetCameraHeight(oPC, 1.25);
            }
            SetCameraFacing(GetLeftDirection(GetFacing(oShip)), 4.0, fAngle);
        }
        if (nCamFace==2)
       {
            lNew = Location(GetArea(oShip), GetChangedPosition(GetPosition(oShip), 5.0, GetRightDirection(GetFacing(oShip))), GetRightDirection(GetFacing(oShip)));
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionJumpToLocation(lNew));
            if (nSize==2 || nSize == 3)

            {    if (GetLocalInt(oShip, "nLanded")==0)
                    SetCameraHeight(oPC, 2.75);
                else
                    SetCameraHeight(oPC, 1.25);
            }
            SetCameraFacing(GetRightDirection(GetFacing(oShip)), 4.0, fAngle);
        }
        if (nCamFace==3)
        {
            lNew = Location(GetArea(oShip), GetChangedPosition(GetPosition(oShip), fDist-4.0, GetFacing(oShip)), GetFacing(oShip));
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionJumpToLocation(lNew));

           if (nSize==2 || nSize == 3)
            {
                if (GetLocalInt(oShip, "nLanded")==0)
                    SetCameraHeight(oPC, 2.75);
                else
                    SetCameraHeight(oPC, 1.25);
           }
        }
        DelayCommand(0.1, ExecuteScript("_mdrn_driverun", oPC));
    }
    else
    {
        if (GetLocalInt(oShip, "nSpeed")>0)
        {
            int nDam = d2(GetLocalInt(oShip, "nSpeed"));
            if (ReflexSave(oPC, 15)>0)
                nDam = nDam / 2;

            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDamage(nDam, DAMAGE_TYPE_BLUDGEONING), oPC);

        }
        if (GetLocalObject(oPC, "oVehicle")==oShip)

            ExecuteScript("_mdrn_start_car", oShip);


        SetLocalInt(oPC, "nMdrnGetOut", 0);
        if (oShip == GetLocalObject(oPC, "oRide"))
        {
            int nPass = GetLocalInt(oShip, "nMdrnPassengers");
            nPass --;
            SetLocalInt(oShip, "nMdrnPassengers", nPass);

        }
        SetLocalObject(oPC, "oShip", OBJECT_INVALID);
        SetLocalObject(oPC, "oRide", OBJECT_INVALID);
        effect eRem = GetFirstEffect(oPC);
        while (GetIsEffectValid(eRem))
        {
            if (GetEffectType(eRem)==EFFECT_TYPE_ETHEREAL || GetEffectType(eRem)==EFFECT_TYPE_CUTSCENEGHOST || (GetEffectType(eRem)==EFFECT_TYPE_VISUALEFFECT && GetEffectSubType(eRem)==SUBTYPE_SUPERNATURAL))
                DelayCommand(0.5, RemoveEffect(oPC, eRem));

            eRem = GetNextEffect(oPC);
        }
        DestroyObject(GetItemPossessedBy(oPC, "_mdrn_drmanual"));



    }
}
