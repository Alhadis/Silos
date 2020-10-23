
/**
 * Force applies an effect.
 *
 * This function is useful when applying an effect from an item property call back.
 * This will allow your effects to bypass some effect application checks, such as if
 * the target object is dead.
 *
 */
void ForceApplyEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration=0.0f);

/**
 * Creates a custom effect. This requires nwnx_structs.
 *
 * +truetype+ is a number meant to reflect further types beyond
 * EFFECT_TRUETYPE_DEFENSIVESTANCE (truetype > 95).
 *
 * To actually define what your custom effect does, use nwnx_structs
 * as usual to set it's integers. It is recommended to write your own
 * EffectX() constructors.
 *
 * Your truetype effect IDs are mapped 1:1 to script IDs, so you can check for
 * them with the usual suspects (GetHasEffect etc).
 *
 * Please see README.md for detailed usage instructions.
 */
effect EffectCustom(int truetype);

/**
 * Sets the native effect of EFFECT_TRUETYPE_x to trigger callbacks.
 *
 * This can be used to augment existing effect types.
 *
 * Best called in OnModuleLoad or similar.
 */
void SetNativeEffectCallsUs(int truetype);

/**
 * Returns the custom effect's truetype.
 *
 * This will only work inside nwnx_effect callback scripts. Returns -1 on error.
 */
int GetCustomEffectTrueType();

/**
 * Returns the custom effect's tickrate (>= 0).
 *
 * This will only work inside nwnx_effect callback scripts. Returns -1 on error.
 */
int GetCustomEffectTickRate();

/**
 * Sets the custom effect's tickrate (>= 0).
 *
 * This will only work inside nwnx_effect callback scripts.
 */
void SetCustomEffectTickRate(int value);

/**
 * Gets any of the custom parameters given to EffectCustom (arg0..19).
 *
 * This will only work inside nwnx_effect callback scripts.
 *
 * Returns -1 on error (unless your value is -1 ..).
 */
int GetCustomEffectInteger(int index);

/**
 * Sets any of the custom parameters given to EffectCustom (arg0..19).
 *
 * This will only work inside nwnx_effect callback scripts.
 */
void SetCustomEffectInteger(int index, int value);

/**
 * Stops the current apply from happening.
 *
 * This will only work inside the nwnx_effect apply callback.
 */
void SetCustomEffectFailed();

/**
 * Gets the effect creator (whatever was OBJECT_SELF when you called EffectCustom()).
 *
 * This will only work inside nwnx_effect callback scripts.
 */
object GetCustomEffectCreator();

/**
 * Custom Item Properties and You.
 *
 * The normal way the NWN engine applies item properties is after the item property
 * is created on the item it fires an OnItemPropertyApplied event.  Nearly all of these
 * create effects which are then applied to the equipper of the item as DURATION_TYPE_EQUIPPED
 * and where the creator of the effect is the item.  This is what you should do too.
 */


/**
 * Gets the item the property is being applied to.
 *
 * This will only work inside nwnx_effect callback scripts.
 */
object GetCustomItemPropertyItem();

/**
 * Gets the item property type.
 *
 * This will only work inside nwnx_effect callback scripts.
 */
int GetCustomItemPropertyType();

/**
 * Gets the item property subtype.
 *
 * This will only work inside nwnx_effect callback scripts.
 */
int GetCustomItemPropertySubType();

/**
 * Gets the item property param table as defined in itempropdef.2da
 *
 * This will only work inside nwnx_effect callback scripts.
 */
int GetCustomItemPropertyParam1();

/**
 * Gets the item property param table value.
 *
 * This will only work inside nwnx_effect callback scripts.
 */
int GetCustomItemPropertyParam1Value();

/**
 * Gets the item property cost table as defined in itempropdef.2da
 *
 * This will only work inside nwnx_effect callback scripts.
 */
int GetCustomItemPropertyCostTable();

/**
 * Gets the item property cost table value.
 *
 * This will only work inside nwnx_effect callback scripts.
 */
int GetCustomItemPropertyCostTableValue();

/**
 * Gets the item property duration type.
 *
 * This is added for completenes.  If you're wondering "What would
 * I ever do with this?", the answer is probably nothing.
 *
 * This will only work inside nwnx_effect callback scripts.
 */
int GetCustomItemPropertyDurationType();

/**
 * Bypass the native OnItemPropertyApplied handler.
 *
 * This is useful only in cases that you'd like to override any of the default item properties.
 */
void BypassNativeItemProperty();

// Impl

void ForceApplyEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration=0.0f) {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!FORCEAPPLY", "1");
    ApplyEffectToObject(nDurationType, eEffect, oTarget, fDuration=0.0f);
    // Hook handles clearing the force application flag.
}

void LogEffects(object obj) {
    SetLocalString(obj, "NWNX!EFFECTS!LOG", "1");
}

int GetCustomEffectTrueType()
{
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETTRUETYPE", " ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETTRUETYPE"));
}

int GetCustomEffectTickRate()
{
    return GetCustomEffectInteger(20);
}

void SetNativeEffectCallsUs(int truetype)
{
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!SETEFFECTNATIVEHANDLED", IntToString(truetype) + " ");
}

void SetCustomEffectTickRate(int value)
{
    SetCustomEffectInteger(20, value);
}

int GetCustomEffectInteger(int index)
{
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETINT", IntToString(index) + " ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETINT"));
}

void SetCustomEffectInteger(int index, int value)
{
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!SETINT",
                   IntToString(index) + "~" + IntToString(value));
}

void SetCustomEffectFailed()
{
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!SETFAILED", "1");
}

object GetCustomEffectCreator()
{
    return GetLocalObject(OBJECT_SELF, "NWNX!EFFECTS!GETCREATOR");
}

effect EffectCustom(int truetype)
{
    effect ret;

    if (truetype >= 96) {
        // We're using effectModifyAttacks as a template because it only uses
        // one int param.
        ret = EffectModifyAttacks(0);
        // We immediately set a custom truetype, so it never registers as such
        // with nwserver. You're free to use all local CGameEffect
        // ints/floats/object/strings for your own nefarious purposes.
        SetEffectTrueType(ret, truetype);
    }

    return ret;
}

int GetCustomItemPropertyType() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPTYPE", "         ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPTYPE"));
}

int GetCustomItemPropertySubType() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPSUBTYPE", "         ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPSUBTYPE"));
}

int GetCustomItemPropertyParam1() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPPARAMTABLE", "         ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPPARAMTABLE"));
}

int GetCustomItemPropertyParam1Value() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPPARAMVALUE", "         ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPPARAMVALUE"));
}

int GetCustomItemPropertyCostTable() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPCOSTTABLE", "         ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPCOSTTABLE"));
}

int GetCustomItemPropertyCostTableValue() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPCOSTVALUE", "         ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPCOSTVALUE"));
}

int GetCustomItemPropertyDurationType() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPDURTYPE", "         ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EFFECTS!GETIPDURTYPE"));
}

object GetCustomItemPropertyItem() {
    return GetLocalObject(OBJECT_SELF, "NWNX!EFFECTS!GETIPITEM");
}

void BypassNativeItemProperty() {
    SetLocalString(OBJECT_SELF, "NWNX!EFFECTS!IPBYPASS", "1");
}
