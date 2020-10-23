// This is the main D20 Modern script to handle when someone is hit by a weapon; it checks for damage threshold
// (damage > Con) as well as various feats or other bonus delivering actions.

#include "_mdrn_rof"
#include "_mdrn_char_core"
#include "_mdrn_inc_sound"

void main()
{
    object oTarget = GetSpellTargetObject();
    object oShooter = OBJECT_SELF;

    if (GetLocalInt(OBJECT_SELF, "nBurstMode")==1)
    {
        effect eHit = EffectVisualEffect(VFX_COM_BLOOD_SPARK_MEDIUM);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHit, oTarget, 2.0);
    }

    if (GetHasFeat(FEAT_SHOTONTHERUN, oShooter) && GetWeaponRanged(GetLastWeaponUsed(oShooter))&& GetLocalInt(oShooter, "nShotRun") == 0)
    {
        SetLocalInt(oShooter, "nShotRun", 1);
        DelayCommand(6.0, SetLocalInt(oShooter, "nShotRun", 0));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedIncrease(99), oShooter, 6.0);
    }

    if (GetPhenoType(oTarget)==5 && GetLocalInt(oShooter, "nCrawlPen") == 0)
    {
        SetLocalInt(oShooter, "nCrawlPen", 1);
        DelayCommand(6.0, SetLocalInt(oShooter, "nCrawlPen", 0));
        if(GetWeaponRanged(GetLastWeaponUsed(oShooter)))
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackDecrease(4), oShooter, 6.0);
        else
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(4), oShooter, 6.0);
    }

    if (GetHasFeat(FEAT_SHARPSHOOTING, oShooter) && GetWeaponRanged(GetLastWeaponUsed(oShooter)))
    {
        object oShoot = GetLocalObject(oShooter, "oSharpshoot");
        if (oShoot == OBJECT_SELF)
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(2), oShooter, 6.0);
        else
            SetLocalObject(oShooter, "oSharpshoot", OBJECT_SELF);
    }

    if (GetLocalInt(oTarget, "nMdrnHitTarget")==0 && GetLocalInt(OBJECT_SELF, "nBurstMode")==1)
    {
        // This section only used if target has not triggered effects in OnPhysicalAttacked and if in Burst Mode.
        SetLocalInt(oTarget, "nMdrnHitTarget", 1);      // Set the flag that this has already been done.
        DelayCommand(2.0, SetLocalInt(oTarget, "nMdrnHitTarget", 0));    // Turn off the flag after a bit
        // Create and use a sound object to play machinegun sound.
        object oTarget = GetSpellTargetObject();
        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
        // Check for automatic weapon.
        if (!GetIsObjectValid(oWeapon) ||
            GetGunRate(oWeapon) != IP_CONST_ROF_AUTOMATIC )
        {
            SendMessageToPC(OBJECT_SELF, "You can only use automatic weapons with Burst mode.");
            SendDebugMessage("BurstFire: Invalid Weapon");
            return;
        }
        // Let target know they've been hit.
        SignalEvent(oTarget,EventSpellCastAt(OBJECT_SELF,GetSpellId(), TRUE));
        // Handle D20 Modern gun system; disallow Burst if ammo < 5 shots; remove 5 shots.
        int iGunType = GetBaseItemType(oWeapon);
        int iAmmoType = GetAmmoType(iGunType);
        object oAmmo = GetItemInSlot(GetAmmoSlot(iAmmoType), OBJECT_SELF);
        int iAmmoCount = GetItemStackSize(oAmmo);
        if ( iAmmoCount < 4 )
        {
            SendDebugMessage("BurstFire: Invalid Ammo - " + IntToString(iAmmoCount));
            return;
        }
        object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(OBJECT_SELF));
        string sClip = "cb_sh_machgun";
        if (GetLocalString(GetLastWeaponUsed(oShooter), "Craft")=="Electronic")
            sClip = "cb_sh_pulserifle";
        DelayCommand(0.5, AssignCommand(oSound, PlaySound(sClip)));
        DelayCommand(2.0, DestroyObject(oSound));
        if( (iAmmoCount-4)<1)
            DestroyObject(oAmmo);
        else
            SetItemStackSize( oAmmo, iAmmoCount-4 );
        effect eDamage;
        // General damage handler; add 2 dice of damage.
        if(iGunType == BASE_ITEM_HEAVYARM_D10)
            eDamage = EffectDamage( d10(2), DAMAGE_TYPE_PIERCING,DAMAGE_POWER_NORMAL);
        else if(iGunType == BASE_ITEM_HEAVYARM_D12 )
            eDamage = EffectDamage( d12(2), DAMAGE_TYPE_PIERCING,DAMAGE_POWER_NORMAL);
        else if(iGunType == BASE_ITEM_SMALLARM_D6 || iGunType == BASE_ITEM_SLING)
                     eDamage = EffectDamage( d6(2), DAMAGE_TYPE_PIERCING,DAMAGE_POWER_NORMAL);
        else if(iGunType == BASE_ITEM_SMALLARM_D8)
            eDamage = EffectDamage( d8(2), DAMAGE_TYPE_PIERCING,DAMAGE_POWER_NORMAL);
        else
            eDamage = EffectDamage( 0, DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oTarget);
        // Make cool spark effect for gunshots.
        object oGun = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
        if (GetLocalInt(oGun, "nMdrnBeam")==1 )
        {
            if (GetLocalInt(OBJECT_SELF, "nMdrnHitBeam")==0)
            {
                SetLocalInt(OBJECT_SELF, "nMdrnHitBeam", 1);
                DelayCommand(2.0, SetLocalInt(OBJECT_SELF, "nMdrnHitBeam", 0));
                location lTarg = GetLocation(oTarget);
                vector vTarg = GetPositionFromLocation(lTarg);
                location lBeam = Location(GetArea(oTarget), Vector(vTarg.x, vTarg.y, vTarg.z+1.0), 0.0);
                object oBeam = oTarget;
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE_W_SILENT, OBJECT_SELF, BODY_NODE_HAND, FALSE), oBeam, 0.5);
            }
        }
    }
    //Deal with dual wielding pistols
    if (GetLocalInt(oTarget, "nMdrnHitTarget2")==0 && GetLocalInt(OBJECT_SELF, "nDualMode")==1)
    {
        SetLocalInt(OBJECT_SELF, "nMdrnHitTarget2", 1);
        int nShots =1;
        DelayCommand(2.0, SetLocalInt(oTarget, "nMdrnHitTarget2", 0));
        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
        int iGunType = GetBaseItemType(oWeapon);
        int iAmmoType = GetAmmoType(iGunType);
        object oAmmo = GetItemInSlot(GetAmmoSlot(iAmmoType), OBJECT_SELF);
        int iAmmoCount = GetItemStackSize(oAmmo);
        int nBurst = 0;
        if (GetLocalInt(OBJECT_SELF, "nBurstMode")==1 &&  iAmmoCount > 3 )
        {
            nShots = 4;
            nBurst = 1;
        }
        if( (iAmmoCount-nShots)<1)
            DestroyObject(oAmmo);
        else
            SetItemStackSize( oAmmo, iAmmoCount-nShots );
        int nBase = GetBaseAttackBonus(OBJECT_SELF);
        int nRollBase = d20();
        int nRoll = nRollBase+nBase-4*GetLocalInt(OBJECT_SELF, "nBurstMode")+GetAbilityModifier(ABILITY_DEXTERITY, OBJECT_SELF)+2*GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, OBJECT_SELF)+4*GetHasFeat(FEAT_AMBIDEXTERITY, OBJECT_SELF)-8;
        int nAC = GetAC(oTarget)-1;
        int nDam;
        if (iGunType == 6)
            nDam = d10(2+2*nBurst);
        if (iGunType == 8 || iGunType == 7)
            nDam = d8(2+2*nBurst);
        if (iGunType ==  11 || iGunType == BASE_ITEM_SLING)
            nDam = d6(2+2*nBurst);
        if (nRoll > nAC)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam, DAMAGE_TYPE_BALLISTIC), oTarget);
            FloatingTextStringOnCreature(GetName(OBJECT_SELF)+" rolls "+IntToString(nRollBase)+"+"+IntToString(nRoll-nRollBase)+" and hits with an off-hand shot.", OBJECT_SELF, FALSE);
        }
        else
            FloatingTextStringOnCreature(GetName(OBJECT_SELF)+" rolls "+IntToString(nRollBase)+"+"+IntToString(nRoll-nRollBase)+" and misses with an off-hand shot.", OBJECT_SELF, FALSE);
    }

    if (GetObjectType(oTarget) != OBJECT_TYPE_PLACEABLE)
    {
        // Check for riders on untrained horses - non-placeables only
        if (GetLocalInt(oTarget, "nMdrnRidingBad")==1)
        {
            int nSkill = GetSkillRank(71, oTarget);
            int nDC = 20;
            int nRoll = d20();
            SendMessageToPC(oTarget, "Ride check: "+IntToString(nRoll+nSkill)+" vs. DC: "+IntToString(nDC));
            if (nSkill+nRoll+5 < nDC)
                 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectFrightened(), oTarget, d4()*6.0);
            else if (nSkill+nRoll < nDC)
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oTarget, 6.0);
        }

        // Now for massive damage - non-placeables only
        SetLocalObject(OBJECT_SELF, "oMdrnConTarg", oTarget);  // Let the target know whom to report to.
        ExecuteScript("_mdrn_exe_condam", oTarget);
        ExecuteScript("_mdrn_exe_con", OBJECT_SELF);
    }
}
