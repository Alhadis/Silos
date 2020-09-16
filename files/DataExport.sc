(scDE_TaskMan..scDE_TaskMan)
{
  '~Ctrl+Enter~ Открыть',     cmTreeOpenNode,  kbCtrlEnter;
  '~Ctrl+Backspace~ Закрыть', cmTreeCloseNode, kbCtrlBack;
  '~F4~ Параметры',           cmEdit,          kbF4;
  '~F7~ Добавить',            cmInsert,        kbF7;
  '~F8~ Удалить',             cmDelete,        kbF8;
  '~Esc~ Выход',              cmClose,         kbAltF3;
  #Ins
  #PlusMinus
}

(scDE_JobMan..scDE_JobMan)
{
  '~F3~ Журнал',              cmPick,          kbF3;
  '~Ctrl+F3~ Редактировать',  cmDE_EditJob,    kbCtrlF3;
  '~F4~ Параметры',           cmEdit,          kbF4;
  '~F5~ Выполнить',           cmDE_RunTask,    kbF5;
  '~F7~ Добавить',            cmInsert,        kbF7;
  '~F8~ Удалить',             cmDelete,        kbF8;
  '~Esc~ Выход',              cmClose,         kbAltF3;
  #Ins
  #PlusMinus
}

(scDE_QueueManQ..scDE_QueueManQ)
{
  '~F3~ Статус',                cmPick,                 kbF3;
  '~F4~ Параметры',             cmEdit,                 kbF4;
  '~F7~ Добавить',              cmInsert,               kbF7;
  '~F8~ Удалить',               cmDelete,               kbF8;
  '~Ctrl+Up~ Переместить выше',    cmDE_LineUp,            kbCtrlUp;
  '~Ctrl+Down~ Переместить ниже',  cmDE_LineDown,          kbCtrlDown;
  '~Esc~ Выход',                cmClose,                kbAltF3;
}

(scDE_QueueManJ..scDE_QueueManJ)
{
  '~F3~ Журнал',                cmPick,                 kbF3;
  '~F4~ Параметры',             cmEdit,                 kbF4;
  '~F7~ Добавить',              cmInsert,               kbF7;
  '~F8~ Удалить',               cmDelete,               kbF8;
  '~Ctrl+Up~ Переместить выше',    cmDE_LineUp,            kbCtrlUp;
  '~Ctrl+Down~ Переместить ниже',  cmDE_LineDown,          kbCtrlDown;
  '~Esc~ Выход',                cmClose,                kbAltF3;
}
