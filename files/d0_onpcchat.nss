#include "d0_cmd_inc"
void main()
{
    object oPC      = GetPCChatSpeaker();
    int    iVolume  = GetPCChatVolume();
    string sMessage = GetPCChatMessage();
    object oTarget, oTarget2;
    int    iLen, iXLen, iNum, iNum2;
    float  fNum;
    string sParam, sParam2, sParam3, sParam4, cmd, sMsg;

    if(!GetIsPC(oPC) && !GetIsDM(oPC))return;

    //********************************************************************//
    //*                        Chatunterdrueckung                        *//
    //********************************************************************//
    if(NWNXChat_GetIsPCChannelSupressed(oPC, iVolume))
    {
        SetPCChatMessage();
        SendMessageToPC(oPC, "Euer "+GetTalkVolumeName(iVolume)+" wurde von einem Spielleiter blockiert!");
        return;
    }


    //********************************************************************//
    //*                           Sprachitems                            *//
    //********************************************************************//

    if(GetStringLeft(sMessage, 2) == ";;")
    {
        if(GetLocalInt(oPC, "hls_MyLanguage") > 0)
        {
            iNum     = GetLocalInt(oPC, "hls_MyLanguage");
            sMessage = GetSubString(sMessage, 2, GetStringLength(sMessage)-2);

            if(sMessage == "")return;

            SetPCChatMessage(TranslateCommonToLanguage(iNum, ConvertColorTags(sMessage)));
            ParseLanguageMessage(oPC, ConvertColorTags(sMessage));
        }
        return;
    }

    //********************************************************************//
    //*                             Bank                               *//
    //********************************************************************//
    if(GetInternSwitch(DBK_CHAT_ENABLED, oPC))
    {
        string sIndex, sTemp, sNewMessage;

        sIndex = D0_INDEX_NUMBERS;
        iLen   = GetStringLength(sMessage);

        for(iNum = 0; iNum < iLen; iNum++)
        {
            sTemp = GetSubString(sMessage, iNum, 1);

            if(FindSubString(sIndex, sTemp) != -1)
            sNewMessage += sTemp;
        }

        iNum = StringToInt(sNewMessage);
        if(DBK_GetGold(oPC) >= iNum)
        {
            SetInternSwitch(DBK_CURRENT_AMOUNT, iNum, oPC);
            Debug(oPC, "Neuer Betrag: "+sNewMessage);
        }
        else
        Debug(oPC, "Ihr besitzt nicht soviel Gold!");

        return;
    }

    //********************************************************************//
    //*                           Chatbefehle                            *//
    //********************************************************************//
    if(GetStringLeft(sMessage, 1) == "/" && GetStringLeft(sMessage, 2) != "//")
    {
        SetPCChatMessage();

        if(FindSubString(sMessage, " ") == -1)
            cmd = GetStringLowerCase(sMessage);
        else
            cmd = GetLowerStringLeft(sMessage, FindSubString(sMessage, " "));

        cmd = GetStringRight(cmd, GetStringLength(cmd)-1);


        //********************************************************************//
        //*                      Spielleiter-befehle                         *//
        //********************************************************************//
        if(GetIsDM(oPC))
        {
            if(IsCommand(cmd, "dminfo"))
            {
                sParam = GetChatParameter(sMessage);

                if(!GetIsCommandValid(sParam))sParam = "DMInfo";

                CreateInfoDisplay("Informationsanzeige - "+sParam, GetCommandDescription(sParam, TRUE));
                return;
            }
            //********************************************************************//
            //*                   Flügel des Spielers veraendern                 *//
            //********************************************************************//
            else if(IsCommand(cmd, "flügel||wing"))
            {
                iNum    = StringToInt(GetChatParameter(sMessage));
                oTarget = GetPCChatTarget();

                if(!GetIsObjectValid(oTarget))
                {
                    Debug(oPC, "Anvisierter Spieler existiert nicht!");
                    return;
                }
                if(iNum < 0)
                {
                    Debug(oPC, "Ungültiger Flügeltyp!");
                    return;
                }

                SendMessageToPC(oPC, "Alter Flügeltyp: "+IntToString(GetCreatureWingType(oTarget))+", neuer Flügeltyp: "+IntToString(iNum));
                SetCreatureWingType(iNum, oTarget);
                return;
            }
            //********************************************************************//
            //*                  Schwanz des Spielers veraendern                 *//
            //********************************************************************//
            else if(IsCommand(cmd, "schwanz||tail"))
            {
                iNum    = StringToInt(GetChatParameter(sMessage));
                oTarget = GetPCChatTarget();

                if(!GetIsObjectValid(oTarget))
                {
                    Debug(oPC, "Anvisierter Spieler existiert nicht!");
                    return;
                }
                if(iNum < 0)
                {
                    Debug(oPC, "Ungültiger Schwanztyp!");
                    return;
                }

                SendMessageToPC(oPC, "Alter Schwanztyp: "+IntToString(GetCreatureTailType(oTarget))+", neuer Schwanztyp: "+IntToString(iNum));
                SetCreatureTailType(iNum, oTarget);
                return;
            }
            //********************************************************************//
            //*                     Gegenstaende kopieren                        *//
            //********************************************************************//
            else if(IsCommand(cmd, "kopieren||copy"))
            {
                iNum    = StringToInt(GetChatParameter(sMessage));
                oTarget = GetPCChatTarget();

                if(!GetIsObjectValid(oTarget))
                {
                    Debug(oPC, "Kein Objekt anvisiert!");
                    return;
                }

                if(GetIsPC(oTarget))
                {
                    Debug(oPC, "Du kannst keine Spieler-Charaktere kopieren!");
                    return;
                }

                if(iNum <= 0) iNum = 1;
                if(iNum >  15)iNum = 15;

                int iCount;
                if(GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
                {
                    for(iCount=0; iCount < iNum; iCount++){object oNew = SafeCopyItem(oTarget, oPC, TRUE);}
                    Debug(oPC, GetName(oTarget)+" "+IntToString(iNum)+"-mal in euer Inventar kopiert!");
                }
                else if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
                {
                    for(iCount=0; iCount < iNum; iCount++){object oNew = SafeCopyObject(oTarget, GetLocation(oTarget));}
                    Debug(oPC, GetName(oTarget)+" "+IntToString(iNum)+"-mal kopiert!");
                }
                else
                Debug(oPC, "Ungültiges Objekt!");

                return;
            }
            else if(IsCommand(cmd, "kopierenziel||copytarget"))
            {
                iNum    = StringToInt(GetChatParameter(sMessage));
                oTarget = GetPCChatTarget();

                if(!GetIsObjectValid(oTarget))
                {
                    Debug(oPC, "Kein Objekt anvisiert!");
                    return;
                }

                if(GetIsPC(oTarget))
                {
                    Debug(oPC, "Du kannst keine Spieler-Charaktere kopieren!");
                    return;
                }

                if(iNum <= 0) iNum = 1;
                if(iNum >  15)iNum = 15;

                int iCount;
                if(GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
                {
                    for(iCount=0; iCount < iNum; iCount++){object oNew = SafeCopyItem(oTarget, GetItemPossessor(oTarget), TRUE);}
                    Debug(oPC, GetName(oTarget)+" "+IntToString(iNum)+"-mal in das Inventar von "+GetName(GetItemPossessor(oTarget))+" kopiert!");
                }
                else if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
                {
                    for(iCount=0; iCount < iNum; iCount++){object oNew = SafeCopyObject(oTarget, GetLocation(oTarget));}
                    Debug(oPC, GetName(oTarget)+" "+IntToString(iNum)+"-mal kopiert!");
                }
                else
                Debug(oPC, "Ungültiges Objekt!");

                return;
            }
            //********************************************************************//
            //*                    Spielerkanal sperren                          *//
            //********************************************************************//
            else if(IsCommand(cmd, "dmchansupress"))
            {
                sParam  = GetChatParameter(sMessage);    //account
                sParam2 = GetChatParameter(sMessage, 2); //channel
                oTarget = GetPCExists(sParam);

                if(sParam2 == "")
                {
                    oTarget = GetPCChatTarget();

                    sParam2=sParam;
                }

                if(!GetIsObjectValid(oTarget))
                {
                    Debug(oPC, sParam+" existiert nicht!");
                    return;
                }

                if(GetStringLength(sParam2) > 1)
                    iNum = GetTalkvolumeByString(sParam2);
                else
                    iNum = StringToInt(sParam2);

                if(iNum > 6 || iNum < 0)
                {
                    Debug(oPC, "Ungültigen Kanal angegeben!");
                    return;
                }

                if(NWNXChat_GetIsPCChannelSupressed(oTarget, iNum))
                {
                    NWNXChat_SetPCSupressChannelMode(oTarget, iNum, FALSE);
                    Debug(oPC, "Ihr habt "+GetName(oTarget)+"s "+GetTalkVolumeName(iNum)+" freigegeben!");
                    Debug(oTarget, "Euer "+GetTalkVolumeName(iNum)+" wurde von einem Spielleiter freigegeben!");
                }
                else
                {
                    NWNXChat_SetPCSupressChannelMode(oTarget, iNum, TRUE);
                    Debug(oPC, "Ihr habt "+GetName(oTarget)+"s "+GetTalkVolumeName(iNum)+" gesperrt!");
                    Debug(oTarget, "Euer "+GetTalkVolumeName(iNum)+" wurde von einem Spielleiter gesperrt!");
                }
                return;
            }
            //********************************************************************//
            //*                     Text auf DB speichern                        *//
            //********************************************************************//
            else if(IsCommand(cmd, "dmignore"))
            {
                sParam   = GetChatParameter(sMessage);    //account1
                sParam2  = GetChatParameter(sMessage, 2); //account2
                oTarget  = GetPCExists(sParam);
                oTarget2 = GetPCExists(sParam2);

                if(sParam == "" || sParam2 == "")
                {
                    ShowInvalidFunctionText(cmd);return;
                }

                if(GetIsDM(oTarget2))
                {
                    Debug(oPC, "Spielleiter können nicht ignoriert werden!");
                    return;
                }

                if(!GetIsObjectValid(oTarget))
                {
                    Debug(oPC, sParam+" existiert nicht!");
                    return;
                }
                if(!GetIsObjectValid(oTarget2))
                {
                    Debug(oPC, sParam2+" existiert nicht!");
                    return;
                }

                if(NWNXChat_GetIgnorePC(oTarget, oTarget2))
                {
                    NWNXChat_SetIgnorePC(oTarget, oTarget2, FALSE);
                    Debug(oPC, GetName(oTarget)+" ignoriert "+GetName(oTarget2)+" jetzt nicht mehr!");
                    Debug(oTarget, "Du ignorierst "+GetName(oTarget2)+" nicht mehr! (Erzwungen von SL)");
                    Debug(oTarget2, GetName(oTarget)+" ignoriert dich nicht mehr! (Erzwungen von SL)");
                }
                else
                {
                    NWNXChat_SetIgnorePC(oTarget, oTarget2, TRUE);
                    Debug(oPC, GetName(oTarget)+" ignoriert jetzt "+GetName(oTarget2)+"!");
                    Debug(oTarget, "Du ignorierst jetzt "+GetName(oTarget2)+"! (Erzwungen von SL)");
                    Debug(oTarget2, GetName(oTarget)+" ignoriert dich jetzt! (Erzwungen von SL)");
                }

                return;
            }
            //********************************************************************//
            //*                    Nebel in Gebiet aendern                      *//
            //********************************************************************//
            else if(IsCommand(cmd, "dmassociate"))
            {
                oTarget = GetPCChatTarget();
                iNum    = GetPolymorphFromAppearance(GetChatParameterInt(sMessage));

                if(!GetIsObjectValid(oTarget))
                {
                    Debug(oPC, "Ihr habt kein Ziel angewählt. Über das Spielerwerkzeug 1 in eurer Spezialfähigkeitenleiste, könnt ihr ein Ziel anvisieren!");
                    return;
                }

                if(iNum < 0)
                {
                    Debug(oPC, "Ungültige Gefährtennummer!");
                    return;
                }

                SetAlternativeAssociate(oTarget, iNum);
                Debug(oPC, "Ihr habt das Aussehen von "+GetName(oTarget)+"s Begleiter geändert (No. "+IntToString(iNum)+")");
                Debug(oTarget, "Das Aussehen von eurem Begleiter wurde geändert");
                return;
            }
            //********************************************************************//
            //*                    Nebel in Gebiet aendern                      *//
            //********************************************************************//
            else if(IsCommand(cmd, "foghex"))
            {
                sParam  = GetChatParameter(sMessage);    //Amount
                sParam2 = GetChatParameter(sMessage, 2); //Type 0-2

                if(sParam == "")
                {
                    ShowInvalidFunctionText(cmd);return;
                }

                iNum  = HexStringToInt(sParam);
                iNum2 = StringToInt(sParam2);

                if(iNum <= 0)
                {
                    ShowInvalidFunctionText(cmd);return;
                }
                if(iNum2 <= 0 || iNum2 > 2)iNum2 = FOG_TYPE_ALL;

                SetFogColor(iNum2, iNum, GetArea(oPC));
                return;
            }
            else if(IsCommand(cmd, "fogcolor"))
            {
                sParam  = GetChatParameter(sMessage);    //Amount
                sParam2 = GetChatParameter(sMessage, 2); //Type 0-2

                if(sParam == "")
                {
                    ShowInvalidFunctionText(cmd);return;
                }

                iNum  = StringToInt(sParam);
                iNum2 = StringToInt(sParam2);

                if(iNum <= 0)
                {
                    ShowInvalidFunctionText(cmd);return;
                }
                if(iNum2 <= 0 || iNum2 > 2)iNum2 = FOG_TYPE_ALL;

                SetFogColor(iNum2, iNum, GetArea(oPC));
                return;
            }
            //********************************************************************//
            //*                 Nebeldichte in Gebiet aendern                    *//
            //********************************************************************//
            else if(IsCommand(cmd, "fogamount"))
            {
                sParam  = GetChatParameter(sMessage);    //Amount
                sParam2 = GetChatParameter(sMessage, 2); //Type 0-2

                if(sParam == "")
                {
                    ShowInvalidFunctionText(cmd);return;
                }

                iNum  = StringToInt(sParam);
                iNum2 = StringToInt(sParam2);

                if(iNum <= 0)
                {
                    ShowInvalidFunctionText(cmd);return;
                }
                if(iNum2 <= 0 || iNum2 > 2)iNum2 = FOG_TYPE_ALL;

                SetFogAmount(iNum2, iNum, GetArea(oPC));
                return;
            }
            //********************************************************************//
            //*                     Text auf DB speichern                        *//
            //********************************************************************//
            else if(IsCommand(cmd, "dbsave"))
            {
                sParam  = GetChatParameter(sMessage);    // varname
                sParam2 = GetChatParameter(sMessage, 2); // text

                if(sParam == "")
                {
                    ShowInvalidFunctionText(cmd);return;
                }
                else if(sParam != "" && sParam2 != "")
                {
                    SQLExecDirect("insert into "+TE_CHATDB+" ("+CAccname+","+CTextName+","+CText+") values ('"+GetPCPlayerName(oPC)+"','"+sParam+"','"+sParam2+"')");
                    SetLocalString(oPC, sParam, sParam2);
                    Debug(oPC, "Text '"+sParam+"' gespeichert", TRUE);
                }
                return;
            }
            //********************************************************************//
            //*                      Text von DB abrufen                         *//
            //********************************************************************//
            else if(IsCommand(cmd, "dbcall"))
            {
                sParam = GetChatParameter(sMessage); //textname

                SQLExecDirect("select "+CText+" from "+TE_CHATDB+" where "+CAccname+"='"+GetPCPlayerName(oPC)+"' and "+CTextName+"='"+sParam+"'");

                if(SQLFetch())
                {
                    sParam3 = SQLGetData(1);
                    SetLocalString(oPC, sParam, sParam3);
                }

                // Invalid parameters
                if(sParam == "")
                {
                    ShowInvalidFunctionText(cmd);return;
                }
                else if(sParam3 == "")
                {
                    Debug(oPC, "Kein Text mit dem Variablennamen '"+sParam3+"' gespeichert", TRUE);return;
                }

                if(sParam != "" && sParam3 != "")
                {
                    SetPCChatMessage(sParam3);
                }
                return;
            }
            //********************************************************************//
            //*                      Text von DB loeschen                        *//
            //********************************************************************//
            else if(IsCommand(cmd, "dbdelete"))
            {
                sParam = GetChatParameter(sMessage); // varname

                // Invalid parameter
                if(sParam == "")
                {
                    ShowInvalidFunctionText(cmd);return;
                }

                SQLExecDirect("select "+CText+" from "+TE_CHATDB+" where "+CAccname+"='"+GetPCPlayerName(oPC)+"' and "+CTextName+"='"+sParam+"'");

                if(SQLFetch())sParam2 = SQLGetData(1);

                SQLExecDirect("delete from "+TE_CHATDB+" where "+CAccname+"='"+GetPCPlayerName(oPC)+"' and "+CTextName+"='"+sParam+"'");

                if(sParam2 == "")
                {
                    Debug(oPC, "Text '"+sParam+"' ist nicht in benutzung", TRUE);return;
                }
                else
                {
                    DeleteLocalString(oPC, sParam);
                    Debug(oPC, "Text '"+sParam+"' wurde zurückgesetzt", TRUE);return;
                }
                return;
            }
            //********************************************************************//
            //*                      Spielerskill aendern                        *//
            //********************************************************************//
            /*
            else if(IsCommand(cmd, "setskill"))
            {
                oTarget = GetPCChatTarget();
                sParam  = GetChatParameter(sMessage);    // profession, here: 1 or 2
                sParam2 = GetChatParameter(sMessage, 2); // format -/-/-/-/
                iNum    = DCS_GetProfession(oTarget, StringToInt(sParam));

                if(!GetIsObjectValid(oTarget))
                oTarget = oPC;

                SendMessageToPC(oPC, "Neuer Skillstatus vom Beruf "+DCS_GetProfessionName(iNum)+": "+sParam2);
                DCS_WriteSkillStatus(oTarget, iNum, sParam2);
            }
            */
            //********************************************************************//
            //*                      Spielerberuf aendern                        *//
            //********************************************************************//
            /*
            else if(IsCommand(cmd, "setprofession"))
            {
                oTarget = GetPCChatTarget();
                sParam  = GetChatParameter(sMessage);   // profession, here: 1 or 2
                sParam2 = GetChatParameter(sMessage, 2);// format -/-/-/-/
                iNum    = DCS_GetProfession(oTarget, StringToInt(sParam));

                if(!GetIsObjectValid(oTarget))
                oTarget = oPC;

                SendMessageToPC(oPC, "Neuer Status vom Beruf "+DCS_GetProfessionName(iNum)+": "+sParam2);
                //DCS_SetProfessionStatus(oTarget, iNum, sParam2);
            }
            */
            //********************************************************************//
            //*                      Spielerberuf abfragen                       *//
            //********************************************************************//
            /*
            else if(IsCommand(cmd, "getprofstatus"))
            {
                oTarget = GetPCChatTarget();
                sParam  = GetChatParameter(sMessage);   // profession, here: 1 or 2
                iNum    = DCS_GetProfession(oTarget, StringToInt(sParam));

                if(!GetIsObjectValid(oTarget))
                oTarget = oPC;

                SendMessageToPC(oPC, DCS_GetProfessionStatus(oTarget, iNum, TRUE));
            }
            */
            //********************************************************************//
            //*                      Spielerskill abfragen                       *//
            //********************************************************************//
            /*
            else if(IsCommand(cmd, "getskillstatus"))
            {
                oTarget = GetPCChatTarget();
                sParam  = GetChatParameter(sMessage);   // profession, here: 1 or 2
                iNum    = DCS_GetProfession(oTarget, StringToInt(sParam));

                if(!GetIsObjectValid(oTarget))
                oTarget = oPC;

                SendMessageToPC(oPC, DCS_GetSkillStatus(oTarget, iNum, TRUE));
            }
            */
        }

        //********************************************************************//
        //*                       Generelle Chatbefehle                      *//
        //********************************************************************//

        //********************************************************************//
        //*                             Emotes                               *//
        //********************************************************************//
        if(GetIsEmoteCommand(cmd))
        {
            iNum    = GetEmoteCommandAnimation(cmd);
            fNum    = 8500.0; //dauer
            sParam2 = GetChatParameter(sMessage);
            sParam  = GetStringLowerCase(GetChatParameter(sMessage, 2));//emotetext

            if(StringToFloat(sParam2) > 0.0)
            fNum = StringToFloat(sParam2);

            if(sParam == "an")
            SetPCChatMessage(GetEmoteCommandText(cmd));

            if(fNum > 0.0)
                AssignCommand(oPC, ActionPlayAnimation(iNum, 1.0, fNum));
            else
                AssignCommand(oPC, ActionPlayAnimation(iNum));
            return;
        }
        // Emoteliste
        else if(IsCommand(cmd, "emotes||emoteliste"))
        {
            CreateInfoDisplay("Emoteliste", GetEmoteList());
            return;
        }
        //********************************************************************//
        //*                         Informationsfenster                      *//
        //********************************************************************//
        if(IsCommand(cmd, "info"))
        {
            string sDisplay;
            sParam = GetChatParameter(sMessage);

            if(!GetIsCommandValid(sParam))
            {
                sParam   = "info";
                sDisplay = "";
            }
            else
                sDisplay = " - "+sParam;

            CreateInfoDisplay("Informationsanzeige"+sDisplay, GetCommandDescription(sParam));
            return;
        }
        //********************************************************************//
        //*                           Hilfefenster                           *//
        //********************************************************************//
        else if(IsCommand(cmd, "hilfe||help"))
        {
            CreateInfoDisplay("Hilfefenster", GetChatCommandList());
            return;
        }
        //********************************************************************//
        //*                            Rastmenü                              *//
        //********************************************************************//
        else if(IsCommand(cmd, "rasten||rest"))
        {
            AssignCommand(oPC, ActionStartConversation(oPC, "d0_resting", TRUE, FALSE));
            return;
        }
        //********************************************************************//
        //*                      Behälter umbenennen                         *//
        //********************************************************************//
        else if(IsCommand(cmd, "rename"))
        {
            object oTarget = GetLocalObject(oPC, "PCContainer_Target");
            string sName   = GetChatParameter(sMessage); // Neuer name
            string sDesc   = GetDescription(oTarget);

            if(GetIsObjectValid(oTarget)) {
                SetName(oTarget, sName);
                SetDescription(oTarget, sDesc);
            }
            else
                Debug(oPC, "Ihr müsst einen Behälter anvisieren, um diesen Befehl zu benutzen!");

            return;
        }
        //********************************************************************//
        //*                           Neu laden                              *//
        //********************************************************************//
        else if(IsCommand(cmd, "neuladen||reload"))
        {
            if(!GetLocalInt(oPC, "d0_reloaded"))
            {
                SetLocalInt(oPC, "d0_reloaded", TRUE);
                DCS_UpdatePlayerSkill(oPC, TRUE);
                ExportSingleCharacter(oPC);
                Debug(oPC, "Eure Daten wurden neu geladen");
                DelayCommand(60.0, DeleteLocalInt(oPC, "d0_reloaded"));
            }
            else
            Debug(oPC, "Ihr könnt diesen Befehl nur alle 60 Sekunden aufrufen");

            return;
        }
        //********************************************************************//
        //*                           Würfelbeutel                           *//
        //********************************************************************//
        else if(IsCommand(cmd, "würfel||dice"))
        {
            string sSpeak;
            int iMod, iDice;
            sParam = GetStringLowerCase(GetChatParameter(sMessage));
            iNum   = stInt(GetChatParameter(sMessage));

            if(iNum)
            {
                iDice  = diceX(iNum);
                sSpeak = ColorText("Wurf 1w"+inStr(iNum)+": "+IntToString(iDice), nwcCyan);
            }
            else
            {
                if(sParam == "cha" || sParam == "charisma")
                {
                    sParam2 = "Charisma";
                    iNum    = ABILITY_CHARISMA;
                }
                else if(sParam == "kon" || sParam == "konstitution")
                {
                    sParam2 = "Konstitution";
                    iNum    = ABILITY_CONSTITUTION;
                }
                else if(sParam == "ges" || sParam == "geschicklichkeit")
                {
                    sParam2 = "Geschicklichkeit";
                    iNum    = ABILITY_DEXTERITY;
                }
                else if(sParam == "int" || sParam == "intelligenz")
                {
                    sParam2 = "Intelligenz";
                    iNum    = ABILITY_INTELLIGENCE;
                }
                else if(sParam == "str" || sParam == "stärke")
                {
                    sParam2 = "Stärke";
                    iNum    = ABILITY_STRENGTH;
                }
                else if(sParam == "wis" || sParam == "weisheit")
                {
                    sParam2 = "Weisheit";
                    iNum    = ABILITY_WISDOM;
                }

                iDice  = d20();
                iMod   = GetAbilityModifier(iNum);
                sSpeak = ColorText(sParam2+", Wurf 1w20: "+IntToString(iDice)+" + Attributs-Modifikator: "+IntToString(iMod)+" = Total: "+IntToString(iDice+iMod), nwcCyan);
            }

            AssignCommand(oPC, SpeakString(sSpeak));
            AssignCommand(oPC, SpeakString(sSpeak, TALKVOLUME_SILENT_SHOUT));
            return;
        }
        //********************************************************************//
        //*                        Sprachitem aktivieren                     *//
        //********************************************************************//
        else if(IsCommand(cmd, "sprache||language"))
        {
            sParam  = GetChatParameter(sMessage);
            sParam2 = GetLanguageItemTag(sParam);
            oTarget = GetItemPossessedBy(oPC, sParam2);

            if(IsCommand(sParam, "none||keine"))
            {
                Debug(oPC, "Sprache deaktiviert", TRUE);
                DeleteLocalInt(oPC, "hls_MyLanguage");
                DeleteLocalString(oPC, "hls_MyLanguageName");
                return;
            }

            // Invalid parameters
            if(sParam == "" || sParam2 == "")
            {
                ShowInvalidFunctionText(cmd);return;
            }

            iNum = StringToInt(GetSubString(sParam2, 8, GetStringLength(sParam2)-8));

            if(GetIsObjectValid(oTarget) || iNum == 99 || GetDefaultRacialLanguage(oPC) == iNum || GetIsDM(oPC))
            {
                Debug(oPC, "Sprache aktiviert: Ihr sprecht nun die Sprache "+ColorText(GetLanguageName(iNum), nwcWhite));
                SetLocalInt(oPC, "hls_MyLanguage", iNum);
                SetLocalString(oPC, "hls_MyLanguageName", GetLanguageName(iNum));
            }
            else
            {
                Debug(oPC, "Ihr besitzt dieses Sprachitem nicht", TRUE);
            }
            return;
        }
        //********************************************************************//
        //*                        Spieler ignorieren                        *//
        //********************************************************************//
        else if(IsCommand(cmd, "ignore||ignorieren"))
        {
            sParam = GetChatParameter(sMessage); //account

            if(GetIsDM(oTarget))
            {
                Debug(oPC, "Du kannst keinen Spielleiter ignorieren!");
                return;
            }

            if(sParam == "" || sParam == Chatvar_Target)
                oTarget = GetPCChatTarget();
            else
                oTarget = GetPCExists(sParam);

            if(!GetIsObjectValid(oTarget))
            {
                Debug(oPC, sParam+" existiert nicht!");
                return;
            }

            if(NWNXChat_GetIgnorePC(oPC, oTarget))
            {
                NWNXChat_SetIgnorePC(oPC, oTarget, FALSE);
                Debug(oPC, "Du ignorierst "+GetName(oTarget)+" nicht mehr!");
                Debug(oTarget, GetName(oPC)+" ignoriert dich nicht mehr!");
            }
            else
            {
                NWNXChat_SetIgnorePC(oPC, oTarget, TRUE);
                Debug(oPC, "Du ignorierst jetzt "+GetName(oTarget)+"!");
                Debug(oTarget, GetName(oPC)+" ignoriert dich jetzt!");
            }
            return;
        }
        //********************************************************************//
        //*                    Goldbetrag in Bank einzahlen                  *//
        //********************************************************************//
        else if(IsCommand(cmd, "einzahlen||deposit"))
        {
            if(DBK_GetIsInBank(oPC) || GetIsDM(oPC)) //Is in Bank?
            {
                if(DBK_GetIsMember(oPC)) // Is a Member of the Bank?
                {
                    string sDebug;
                    sParam = GetChatParameter(sMessage);
                    iNum   = StringToInt(sParam);          //Amount of Gold

                    if(!iNum)
                        return;
                    else if(GetGold(oPC) < iNum || GetStringLength(sParam) >= 18)
                    {
                        Debug(oPC, "Ihr besitzt nicht so viel Gold!");
                        return;
                    }

                    if(!DBK_USE_PERCENTAGE)
                    DBK_StoreGold(oPC, iNum);

                    sDebug = "Ihr habt "+ColorText(ConvertNumberToString(FloatToInt(iNum*DBK_PERCENTAGE)), nwcYellow)+" Gold in der Bank eingezahlt! ";

                    if(DBK_USE_PERCENTAGE)
                    sDebug += "(Incl. "+DBK_PERCENTAGE_STRING+" Zusatzkosten)";

                    Debug(oPC, sDebug);
                }
                else
                    Debug(oPC, "Ihr braucht eine Mitgliedskarte, um etwas in der Bank einzuzahlen. Redet mit einem Bänker, um eine zu erhalten!");
            }
            else
                Debug(oPC, "Ihr müsst euch in einer Bank befinden!");

            return;
        }
        //********************************************************************//
        //*                    Goldbetrag von Bank abheben                   *//
        //********************************************************************//
        else if(IsCommand(cmd, "abheben||withdraw"))
        {
            if(DBK_GetIsInBank(oPC) || GetIsDM(oPC)) //Is in Bank?
            {
                if(DBK_GetIsMember(oPC)) // Is a Member of the Bank?
                {
                    sParam = GetChatParameter(sMessage);
                    iNum   = StringToInt(sParam);          //Amount of Gold

                    if(!iNum)return;

                    if(DBK_GetGoldStored(oPC) < iNum || GetStringLength(sParam) >= 18)
                    {
                        Debug(oPC, "Ihr habt nicht so viel Gold auf der Bank eingezahlt!");
                        return;
                    }

                    DBK_WithdrawGold(oPC, iNum);
                    GiveGoldToCreature(oPC, iNum);
                    Debug(oPC, "Ihr habt "+ColorText(ConvertNumberToString(iNum), nwcYellow)+" Gold von der Bank abgehoben!");
                }
                else
                    Debug(oPC, "Ihr braucht eine Mitgliedskarte, um etwas in der Bank einzuzahlen. Redet mit einem Bänker, um eine zu erhalten!");
            }
            else
                Debug(oPC, "Ihr müsst euch in einer Bank befinden!");

            return;
        }
        //********************************************************************//
        //*                  Goldbetrag an Spieler ueberweisen               *//
        //********************************************************************//
        else if(IsCommand(cmd, "überweisung||ueberweisung||transfer"))
        {
            if(DBK_GetIsInBank(oPC) || GetIsDM(oPC)) //Is in Bank?
            {
                if(DBK_GetIsMember(oPC)) // Is a Member of the Bank?
                {
                    sParam  = GetChatParameter(sMessage);   //Charname
                    sParam2 = GetChatParameter(sMessage, 2);//Accname
                    iNum    = StringToInt(GetChatParameter(sMessage, 3));//Amount

                    if(sParam == "" || sParam2 == "" || !iNum)
                    {
                        sParam = Chatvar_Target;
                        iNum   = StringToInt(GetChatParameter(sMessage));

                        if(!iNum)
                        {
                            ShowInvalidFunctionText(cmd);return;
                        }
                    }

                    if(sParam == Chatvar_Target)
                    {
                        oTarget = GetPCChatTarget();

                        if(GetIsObjectValid(oTarget))
                        {
                            if(oTarget == oPC)
                            {
                                Debug(oPC, "Ihr könnt euch selbst kein Gold überweisen!");
                            }
                            else if(DBK_GetGold(oPC) >= iNum || GetIsDM(oPC))
                            {
                                DBK_TransferGoldToPlayer(oPC, oTarget, iNum);
                            }
                            else
                            Debug(oPC, "Ihr habt nicht genug Gold für diese Überweisung!");
                        }
                        else
                        Debug(oPC, "Euer Ziel existiert nicht!");
                    }
                    else
                    {
                        if(DBK_GetGold(oPC) >= iNum || GetIsDM(oPC))
                        {
                            DBK_TransferGold(oPC, sParam, sParam2, iNum);
                        }
                        else
                        Debug(oPC, "Ihr habt nicht genug Gold für diese Überweisung!");
                    }
                }
                else
                    Debug(oPC, "Ihr braucht eine Mitgliedskarte, um etwas in der Bank einzuzahlen. Redet mit einem Bänker, um eine zu erhalten!");
            }
            else
                Debug(oPC, "Ihr müsst euch in einer Bank befinden!");

            return;
        }
        //********************************************************************//
        //*                               Afk                                *//
        //********************************************************************//
        else if(IsCommand(cmd, "afk"))
        {
            location lLoc = GetLocation(oPC);
            string   sTag = "afk_butterflies";
            CreateObject(OBJECT_TYPE_PLACEABLE,sTag,lLoc,FALSE);
            AssignCommand(oPC, ActionInteractObject(GetObjectByTag(sTag)));

            return;
        }
        //********************************************************************//
        //*                          Text speichern                          *//
        //********************************************************************//
        else if(IsCommand(cmd, "save"))
        {
            sParam  = GetChatParameter(sMessage);    // varname
            sParam2 = GetChatParameter(sMessage, 2); // text

            if(sParam == "")
            {
                ShowInvalidFunctionText(cmd);return;
            }
            else if(sParam != "" && sParam2 != "")
            {
                SetLocalString(oPC, sParam, sParam2);
                Debug(oPC, "Text '"+sParam+"' gespeichert", TRUE);
            }
            return;
        }
        //********************************************************************//
        //*                    Gespeicherten Text aufrufen                   *//
        //********************************************************************//
        else if(IsCommand(cmd, "call"))
        {
            sParam  = GetChatParameter(sMessage);    //text name
            sParam3 = GetLocalString(oPC, sParam);

            // Invalid parameters
            if(sParam == "")
            {
                ShowInvalidFunctionText(cmd);return;
            }
            else if(sParam3 == "")
            {
                Debug(oPC, "Kein Text mit dem Variablennamen '"+sParam3+"' gespeichert", TRUE);return;
            }

            if(sParam != "" && sParam3 != "")
            {
                if(iVolume == TALKVOLUME_SHOUT)
                SetPCChatVolume();

                SetPCChatMessage(sParam3);
            }
            return;
        }
        //********************************************************************//
        //*                    Gespeicherten Text loeschen                   *//
        //********************************************************************//
        else if(IsCommand(cmd, "delete"))
        {
            sParam  = GetChatParameter(sMessage); // varname
            sParam2 = GetLocalString(oPC, sParam);

            // Invalid parameter
            if(sParam == "")
            {
                ShowInvalidFunctionText(cmd);return;
            }

            if(sParam2 == "")
            {
                Debug(oPC, "Text '"+sParam+"' ist nicht in benutzung", TRUE);return;
            }
            else
            {
                DeleteLocalString(oPC, sParam);
                Debug(oPC, "Text '"+sParam+"' wurde zurückgesetzt", TRUE);return;
            }
            return;
        }
        //********************************************************************//
        //*                           Ziel Folgen                            *//
        //********************************************************************//
        else if(IsCommand(cmd, "folgen||follow"))
        {
            sParam  = GetChatParameter(sMessage);
            sParam2 = GetChatParameter(sMessage, 2);

            if(sParam == Chatvar_Target && !GetIsObjectValid(GetPCChatTarget()))
            {
                Debug(oPC, "Ihr habt kein Ziel angewählt. Über das Spielerwerkzeug 1 in eurer Spezialfähigkeitenleiste, könnt ihr ein Ziel anvisieren!");
                return;
            }

            if(sParam == "" && GetIsObjectValid(GetPCChatTarget()))
            {
                sParam = Chatvar_Target;
            }

            // Invalid parameters
            else if(sParam == "")
            {
                ShowInvalidFunctionText(cmd);return;
            }

            fNum    = StringToFloat(sParam2);
            oTarget = GetChatTarget(sParam);

            if(fNum == 0.0) fNum = 3.0;

            if(GetIsObjectValid(oTarget))
            AssignCommand(oPC, ActionForceFollowObject(oTarget, StringToFloat(sParam2)));

            else if(IsCommand(sParam, "$ziel||$target||$nearest||$associate||$henchman||$begleiter||$gefährte"))
                Debug(oPC, "Kein gültiges Ziel gefunden ", TRUE);
            else
                Debug(oPC, sParam+" ist kein gültiges Ziel ", TRUE);

            return;
        }

        //********************************************************************//
        //*                          Ziel anvisieren                         *//
        //********************************************************************//
        else if(IsCommand(cmd, "target"))
        {
            sParam  = GetChatParameter(sMessage);
            sParam2 = GetChatParameter(sMessage, 2);

            if(sParam2 == "")sParam2 = "sc";

            // Invalid parameters
            if(sParam == "" || (!IsCommand(sParam2, "pc||sc") && !IsCommand(sParam2, "nsc||npc")))
            {
                ShowInvalidFunctionText(cmd);return;
            }
            // finding the nearest creature
            if(IsCommand(sParam, "$nearest"))
            {
                // should it be a pc or npc?
                if(IsCommand(sParam2, "pc||sc"))iNum = TRUE;

                oTarget = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, iNum, oPC);
            }
            else
            {
                // finding the first pc with sParam as name or part of the name
                if(IsCommand(sParam2, "pc||sc"))
                {
                    oTarget = GetPCByName(sParam);
                }
                // finding the first npc with sParam as name or part of the name
                else if(IsCommand(sParam2, "nsc||npc"))
                {
                    oTarget = GetNearestCreatureByName(sParam, oPC);
                }
            }
            if(GetIsObjectValid(oTarget))
            {
                SetChatTarget(oTarget);
                Debug(oPC, GetName(oTarget)+" als Ziel anvisiert", TRUE);
            }
            else
            {
                if(IsCommand(sParam, "$nearest"))
                {
                    Debug(oPC, "Kein gültiges Ziel gefunden", TRUE);
                }
                else
				{
					Debug(oPC, sParam+" ist kein gültiges Ziel", TRUE);
				}
            }
            return;
        }
		
		//********************************************************************//
        //*                          Selbst töten                            *//
        //********************************************************************//
        else if(IsCommand(cmd, "death"))
		{
			int HP = GetCurrentHitPoints(oPC);
			
			if(HP < 0)
			{
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oPC);
			}
			else
			{
				Debug(oPC, "* Dieser Befehl funktioniert nur, wenn eure HP unter 0 sind! *", TRUE);
			}
			return;
		}


        return;
    } //Chatbefehle ende

    SetPCChatMessage(ConvertColorTags(sMessage));
}
