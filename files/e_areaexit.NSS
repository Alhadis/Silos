#include "sys_tat_ex_inc"
#include "inc_pwcore_event"
float fDelayTime = 120.0;

void main(){
  object oArea = OBJECT_SELF;
  object oPC = GetExitingObject();
  if (!GetIsPC(oPC)) return;

  if (GetLocalInt(oArea, "CleanArea") != 1){
    DelayCommand(fDelayTime, CleanArea(oArea));
    SetLocalInt(oArea, "CleanArea", 1);
                                           }
            }  