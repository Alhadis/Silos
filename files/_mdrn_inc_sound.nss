
// Check to see if the special projectile sound scheme is needed,
// And use it if necessary
void CheckForSoundoff(object oAttacker, object oVictim);

// Plays the sound of the firearm firing
void PlayShotSound(string sShotSound);

// Plays the miss sound. The miss sound is cancelled by PlayHitSound()
void PlayMissSound(string sMissSound);

// Plays the sound of hitting the target. Cancels PlaySounds() from further action.
void PlayHitSound(object oAttacker, object oVictim, object oWeapon);

// Checks to see if oCreature has an effect of type iEffectType
int CheckForEffect(object oCreature, int iEffectType);

// Returns the sound of a fired shot, if any exists
string GetShotSound(object oWeapon);

// Searches the special projectile sound scheme for appropriate sound,
// and then plays it.
string GetProjectileHitSound(object oAttacker, object oVictim, object oWeapon);

// Searches the special projectile sound scheme for appropriate sound,
// and then plays it.
string GetProjectileDeadSound(object oAttacker, object oVictim, object oWeapon);

// Searches the special projectile sound scheme for appropriate sound,
// and then plays it.
string GetProjectileMissSound(object oAttacker, object oVictim, object oWeapon);

// Searches the special projectile sound scheme for appropriate sound,
// and then plays it.
string GetArmorSound(string sWeaponType, object oVictim, int iDead = 0);

void CheckForSoundoff(object oAttacker, object oVictim)
{
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oAttacker);
    int iType = GetBaseItemType(oWeapon);
    if ( iType != BASE_ITEM_HEAVYCROSSBOW
         && iType != BASE_ITEM_LIGHTCROSSBOW
         && iType != BASE_ITEM_LONGBOW
         && iType != BASE_ITEM_SHORTBOW)
        return;
    string sSound;
    if (GetLastDamager(oVictim) != oAttacker)
        sSound = GetProjectileMissSound(oAttacker,oVictim,oWeapon);
    else if (GetCurrentHitPoints(oVictim) < 1)
        sSound = GetProjectileDeadSound(oAttacker,oVictim,oWeapon);
    else
        sSound = GetProjectileHitSound(oAttacker,oVictim,oWeapon);
    object oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oAttacker),FALSE,"GunShot");
    DelayCommand(0.3, AssignCommand(oSound, PlaySound(sSound)));
    DelayCommand(2.1, DestroyObject(oSound));
    return;
}

void PlayShotSound(string sShotSound)
{
    PlaySound(sShotSound);
}

void PlayMissSound(string sMissSound)
{
    DelayCommand(1.2,PlaySound(sMissSound));
    DelayCommand(2.5,DestroyObject(OBJECT_SELF));
}

void PlayHitSound(object oAttacker, object oVictim, object oWeapon)
{
    string sSound = GetProjectileHitSound(oAttacker,oVictim,oWeapon);
    object oSound = GetFirstObjectInShape(SHAPE_SPHERE,3.0,GetLocation(oVictim),FALSE, OBJECT_TYPE_PLACEABLE);
    while (GetIsObjectValid(oSound))
    {
        if (GetTag(oSound) == "GunShot")
        {
            // Destroy all existing 'sound-off' objects, in the area
            DestroyObject(oSound);
        }
        oSound = GetNextObjectInShape(SHAPE_SPHERE,3.0,GetLocation(oVictim),FALSE, OBJECT_TYPE_PLACEABLE);
    }
    oSound = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oVictim),FALSE,"GunShot");
    DelayCommand(0.05, AssignCommand(oSound, PlaySound(sSound)));
    DelayCommand(1.0, DestroyObject(oSound));
}

int CheckForEffect(object oCreature, int iEffectType)
{
    effect eEffect = GetFirstEffect(oCreature);
    int iFoundIt = FALSE;
    while ( GetIsEffectValid(eEffect))
    {
        if (GetEffectType(eEffect) == iEffectType)
        {
            iFoundIt = TRUE;
            break;
        }
        eEffect = GetNextEffect(oCreature);
    }
    return iFoundIt;
}

