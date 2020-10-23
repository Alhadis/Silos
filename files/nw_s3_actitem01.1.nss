//::///////////////////////////////////////////////
//:: Actuvate Item Script
//:: NW_S3_ActItem01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This fires the event on the module that allows
    for items to have special powers.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 19, 2001
//:://////////////////////////////////////////////

int GetHasHenchmanByTag(object oMaster, string sTag)
{
    object oHench = GetHenchman(oMaster);
    int i         = 1;
    int iResult;

    while(GetIsObjectValid(oHench))
    {
        if(GetTag(oHench) == sTag)
        {
            iResult = TRUE;
            break;
        }

        i++;
        oHench = GetHenchman(oMaster, i);
    }

    return iResult;
}

void main()
{
    object oPC      = OBJECT_SELF;
    object oItem    = GetSpellCastItem();
    object oTarget  = GetSpellTargetObject();
    location lLocal = GetSpellTargetLocation();

    if(GetTag(oItem) == "bbs_notice")
    {
        SetLocalObject(oPC, "bbs_notice_act", oItem);
        AssignCommand(oPC, ActionStartConversation(oPC, "bbs_notice", TRUE));
        return;
    }
    if(GetTag(oItem) == "d0_tattoo_01")
    {
        ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_CATS_GRACE, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_ENDURANCE, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        //ExecuteScript("nw_s0_bullstr", oPC);
        //ExecuteScript("nw_s0_catgrace", oPC);
        //ExecuteScript("nw_s0_endurce", oPC);
        /*
        effect eTattoo = EffectAbilityIncrease(ABILITY_STRENGTH, d4()+1);
               eTattoo = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, d4()+1), eTattoo);
               eTattoo = EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY, d4()+1), eTattoo);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_PULSE_NATURE), oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTattoo, oPC, HoursToSeconds(15));
        */
        return;
    }
    if(GetTag(oItem) == "d0_tattoo_02")
    {
        ActionCastSpellAtObject(SPELL_EAGLE_SPLEDOR, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_OWLS_WISDOM, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_FOXS_CUNNING, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        //ExecuteScript("nw_s0_eaglespl", oPC);
        //ExecuteScript("nw_s0_owlwis", oPC);
        //ExecuteScript("nw_s0_foxcunng", oPC);
        /*
        effect eTattoo = EffectAbilityIncrease(ABILITY_CHARISMA, d4()+1);
               eTattoo = EffectLinkEffects(EffectAbilityIncrease(ABILITY_INTELLIGENCE, d4()+1), eTattoo);
               eTattoo = EffectLinkEffects(EffectAbilityIncrease(ABILITY_WISDOM, d4()+1), eTattoo);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SUPER_HEROISM), oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTattoo, oPC, HoursToSeconds(15));
        */
        return;
    }
    if(GetStringLeft(GetTag(oItem), 5) == "dmfi_" || GetStringLeft(GetTag(oItem), 8) == "hlslang_")
    {
        SetLocalObject(OBJECT_SELF, "dmfi_item", oItem);
        SetLocalObject(OBJECT_SELF, "dmfi_target", oTarget);
        SetLocalLocation(OBJECT_SELF, "dmfi_location", lLocal);
        ExecuteScript("dmfi_activate", OBJECT_SELF);
        return;
    }
    if(GetStringLeft(GetTag(oItem), 5) == "dj_g1")
    {
        ExecuteScript("_dj_g1activate", OBJECT_SELF);
        return;
    }
    if(GetStringLeft(GetTag(oItem), 5) == "dj_g2")
    {
        ExecuteScript("_dj_g2activate", OBJECT_SELF);
        return;
    }
    if(GetStringLeft(GetTag(oItem), 5) == "dj_g3")
    {
        ExecuteScript("_dj_g3activate", OBJECT_SELF);
        return;
    }
    if(GetStringLeft(GetTag(oItem), 5) == "dj_g4")
    {
        ExecuteScript("_dj_g4activate", OBJECT_SELF);
        return;
    }
    if(GetStringLeft(GetTag(oItem), 5) == "dj_g5")
    {
        ExecuteScript("_dj_g5activate", OBJECT_SELF);
        return;
    }
    if(GetStringLeft(GetTag(oItem), 5) == "dj_g6")
    {
        ExecuteScript("_dj_g6activate", OBJECT_SELF);
        return;
    }
    if(GetTag(oItem)=="dj_jring")
    {
        AssignCommand(oPC, ActionJumpToLocation(lLocal));
        return;
    }
    if(GetStringLeft(GetResRef(oItem), 10) == "dj_rdhorse")
    {
        ExecuteScript("d0_horse", oPC);
        return;
    }
    if(GetTag(oItem) == "_sl_tool" || GetName(oItem) == "SL-Tool")
    {
        SetLocalInt(oPC, "Chose_Tool", 2);
        SetLocalObject(oPC, "stool_fix_object", oTarget);
        SetLocalObject(oPC, "stool_target_object", oItem);
        SetLocalLocation(oPC, "stool_target_loc", lLocal);
        SetCustomToken(11880, GetName(oTarget));
        AssignCommand(oPC, ActionStartConversation(oPC, "stool_choose", TRUE));
        return;
    }
    if(GetTag(oItem) == "_player_tool" || GetName(oItem) == "Effekt-Tool")
    {
        SetLocalInt(oPC, "Chose_Tool", 1);

        if(GetIsObjectValid(oTarget))
        {
            SetLocalObject(oPC, "stool_fix_object", oTarget);
            AssignCommand(oPC, ActionStartConversation(oPC, "stool_choose", TRUE));
        }
        else
        {
            oTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "_inv_target", lLocal);
            SetName(oTarget, " ");
            SetLocalObject(oPC, "stool_fix_object", oTarget);
            AssignCommand(oPC, ActionStartConversation(oPC, "stool_choose", TRUE));
        }

        return;
    }
    if(GetTag(oItem) == "d0_app_arcfox")
    {
        int iIsChanged = GetLocalInt(oPC, "d0_app_item_active");
        int iDefApp    = GetLocalInt(oPC, "d0_app_item_default");
        int iNewApp    = 3190;

        if(!iIsChanged)
        {
            SetLocalInt(oPC, "d0_app_item_active", TRUE);
            SetLocalInt(oPC, "d0_app_item_default", GetAppearanceType(oPC));

            SetCreatureAppearanceType(oPC, iNewApp);
        }
        else
        {
            SetCreatureAppearanceType(oPC, iDefApp);

            DeleteLocalInt(oPC, "d0_app_item_active");
            DeleteLocalInt(oPC, "d0_app_item_default");
        }
        return;
    }
    if(GetTag(oItem) == "d0_app_raven")
    {
        int iIsChanged = GetLocalInt(oPC, "d0_app_item_active");
        int iDefApp    = GetLocalInt(oPC, "d0_app_item_default");
        int iNewApp    = 145;

        if(!iIsChanged)
        {
            SetLocalInt(oPC, "d0_app_item_active", TRUE);
            SetLocalInt(oPC, "d0_app_item_default", GetAppearanceType(oPC));

            SetCreatureAppearanceType(oPC, iNewApp);
        }
        else
        {
            SetCreatureAppearanceType(oPC, iDefApp);

            DeleteLocalInt(oPC, "d0_app_item_active");
            DeleteLocalInt(oPC, "d0_app_item_default");
        }
        return;
    }
    if(GetTag(oItem) == "d0_poly_human")
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(114), oTarget);
        return;
    }
    if(GetTag(oItem) == "d0_poly_nhuman")
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(POLYMORPH_TYPE_NULL_HUMAN), oTarget);
        return;
    }
    if(GetStringLeft(GetTag(oItem), 6) == "_dj_hs")
    {
        SetLocalString(oPC, "d0_haustier", GetTag(oItem));
        ExecuteScript("d0_pet_act", oPC);
        return;
    }
    if(GetTag(oItem) == "d0_quiver")
    {
        ExecuteScript("d0_quiver", oPC);
        return;
    }
    if(GetTag(oItem) == "d0_campfire")
    {
        ExecuteScript("d0_lagerfeuer", oPC);
        return;
    }
    if(GetTag(oItem) == "_d0_draghn")
    {
        if(!GetLocalInt(oPC, "DRAGON_HEIGHT_BIG"))
        {
            SetLocalInt(oPC, "DRAGON_HEIGHT_BIG", 1);
            SendMessageToPC(oPC, "Drachengröße: Normal");
        }
        else
        {
            DeleteLocalInt(oPC, "DRAGON_HEIGHT_BIG");
            SendMessageToPC(oPC, "Drachengröße: Klein");
        }
        return;
    }
    if(GetTag(oItem) == "d0_potion_harm")
    {
        if (GetRacialType(oPC) == RACIAL_TYPE_UNDEAD)
        {
            int nHeal = GetMaxHitPoints(oPC) - GetCurrentHitPoints(oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_G), oPC);
            SignalEvent(oPC, EventSpellCastAt(OBJECT_SELF, SPELL_HARM, FALSE));
        }
        else
        {
            int nDamage = GetCurrentHitPoints(oPC) - d4(1);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE), oPC));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(246), oPC);
            SignalEvent(oPC, EventSpellCastAt(OBJECT_SELF, SPELL_HARM));
        }
        return;
    }
    if(GetTag(oItem) == "d0_ent_item")
    {
        if(!GetHasHenchmanByTag(oPC, "d0_ent"))
        {
            object oEntLead = CreateObject(OBJECT_TYPE_CREATURE, "d0_ent", GetLocation(oPC));
            object oEnt1    = CreateObject(OBJECT_TYPE_CREATURE, "d0_ent", GetLocation(oPC));
            object oEnt2    = CreateObject(OBJECT_TYPE_CREATURE, "d0_ent", GetLocation(oPC));

            AddHenchman(oPC, oEntLead);
            AddHenchman(oPC, oEnt1);
            AddHenchman(oPC, oEnt2);
            SetName(oEntLead, GetName(oEntLead)+" [Leiter]");
            SetLocalInt(oEntLead, "d0_EntLeader", TRUE);
            SetPlotFlag(oEntLead, TRUE);
        }

        return;
    }

    SignalEvent(GetModule(), EventActivateItem(oItem, lLocal, oTarget));
}
