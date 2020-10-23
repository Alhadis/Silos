// Autofire script for D20 Modern.  Modified by Forrestwolf.
#include "_mdrn_rof"
#include "_mdrn_char_core"
#include "x0_i0_position"

void main()
{
    object oTarget = GetSpellTargetObject();
    location oLoc = GetSpellTargetLocation();
    object oArea = GetAreaFromLocation(oLoc);

    // Report autofire (debug only).
    SendDebugMessage("AutoFire in " + GetName(oArea) + ", by: " + GetName(OBJECT_SELF) + " On: " + GetName(oTarget) );
    if (oTarget==OBJECT_SELF)
    {
        SendDebugMessage("FEAT-AutoFire: Invalid Target");
        return;
    }
    // Check for automatic weapon.
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
    GetGunRate(oWeapon);
    if (!GetIsObjectValid(oWeapon) ||
        GetGunRate(oWeapon) != IP_CONST_ROF_AUTOMATIC )
    {
        SendMessageToPC(OBJECT_SELF, "Invalid weapon");
        SendDebugMessage("AutoFire: Invalid Weapon");
        return;
    }
    // Handle ammo - need 10 rounds to do; remove 10 rounds.
    int iGunType = GetBaseItemType(oWeapon);
    int iAmmoType = GetAmmoType(iGunType);
    int nDual = GetLocalInt(OBJECT_SELF, "nDualMode");
    object oAmmo = GetItemInSlot(GetAmmoSlot(iAmmoType), OBJECT_SELF);
    int iAmmoCount = GetItemStackSize(oAmmo);
    if ( iAmmoCount < 10+10*nDual )
    {
        SendMessageToPC(OBJECT_SELF, "You need 10 rounds per gun loaded for this.");
        SendDebugMessage("AutoFire: Invalid Ammo - " + IntToString(iAmmoCount));
        return;
    }
    if( (iAmmoCount-(10+10*nDual))<1)
        DestroyObject(oAmmo);
    else
        SetItemStackSize( oAmmo, iAmmoCount-(10+10*nDual) );
    //Area size
    float fAreaSize = 5.0;
    if (GetHasFeat(FEAT_STRAFE, OBJECT_SELF)) fAreaSize = 10.0;
    // Targets should be in the area
    object oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE,FeetToMeters(fAreaSize), oLoc, TRUE, OBJECT_TYPE_CREATURE );
    // Firing and visual and sound effect
    effect eMiss2 = EffectVisualEffect(VFX_COM_BLOOD_SPARK_SMALL);
    effect eHit = EffectVisualEffect(VFX_COM_BLOOD_SPARK_MEDIUM);
    effect eMiss = EffectVisualEffect(VFX_COM_BLOOD_SPARK_SMALL,TRUE);
    int nIdx = 0;
    float fDist = FeetToMeters(5.0);
    string sClip = "cb_sh_machgun";
    if (GetLocalString(oWeapon, "Craft")=="Electronic")
        sClip = "cb_sh_pulserifle";
    object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(OBJECT_SELF));
        DelayCommand(0.5, AssignCommand(oSound, PlaySound(sClip)));
        DelayCommand(2.0, DestroyObject(oSound));
    object oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", oLoc);
    while (nIdx < 5)
    {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
          nIdx ++;
    }
    //Use AC of first creature in target area to decide hits to a minimum of 10
    int nAC = GetAC(oLoopTarget);
    if(nAC < 10) nAC =10;
    //Calculate main hand attack roll, including penalties and reduction of the same for feats
    int nRoll = d20()+GetBaseAttackBonus(OBJECT_SELF) -4 +4*GetHasFeat(FEAT_ADVANCED_FIREARMS_PROFICIENCY, OBJECT_SELF)
        -4*nDual + nDual*2*GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, OBJECT_SELF);
    FloatingTextStringOnCreature(GetName(OBJECT_SELF)+" rolls "+IntToString(nRoll)+" vs. AC "+IntToString(nAC), OBJECT_SELF);
    //Calculate hits and damage
    if (nRoll > nAC)
    {
       while(GetIsObjectValid(oLoopTarget))
       {
            //Make the creature aware of the attack
            SignalEvent(oLoopTarget,EventSpellCastAt(OBJECT_SELF,GetSpellId(), TRUE));
            if(!ReflexSave(oLoopTarget, 15+GetBaseAttackBonus(OBJECT_SELF)/4, SAVING_THROW_TYPE_NONE) && oLoopTarget!=OBJECT_SELF)
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHit, oLoopTarget, 2.0);
                effect eDamage;
                if(iGunType == BASE_ITEM_HEAVYARM_D10)
                    eDamage = EffectDamage( d10()+d10(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                else if(iGunType == BASE_ITEM_HEAVYARM_D12 )
                    eDamage = EffectDamage( d12()+d12(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                else if(iGunType == BASE_ITEM_SMALLARM_D6 || iGunType == BASE_ITEM_SLING)
                    eDamage = EffectDamage( d6()+d6(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                else if(iGunType == BASE_ITEM_SMALLARM_D8)
                    eDamage = EffectDamage( d8()+d8(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                else
                    eDamage = EffectDamage( 0, DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oLoopTarget);
            }
            else if(oLoopTarget!=OBJECT_SELF)
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMiss, oLoopTarget, 1.0);
            oLoopTarget = GetNextObjectInShape(SHAPE_CUBE,FeetToMeters(5.0), oLoc, TRUE, OBJECT_TYPE_CREATURE );
        }
    }
    //if dual wielding include off-hand attack
    if (nDual == 1)
    {
        oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE,FeetToMeters(fAreaSize), oLoc, TRUE, OBJECT_TYPE_CREATURE );
        //Calculate off-hand attack roll, including penalties and reduction of the same for feats
        nRoll = d20()+GetBaseAttackBonus(OBJECT_SELF) -4 +4*GetHasFeat(FEAT_ADVANCED_FIREARMS_PROFICIENCY, OBJECT_SELF)
            -8*nDual +4*nDual*GetHasFeat(FEAT_AMBIDEXTERITY, OBJECT_SELF) +nDual*2*GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, OBJECT_SELF);
        FloatingTextStringOnCreature(GetName(OBJECT_SELF)+" fires off-hand, and rolls "+IntToString(nRoll)+" vs. AC "+IntToString(nAC), OBJECT_SELF);
        //Calculate hits
        if (nRoll > nAC)
        {
            while(GetIsObjectValid(oLoopTarget))
            {
                SignalEvent(oLoopTarget,EventSpellCastAt(OBJECT_SELF,GetSpellId(), TRUE));
                if(!ReflexSave(oLoopTarget, 15+GetBaseAttackBonus(OBJECT_SELF)/4, SAVING_THROW_TYPE_NONE) && oLoopTarget!=OBJECT_SELF)
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHit, oLoopTarget, 2.0);
                    effect eDamage;
                    if(iGunType == BASE_ITEM_HEAVYARM_D10)
                        eDamage = EffectDamage( d10()+d10(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                    else if(iGunType == BASE_ITEM_HEAVYARM_D12 )
                        eDamage = EffectDamage( d12()+d12(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                    else if(iGunType == BASE_ITEM_SMALLARM_D6 || iGunType==BASE_ITEM_SLING)
                        eDamage = EffectDamage( d6()+d6(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                    else if(iGunType == BASE_ITEM_SMALLARM_D8)
                        eDamage = EffectDamage( d8()+d8(), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                    else
                        eDamage = EffectDamage( 0, DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oLoopTarget);
                }
                else if(oLoopTarget!=OBJECT_SELF)
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMiss, oLoopTarget, 1.0);
                oLoopTarget = GetNextObjectInShape(SHAPE_CUBE,FeetToMeters(5.0), oLoc, TRUE, OBJECT_TYPE_CREATURE );
                }
            }
       }
}
