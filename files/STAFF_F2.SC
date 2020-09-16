/*
  ╔═════════════════════════════════════════════════════════════════════╗
  ║    А О   "Н О В Ы Й   А Т Л А Н Т",    Н Т О  "T O P   S O F T"     ║
  ║           Проект "КАДРЫ" (с) 1995                                   ║
  ║      Версия : 3.01                                                  ║
  ║      Разработал:  Московских А.М.                                   ║
  ║      Назначение:  Статус-контексты для ввода по форме Т2            ║
  ║      Параметры:                                                     ║
  ║      Изменения:                                                     ║
  ╚═════════════════════════════════════════════════════════════════════╝
*/

        (scStaffReceptionT2Main..scStaffReceptionT2Main)
        {
#F1
          '~F7~ Добавить',      cmStaffEmplInsert,       kbF7;
          '~F8~ Удалить',       cmDelete,                kbF8;
          '~Enter~ Изменить',   cmStaffDoCommonData,     kbEnter;
          '',                   cmStaffSeeDopInfo,       kbF9;
          '~Alt+B~ Фильтр',     cmStaffPrSetFlt,         kbAltB;
          '~Alt+S~ Сортировка ',cmStaffSort,             kbAltS;
          '~Alt+F~ Фото'       ,cmNal,                   kbAltF;
#Staf2Std
        }
        (scStaffReceptionT2MainPick..scStaffReceptionT2MainPick)
        {
#F1
          '~F7~ Добавить',           cmStaffEmplInsert,       kbF7;
          '~F8~ Удалить',            cmDelete,                kbF8;
          '~Enter~ Изменить',        cmStaffDoCommonData,     kbEnter;
          '',                        cmStaffSeeDopInfo,       kbF9;
          '~Alt+B~ Фильтр',          cmStaffPrSetFlt,         kbAltB;
          '~Alt+S~ Сортировка ',     cmStaffSort,             kbAltS;
          '~Alt+F~ Фото'       ,     cmNal,                   kbAltF;



#Ins
#PlusMinus
#Staf2Std
        }
        (scStaffReceptionMainTree..scStaffReceptionMainTree)
        {
#F1
          '~F7~ Добавить',      cmStaffEmplInsert,       kbF7;
          '~F8~ Удалить',       cmDelete,                kbF8;
          '~Enter~ Изменить',   cmStaffDoCommonData,     kbEnter;
          '',                   cmStaffSeeDopInfo,       kbF9;
          '~Alt+B~ Фильтр',     cmStaffPrSetFlt,         kbAltB;
          '~Alt+S~ Сортировка ',cmStaffSort,             kbAltS;
          '~Alt+F~ Фото'       ,cmNal,                   kbAltF;
          '~Alt+O~ Отображение',cmExp,                   kbAltO;
#Staf2Std
        }

        (scStaffReceptionT2CD..scStaffReceptionT2CD)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2CDPick..scStaffReceptionT2CDPick)
        {
#F1
          '~Ctrl+Enter~ следующее', cmStaffDoWinNext,  kbCtrlEnter;
          '~F3~ Выбор',             cmPick,            kbF3;
          '~F7~ Добавить',          cmInsert,          kbF7;
          '~F8~ Удалить',           cmDelete,          kbF8;
!          '~Alt+B~ Фильтр',        cmStaffPrSetFlt,   kbAltB;
          '',                       cmClose,           kbEsc;
          '',                       cmStaffSeeDopInfo, kbF9;
          '',                       cmCalc,            kbCtrlQ;

#Staf2Std
        }

        (scStaffReceptionT2PsnFamState..scStaffReceptionT2PsnFamState)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F3~ Выбор',       cmPick,              kbF3;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2CDEdit..scStaffReceptionT2CDEdit)
        {
#F1
          '~Ctrl+Enter~ следующее', cmStaffDoWinNext,  kbCtrlEnter;
          '~F3~ Изменить',          cmPick,            kbF3;
          '~F7~ Добавить',          cmInsert,          kbF7;
          '~F8~ Удалить',           cmDelete,          kbF8;
          '',                       cmClose,           kbEsc;
          '',                       cmStaffSeeDopInfo, kbF9;
          '',                       cmCalc,            kbCtrlQ;

#Std_Stat
#Staf2Std
        }

        (scStaffReceptionT2CDEditNew..scStaffReceptionT2CDEditNew)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F3~ Изменить',    cmPick,         kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '~Alt+B~ Фильтр',   cmStaffPrSetFlt,         kbAltB;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
          '',                 cmCopyToBuf,    kbCtrlC;
          '',                 cmPasteFromBuf, kbCtrlV;

