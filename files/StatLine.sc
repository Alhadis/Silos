//------------------------------------------------------------------------------
//                                                      (c) Корпорация ГАЛАКТИКА
//------------------------------------------------------------------------------
// Система       : ГАЛАКТИКА
// Версия        : 8.0
// Назначение    : Все статус - линии
// Ответсвенный  :
//------------------------------------------------------------------------------

!-------------------------------------------------------------------------------
StatGal StatusLine
{
   #include StatDefs.inc        // Глобальные define для статус линий
   #include StdLine.rc1         // Атлантис
   #include StdZar.sc           // Зарплата
   #include FA.sc               // Финансовый анализ
   #include F_Pat.sc            // Статусы для компоненты F_PAT
   #include F_alg.sc            // Статусы для компоненты F_ALG
   #include AllStat.sc
   #include Sct.sc              // Стандартные статусы с cmInsert
   #include class.sc            // Классификация
   #include statmbp.sc          // Учет спецоснастки
   #include statsfo.sc          // Спецодежда
   #include intclass.sc         // ?! Встроенная классификация
   #include docbas.sc           // Документооборот
   #include market.sc           // Маркетинг
   #include ap.sc               // Планирование (старое)
   #include staffall.sc         // Кадры
   #include stafcard.sc         // Полная личная карточка
   #include staff_f2.sc         // Личная карточка по форме Т2
   #ifdef Use_VDE
     #include vdestat.sc        // VDE
   #end
   #ifdef __SKYSHOP__
     #include sky.sc
   #end
   #include statuses.sc
   #include tppstats.sc
   #include tepansta.sc
   #include scmick.sc
   #include Tree.sc
   #include Remont.sc           // Управление ремонтами
   #include mKlient.sc          // Работа с клиентами
   #include Avtosta.sc          // Автотранспорт
   #include SoprHoz.sc
   #include BlStat.sc
   #include AnStat.sc           // Зарплата
   #include Eugen.sc
   #include sfres.sc
#ifdef GAL7_12
   #include DataExport.sc       // Экспорт данных во внешнее хранилище (OLAP)
#endif
   ("ZReport")
   ("StatLine_ZBANKCARD")
   ("PL_StatLine")
   ("StatLine_User_Ex1")  //пр 102.154222 Нужны пользовательские точки подключения для стандартной статус строки StatGal
   ("StatLine_User_Ex2")
   ("StatLine_User_Ex3")
   ("StatLine_User_Ex4")
   ("StatLine_User_Ex5")
   #include StdLine.rc2         // Атлантис
   #include StdLine.rc3         // Атлантис - Должен быть последним из статусов !!!
}
!-------------------------------------------------------------------------------
