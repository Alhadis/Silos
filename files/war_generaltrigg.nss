void main()
{
object oTarget = GetEnteringObject();
object oGeneral = GetNearestCreature (CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_SHAPECHANGER, oTarget, 1, CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC);
//string sGenName = GetName (oGeneral);
//SendMessageToPC (oTarget, "the general is:" +sGenName);
int nLightning = SPELL_LIGHTNING_BOLT;
effect eLightning;
eLightning = EffectBeam(VFX_BEAM_LIGHTNING, oTarget , BODY_NODE_CHEST);
string sTag = GetTag(oGeneral);

if (GetStringLeft(sTag,1)=="G")
{
SetLocalString (oGeneral, "team", "GOLD" );
}
else if (GetStringLeft(sTag,1)=="S")
{
SetLocalString (oGeneral, "team", "SILVER" );
}

string sTargetTeam =GetLocalString(oTarget, "team");
string sTeamself = GetLocalString(oGeneral, "team");

if ((sTargetTeam == sTeamself)||(!GetIsPC (oTarget)))
{
SetIsTemporaryFriend(oTarget, oGeneral);
}
else
{
AssignCommand (oGeneral, SetIsTemporaryEnemy (oTarget));
AssignCommand (oGeneral, PlaySound ("vs_naribetf_bat3"));
AssignCommand (oGeneral,ActionCastFakeSpellAtObject (nLightning, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
DelayCommand(2.0, AssignCommand (oTarget, (ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oGeneral, 1.0))));
DelayCommand(2.0, AssignCommand (oTarget, (ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(10), DAMAGE_TYPE_ELECTRICAL), oTarget))));
}

}