#Staf2Std
        }


        (scStaffReceptionT2Com..scStaffReceptionT2Com)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F7~ Добавить',           cmInsert,          kbF7;
          '~F8~ Удалить',            cmDelete,          kbF8;
!          '~Alt+B~ Фильтр',         cmStaffPrSetFlt,   kbAltB;
          '',                        cmClose,           kbEsc;
          '',                        cmStaffSeeDopInfo, kbF9;
          '',                        cmCalc,            kbCtrlQ;

#Staf2Std
        }

        (scStaffReceptionT2ComNew..scStaffReceptionT2ComNew)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '~Alt+B~ Фильтр',   cmStaffPrSetFlt,         kbAltB;
          '',                 cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;

#Staf2Std
        }


        (scStaffReceptionT2ComPick..scStaffReceptionT2ComPick)
        {
#F1
          '~Ctrl+Enter~ следующее', cmStaffDoWinNext,  kbCtrlEnter;
          '~F3~ Выбор',             cmPick,            kbF3;
          '~F7~ Добавить',          cmInsert,          kbF7;
          '~F8~ Удалить',           cmDelete,          kbF8;
!          '~Alt+B~ Фильтр',        cmStaffPrSetFlt,   kbAltB;
          '',                       cmClose,           kbEsc;
          '',                       cmStaffSeeDopInfo, kbF9;
          '',                       cmCalc,            kbCtrlQ;

#Staf2Std
        }

        (scStaffReceptionT2ComPickNew..scStaffReceptionT2ComPickNew)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F3~ Выбор',       cmPick,         kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '~Alt+B~ Фильтр',   cmStaffPrSetFlt,         kbAltB;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2NonStop..scStaffReceptionT2NonStop)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2SL..scStaffReceptionT2SL)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '~F4~ История',     cmStaffEdit,    kbF4;
          '',                 cmStaffSeeDopInfo,   kbF9;
          '~Alt+C~ Дополнительно', cmStaffPrOk,    kbAltC;
#Staf2Std
        }


        (scStaffPens..scStaffPens)
        {
#F1
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '~Esc Выход', cmClose,        kbEsc;
#Staf2Std
        }

        (scStaffPensPick..scStaffPensPick)
        {
#F1
          '~F3~ Выбор',       cmPick,         kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '~Esc Выход',       cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }


        (scStaffReceptionT2SLHis..scStaffReceptionT2SLHis)
        {
          '~F1~ Помощь',      cmHelp,              kbF1;
          '~F4~ Изменить',    cmStaffEdit,         kbF4;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffSLRec..scStaffSLRec)
        {
          '~F1~ Помощь',      cmHelp,              kbF1;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffSLRecPick..scStaffSLRecPick)
        {
          '~F1~ Помощь',      cmHelp,              kbF1;
          '~F3~ Выбор',       cmPick,              kbF3;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2SLEdit..scStaffReceptionT2SLEdit)
        {
#F1
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2SLEditPick..scStaffReceptionT2SLEditPick)
        {
#F1
          '~F3~ Выбор',       cmPick,         kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2SLEditDate..scStaffReceptionT2SLEditDate)
        {
#F1
          '~F3~ Тек.дата',    cmPick,         kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2Passp..scStaffReceptionT2Passp)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2PasspNat..scStaffReceptionT2PasspNat)
        {
          '~F1~ Помощь',      cmHelp,              kbF1;
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F2~ Форма',       cmStaffPasspForm,    kbF2;
          '~F8~ Удалить',     cmDelete,            kbF8;
          '', cmClose,             kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffReceptionT2Butt..scStaffReceptionT2Butt)
        {
#F1
          '~Ctrl+Enter~ следующее', cmStaffDoWinNext,  kbCtrlEnter;
          '',                       cmClose,           kbEsc;
          '',                       cmStaffSeeDopInfo, kbF9;
          '',                       cmCalc,            kbCtrlQ;

#Staf2Std
        }

        (scStaffReceptionT2ButtAltG..scStaffReceptionT2ButtAltG)
        {
#F1
          '~F7~ Добавить',          cmInsert,          kbF7;
          '~F8~ Удалить',           cmDelete,          kbF8;
          '~Ctrl+Enter~ следующее', cmStaffDoWinNext,  kbCtrlEnter;
          '',                       cmClose,           kbEsc;
          '',                       cmStaffSeeDopInfo, kbF9;
          '',                       cmCalc,            kbCtrlQ;
          '',                       cmRecalcAllSums,   kbAltG;

#Staf2Std
        }

        (scStaffT2Add..scStaffT2Add)
        {
#F1
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffT2AddPick..scStaffT2AddPick)
        {
#F1
          '~F3~ Выбор',       cmPick,         kbF3;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffRecepT2Conscr..scStaffRecepT2Conscr)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffRecepT2ConscrPick..scStaffRecepT2ConscrPick)
        {
#F1
          '~Ctrl+Enter~ следующее',  cmStaffDoWinNext,  kbCtrlEnter;
          '~F3~ Выбор',       cmPick,         kbF3;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffRecepT2Hire..scStaffRecepT2Hire)
        {
#F1
          '~F2~ Форма',       cmStaffHireForm,kbF2;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffRecepT2HirePick..scStaffRecepT2HirePick)
        {
#F1
          '~F2~ Форма',       cmStaffHireForm,kbF2;
          '~F3~ Выбор',       cmPick,         kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
#Staf2Std
        }

        (scStaffRecepT2Raise..scStaffRecepT2Raise)
        {
#F1
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
          '',                 cmSortMC,       kbAltR;
#Staf2Std
        }

        (scStaffRecepT2RaisePick..scStaffRecepT2RaisePick)
        {
#F1
          '~F3~ Выбор',       cmPick,         kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
          '',                 cmSortMC,       kbAltR;
#Staf2Std
        }
