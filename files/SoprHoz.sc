/////////////////////////////////////////////////////////////////////////
// To Do Хоть и называется plpor но исползтуется только в Soprhoz.vip  //
//                    "Разноска Хозопераций"                           //
/////////////////////////////////////////////////////////////////////////
(scInterfHO01..scInterfHO01)  // В зеленом интерфейсе с кнопкой F3
{
  #F1
  '~F3~ Выбор',         cmPick,              kbF3;
  '~F4~ Документ',      cmEdit,              kbF4;
  '~Ins,+/-~ Пометка',  cmMarkUnMark,        kbIns;
  '~Enter~ Проводки',   cmDefault,           kbEnter;
  '',                   cmSelectAll,         kbGrayPlus;
  '',                   cmUnSelectAll,       kbGrayMinus;

  '',                   cmBeforeFirstInit,   kbCtrlU;
  '',                   cmBeforeInit,        kbCtrlUp;
  '',                   cmAfterInit,         kbCtrlDown;
  '',                   cmAfterFirstInit,    kbCtrlD;
  #Std_Stat
}
(scInterfHO02..scInterfHO02)  // В зеленом интерфейсе без кнопки F3
{
  #F1
  '',                   cmOk,                kbF3;
  '~F4~ Документ',      cmEdit,              kbF4;
  '~Ins,+/-~ Пометка',  cmMarkUnMark,        kbIns;
  '~Enter~ Проводки',   cmDefault,           kbEnter;
  '',                   cmSelectAll,         kbGrayPlus;
  '',                   cmUnSelectAll,       kbGrayMinus;

  '',                   cmBeforeFirstInit,   kbCtrlU;
  '',                   cmBeforeInit,        kbCtrlUp;
  '',                   cmAfterInit,         kbCtrlDown;
  '',                   cmAfterFirstInit,    kbCtrlD;
  #Std_Stat
}
(scInterfHO03..scInterfHO03) // В синем интерфейсе с кнопкой F3
{
  #F1
  '~F3~ Выбор',         cmPick,              kbF3;
  '~F4~ Документ',      cmEdit,              kbF4;
  '~Esc~ Выход',        cmClose,             kbAltF3;

  '',                   cmBeforeFirstInit,   kbCtrlU;
  '',                   cmBeforeInit,        kbCtrlUp;
  '',                   cmAfterInit,         kbCtrlDown;
  '',                   cmAfterFirstInit,    kbCtrlD;
  #Std_Stat
}
(scInterfHO04..scInterfHO04) // В синем интерфейсе без кнопки F3
{
  #F1
  '~F4~ Документ',      cmEdit,              kbF4;
  '~Esc~ Выход',        cmClose,             kbAltF3;

  '',                   cmBeforeFirstInit,   kbCtrlU;
  '',                   cmBeforeInit,        kbCtrlUp;
  '',                   cmAfterInit,         kbCtrlDown;
  '',                   cmAfterFirstInit,    kbCtrlD;
  #Std_Stat
}
(scInterfHO05..scInterfHO05) // Допинфо в зеленом интерфейсе с F7 F8
{
  #F1
  '~F7~ Добавить',      cmInsert,       kbF7;
  '~F8~ Удалить',       cmDelete,       kbF8;
  '~Enter~ Выбор',      cmDefault,      kbEnter;
  '~Esc~ Выход',        cmClose,        kbAltF3;
  #Std_Stat
}
(scInterfHO06..scInterfHO06) // Допинфо в зеленом интерфейсе без F7 F8
{
  #F1
  '~Enter~ Проводки',   cmDefault,      kbEnter;
  '~Esc~ Выход',        cmClose,        kbAltF3;
  #Std_Stat
}
