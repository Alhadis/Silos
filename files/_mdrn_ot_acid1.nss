#include "inc_d20"
void main()
{
    // Complex explosive trap
    object oPC = GetItemActivator();
    int nSkill = GetSkillRank(SKILL_DEMOLITIONS, oPC) - 4*(!GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_demo")));
    int nRoll = d20();
    object oTarg = GetItemActivatedTarget();
    if (GetIsObjectValid(oTarg)==FALSE)
    {
        // Floor trap
        location lTarg = GetItemActivatedTargetLocation();
        object oTrap = CreateTrapAtLocation(TRAP_BASE_TYPE_AVERAGE_ACID, lTarg, 2.0, "", STANDARD_FACTION_DEFENDER, "_mdrn_exe_exdis1");
        SetTrapDisarmDC(oTrap, nSkill+nRoll);
        SetTrapDetectDC(oTrap, 20);
        SetTrapRecoverable(oTrap, FALSE);
        DestroyObject(GetItemActivated());

    }
    else if (GetObjectType(oTarg)==OBJECT_TYPE_DOOR || GetObjectType(oTarg)==OBJECT_TYPE_PLACEABLE)
    {
          if (GetIsTrapped(oTarg))
        {
            // Object trap

            CreateTrapOnObject(TRAP_BASE_TYPE_AVERAGE_ACID, oTarg, STANDARD_FACTION_DEFENDER, "_mdrn_exe_exdis1");
            SetTrapDisarmDC(oTarg, nSkill+nRoll);
            SetTrapDetectDC(oTarg, 20);
            SetTrapRecoverable(oTarg, FALSE);
            DestroyObject(GetItemActivated());
         }
         else
            SendMessageToPC(oPC, "You must target an UNTRAPPED door or placeable to set a trap.");


    }
    else
        SendMessageToPC(oPC, "You must target the floor or an untrapped door or placeable to set a trap.");

}