/*********************** зарплата *************************************/
        (scStaffPass..scStaffPass)
        {
          '~F1~ Помощь',        cmHelp,         kbF1;
          '~Alt+F3~ Закрыть',   cmClose,        kbAltF3;
          '~Enter~ Выбор',      cmDefault,      kbF2;
          '~Alt+~ Редактирование', cmCalculator,   kbShiftF2;
          '',                   cmLastHelp,     kbAltF1;
          '',                   cmZoom,         kbF5;
          '',                   cmResize,       kbCtrlF5;
          '',                   cmQuit,         kbAltX;
          '',                   cmMenu,         kbF10;
          '',              cmEvaluateAndModify, kbCtrlF4;
        }

        (scStaffPick..scStaffPick)
        {
          '~F1~ Помощь',        cmHelp,         kbF1;
          '~Alt+F3~ Закрыть',   cmClose,        kbAltF3;
          '~Enter~ Выбор',      cmDefault,      kbF2;
          '',                   cmCalculator,   kbShiftF2;
          '',                   cmLastHelp,     kbAltF1;
          '',                   cmZoom,         kbF5;
          '',                   cmResize,       kbCtrlF5;
          '',                   cmQuit,         kbAltX;
          '',                   cmMenu,         kbF10;
          '',              cmEvaluateAndModify, kbCtrlF4;
        }

        (scStaffBut..scStaffBut)
        {
          '~F1~ Помощь',        cmHelp,         kbF1;
          '~Alt+F3~ Закрыть',   cmClose,        kbAltF3;
          '',                   cmDefault,      kbF2;
          '',                   cmLastHelp,     kbAltF1;
          '',                   cmCalculator,   kbShiftF2;
          '',                   cmZoom,         kbF5;
          '',                   cmResize,       kbCtrlF5;
          '',                   cmQuit,         kbAltX;
          '',                   cmMenu,         kbF10;
          '',              cmEvaluateAndModify, kbCtrlF4;
        }

        (scStaffInterfac1..scStaffInterfac1)
        {
          '~F1~ Помощь',        cmHelp,         kbF1;
          '~F3~ Выбор',         cmPick,         kbF3;
          '~F4~ Переход',       cmPass,         kbF4;
          '~F7~ Добавить',      cmInsert,       kbF7;
          '~F8~ Удалить',       cmDelete,       kbF8;
          '~Alt+F3~ Закрыть',   cmClose,        kbAltF3;
          ''                ,   cmDoTable1,     kbAltF2;
          '',                   cmprintbase,   kbctrlr;
          '',                   cmPrintBaseGround, kbCtrlP;
          '',                   cmCalculator,   kbShiftF2;
          '',                   cmQuit,         kbAltX;
          '',                   cmsearchsubstr, kbctrlS;
          '',                   cmMenu,         kbF10;
          '',                   cmZoom,         kbF5;
          '',                   cmResize,       kbCtrlF5;
          '',                   cmNext,         kbF6;
          '',                   cmPrev,         kbShiftF6;
          '',                   cmSysMenu,      kbCtrlF10;
          '',              cmEvaluateAndModify, kbCtrlF4;

        }

        (scStaffInterfac2..scStaffInterfac2)
        {
          '~F1~ Помощь',        cmHelp,         kbF1;
          '~  ~      ',         cmOk,           kbF3;
          '~F4~ Переход',       cmPass,         kbF4;
          '~F7~ Добавить',      cmInsert,       kbF7;
          '~F8~ Удалить',       cmDelete,       kbF8;
          '~Alt+F3~ Закрыть',   cmClose,        kbAltF3;
          ''                ,   cmDoTable1,     kbAltF2;
          '',                   cmprintbase,   kbctrlr;
          '',                   cmPrintBaseGround, kbCtrlP;
          '',                   cmCalculator,   kbShiftF2;
          '',                   cmQuit,         kbAltX;
          '',                   cmMenu,         kbF10;
          '',                   cmZoom,         kbF5;
          '',                   cmResize,       kbCtrlF5;
          '',                   cmNext,         kbF6;
          '',                   cmPrev,         kbShiftF6;
          '',                   cmSysMenu,      kbCtrlF10;
          '',              cmEvaluateAndModify, kbCtrlF4;

        }

        (scStaff178Esc..scStaff178Esc)
        {
          '~F1~ Помощь',        cmHelp,         kbF1;
          '~F7~ Добавить',      cmInsert,       kbF7;
          '~F8~ Удалить',       cmDelete,       kbF8;
          '~Alt+F3~ Закрыть',   cmClose,        kbAltF3;
          '',                   cmCalculator,   kbShiftF2;
          '',                   cmQuit,         kbAltX;
          '',                   cmsearchsubstr, kbctrlS;
          '',                   cmMenu,         kbF10;
          '',                   cmZoom,         kbF5;
          '',                   cmResize,       kbCtrlF5;
          '',                   cmNext,         kbF6;
          '',                   cmPrev,         kbShiftF6;
          '',                   cmSysMenu,      kbCtrlF10;
          '',              cmEvaluateAndModify, kbCtrlF4;

        }

        (scStaffKlVidPos..scStaffKlVidPos)
        {
#F1
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '~Alt+F3~ Закрыть', cmClose,        kbAltF3;
          '',                 cmOpenSearch,   kbAltS;
          '',                 cmMenu,         kbF10;
          '',                 cmZoom,         kbF5;
          '',                 cmResize,       kbCtrlF5;
          '',                 cmTile,         kbShiftF5;
          '',                 cmCascade,      kbAltF5;
          '',                 cmNext,         kbF6;
          '',                 cmPrev,         kbShiftF6;
          '',                 cmSysMenu,      kbCtrlF10;
          '',                 cmLastHelp,     kbAltF1;
          '',                 cmCallIndex,    kbShiftF1;
          '',                 cmCalendar,     kbCtrlF2;
          '',                 cmCalculator,   kbShiftF2;
          '',                 cmQuit,         kbAltX;
        }

        (scZarPsnLinksEdit..scZarPsnLinksEdit)
        {
#F1
          '~F3~ Изменить',    cmPick,       kbF3;
          '~F7~ Добавить',    cmInsert,       kbF7;
          '~F8~ Удалить',     cmDelete,       kbF8;
          '', cmClose,        kbEsc;
          '',                 cmStaffSeeDopInfo,   kbF9;
          '',                 cmCopyToBuf,    kbCtrlC;
          '',                 cmPasteFromBuf, kbCtrlV;
#Staf2Std

        }
        (scStaffReceptionMainTreeExtend..scStaffReceptionMainTreeExtend)
        {
#F1
          '~F7~ Добавить',      cmStaffEmplInsert,       kbF7;
          '~F8~ Удалить',       cmDelete,                kbF8;
          '~Enter~ Изменить',   cmStaffDoCommonData,     kbEnter;
          '',                   cmStaffSeeDopInfo,       kbF9;
          '~Alt+B~ Фильтр',     cmStaffPrSetFlt,         kbAltB;
          '~Alt+S~ Сортировка ',cmStaffSort,             kbAltS;
          '~Alt+F~ Фото'       ,cmNal,                   kbAltF;
          '~Alt+O~ Отображение',cmExp,                   kbAltO;
          '~Ctrl+F7~ Прием'    ,cmInsLowLevel,           kbCtrlF7;
#Staf2Std
        }
