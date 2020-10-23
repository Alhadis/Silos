//::///////////////////////////////////////////////
//:: underwater_enter
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created : henesua (2016 aug 2)
//:://////////////////////////////////////////////

#include "_inc_terrain"

void main()
{

    object creature;
    object zone_source;
    object zone_tracker;

    switch(GetObjectType(OBJECT_SELF))
    {
        case OBJECT_TYPE_CREATURE:
            creature    = OBJECT_SELF;
            zone_source = GetLocalObject(creature, "ENTERING_AREA");
            zone_tracker= GetZoneTracker(zone_source);
        break;
        case OBJECT_TYPE_TRIGGER:
            creature    = GetEnteringObject();
            zone_source = OBJECT_SELF;
            zone_tracker= OBJECT_SELF;
            SetLocalObject(zone_source,"ZONE_TRACKER",zone_tracker);
        break;
        case OBJECT_TYPE_AREA_OF_EFFECT:
            creature    = GetEnteringObject();
            zone_source = OBJECT_SELF;
            zone_tracker= OBJECT_SELF;
            SetLocalObject(zone_source,"ZONE_TRACKER",zone_tracker);
        break;
        default:
            creature    = GetEnteringObject();
            zone_source = OBJECT_SELF;
            zone_tracker= OBJECT_SELF;
            SetLocalObject(zone_source,"ZONE_TRACKER",zone_tracker);
        break;
    }

    if(zone_tracker!=zone_source)
    {
        SetLocalInt(zone_tracker,"UNDERWATER_BREATHABLE",GetLocalInt(zone_source,"UNDERWATER_BREATHABLE") );
    }

    if(GetIsDM(creature))
        return;

    DelayCommand(0.1, EnterUnderwaterZone(creature, zone_source, zone_tracker) );
}

