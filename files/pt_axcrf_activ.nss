//Универсальный скрипт активации инструмента, и для активации служебных предметов
//Вызывается от лица игрока различными скриптами-обертками (активация предмета, разговор с нпс, проход по триггеру, действие на плейсабл)
//

#include "pt_axcrf_include"


//////////////////////////////////////////////////////
//////////////////////////////////////////////////////




void main()
{
    //Начальные переменные///////////////////////////////
    object oModule=GetModule();
    object oActivator=OBJECT_SELF;
    if(GetLocalInt(oActivator, "pt_curCraftProcess_Mode")) return;
    object oTool=GetLocalObject(oActivator, "pt_ActTool");
    object oTarget=GetLocalObject(oActivator, "pt_ActTarget");

    int bScanRawInToolInventory=GetLocalInt(oActivator, "pt_scanRawInTool");
    int bIsVendor=FALSE; //Для автоматов по "продаже" чего-то, толкаешь в них золото или какую-то токен-валюту и получаешь итем
    object oParentRawTarget;
    object oCrftItem;


    //Кеширование инвентаря крафтера
    object oActItem=GetFirstItemInInventory(oActivator);
    int iArrayNum=-1; string sArrayNum="";
    //Кеширование инвентаря вызывающего инструмента
    object oToolItem=bScanRawInToolInventory? GetFirstItemInInventory(oTool) : OBJECT_INVALID;
    int iToolItemArrayNum=-1; string sToolItemArrayNum="";



    //Квантование и границы
    //Сколько итемов в модуле не вызовут краша скрипта. по столько и анализируем
    int iBeginItem=GetLocalInt(oActivator, "pt_craft_BeginAnalisisNum");
    int iMaxIItem=GetLocalInt(oModule, "pt_CraftItemBoxArray_Length");
    if(iBeginItem+pt_CRFPERFOMANCE_ACTIVATE_MAXITEMS_IN_SCRIPT>=iMaxIItem) DeleteLocalObject(oActivator, "pt_ActTarget");

    //Шкура активатора (заменена на итем универсального инструмента, на нем хранятся переменные крафта в сессии игры)
    object oSkin=SKIN_SupportGetSkin(oActivator);

    //Таг инструмента, который вызвал скрипт
    string sToolTag=GetTag(oTool);

    //Оверлейный таг вызывающего инструмента, только для того чтобы вызвать нужный процесс от лица тех предметов у которых нельзя изменить таг по каким-то причинам,
    //в стандартном скрипте добычи в проверках не поддерживается оверлейный таг -
    //так что в каждом конкретном случае если эта фишка будет использоваться - нужно переписать отдельно момент проверки инструментов для скрипта добычи
    string sTOverlayTag=GetLocalString(oTool, "pt_CRAFT_OVERLAY_TAG");
    if(sTOverlayTag!="") sToolTag=sTOverlayTag;
    if(GetStringRight(sToolTag, 5)=="_port") //когда портативные инструменты отбрасываем окончание
        {
        sToolTag=GetStringLeft(sToolTag, GetStringLength(sToolTag)-5);
        };
    //debug
    //SendMessageToPC(GetFirstPC(), "Значение sToolTag = "+sToolTag);


    // Неподвижность
    effect eCuImm=EffectCutsceneImmobilize();
    eCuImm=ExtraordinaryEffect(eCuImm);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCuImm, oActivator, pt_CRFPERFOMANCE_ACTIVATE_MAXTIME_OF_SCRIPT+0.05);


    /////////////////////////////////////////////////////
    /////////////////////////////////////////////////////
    /////////////////////////////////////////////////////

    //Квантование //////////////////////////////////////////
    //Очистка токенов и переменных определяющих форму диалога
    int iNumDialogNodes=-1;
    if(iBeginItem<=0)  //Если анализ ресурсов не разквантован
        {
            //Прогрессбар
            pInitProgressBar(oTool, iMaxIItem);
            pClearDialogTokensVars(oActivator); iNumDialogNodes=-1;
            pClearServiceVars(oActivator);
        }
        else
        {
            //Прогрессбар
            pSetProgressBar(oTool, iBeginItem);
            iNumDialogNodes=(GetLocalInt(oActivator, "pt_craft_currentNumDialogNodes")<=0)?-1:GetLocalInt(oActivator, "pt_craft_currentNumDialogNodes")-1;
        };
    //debug
    //SendMessageToPC(GetFirstPC(), "Значение iNumDialogNodes = "+IntToString(iNumDialogNodes));


    //Квантование //////////////////////////////////////////
    if(iBeginItem<=0)  //Если анализ ресурсов не разквантован
        {
        //Запишем Имя инструмента,который вызвал скрипт для диалога
        SetLocalString(oActivator, "pt_craft_dialTool", GetName(oTool));
        //Запишем Последний используемый инструмент, может использоваться в скриптах процесса.
        SetLocalObject(oActivator, "pt_craft_lastUsedTool", oTool);



        //1./////////////////////////////////////////////////
        //Служебные предметы для управления системой
        /////////////////////////////////////////////////////
        //
        //Большая палка Инструментов(настройка инструмента)
            if(sToolTag=="pt_craft_tool_DMs10")
            {
            if(GetObjectType(oTarget)!=OBJECT_TYPE_ITEM && GetObjectType(oTarget)!=OBJECT_TYPE_PLACEABLE && GetObjectType(oTarget)!=OBJECT_TYPE_CREATURE) {FloatingTextStringOnCreature("Не подходящий предмет.", oActivator, FALSE); return;};

            SetLocalInt(oActivator, "pt_craft_dialToolIsToolTool", TRUE);
            SetLocalObject(oActivator, "pt_craft_dialToolIsToolToolTarget", oTarget);

            AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
            return;
            }


        //2./////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        //Служебные предметы для ввода в систему ингридиентов
        /////////////////////////////////////////////////////
        /////////////////////////////////////////////////////
        //
        //Большая cфера трансформации(преобразование итема в сырье)
            else if(sToolTag=="pt_craft_tool_DMs01")
            {
            if(GetObjectType(oTarget)!=OBJECT_TYPE_ITEM) {DeleteLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget"); FloatingTextStringOnCreature("Не подходящий предмет.", oActivator, FALSE); return;};

            SetLocalInt(oActivator, "pt_craft_dialToolIsRawCreateSp", TRUE);
            SetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget", oTarget);


            //Задание переменных для диалога
            string sRawsString=GetLocalString(oTarget, "pt_CRAFT_RAW"), sToolsString=GetLocalString(oTarget, "pt_CRAFT_TOOL"), sSkillsString=GetLocalString(oTarget, "pt_CRAFT_SKILL_ID"), sRTtempstring, sNumDialogNodes;
            int x, iRawLen=pArrayLength(sRawsString), iToolLen=pArrayLength(sToolsString), iSkillLen=pArrayLength(sSkillsString);

            int iNumDialogNodes=-1;
            for(x=0; x<iRawLen; x++)
                {
                sRTtempstring=pArray(sRawsString, x);
                if(sRTtempstring=="") continue;

                iNumDialogNodes++;
                sNumDialogNodes=IntToString(iNumDialogNodes);

                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemRawTag", sRTtempstring);
                };
            iNumDialogNodes=-1;
            for(x=0; x<iToolLen; x++)
                {
                sRTtempstring=pArray(sToolsString, x);
                if(sRTtempstring=="") continue;

                iNumDialogNodes++;
                sNumDialogNodes=IntToString(iNumDialogNodes);

                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemToolTag", sRTtempstring);
                };
            iNumDialogNodes=-1;
            for(x=0; x<iSkillLen; x++)
                {
                sRTtempstring=pArray(sSkillsString, x);
                if(sRTtempstring=="") continue;

                iNumDialogNodes++;
                sNumDialogNodes=IntToString(iNumDialogNodes);

                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemSkillId", sRTtempstring);
                };

            //Задание длинны массива
            SetLocalInt(oActivator, "pt_craft_dialNodeArray_Length", iRawLen+((iRawLen<iToolLen)?abs(iRawLen-iToolLen):0));
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Запись данных в переменные");


            AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
            return;
            }
        //
        //
        //Малая палка сырья(добавление сырья к сырью)
            else if(sToolTag=="pt_craft_tool_DMs02")
            {
            oParentRawTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
            if(!GetIsObjectValid(oParentRawTarget)) {FloatingTextStringOnCreature("Вы не выбрали предмет для редактирования с помощью сферы трансформации.", oActivator, FALSE); return;};

            if(GetIsObjectValid(oTarget) && GetObjectType(oTarget)==OBJECT_TYPE_ITEM)
                {
                FloatingTextStringOnCreature("Предмет добавлен в качестве сырья к '"+GetName(oParentRawTarget)+"'" , oActivator, FALSE);
                }
                else
                {
                FloatingTextStringOnCreature("Не подходящий предмет.", oActivator, FALSE);
                SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeRawSp", TRUE);
                AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
                return;
                };

            //Задание переменных для диалога
            string sRawsString=GetLocalString(oParentRawTarget, "pt_CRAFT_RAW");
            int iRawLen=pArrayLength(sRawsString);

            int iNumDialogNodes=iRawLen;
            iNumDialogNodes++;
            string sNumDialogNodes=IntToString(iNumDialogNodes);

            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemRawTag", GetTag(oTarget));
            if(sRawsString!="") {sRawsString+=","+GetTag(oTarget);} else{sRawsString=GetTag(oTarget);};
            SetLocalString(oParentRawTarget, "pt_CRAFT_RAW", sRawsString);

            //Задание длинны массива
            SetLocalInt(oActivator, "pt_craft_dialNodeArray_Length", iNumDialogNodes);
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Запись данных в переменные");

            SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeRawSp", TRUE);
            AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));

            return;
            }
        //
        //
        //Малая палка инструментов(добавление инструмента к сырью)
            else if(sToolTag=="pt_craft_tool_DMs04")
            {
            oParentRawTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
            if(!GetIsObjectValid(oParentRawTarget)){FloatingTextStringOnCreature("Вы не выбрали предмет для редактирования с помощью сферы трансформации.", oActivator, FALSE);return;};

            if(GetIsObjectValid(oTarget))
                {
                FloatingTextStringOnCreature("Предмет добавлен в качестве инструмента к '"+GetName(oParentRawTarget)+"'" , oActivator, FALSE);
                }
                else
                {
                FloatingTextStringOnCreature("Не подходящий предмет.", oActivator, FALSE);
                SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeToolSp", TRUE);
                AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
                return;
                };
            //Задание переменных для диалога
            string sToolsString=GetLocalString(oParentRawTarget, "pt_CRAFT_TOOL");
            int iToolLen=pArrayLength(sToolsString);

            int iNumDialogNodes=iToolLen;
            iNumDialogNodes++;
            string sNumDialogNodes=IntToString(iNumDialogNodes);

            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemToolTag", GetTag(oTarget));
            if(sToolsString!="") {sToolsString+=","+GetTag(oTarget);} else{sToolsString=GetTag(oTarget);};
            SetLocalString(oParentRawTarget, "pt_CRAFT_TOOL", sToolsString);

            //Задание длинны массива
            SetLocalInt(oActivator, "pt_craft_dialNodeArray_Length", iNumDialogNodes);
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Запись данных в переменные");

            SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeToolSp", TRUE);
            AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));

            return;
            }
        //
        //
        //Малая палка навыков(добавление навыка к сырью)
            else if(sToolTag=="pt_craft_tool_DMs06")
            {
            oParentRawTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
            if(!GetIsObjectValid(oParentRawTarget)){FloatingTextStringOnCreature("Вы не выбрали предмет для редактирования с помощью сферы трансформации.", oActivator, FALSE);return;};

            FloatingTextStringOnCreature("Произнесите идентификатор навыка", oActivator, FALSE);

            SetLocalInt(oActivator, "pt_craft_dialToolIsRawCreateSkillSt", TRUE);

            return;
            }
        //
        //
        //Малая сфера просмотра сырья
            else if(sToolTag=="pt_craft_tool_DMs03")
            {
            oParentRawTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
            if(!GetIsObjectValid(oParentRawTarget)) {FloatingTextStringOnCreature("Вы не выбрали предмет для редактирования с помощью сферы трансформации.", oActivator, FALSE); return;};

            SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeRawSp", TRUE);

            AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
            return;
            }
        //
        //
        //Малая сфера просмотра инструментов
            else if(sToolTag=="pt_craft_tool_DMs05")
            {
            oParentRawTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
            if(!GetIsObjectValid(oParentRawTarget)) {FloatingTextStringOnCreature("Вы не выбрали предмет для редактирования с помощью сферы трансформации.", oActivator, FALSE); return;};

            SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeToolSp", TRUE);

            AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
            return;
            }
        //
        //
        //Малая сфера просмотра навыков
            else if(sToolTag=="pt_craft_tool_DMs07")
            {
            oParentRawTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
            if(!GetIsObjectValid(oParentRawTarget)) {FloatingTextStringOnCreature("Вы не выбрали предмет для редактирования с помощью сферы трансформации.", oActivator, FALSE); return;};

            SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeSkillSp", TRUE);

            AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
            return;
            };

        ////////////////////////////////////////////////////
        ////////////////////////////////////////////////////
        ////////////////////////////////////////////////////
        ////////////////////////////////////////////////////
        ////////////////////////////////////////////////////


        //Инструмент изнашивается
        int iMaxUses=GetLocalInt(oTool, "pt_CRAFT_PROCESS_NUMUSE");
        int iCurUses=GetLocalInt(oTool, "pt_curCraftProcess_uses");
        iCurUses++;
        SetLocalInt(oTool, "pt_curCraftProcess_uses", iCurUses);
        if(iCurUses>iMaxUses && iMaxUses>0)
            {
            //debug
            //FloatingTextStringOnCreature("Ресурс инструмента или источника исчерпан.", oActivator, FALSE);

            int iToolObjectType=GetObjectType(oTool);
            float fRespTime=GetLocalFloat(oTool, "pt_CRAFT_PROCESS_RESPTIME");
            if(fRespTime>0.0 && iToolObjectType!=OBJECT_TYPE_ITEM && iToolObjectType!=OBJECT_TYPE_TRIGGER)
                {
                string sToolResRef=GetResRef(oTool);
                object oBuoy=CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oTool));
                float fCurRespTime=fRespTime+IntToFloat(Random(FloatToInt(fRespTime)/2));

                AssignCommand(oBuoy, DelayCommand(fCurRespTime, pCreateObjectInLocal(oBuoy, "pt_curCraftProcess_buoytool", iToolObjectType, sToolResRef, GetLocation(oBuoy))));

                AssignCommand(oBuoy, DelayCommand(fCurRespTime+0.1, SetLocalInt(GetLocalObject(oBuoy, "pt_curCraftProcess_buoytool"), "pt_CRAFT_PROCESS_NUMUSE", iMaxUses)));
                AssignCommand(oBuoy, DelayCommand(fCurRespTime+0.1, SetLocalFloat(GetLocalObject(oBuoy, "pt_curCraftProcess_buoytool"), "pt_CRAFT_PROCESS_RESPTIME", fRespTime)));

                AssignCommand(oBuoy, DelayCommand(fCurRespTime+0.1, DestroyObject(oBuoy)));
                };

            DeleteLocalInt(oActivator, "pt_curCraftProcess_Mode");
            DeleteLocalInt(oActivator, "pt_curCraftProcess_ScriptMode");
            DeleteLocalLocation(oActivator, "pt_craft_PClocation");
            DeleteLocalInt(oActivator, "pt_scanRawInTool");
            DestroyObject(oTool);

            return;
            };


        //Кеш предметов персонажа в его локальные переменные
        oActItem=GetFirstItemInInventory(oActivator);
        iArrayNum=-1; sArrayNum="";
        while(GetIsObjectValid(oActItem))
            {
            iArrayNum++;
            //debug
            //SendMessageToPC(GetFirstPC(), "Предмет #"+IntToString(iArrayNum));
            sArrayNum=IntToString(iArrayNum);
            SetLocalObject(oActivator, "pt_craft_pcInventory"+sArrayNum+"_Object", oActItem);
            SetLocalInt(oActivator, "pt_craft_pcInventory_Length", iArrayNum+1);
            //debug
            //SendMessageToPC(GetFirstPC(), "Закэширован");

            oActItem=GetNextItemInInventory(oActivator);
            };
        //debug
        //SendMessageToPC(GetFirstPC(), "Закэшировано предметов: "+IntToString(GetLocalInt(oActivator, "pt_craft_pcInventory_Length")));


        //Кеш предметов инвентаря вызывающего инструмента в локальные переменные крафтера
        if(bScanRawInToolInventory)
            {
            object oToolItem=GetFirstItemInInventory(oTool);
            int iToolItemArrayNum=-1;string sToolItemArrayNum="";
            while(GetIsObjectValid(oToolItem))
                {
                iToolItemArrayNum++;
                //debug
                //SendMessageToPC(GetFirstPC(), "Предмет #"+IntToString(iArrayNum));
                sToolItemArrayNum=IntToString(iToolItemArrayNum);
                SetLocalObject(oActivator, "pt_craft_toolInventory"+sToolItemArrayNum+"_Object", oToolItem);
                SetLocalInt(oActivator, "pt_craft_toolInventory_Length", iToolItemArrayNum+1);
                //debug
                //SendMessageToPC(GetFirstPC(), "Закэширован");

                oToolItem=GetNextItemInInventory(oTool);
                };
            //debug
            //SendMessageToPC(GetFirstPC(), "Закэшировано предметов: "+IntToString(GetLocalInt(oActivator, "pt_craft_pcInventory_Length")));
            };


        //Пока непонятно как это байда с портативными инструментами будет работать с квантованием :))
        //Проверим портативные инструменты и запустим скрипты на их активацию с небольшой задержкой
        //(вызывается только специнструментом pt_craft_tool_ у каждого)
        if(GetTag(oTool)=="pt_craft_tool_")
            {
            float fDel=1.5; int port=0;
            iArrayNum=0;    sArrayNum="0";    int iArrayLenn=GetLocalInt(oActivator, "pt_craft_pcInventory_Length");
            for(iArrayNum=0; iArrayNum<iArrayLenn; iArrayNum++)
                {
                sArrayNum=IntToString(iArrayNum);
                oActItem=GetLocalObject(oActivator, "pt_craft_pcInventory"+sArrayNum+"_Object");

                if(GetStringRight(GetTag(oActItem), 5)=="_port")  //портативные инструменты
                    {
                    port++;
                    fDel+=0.2;
                    DelayCommand(1.0+fDel, SetLocalObject(oActivator, "pt_ActTool", oActItem));
                    DelayCommand(1.0+fDel+0.01, ExecuteScript("pt_axcrf_activ", OBJECT_SELF));
                    };
                };
            //debug
            //SendMessageToPC(oActivator, "Портативных предметов: "+IntToString(port));
            };
        };




        //1|--.//////////////////////////////////////////////
        //Служебные предметы для управления системой
        /////////////////////////////////////////////////////
        //Должны  учавствовать в квантовании
        //
        //Большая книга крафта(создание ресурсов)
        if(sToolTag=="pt_craft_tool_DMbook")
            {
            SetLocalInt(oActivator, "pt_craft_dialToolIsBook", TRUE);
            }
        //
        //
        //Большая палка навыков(настройка навыков персонажа)
            else if(sToolTag=="pt_craft_tool_DMs00")
            {
            if(GetObjectType(oTarget)!=OBJECT_TYPE_CREATURE) {FloatingTextStringOnCreature("Не подходящий предмет.", oActivator, FALSE); return;};

            SetLocalInt(oActivator, "pt_craft_dialToolIsSkillStick", TRUE);
            SetLocalObject(oActivator, "pt_craft_dialToolIsSkillStickTarget", oTarget);
            };
        //


    //debug
    //SendMessageToPC(GetFirstPC(), "Переходим к построению "+IntToString(iMaxIItem) + " процессов");



    //3./////////////////////////////////////////////////
    //                                                 //
    //                   КРАФТ                         //
    //                                                 //
    /////////////////////////////////////////////////////


    //4.//////////////////////////////////////////
    ///Начало цикла построения возможных процессов
    //////////////////////////////////////////////
    int i, k, l, m;
    for(i=iBeginItem; i<iMaxIItem; i++)
        {
        string sI=IntToString(i);
        DeleteLocalObject(oActivator, "pt_craft_dialNodeArray"+sI+"_Object");
        DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemName");
        ///////////////////////////////////////////////////////////////////////
        //debug
        //SendMessageToPC(GetFirstPC(), "Позиция " + sI);


            //4.0.1////////////////////////////////////////////////////////////////
            ////Квантование анализирования скриптов, когда слишком много инструкций
            if(i>=iBeginItem+pt_CRFPERFOMANCE_ACTIVATE_MAXITEMS_IN_SCRIPT)
                {
                //debug
                //SendMessageToPC(GetFirstPC(), "Анализируются позиции " + IntToString(iBeginItem) + " - " + IntToString(iMaxIItem));

                iBeginItem=iBeginItem+pt_CRFPERFOMANCE_ACTIVATE_MAXITEMS_IN_SCRIPT;
                SetLocalInt(oActivator, "pt_craft_BeginAnalisisNum", iBeginItem);
                SetLocalInt(oActivator, "pt_craft_currentNumDialogNodes", iNumDialogNodes+1);

                SetCommandable(TRUE, oActivator);
                AssignCommand(oActivator, DelayCommand(pt_CRFPERFOMANCE_ACTIVATE_MAXTIME_OF_SCRIPT, SetCommandable(TRUE, oActivator)));
                AssignCommand(oActivator, DelayCommand(pt_CRFPERFOMANCE_ACTIVATE_MAXTIME_OF_SCRIPT+0.01, ExecuteScript("pt_axcrf_activ", OBJECT_SELF)));
                SetCommandable(FALSE, oActivator);
                return;
                };


            //Итем, который крафтим
            oCrftItem=GetLocalObject(oModule, "pt_CraftItemBoxArray"+sI);
            if(!GetIsObjectValid(oCrftItem)) continue;




            //4.1///////////////////////////////////////////////////////
            //Большая книга крафта, дальнейшие проверки не целесообразны
            if(GetTag(oTool)=="pt_craft_tool_DMbook")
                {
                iNumDialogNodes++;
                string sNumDialogNodes=IntToString(iNumDialogNodes);

                SetLocalObject(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_Object", oCrftItem);
                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemName", GetName(oCrftItem) + (FindSubString(GetName(oCrftItem), "*")==-1?" (" + IntToString(GetLocalInt(oCrftItem, "pt_CRAFT_MINQUANT")) + "-" + IntToString(GetLocalInt(oCrftItem, "pt_CRAFT_MAXQUANT")) + " ед.)":""));

                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_Skills", GetLocalString(oCrftItem, "pt_CRAFT_SKILL_ID"));
                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_SkillsVal", GetLocalString(oCrftItem, "pt_CRAFT_SKILL_VALUE"));
                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_RawNames", GetLocalString(oCrftItem, "pt_CRAFT_RAW"));
                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_RawCost", GetLocalString(oCrftItem, "pt_CRAFT_RAW_COST"));

                SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ToolNames", GetLocalString(oCrftItem, "pt_CRAFT_TOOL"));

                //debug
                //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Запись данных в переменные");

                continue;
                };




            //4.2/////////////////
            ////Проверка навыка
            string sProcSkill=GetLocalString(oCrftItem, "pt_CRAFT_SKILL_ID");
            string sProcSkillVal=GetLocalString(oCrftItem, "pt_CRAFT_SKILL_VALUE");
            if(sProcSkill!="") //Если не заполнены навыки - пропустим эти проверки, из соображений производительности
            {
            int iSkillLen=pArrayLength(sProcSkill);
            int iSkillValLen=pArrayLength(sProcSkillVal);
            int bClosedSkill=FALSE;
            for(k=0; k<iSkillLen; k++)
                {
                int iValK=(k<=(iSkillValLen-1)?k:iSkillValLen-1);

                string sSkillID=pArray(sProcSkill, k);
                sSkillID=GetStringLeft(sSkillID, 35);

                //Большая палка навыков
                if(GetTag(oTool)=="pt_craft_tool_DMs00")
                    {
                    int z, bHasThatSkill;
                    bHasThatSkill=FALSE;
                    for(z=0; z<=iNumDialogNodes+1; z++)
                        {
                        if(GetLocalString(oActivator, "pt_craft_dialNodeArray"+IntToString(z)+"_ItemName")==sSkillID) {bHasThatSkill=TRUE; break;};
                        };
                    if(!bHasThatSkill)
                        {
                        iNumDialogNodes++;
                        string sNumDialogNodes=IntToString(iNumDialogNodes);

                        SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemName", sSkillID);
                        };

                    //debug
                    //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Запись данных в переменные");

                    continue;
                    }
                    else
                    {
                    float fActivatorSkill=GetLocalFloat(oSkin, "pt_craft_skill_"+sSkillID+"_value");

                    if(fActivatorSkill<0.0 || GetLocalInt(oSkin, "pt_craft_skill_"+sSkillID+"_DMblock")) {bClosedSkill=TRUE; break;};
                    };
                };
            if(bClosedSkill) continue;
            };
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Проверка скила успешна.");

            //4.3/////////////////////////////////////////////////////////
            //Большая палка навыков, дальнейшие проверки не целесообразны
            if(GetTag(oTool)=="pt_craft_tool_DMs00")
                {
                continue;
                };






            //4.4///////////////////////////////
            ////Проверка вызывающего инструмента
            string sProcTool=GetLocalString(oCrftItem, "pt_CRAFT_TOOL");
            string sProcToolNames=sProcTool;
            int iToolLen=pArrayLength(sProcTool);

            string sCurToolTag=sToolTag;

            //debug
            //SendMessageToPC(GetFirstPC(), "Инструмент вызова '"+sCurToolTag+"'");
            //debug
            //SendMessageToPC(GetFirstPC(), "Инструмент процесса '"+sProcTool+"'");

            int iCurToolIndex=-1;
            if(sCurToolTag=="pt_craft_tool_" && sProcTool=="") {sProcToolNames=GetName(oTool) ; iCurToolIndex=0;};
            for(k=0; k<iToolLen; k++)
                    {
                    string sToolTemp=pArray(sProcTool, k);
                    if(sCurToolTag==sToolTemp) {sProcToolNames=pArray(sProcToolNames, k, GetName(oTool)); iCurToolIndex=k; break;};
                    };
            if(iCurToolIndex<0) continue; //Если в процессе не был найден даже вызывающий инструмент - то переходим к следующему
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' выделили инструмент вызова. ("+pArray(sProcTool, iCurToolIndex)+")");

            //4.5////////////////////////////////////////////////////////
            ////Проверка инструментов которые требуются кроме вызывающего
            if (sProcTool!="") //Если у процесса заполнены данные об инструментах - продолжаем, иначе - проверки не будет - полезно для производительности
                {
                int bNotHasAllTool=FALSE;
                for(k=0; k<iToolLen; k++)
                    {
                    int bHasTool=FALSE;

                    if(iCurToolIndex==k) continue; //проверки для вызывающего инструмента не осуществляются

                    string sToolTag=pArray(sProcTool, k);

                    object oPlaTool=GetNearestObjectByTag(sToolTag, oActivator); //Сканирование рядом
                    if(GetIsObjectValid(oPlaTool) && GetObjectType(oPlaTool)!=OBJECT_TYPE_ITEM && GetDistanceBetween(oPlaTool, oActivator)<=4.0) {sProcToolNames=pArray(sProcToolNames, k, GetName(oPlaTool)); bHasTool=TRUE;};
                    if(!bHasTool)//
                        {
                        int iCurItemSlot=0;
                        object oActItem=GetItemInSlot(iCurItemSlot, oActivator);
                        while(!bHasTool && iCurItemSlot<=17) //Сканирование в слотах надетых вещей
                            {
                            if(GetTag(oActItem)==sToolTag) {sProcToolNames=pArray(sProcToolNames, k, GetName(oActItem)); bHasTool=TRUE; break;};

                            iCurItemSlot++; oActItem=GetItemInSlot(iCurItemSlot, oActivator);
                            };
                        if(!bHasTool)///
                            {
                            int iArrayNum=0;string sArrayNum="0";int iArrayLenn=GetLocalInt(oActivator, "pt_craft_pcInventory_Length");
                            for(iArrayNum=0; iArrayNum<iArrayLenn; iArrayNum++)
                                {
                                sArrayNum=IntToString(iArrayNum);
                                oActItem=GetLocalObject(oActivator, "pt_craft_pcInventory"+sArrayNum+"_Object");

                                if(!bHasTool && GetIsObjectValid(oActItem)) //Сканирование в инвентаре
                                    {
                                    if(GetTag(oActItem)==sToolTag)
                                        {
                                        sProcToolNames=pArray(sProcToolNames, k, GetName(oActItem)); bHasTool=TRUE; break;
                                        };
                                    };
                                };
                            };
                        };
                    if(!bHasTool) {bNotHasAllTool=TRUE; break;};
                    };
                if(bNotHasAllTool) continue;
                };
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Проверка остальных инструментов успешна");



            //4.6/////////////////////////////////
            ////Проверка наименований сырья
            string sProcRaw=GetLocalString(oCrftItem, "pt_CRAFT_RAW");
            if (sProcRaw=="NW_IT_GOLD001") bIsVendor=TRUE;
            string sProcRawNames=GetLocalString(oCrftItem, "pt_CRAFT_RAW");
            string sProcRawCost=GetLocalString(oCrftItem, "pt_CRAFT_RAW_COST");
            if (sProcRaw!="") //Если наименование сырья в процессе пусто - то все проверки на сырье успешны
            {
            string sProcActivatorRawValue="0";

            int iRawLen=pArrayLength(sProcRaw);
            int iRawCostLen=pArrayLength(sProcRawCost);

            int bNotHasAllRaw=FALSE;
            for(k=0; k<iRawLen; k++)
                {
                string sRawTag=pArray(sProcRaw, k);

                int bHasRaw=FALSE;
                if(bScanRawInToolInventory) //Сканировать ресурсы в инвентаре инструмента
                    {
                    int iToolItemArrayNum; string sToolItemArrayNum; int iToolItemArrayLenn=GetLocalInt(oActivator, "pt_craft_toolInventory_Length");
                    for(iToolItemArrayNum=0; iToolItemArrayNum<iToolItemArrayLenn; iToolItemArrayNum++)
                        {
                        sToolItemArrayNum=IntToString(iToolItemArrayNum);

                        object oToolItem=GetLocalObject(oActivator, "pt_craft_toolInventory"+sToolItemArrayNum+"_Object");
                        if(GetIsObjectValid(oToolItem))
                            {
                            if(GetTag(oToolItem)==sRawTag)
                                {
                                sProcRawNames=pArray(sProcRawNames, k, GetName(oToolItem));

                                int iToolItemRawVal=StringToInt(pArray(sProcActivatorRawValue, k));
                                iToolItemRawVal+=GetItemStackSize(oToolItem);
                                sProcActivatorRawValue=pArray(sProcActivatorRawValue, k, IntToString(iToolItemRawVal));
                                bHasRaw=TRUE;
                                };
                            };
                        };
                    }
                    else //Сканировать ресурсы в инвентаре активатора
                    {
                    int iArrayNum; string sArrayNum; int iArrayLenn=GetLocalInt(oActivator, "pt_craft_pcInventory_Length");
                    for(iArrayNum=0; iArrayNum<iArrayLenn; iArrayNum++)
                        {
                        sArrayNum=IntToString(iArrayNum);

                        object oActItem=GetLocalObject(oActivator, "pt_craft_pcInventory"+sArrayNum+"_Object");
                        if(GetIsObjectValid(oActItem))
                            {
                            if(GetTag(oActItem)==sRawTag)
                                {
                                sProcRawNames=pArray(sProcRawNames, k, GetName(oActItem));

                                int iActRawVal=StringToInt(pArray(sProcActivatorRawValue, k));
                                iActRawVal+=GetItemStackSize(oActItem);
                                sProcActivatorRawValue=pArray(sProcActivatorRawValue, k, IntToString(iActRawVal));
                                bHasRaw=TRUE;
                                };
                            };
                        };
                    };
                if(!bHasRaw) {bNotHasAllRaw=TRUE; break;};
                };
            if(bNotHasAllRaw) continue;
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Формирование массива наличия сырья успешно.");


            //4.7///////////////////////////////////
            ////Проверка количества сырья у игрока
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Требование сырья: "+sProcRawCost);
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Наличие сырья: "+sProcActivatorRawValue);
            int bNotHasAllRawQuant=FALSE;
            for(k=0; k<iRawLen; k++)
                {
                int iCostK=(k<=(iRawCostLen-1)?k:iRawCostLen-1);

                int iCurRawCost=StringToInt(pArray(sProcRawCost, iCostK));
                int iCurRawHave=StringToInt(pArray(sProcActivatorRawValue, iCostK));

                if(iCurRawCost<0) iCurRawCost=1;

                if(iCurRawHave<iCurRawCost) {bNotHasAllRawQuant=TRUE; break;};
                };
            if(bNotHasAllRawQuant) continue;
            };
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Проверка количества сырья у игрока успешна.");




            //4.8////////////////////////////////////////////////////////////////
            ////Задание переменных если все проверки успешны для данного процесса
            iNumDialogNodes++;
            string sNumDialogNodes=IntToString(iNumDialogNodes);

            SetLocalObject(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_Object", oCrftItem);
            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ItemName", GetName(oCrftItem) + (FindSubString(GetName(oCrftItem), "*")==-1?" (" + IntToString(GetLocalInt(oCrftItem, "pt_CRAFT_MINQUANT")) + "-" + IntToString(GetLocalInt(oCrftItem, "pt_CRAFT_MAXQUANT")) + " ед.)":""));

            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_Skills", sProcSkill);
            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_SkillsVal", sProcSkillVal);   //Поидее это вообще не нужно, можно взять из локальной переменной, но для чего-то я оставил
            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_RawNames", sProcRawNames);
            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_RawCost", sProcRawCost);      //Поидее это вообще не нужно, можно взять из локальной переменной

            SetLocalString(oActivator, "pt_craft_dialNodeArray"+sNumDialogNodes+"_ToolNames", sProcToolNames);
            //debug
            //SendMessageToPC(GetFirstPC(), "'"+GetName(oCrftItem)+"' Запись данных в переменные");

        };//-конец цикла




    //5.////////////////////////////////////////////////////////////////
    ////Квантование анализирования скриптов
    if(iBeginItem+pt_CRFPERFOMANCE_ACTIVATE_MAXITEMS_IN_SCRIPT>=iMaxIItem)
        {
        SetLocalInt(oActivator, "pt_craft_BeginAnalisisNum", 0);
        SetLocalInt(oActivator, "pt_craft_currentNumDialogNodes", 0);
        };

    //Прогрессбар
    pSetProgressBar(oTool, iMaxIItem);
    pClearProgressBar(oTool);
    //Запишем Имя инструмента,который вызвал скрипт для диалога
    SetLocalString(oActivator, "pt_craft_dialTool", GetName(oTool));


    //debug
    //SendMessageToPC(GetFirstPC(), "ноды "+IntToString(iNumDialogNodes));
    //debug
    //SendMessageToPC(GetFirstPC(), "в инвентаре "+IntToString(bScanRawInToolInventory));
    //debug
    //SendMessageToPC(GetFirstPC(), "вендор "+IntToString(bIsVendor));


    //6./////////////////////////////////////////////////////////
    //Если только один процесс возможен - то сразу запустим скрипт
    if(iNumDialogNodes==0 && GetTag(oTool)!="pt_craft_tool_" && GetStringRight(GetTag(oTool), 5)!="_port" && GetStringLeft(GetTag(oTool), 16)!="pt_craft_tool_DM" && (!bScanRawInToolInventory || bIsVendor))
        {
        oCrftItem=GetLocalObject(oActivator, "pt_craft_dialNodeArray"+IntToString(iNumDialogNodes)+"_Object");
        string sCustomScript=GetLocalString(oCrftItem, "pt_CRAFT_PROCESS_PC_CUSTOM_SCRIPT");
        sCustomScript=(sCustomScript==""?"pt_axcrf_pr_defa":sCustomScript);

        SetLocalInt(oActivator, "pt_curCraftProcess_Mode", 1);
        SetLocalObject(oActivator, "pt_curCraftProcess_Object", oCrftItem);

        ExecuteScript(sCustomScript, oActivator);
        return;
        }

    //7.///////////////////////////////////////
    //Задание длинны массива полученных процессов
    SetLocalInt(oActivator, "pt_craft_dialNodeArray_Length", iNumDialogNodes+1);

    //8.////////////////////
    //Запуск диалогового меню
    if(iNumDialogNodes>=0) AssignCommand(oActivator, ActionStartConversation(oActivator, "pt_axcrf_main", TRUE, FALSE));
}
