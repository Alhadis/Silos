#include "_mdrn_rof"
#include "_mdrn_char_core"
#include "x0_i0_position"

void main()
{

    object oTarget = GetSpellTargetObject();
    location oLoc = GetSpellTargetLocation();
    object oArea = GetAreaFromLocation(oLoc);
     SendDebugMessage("AutoFire in " + GetName(oArea) + ", by: " + GetName(OBJECT_SELF) + " On: " + GetName(oTarget) );
    if (oTarget==OBJECT_SELF)
    {
        SendDebugMessage("FEAT-AutoFire: Invalid Target");
        return;
    }

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
    if (!GetIsObjectValid(oWeapon) || GetGunRate(oWeapon) != IP_CONST_ROF_AUTOMATIC )
    {
        SendMessageToPC(OBJECT_SELF, "Invalid weapon");

        SendDebugMessage("AutoFire: Invalid Weapon");
        return;
    }

    int iGunType = GetBaseItemType(oWeapon);
    int iAmmoType = GetAmmoType(iGunType);
    int nDual = GetLocalInt(OBJECT_SELF, "nDualMode");
    object oAmmo = GetItemInSlot(GetAmmoSlot(iAmmoType), OBJECT_SELF);
    int iAmmoCount = GetItemStackSize(oAmmo);
    if ( iAmmoCount < 10+10*nDual ){
        SendMessageToPC(OBJECT_SELF, "You need 10 rounds per gun loaded for this.");
        SendDebugMessage("AutoFire: Invalid Ammo - " + IntToString(iAmmoCount));
        return;
    }

    if( (iAmmoCount-(10+10*nDual))<1)
        DestroyObject(oAmmo);
    else
        SetItemStackSize( oAmmo, iAmmoCount-(10+10*nDual) );
/* Silliness removed by Forrestwolf
    effect eBurstAttackDecrease = SupernaturalEffect(EffectAttackDecrease(5,ATTACK_BONUS_ONHAND));
    if(!GetHasFeat(FEAT_ADVANCED_FIREARMS_PROFICIENCY, OBJECT_SELF)){
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBurstAttackDecrease, OBJECT_SELF, 2.0);
    }
*/

//Should do some sort of attack success check here
// Forrestwolf - can do (see below).
    float fDist = FeetToMeters(2.5);
    effect eMiss = EffectVisualEffect(VFX_COM_BLOOD_SPARK_SMALL,TRUE);
    effect eMiss2 = EffectVisualEffect(VFX_COM_BLOOD_SPARK_SMALL);
    location lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPositionFromLocation(oLoc), FeetToMeters(2.5), GetRightDirection(GetFacing(OBJECT_SELF))), GetFacing(OBJECT_SELF));
    int nIdx = 0;
     string sClip = "cb_sh_machgun";
    if (GetLocalString(oWeapon, "Craft")=="Electronic")
        sClip = "cb_sh_pulserifle";
    object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(OBJECT_SELF));
        DelayCommand(0.5, AssignCommand(oSound, PlaySound(sClip)));
        DelayCommand(2.0, DestroyObject(oSound));
     object oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lNew);
    while (nIdx < 5)
    {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
          nIdx ++;
    }

    object oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    effect eHit = EffectVisualEffect(VFX_COM_BLOOD_SPARK_MEDIUM);

    int nAC = 14;

    int nRoll = d20()+GetBaseAttackBonus(OBJECT_SELF) -4*nDual +nDual*2*GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, OBJECT_SELF) +4*GetHasFeat(FEAT_ADVANCED_FIREARMS_PROFICIENCY, OBJECT_SELF);
        FloatingTextStringOnCreature(GetName(OBJECT_SELF)+" rolls "+IntToString(nRoll)+" vs. AC "+IntToString(nAC), OBJECT_SELF);

        if (nRoll < nAC)
        {
            // Missed the area

            return;

        }

    while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe")==0){
        SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 1);
        DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 0));


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

        oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    }
    lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPositionFromLocation(oLoc), FeetToMeters(5.0), GetRightDirection(GetFacing(OBJECT_SELF))), GetFacing(OBJECT_SELF));
    nIdx = 0;
    oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lNew);
    while (nIdx < 5)
    {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
          nIdx ++;
    }



    oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe")==0){
        SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 1);
        DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 0));



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

        oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    }
    lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPositionFromLocation(oLoc), FeetToMeters(2.5), GetLeftDirection(GetFacing(OBJECT_SELF))), GetFacing(OBJECT_SELF));
     nIdx = 0;
     oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lNew);
    while (nIdx < 5)
    {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
          nIdx ++;
    }

     oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe")==0){
        SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 1);
        DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 0));



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

        oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    }
    lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPositionFromLocation(oLoc), FeetToMeters(5.0), GetLeftDirection(GetFacing(OBJECT_SELF))), GetFacing(OBJECT_SELF));
     nIdx = 0;
      oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lNew);
    while (nIdx < 5)
    {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
          nIdx ++;
    }

     oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe")==0){
        SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 1);
        DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe", 0));



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

        oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
    }

    if (nDual == 1)
        {
        nRoll = d20()+GetBaseAttackBonus(OBJECT_SELF) -8*nDual +4*GetHasFeat(FEAT_AMBIDEXTERITY, OBJECT_SELF)+nDual*2*GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, OBJECT_SELF) +4*GetHasFeat(FEAT_ADVANCED_FIREARMS_PROFICIENCY, OBJECT_SELF);
                FloatingTextStringOnCreature(GetName(OBJECT_SELF)+" fires off-hand, and rolls "+IntToString(nRoll)+" vs. AC "+IntToString(nAC), OBJECT_SELF);

            if (nRoll < nAC)
            {
                // Missed the area

                return;

            }

        while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe")==0){
            SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 1);
            DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 0));


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

            oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
        }
        lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPositionFromLocation(oLoc), FeetToMeters(5.0), GetRightDirection(GetFacing(OBJECT_SELF))), GetFacing(OBJECT_SELF));
        nIdx = 0;
        oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lNew);
        while (nIdx < 5)
        {
              ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
              nIdx ++;
        }



        oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
        while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe2")==0){
            SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 1);
            DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 0));



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

            oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
        }
        lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPositionFromLocation(oLoc), FeetToMeters(2.5), GetLeftDirection(GetFacing(OBJECT_SELF))), GetFacing(OBJECT_SELF));
         nIdx = 0;
         oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lNew);
        while (nIdx < 5)
        {
              ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
              nIdx ++;
        }

         oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
        while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe2")==0){
            SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 1);
            DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 0));



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

            oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
        }
        lNew = Location(GetArea(OBJECT_SELF), GetChangedPosition(GetPositionFromLocation(oLoc), FeetToMeters(5.0), GetLeftDirection(GetFacing(OBJECT_SELF))), GetFacing(OBJECT_SELF));
         nIdx = 0;
          oShot = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lNew);
        while (nIdx < 5)
        {
              ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMiss2, GetRandomLocation(oArea, oShot, fDist));
              nIdx ++;
        }

         oLoopTarget = GetFirstObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
        while(GetIsObjectValid(oLoopTarget) && GetLocalInt(oLoopTarget, "nMdrnHitStrafe2")==0){
            SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 1);
            DelayCommand(1.0, SetLocalInt(oLoopTarget, "nMdrnHitStrafe2", 0));



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

            oLoopTarget = GetNextObjectInShape(SHAPE_CUBE, FeetToMeters(2.5), lNew, TRUE);
        }
   }
}

