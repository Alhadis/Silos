float pitch = -1.0f;
float distance = -1.0f;

void DebugOut(string message)
{
    object pc = GetFirstPC();
    
    // Define colours using Hex. FF is highest, 00 is lowest. See online calculators if you want specific colours.
    int nColourRed = 0xFF0000FF;
    int nColourGreen = 0x00FF0FF;
    int nColourBlue = 0x0000FFFF;
    int nColourWhite = 0xFFFFFFFF;
    int nFadeOut = 0xFFFFFFFF;
    float timeOnScreen = 9999.0f;    

    string msg1 = GetLocalString(pc, "msg1");
    string msg2 = GetLocalString(pc, "msg2");
    string msg3 = GetLocalString(pc, "msg3");
    string msg4 = GetLocalString(pc, "msg4");
    string msg5 = GetLocalString(pc, "msg5");

    if (GetStringLength(msg1) > 0)
    {
        if (GetStringLength(msg2) > 0)
        {
            if (GetStringLength(msg3) > 0)
            {
                if (GetStringLength(msg4) > 0)
                {
                    if (GetStringLength(msg5) > 0)
                    {
                        msg1 = msg2;
                        msg2 = msg3;
                        msg3 = msg4;
                        msg4 = msg5;
                    }
                    
                    msg5 = message;
                }
                else
                {
                    msg4 = message;
                }
            }
            else
            {
                msg3 = message;
            }
        }
        else
        {
            msg2 = message;
        }
    }
    else
    {
        msg1 = message;
    }

    SetLocalString(pc, "msg1", msg1);
    SetLocalString(pc, "msg2", msg2);
    SetLocalString(pc, "msg3", msg3);
    SetLocalString(pc, "msg4", msg4);
    SetLocalString(pc, "msg5", msg5);
    
    PostString(pc, msg1, 0, 0, SCREEN_ANCHOR_TOP_LEFT, timeOnScreen, nColourWhite, nFadeOut);
    PostString(pc, msg2, 0, 1, SCREEN_ANCHOR_TOP_LEFT, timeOnScreen, nColourWhite, nFadeOut);
    PostString(pc, msg3, 0, 2, SCREEN_ANCHOR_TOP_LEFT, timeOnScreen, nColourWhite, nFadeOut);
    PostString(pc, msg4, 0, 3, SCREEN_ANCHOR_TOP_LEFT, timeOnScreen, nColourWhite, nFadeOut);
    PostString(pc, msg5, 0, 4, SCREEN_ANCHOR_TOP_LEFT, timeOnScreen, nColourWhite, nFadeOut);
}