string GetShotSound(object oWeapon)
{
    string sValue = GetLocalString(oWeapon,"AmmoType");
    if (GetLocalInt(oWeapon, "nMdrnLaser")==1)
    {
        return "cb_sh_laser_hvy";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPlasma")==1)
    {
        return "cb_sh_plascannon";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPulse")==1)
    {
        return "cb_sh_pulserifle";
    }
    else if (sValue == "arrow")
    {
        return "cb_sh_bow1";
    }
    else if (sValue == "bolt")
    {
        return "cb_sh_xbow1";
    }
    else if ( GetBaseItemType(oWeapon) == BASE_ITEM_HEAVYCROSSBOW)
    {
        return "cb_sh_alongarm";
    }
    else if (GetLocalInt(oWeapon, "nMdrnChainsaw")==1)
    {
        return "dssawful";
    }
    else
    {
        return "cb_sh_ahandgun";
    }
}

string GetProjectileHitSound(object oAttacker, object oVictim, object oWeapon)
{
    string sValue = GetLocalString(oWeapon,"AmmoType");
    if (GetLocalInt(oWeapon, "nMdrnLaser")==1)
    {
        return "";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPlasma")==1)
    {
        return "";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPulse")==1)
    {
        return "";
    }
    else if (sValue == "arrow")
    {
        return GetArmorSound("bow",oVictim,0);
    }
    else if (sValue == "bolt")
    {
        return GetArmorSound("xbow",oVictim,0);
    }
    else if (GetLocalInt(oWeapon, "nMdrnChainsaw")==1)
    {
        return "dssawhit";
    }
    else
    {
        return GetArmorSound("gun",oVictim,0);
    }

}

string GetProjectileDeadSound(object oAttacker, object oVictim, object oWeapon)
{
    string sValue = GetLocalString(oWeapon,"AmmoType");
    if (GetLocalInt(oWeapon, "nMdrnLaser")==1)
    {
        return "";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPlasma")==1)
    {
        return "";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPulse")==1)
    {
        return "";
    }
    else if (sValue == "arrow")
    {
        return GetArmorSound("bow",oVictim,1);
    }
    else if (sValue == "bolt")
    {
        return GetArmorSound("xbow",oVictim,1);
    }
    else if (GetLocalInt(oWeapon, "nMdrnChainsaw")==1)
    {
        return "dssawhit";
    }
    else
    {
        return GetArmorSound("gun",oVictim,1);
    }
}

string GetProjectileMissSound(object oAttacker, object oVictim, object oWeapon)
{
    string sValue = GetLocalString(oWeapon,"AmmoType");
    if (GetLocalInt(oWeapon, "nMdrnLaser")==1)
    {
        return "cb_sh_laser_hvy";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPlasma")==1)
    {
        return "cb_sh_plascannon";
    }
    else if (GetLocalInt(oWeapon, "nMdrnPulse")==1)
    {
        return "cb_sh_pulserifle";
    }
    else if (sValue == "arrow")
    {
        if (d10()>4)
            return "cb_sh_bow1";
        else
            return "cb_sh_bow2";
    }
    else if (sValue == "bolt")
    {
        if (d10()>4)
            return "cb_sh_xbow1";
        else
            return "cb_sh_xbow2";
    }
     else if (GetLocalInt(oWeapon, "nMdrnChainsaw")==1)
    {
        return "dssawful";
    }
    else
    {
        if ( d10() > 4)
            return "cb_sh_multmiss";
        else
            return "cb_sh_multmiss1";
    }
}

string GetArmorSound(string sWeaponType, object oVictim, int iDead = 0)
{
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST,oVictim);
    int iAC = GetItemACValue(oArmor);

    if ( GetLocalInt(oVictim,"X2_L_IS_INCORPOREAL") == TRUE
              || CheckForEffect(oVictim,EFFECT_TYPE_ETHEREAL) == TRUE)
        return "cb_ht_ethereal1";
    else if ( sWeaponType == "bow"
              || sWeaponType == "xbow")
    {
        if (iAC < 2)
        {
            if (iDead == 0)
                return "cb_ht_chitin1";
            else
                return "cb_ht_chitin2";
        }
        else if (iAC == 4)
        {
            if (iDead == 0)
                return "cb_ht_scale1";
            else
                return "cb_ht_scale2";
        }
        else
        {
            return "cb_ht_arrow1";
        }
    }
    else
    {
        if ( GetAppearanceType(oVictim) == APPEARANCE_TYPE_GOLEM_CLAY
             || GetAppearanceType(oVictim) == APPEARANCE_TYPE_GOLEM_STONE)
        {
            if (iDead == 0)
                return "cb_sh_multmiss";
            else
                return "cb_sh_multmiss1";
        }
        else if ( GetAppearanceType(oVictim) == APPEARANCE_TYPE_GOLEM_IRON
             || GetAppearanceType(oVictim) == APPEARANCE_TYPE_GOLEM_ADAMANTIUM
             || GetAppearanceType(oVictim) == APPEARANCE_TYPE_GOLEM_MITHRAL)
        {
            if (iDead == 0)
                return "cb_sh_metal";
            else
                return "cb_sh_metal1";
        }
        else if (iAC < 2)
        {
            if (iDead == 0)
                return "cb_sh_alongarm";
            else
                return "cb_sh_alongarm1";
        }
        else if (iAC < 4)
        {
            if (iDead == 0)
                return "cb_ht_leather";
            else
                return "cb_ht_leather1";
        }
        else
        {
            if (iDead == 0)
                return "cb_ht_metal";
            else
                return "cb_ht_metal1";
        }
    }
}

