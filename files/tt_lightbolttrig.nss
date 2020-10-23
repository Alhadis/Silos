/*
void main()
{

object oPC = GetEnteringObject();

//if (!GetIsPC(oPC)) return;



if (GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)) == "tt_scepter")
   return;

object oCaster;
oCaster = GetObjectByTag("tt_magstone_001");

object oTarget;
oTarget = oPC;

if (GetLocalInt(oCaster, "Active")!= 1)
   return;

AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_LIGHTNING_BOLT, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

}
*/


void main()
{

object oPC = GetEnteringObject();


object oCaster;
oCaster = GetObjectByTag("tt_magstone_001");

if (GetLocalInt(oCaster, "X2_L_PLC_ACTIVATED_STATE")== 1)
   return;



object oTarget;
oTarget = oPC;

AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_LIGHTNING_BOLT, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

}

