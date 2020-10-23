void main()
{
object oGeneral = OBJECT_SELF;
object oTarget = GetLastPerceived();
int nLightning = SPELL_LIGHTNING_BOLT;
effect eLightning;
eLightning = EffectBeam(VFX_BEAM_LIGHTNING, oTarget , BODY_NODE_CHEST);
string sTag = GetTag(OBJECT_SELF);

if (GetStringLeft(sTag,1)=="G")
{
SetLocalString (OBJECT_SELF, "team", "GOLD" );
}
else if (GetStringLeft(sTag,1)=="S")
{
SetLocalString (OBJECT_SELF, "team", "SILVER" );
}

string sTargetTeam =GetLocalString(oTarget, "team");
string sTeamself = GetLocalString(OBJECT_SELF, "team");

if (sTargetTeam == sTeamself)
{
SetIsTemporaryFriend(oTarget, OBJECT_SELF);
}
else
{
SetIsTemporaryEnemy (oTarget);

//while(GetIsObjectValid(oTarget))
//{
PlaySound ("vs_naribetf_bat3");
ActionCastFakeSpellAtObject (nLightning, oTarget, PROJECTILE_PATH_TYPE_DEFAULT);
DelayCommand(2.0, AssignCommand (oTarget, (ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oGeneral, 1.0))));
DelayCommand(2.0, AssignCommand (oTarget, (ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(10), DAMAGE_TYPE_ELECTRICAL), oTarget))));
//return;
//  oTarget = GetLastPerceived();
//}

}

}
