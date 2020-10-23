#include "pwfse_inc"
#include "dcs_inc_spawn"

void main()
{
    object oEnter = GetEnteringObject();
    object oArea  = OBJECT_SELF;

    if(GetIsPC(oEnter))
    {
        //    ExecuteScript("lts_emitter_oae", OBJECT_SELF);

        // only PC in the area ?
        if(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,GetFirstObjectInArea(OBJECT_SELF),2) == OBJECT_INVALID)
        {
          // yes , thus, area was empty before
          // activate spawns
          // SendMessageToPC(GetFirstPC(),"Reactivate all spawns");
          PWFSE_ActivateAllSpawnsInArea(OBJECT_SELF);
        }

        if(!GetLocalInt(oArea, DCS_SPAWNER_AREA_ACTIVATED))
        {
            SetLocalInt(oArea, DCS_SPAWNER_AREA_ACTIVATED, TRUE);
            DelayCommand(10.0, DCS_ActivateAreaSpawns(oArea));
            DelayCommand(300.0, SetLocalInt(oArea, DCS_SPAWNER_AREA_ACTIVATED, FALSE));
        }
    }
}
