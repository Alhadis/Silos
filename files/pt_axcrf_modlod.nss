//Исполняемый при старте модуля скрипт - кеширует предметы из бочки,
//можно запустить со сторонего скрипта для перекеширования

#include "pt_axcrf_include"


void pDestroyCreate(object oDestroy, string sResRef, int iStoreNum, int iStoreIBC, location lLoc, int iType)
{
    object oDuplBox;
    oDuplBox=SQLRCOExec("SELECT OBJ FROM `pt_axcrf_boxes` WHERE ResRef = '"+SQLEncodeSpecialChars( sResRef )+"' AND Number = "+(IntToString(iStoreNum))+"; ", lLoc, iType);
    DestroyObject(oDestroy);
}



void main()
{
    int i, k, m;
    object oModule=GetModule();
    //Флаг того что запущен первый раз при старте модуля
    int bIsModFirstRuned = !GetLocalInt(oModule, "pt_craft_box_mfirstruned");

    //////////////////////////////////////////////////////////////////////////////////////////
    //Кеш предметов из бочки в локальные переменные, а также установка бочек записанных в базе
    //Квантование скрипта
    i=GetLocalInt(oModule, "pt_CraftItemBoxArray_curi");  //На каком итеме закончился анализ при квантовании скрипта
    int iBeginItemForDump = i;
    i=(i==0)?-1:i;
    int iBoxNum=GetLocalInt(oModule, "pt_CraftItemBoxArray_curiBoxNum"); //На каком номере закончился анализ контейнера при квантовании скрипта
    int iBoxFirstStart=GetLocalInt(oModule, "pt_craft_box_mfirstboxes"); //На каком номере закончились конетейнеры

    ///Отобразим состояние кеширования
    if(i == (-1) && !GetLocalInt(oModule, "pt_CraftItemBoxArray_display")) SendMessageToAllDMs("!!!\nЗапущено перекеширование крафт-объектов. \nДождитесь окончания..");
    if(GetLocalInt(oModule, "pt_CraftItemBoxArray_display")) SendMessageToAllDMs("!!!\nЗапущено перекеширование крафт-объектов. \nОбработано всего: " +IntToString(iBoxNum)+ " контейнеров с " +IntToString(i+1)+ " предметами крафта. \nДождитесь окончания..");
    ///

    ////////////////////////////////////////////////
    //Инициализируем НВНХ, при первом кванте скрипта
    if(pt_CRAFT_USE_NWNX && iBoxNum==0)
        {
        SetLocalString(oModule, "NWNX!INIT", "1");
        GetLocalObject(oModule, "NWNX!INIT");

        SQLInit();

        SQLExecDirect("CREATE TABLE IF NOT EXISTS `pt_axcrf_table` (ID CHAR(30), sVar CHAR(60), fValue FLOAT, iType INT(1) default "+IntToString(pt_DBDUMP_TYPE_FLOAT)+") COLLATE='latin1_general_ci' ;");

        SQLExecDirect("CREATE TABLE IF NOT EXISTS `pt_axcrf_boxes` (OBJ MEDIUMBLOB NOT NULL, ResRef VARCHAR(18) NOT NULL DEFAULT '', Number SMALLINT NULL DEFAULT '0', ItemsCount INT NOT NULL DEFAULT '0');");

        SQLExecDirect("CREATE TABLE IF NOT EXISTS `pt_axcrf_varimport` (ID VARCHAR(100), sTools VARCHAR(100), sSkills VARCHAR(150),  sSkillsVal VARCHAR(100), sRaws VARCHAR(150),  sRawsCost VARCHAR(100), fWeary FLOAT, fTime FLOAT, iChanceToCreate INT NOT NULL DEFAULT '0', iMinQuant INT NOT NULL DEFAULT '0',  iMaxQuant INT NOT NULL DEFAULT '0',   sScript VARCHAR(100) );");
        };


    ///////////////////////////
    //Первый контейнер в кванте
    int bHasNew=FALSE;
    object oTargetBox=GetObjectByTag("pt_craft_box", iBoxNum);
    if(!GetIsObjectValid(oTargetBox))  return;


    ///////////////////////////////////////////////////
    // Пробежка по бочкам
    int bStopped=FALSE, bAllBoxes=FALSE;
    while(GetIsObjectValid(oTargetBox))
        {
        //Переменные Прайм-контейнеров, которые не были созданы после запуска модуля
        if(bIsModFirstRuned)
            {
            SetLocalInt(oTargetBox, "pt_craft_box_prime", TRUE);
            SetLocalInt(oTargetBox, "pt_craft_box_number", iBoxNum+1);
            iBoxFirstStart++;
            SetLocalInt(oModule, "pt_craft_box_mfirstboxes", iBoxFirstStart);
            };

        //Инвентарь контейнера
        object oTempItem=GetFirstItemInInventory(oTargetBox);
        int iBC=1, ico=0; //чтото типа хеша, точно изменится если изменится название какогонибуть итема и количество
        while(GetIsObjectValid(oTempItem))
            {
            //Внесем имя итема в словарик модуля
            pTagDictAddWord(GetTag(oTempItem), GetName(oTempItem));

            i++; ico++; //увеличим общий номер закешированных на текущий момент итемов и итемов в бочке соответсвенно
            SetLocalInt(oModule, "pt_CraftItemBoxArray_curi", i);
            SetLocalInt(oModule, "pt_CraftItemBoxArray_Length", i+1); //Длинна масива крафта (кэша итемов)

            //Обновим данные об итеме из базы если для него не заданны переменные
            if(pt_CRAFT_USE_NWNX && bIsModFirstRuned) pRefreshCraftVars(oTempItem);

            //Переменные итемов которые будут соствалять _типахеш_
            string sSkills=GetLocalString(oTempItem, "pt_CRAFT_SKILL_ID");
            string sSkillsVal=GetLocalString(oTempItem, "pt_CRAFT_SKILL_VALUE");
            string sRaws=GetLocalString(oTempItem, "pt_CRAFT_RAW");
            string sRawsCost=GetLocalString(oTempItem, "pt_CRAFT_RAW_COST");
            string sTools=GetLocalString(oTempItem, "pt_CRAFT_TOOL");

            //Предохранитель от того чтобы пустые итемы не "производились" "карманным инструментом"
            if (
                sSkills=="" &&
                sSkillsVal=="" &&
                sRaws=="" &&
                sRawsCost=="" &&
                sTools=="")
                {  sTools="%NO_SETTINGS%";     SetLocalString(oTempItem, "pt_CRAFT_TOOL", "%NO_SETTINGS%");   };

            // _типахеш_
            iBC=iBC+ico+  (
                        GetStringLength( GetName(oTempItem) ) +
                        StringToInt( pArray(sSkillsVal, 0) ) +
                        StringToInt( pArray(sRawsCost, 0) ) +
                        GetStringLength( sRaws+sTools  ) -
                        GetStringLength( sSkills )
                        )/3;
            SetLocalObject(oModule, "pt_CraftItemBoxArray"+IntToString(i), oTempItem);  //Кеш итема для системы

            //К следующему итему бочки
            oTempItem=GetNextItemInInventory(oTargetBox);
            };
        //Значения типахеша на бочку записывается в переменную
        SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //Для квантования, если бочка по количеству проанализированных в этом скрипте не вписывается - то прервем цикл
        iBoxNum++;
        SetLocalInt(oModule, "pt_CraftItemBoxArray_curiBoxNum", iBoxNum);
        oTargetBox=GetObjectByTag("pt_craft_box", iBoxNum);
        if(!GetIsObjectValid(oTargetBox)) bAllBoxes=TRUE;
        //Обрабатываем по несколько контейнеров за раз скрипта обычно 1 чтобы скрипт не бился
        if(!bAllBoxes && iBoxNum-GetLocalInt(oModule, "pt_CraftItemBoxArray_stopiBoxNum")>=pt_CRFPERFOMANCE_MODULE_MAXBOX_IN_SCRIPT)
            {
            bStopped=TRUE; SetLocalInt(oModule, "pt_CraftItemBoxArray_stopiBoxNum", iBoxNum);
            oTargetBox=OBJECT_INVALID;
            continue;
            };
        };
        //Дамп _имен_ переменных (исходя из того что в бочках) PC нуждающихся в отправке в базу
        // т.к. дамп-функция смотрит текущую длинну кэша итемов то в аргументы задается начальный номер (который мы используем при квантовании скрипта)
        // тоесть с какого итема в кеше начинать анализирование. В итоге получается что дамп скрипт тоже "квантуется" и анализирует пачки данных за раз
        pCreateModuleVarNameDump(iBeginItemForDump);



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Для квантования, если еще не проанализированны все бочки, и скрипт не был остановлен (когда количество бочек не вошло
//в pt_CRFPERFOMANCE_MODULE_MAXBOX_IN_SCRIPT, то рекурсивно запустим скрипт  с задержкой (разквантуем на несколько частей)
if(!bAllBoxes && ( bStopped ) )
            {
            DelayCommand(pt_CRFPERFOMANCE_MODULE_MAXTIME_OF_SCRIPT, ExecuteScript("pt_axcrf_modlod", oModule));
            return;
            };
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Нижеследующий блок выполняется только когда все части (кванты) скрипта исполнены, и проанализированны все бочки
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        //Чтобы обозначить сработанные при первом старте модуля скрипт
        SetLocalInt(oModule, "pt_craft_box_mfirstruned", TRUE);
        SetLocalInt(oModule, "pt_CraftItemBoxArray_curiBoxNum", 0);
        SetLocalInt(oModule, "pt_CraftItemBoxArray_stopiBoxNum", 0);
        SetLocalInt(oModule, "pt_CraftItemBoxArray_curi", 0);


        /////////////////////////////////////////////////////////////////////
        //Создание контейнеров которых нету в мастер модуле(при первом старте)
        int bHasNewBox=FALSE;
        if(pt_CRAFT_USE_NWNX && bIsModFirstRuned)
            {
            //Создание контейнеров которых нету в мастер модуле (ну или если скрипт запущен после персистент системы - то до этого момента)
            //Вначале выясняем сколько будет объектов
            int iFuckenModuleArrayIndex=-1;
            SQLExecDirect("SELECT Number FROM `pt_axcrf_boxes` WHERE Number < 0; ");
            while(SQLFetch() == SQL_SUCCESS)
                {
                iFuckenModuleArrayIndex++;
                int iNotPrimeNumb = StringToInt(SQLGetData(1));

                SetLocalInt(oModule, "pt_craft_box_fuckenArray"+IntToString(iFuckenModuleArrayIndex), iNotPrimeNumb);
                };
            //Долбанное создание нескольких объектов
            if(iFuckenModuleArrayIndex>-1)
                {
                int k;
                for(k=0; k<=iFuckenModuleArrayIndex; k++)
                    {
                    object oNewBox = SQLRCOExec("SELECT OBJ FROM `pt_axcrf_boxes` WHERE Number = "+(IntToString(GetLocalInt(oModule, "pt_craft_box_fuckenArray"+IntToString(k))))+"; ", pt_GetRandomLocation(GetObjectByTag("pt_craft_box"), 2.0, TRUE), OBJECT_TYPE_PLACEABLE);

                    //Локация хранится на бочке, я пока не придумал рациональное решение -
                    // или добалять еще колонку в базу с локацией или оставить так :(
                    string sLoc=GetLocalString(oNewBox, "pt_craft_box_location");
                    location lLoc=pGetLocationFromString(sLoc);

                    //Увеличим общее количество бочек - для того чтобы новые номера присваивались корректно и не пересекались
                    iBoxFirstStart++;
                    SetLocalInt(oModule, "pt_craft_box_mfirstboxes", iBoxFirstStart);
                    bHasNewBox=TRUE; //Флаг что есть новые созданные бочки итемы в которых не закешированы
                    };
                };
            };

        ///////////////////////////////////////////////////////////////////////
        //Сохранение или установка(измененных в модуле) бочек записанных в базе
        int bHasRefreshBox=FALSE;
        if(pt_CRAFT_USE_NWNX)
            {
            ///////////////////////////////////////////////////
            // Пробежка по бочкам чтобы пересоздать объекты
            int iBoxNum=0; //тут просто анализируем все бочки созданные на текущий момент в модуле
            object oTargetBox=GetObjectByTag("pt_craft_box", iBoxNum);
            if(!GetIsObjectValid(oTargetBox))  return;
            while(GetIsObjectValid(oTargetBox))
                {
                //Получаем _типахеш_ чтобы сравнить его с тем, который в базе
                //и узнать изменился ли боченок с момента последнего запуска этого скрипта
                int iBC=GetLocalInt(oTargetBox, "pt_craft_box_ibc");
                //Это номер-идентификатор под которым хранятся боченки в базе.
                // Примечательно что в базе хранение начинается с "0" - но в переменной pt_craft_box_number
                // которая на итеме изза значения по умолчанию у aeyrwbb GetLocalInt = 0 - приходится хранить значение на 1 больше
                int iStoreNum=GetLocalInt(oTargetBox, "pt_craft_box_number")-1;

//Контейнеры в системе имеют два термина определяющие их категорию
// 1. Прайм-контейнер - создан в тулсете - есть при старте модуля
// 2. Не прайм-контейнер - создан после старта модуля.

                //////////////////
                //Прайм-контейнеры
                if(GetLocalInt(oTargetBox, "pt_craft_box_prime"))
                    {
                    if(iStoreNum==-1) //Если переменная не установлена(значение 0 - 1 = -1) - берем iBoxNum
                        {
                        iStoreNum=iBoxNum;
                        SetLocalInt(oTargetBox, "pt_craft_box_number", iBoxNum+1);
                        };
                    SQLExecDirect("SELECT ItemsCount FROM `pt_axcrf_boxes` WHERE ResRef = '"+SQLEncodeSpecialChars(GetResRef(oTargetBox))+"' AND Number = "+(IntToString(iStoreNum))+"; ");

                    /////////////////////////////////////////////////////////////
                    //Если в базе есть записаный под этим номером прайм-контейнер
                    if(SQLFetch() == SQL_SUCCESS)
                        {
                        int iSQLBC=StringToInt(SQLGetData(1));
                        //debug
                        //SendMessageToAllDMs("Контейнер " + IntToString(iStoreNum) + " iBC=" + IntToString(iBC) + " iSQLBC=" +IntToString(iSQLBC));

                        //Если скрипт запущен первый раз и SQL-типахеш не равен нулю (по дефолту в базе у этой колонки значения нет)
                        //это означет что запись этого контейнера в базу уже производилась
                        if(bIsModFirstRuned && iSQLBC!=0)
                            {
                            bHasRefreshBox=TRUE; //Флаг что есть контейнеры для обновления(вернее пересоздания)
                            DelayCommand(2.5, pDestroyCreate(oTargetBox, GetResRef(oTargetBox), iStoreNum, iSQLBC, GetLocation(oTargetBox), GetObjectType(oTargetBox)));
                            }
                            //Если типахеш прайма не равен базному
                            //обновляем значения в базе из модуля
                            else if(iBC!=iSQLBC)
                            {
                            SetLocalInt(oTargetBox, "pt_craft_box_number", iStoreNum+1);
                            SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);

                            SQLSCOExec("UPDATE `pt_axcrf_boxes` SET `ItemsCount` = "+(IntToString(iBC))+", `OBJ` = %s  WHERE  ResRef = '"+SQLEncodeSpecialChars(GetResRef(oTargetBox))+"' AND Number = "+(IntToString(iStoreNum))+" LIMIT 1;", oTargetBox);
                            };
                        }

                        ///////////////////////////////////////////////////////////////////////////////////
                        //Если в базе нету прайм-контейнера с данным номером - сохраним(вставим) его в ней
                        else
                        {
                        SetLocalInt(oTargetBox, "pt_craft_box_number", iStoreNum+1);
                        SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);

                        SQLSCOExec("INSERT into `pt_axcrf_boxes` (OBJ, ResRef, Number, ItemsCount) values (%s, '"+SQLEncodeSpecialChars(GetResRef(oTargetBox))+"', "+(IntToString(iStoreNum))+", "+(IntToString(iBC))+") ; ", oTargetBox);
                        };
                    }
                    /////////////////////
                    //Не прайм контейнеры
                    else
                    {
                    //Запрос типахеша контейнера из базы
                    int iSQLBC=0;
                    SQLExecDirect("SELECT ItemsCount FROM `pt_axcrf_boxes` WHERE ResRef = '"+SQLEncodeSpecialChars(GetResRef(oTargetBox))+"' AND Number = "+(IntToString(GetLocalInt(oTargetBox, "pt_craft_box_number")+1))+"; ");
                    if(SQLFetch() == SQL_SUCCESS) iSQLBC=StringToInt(SQLGetData(1));

                    //Если на контейнере вообще нету никаких отметок о его номере - значит
                    //его создали после кеширования и нужно добавить его в базу.
                    //Не прайм контейнеры имеют свой номер-идентификатор - отрицательный, для удобства
                    //он по умолчанию продолжает порядок обычных контейнеров, например есть контейнеры
                    // 0, 1, .. 20, 21, *и продолжает ряд контейнеров модуле* -22, -23 и т.д. эти два последних контейнеров (не прайм)
                    // были созданы после старта модуля и сохранены в базе.
                    if(!GetLocalInt(oTargetBox, "pt_craft_box_number"))
                        {
                        bHasNew=TRUE; //Флаг что есть новые созданные не прайм контейнеры
                        SetLocalInt(oTargetBox, "pt_craft_box_number", 0-(iBoxFirstStart+1) );
                        SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);
                        SetLocalString(oTargetBox, "pt_craft_box_location", pGetStringFromLocation(GetLocation(oTargetBox)));

                        SQLSCOExec("INSERT into `pt_axcrf_boxes` (OBJ, ResRef, Number, ItemsCount) values (%s, '"+SQLEncodeSpecialChars(GetResRef(oTargetBox))+"', "+(IntToString( 0-(iBoxFirstStart) ))+", "+(IntToString(iBC))+") ; ", oTargetBox);
                        iBoxFirstStart++;
                        SetLocalInt(oModule, "pt_craft_box_mfirstboxes", iBoxFirstStart);
                        }
                        //Если типахеш из базы не прайма не равен значению на переменной
                        //обновляем значения в базе
                        else if(iBC!=iSQLBC)
                        {
                        SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);

                        SQLSCOExec("UPDATE `pt_axcrf_boxes` SET `ItemsCount` = "+(IntToString(iBC))+", `OBJ` = %s  WHERE  ResRef = '"+SQLEncodeSpecialChars(GetResRef(oTargetBox))+"' AND Number = "+(IntToString(GetLocalInt(oTargetBox, "pt_craft_box_number")+1))+" LIMIT 1;", oTargetBox);
                        };
                    };

                iBoxNum++;
                oTargetBox=GetObjectByTag("pt_craft_box", iBoxNum);
                };
            };

//Если есть пересозданные контейнеры, не праймы которые нуждаются в перекэшировании и т.д. -
//- запустим кеширование заново (но скрипт уже не будет иметь флаг bIsModFirstRuned)
if(bHasRefreshBox || bHasNewBox) {SetLocalInt(oModule, "pt_CraftItemBoxArray_display", TRUE);   DelayCommand(4.5, ExecuteScript("pt_axcrf_modlod", oModule));   return;};
SetLocalInt(oModule, "pt_CraftItemBoxArray_display", FALSE);
DelayCommand(10.0, SendMessageToAllDMs("!!!\nПерекеширование крафт-объектов закончено. Приятной игры.."));
}