void main()
{
    string command = GetPCChatMessage();
    object pc = GetFirstPC();
    
    int commandLength = GetStringLength(command);
    string commandPrefix = "tp_";
    int isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        string targetTag = GetSubString(command, 3, commandLength - 3);
        object target = GetObjectByTag(targetTag);
        location targetLocation = GetLocation(target);
        AssignCommand(pc, JumpToLocation(targetLocation));
        return;
    }

    commandPrefix = "gm";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        int prefixLength = GetStringLength(commandPrefix);
        string strValue = GetSubString(command, commandLength - 1, 1);
        int value = StringToInt(strValue);
        string debug = "god mode mismatch";
        if (value == 1)
        {
            if (GetLocalInt(pc, "GodMode") == 0)
            {
                debug = "ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTemporaryHitpoints(10000), pc, 1000f);";

                SetLocalInt(pc, "GodMode", 1);
                SetLocalInt(pc, "HP", GetMaxHitPoints(pc));
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectTemporaryHitpoints(10000), pc);
            }
        }
        else
        {
            if (GetLocalInt(pc, "GodMode") == 1)
            {
                int hp = GetCurrentHitPoints(pc);
                int originalHP = GetLocalInt(pc, "HP");
                debug = "ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(" + IntToString(hp - originalHP) + "), pc);";

                SetLocalInt(pc, "GodMode", 0);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(hp - originalHP), pc);
            }
        }

        DebugOut(debug);
        return;
    }

    commandPrefix = "tpcam";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        string strValue = GetSubString(command, commandLength - 1, 1);
        int value = StringToInt(strValue);

        int cameraMode = CAMERA_MODE_STIFF_CHASE_CAMERA;
        float pitch = -1.0f;
        float distance = -1.0f;
        float facing = GetFacing(pc);
        if (value == 1)
        {
            cameraMode = CAMERA_MODE_STIFF_CHASE_CAMERA;
            pitch = 80.0f;
            distance = 5.0f;

        }
        else
        {
            cameraMode = CAMERA_MODE_TOP_DOWN;
        }

        string strCameraMode = "";
        switch (cameraMode)
        {
            case 0:
                strCameraMode = "CAMERA_MODE_CHASE_CAMERA";
                break;

            case 1:
                strCameraMode = "CAMERA_MODE_TOP_DOWN";
                break;

            case 2:
                strCameraMode = "CAMERA_MODE_STIFF_CHASE_CAMERA";
                break;
        }

        string debug = "SetCameraMode(" + strCameraMode + ");\nSetCameraFacing(" + FloatToString(facing) + ", " + FloatToString(distance) + ", " + FloatToString(pitch) + ")";
        DebugOut(debug);
        DelayCommand(0.1f, AssignCommand(pc, SetCameraFacing(facing, distance, pitch)));

        DelayCommand(0.2f, LockCameraDistance(pc, value));
        DelayCommand(0.2f, LockCameraPitch(pc, value));
        DelayCommand(0.3f, SetCameraMode(pc, cameraMode));

        return;
    }

    commandPrefix = "scm";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        string strValue = GetSubString(command, commandLength - 1, 1);
        int value = StringToInt(strValue);
        switch (value)
        {
            case 0:
                strValue = "CAMERA_MODE_CHASE_CAMERA";
                break;

            case 1:
                strValue = "CAMERA_MODE_TOP_DOWN";
                break;

            case 2:
                strValue = "CAMERA_MODE_STIFF_CHASE_CAMERA";   // <--- 3rd person
                break;
        }
        string debug = "Setting Camera Mode to " + strValue;
        DebugOut(debug);
        SetCameraMode(pc, value);
        return;
    }

    commandPrefix = "scp";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        // 80 <--- 3rd person
        float facing = GetFacing(pc);
        int prefixLength = GetStringLength(commandPrefix);
        string variable = GetSubString(command, prefixLength, commandLength - prefixLength);
        pitch = StringToFloat(variable);
        string debug = "SetCameraFacing(" + FloatToString(facing) + ", " + FloatToString(distance) + ", " + variable + ")";
        DebugOut(debug);
        AssignCommand(pc, SetCameraFacing(facing, distance, pitch));
        return;
    }

    commandPrefix = "scd";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        // 10 <--- 3rd person
        float facing = GetFacing(pc);
        int prefixLength = GetStringLength(commandPrefix);
        string variable = GetSubString(command, prefixLength, commandLength - prefixLength);
        distance = StringToFloat(variable);
        string debug = "SetCameraFacing(" + FloatToString(facing) + ", " + variable + ", " + FloatToString(pitch) + ")";
        DebugOut(debug);
        AssignCommand(pc, SetCameraFacing(facing, distance, pitch));
        return;
    }

    commandPrefix = "kill";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        string debug = "Kill PC";
        DebugOut(debug);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(999), pc);
        return;
    }

    commandPrefix = "svi_";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        int prefixLength = GetStringLength(commandPrefix);
        string variable = GetSubString(command, prefixLength, commandLength - 1 - prefixLength);
        string strValue = GetSubString(command, commandLength - 1, 1);
        int value = StringToInt(strValue);
        string debug = "SetLocalInt(PC, " + variable + ", " + strValue + ")";
        DebugOut(debug);
        SetLocalInt(pc, variable, value);
        return;
    }

    commandPrefix = "sgvi_";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        int prefixLength = GetStringLength(commandPrefix);
        string variable = GetSubString(command, prefixLength, commandLength - 1 - prefixLength);
        string strValue = GetSubString(command, commandLength - 1, 1);
        int value = StringToInt(strValue);
        string debug = "SetLocalInt(Module, " + variable + ", " + strValue + ")";
        DebugOut(debug);
        SetLocalInt(GetModule(), variable, value);
        return;
    }

    commandPrefix = "gi_";
    isValidCommand = FindSubString(command, commandPrefix);
    if (isValidCommand != -1)
    {
        int prefixLength = GetStringLength(commandPrefix);
        string itemRef = GetSubString(command, prefixLength, commandLength - 1 - prefixLength);
        string strValue = GetSubString(command, commandLength - 1, 1);
        int value = StringToInt(strValue);
        string debug = "";
        if (value == 1)
        {
            object item = CreateItemOnObject(itemRef, pc);
            SetLocalObject(pc, itemRef, item);
            debug = "CreateItemOnObject(PC, " + itemRef + ", " + GetTag(item) + ")";
        }
        else
        {
            object item = GetLocalObject(pc, itemRef);
            if (item != OBJECT_INVALID)
            {
                debug = "DestroyObject(" + itemRef + ")";
                SetLocalObject(pc, itemRef, OBJECT_INVALID);
                DestroyObject(item);
            }
            else
            {
                debug = "Could not find object " + itemRef;
            }
        }

        DebugOut(debug);
        return;
    }
}
