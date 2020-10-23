/*
    (SPELL HOOK SCRIPT)
    
    - Dominate Monster:
        Script that allows the PC dominate up to two creatures.
        It doesn't includes all calculations such as is target a monster, spell resist check etc.

        Directly overrides to default behaviour of spell. Thus, two monster can dominated in
        two spell. An effect type that used in default spell script was causing a problem
        with effect type that used in this script. So due to that, spell were dominating two creatures
        when casted three times.

        This effect can removed by "Lesser mind blank" or "Mink blank" (dispel works too). 
        "Clarity" does not removes dominate effect so it is not added.

        Note:
        When caster rests, this effect still persists. Effect needed to be manually removed from 
        affected creature(s) when caster rests.

        When creature dies, it's local object need to set to "INVALID_OBJECT".

        To get first dominated creature        : GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC, 1);
        To get second(last) dominated creature : GetLocalObject(oPC, "ZAP_SECOND_DOMINATED_CREATURE_OBJECT");

    - Lesser Mind Blank:
        Removes modified "dominate monster" spell effect from target.

    - Mind Blank:
        Removes modified "dominate monster" spell effect from target(s) in the targetted area.
*/

#include "x2_inc_switches"
#include "zap_effects_hlp"

void main()
{
    int nSpell = GetSpellId();
    int nDC    = GetSpellSaveDC();

    object oCaster = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();

    switch(nSpell)
    {
        case SPELL_DOMINATE_MONSTER:
            if(!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oCaster))
			{
				int nDominateCount = GetLocalInt(oCaster, "ZAP_DOMINATED_CREATURE_COUNT");

				effect eVFX    = EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DOMINATED), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
					   eVFX    = EffectLinkEffects(EffectCutsceneDominated(), eVFX);
					   eVFX    = TagEffect(eVFX, "ZAP_DOMINATE_MONSTER");
				effect eImpact = EffectVisualEffect(VFX_IMP_DOMINATE_S);

				switch(nDominateCount)
				{
					case 0:
                    case 1:
						ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oTarget, HoursToSeconds(3));
						ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpact, oTarget);
						
                        SetLocalObject(oTarget, "ZAP_DOMINATE_MASTER", oCaster);
						SetLocalInt(oCaster, "ZAP_DOMINATED_CREATURE_COUNT", nDominateCount + 1);
					break;

					case 2:
						object oFirstDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oCaster, 1);

						if(oTarget != oFirstDominated && oTarget != GetLocalObject(OBJECT_SELF, "ZAP_SECOND_DOMINATED_CREATURE_OBJECT"))
						{
							int nRemoveStatus = zap_RemoveEffectByTag(oFirstDominated, "ZAP_DOMINATE_MONSTER");
						}

						ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oTarget, HoursToSeconds(3));
						ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpact, oTarget);

                        SetLocalObject(oTarget, "ZAP_DOMINATE_MASTER", oCaster);
                        SetLocalInt(oTarget, "ZAP_SECOND_DOMINATED", 1);

						SetLocalObject(OBJECT_SELF, "ZAP_SECOND_DOMINATED_CREATURE_OBJECT", oTarget);
					break;
				}

				SetModuleOverrideSpellScriptFinished();
			}
        break;

        case SPELL_LESSER_MIND_BLANK:
            if(GetEffectTag(zap_FindEffectByTag(oTarget, "ZAP_DOMINATE_MONSTER")) != ZAP_INVALID_EFFECT_TAG)
            {
                object oDomMaster = GetLocalObject(oTarget, "ZAP_DOMINATE_MASTER");

                zap_RemoveEffectByTag(oTarget, "ZAP_DOMINATE_MONSTER");

                if(GetLocalInt(oTarget, "ZAP_SECOND_DOMINATED") == 1)
                {
                    SetLocalObject(oDomMaster, "ZAP_SECOND_DOMINATED_CREATURE_OBJECT", OBJECT_INVALID);

                    SetLocalObject(oTarget, "ZAP_DOMINATE_MASTER", OBJECT_INVALID);
                    SetLocalInt(oTarget, "ZAP_SECOND_DOMINATED", 0);
                }

                SetLocalInt(oDomMaster, "ZAP_DOMINATED_CREATURE_COUNT", GetLocalInt(oDomMaster, "ZAP_DOMINATED_CREATURE_COUNT") - 1);
            }
        break;

        case SPELL_MIND_BLANK:
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetSpellTargetLocation());
            int    nRemovedEffects = 0;

            object oDomMaster = GetLocalObject(oTarget, "ZAP_DOMINATE_MASTER");

            while(GetIsObjectValid(oTarget))
            {
                if(GetEffectTag(zap_FindEffectByTag(oTarget, "ZAP_DOMINATE_MONSTER")) != ZAP_INVALID_EFFECT_TAG)
                {
                    zap_RemoveEffectByTag(oTarget, "ZAP_DOMINATE_MONSTER");
                    nRemovedEffects += 1;

                    if(GetLocalInt(oTarget, "ZAP_SECOND_DOMINATED") == 1)
                    {
                        SetLocalObject(oDomMaster, "ZAP_SECOND_DOMINATED_CREATURE_OBJECT", OBJECT_INVALID);

                        SetLocalObject(oTarget, "ZAP_DOMINATE_MASTER", OBJECT_INVALID);
                        SetLocalInt(oTarget, "ZAP_SECOND_DOMINATED", 0);
                    }
                }

                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetSpellTargetLocation());
            }

            if(nRemovedEffects > 0)
            {
                SetLocalInt(oDomMaster, "ZAP_DOMINATED_CREATURE_COUNT", GetLocalInt(oDomMaster, "ZAP_DOMINATED_CREATURE_COUNT") - nRemovedEffects);
            }
        break;
    }
}
