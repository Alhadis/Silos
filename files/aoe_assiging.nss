void main()
{
location lWhere = GetSpellTargetLocation();

object oNewAOE = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_SMALL, lWhere, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);

while(oNewAOE != OBJECT_INVALID)
{
if(GetObjectType(oNewAOE) == OBJECT_TYPE_AREA_OF_EFFECT)//  && GetLocalInt(oNewAOE, "Has_Ints_Set_Already_Boolean") == 0)
{

string toSay = "Trapped an entering AOE object";
SendMessageToPC(OBJECT_SELF, toSay);


int somevalue = 1;

SetLocalInt(oNewAOE, "Has_Ints_Set_Already_Boolean", somevalue);

SetLocalInt(oNewAOE, "Caster_Level_Int", somevalue);

SetLocalInt(oNewAOE, "Damage_Type_Int", somevalue);

SetLocalInt(oNewAOE, "Spell_Save_DC_Int", somevalue);

SetLocalInt(oNewAOE, "Spell_Penetration_Bonus_Int", somevalue);
}

oNewAOE = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_SMALL, lWhere, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
}

}

