void main()
{
object oModule=GetModule();
object oActivator=GetPCSpeaker();
object oTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsSkillStickTarget");

SetLocalInt(oActivator, "pt_craft_dialToolIsRawCreateSp", FALSE);
SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeRawSp", FALSE);
SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeToolSp", FALSE);
SetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeSkillSp", FALSE);
SetLocalInt(oActivator, "pt_craft_dialToolIsRawCreateSkillSt", FALSE);

DeleteLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
}
