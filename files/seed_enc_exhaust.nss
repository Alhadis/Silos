#include "seed_enc_inc"

void main() {
   object oEnc = OBJECT_SELF;
   object oWorker = GetObjectByTag("TavernInfo");
   if (GetLocalInt(oEnc,"SpawnOK")==1) { // IN JUST FIRED MODE
      SetLocalInt(oEnc,"SpawnOK",2); // SET TO WAIT MODE
      AssignCommand(oWorker, DelayCommand(300.0f,SetLocalInt(oEnc,"SpawnOK",0)));
   }
}
