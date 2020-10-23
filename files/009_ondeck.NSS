#include "acr_skills_i"

int GetWeatherBalance()
{
	int weather = GetWeather(GetArea(OBJECT_SELF), WEATHER_TYPE_RAIN);
	switch(weather)
	{
		case WEATHER_POWER_HEAVY:
		case WEATHER_POWER_STORMY:
			return 15;
		case WEATHER_POWER_MEDIUM:
			return 10;
		case WEATHER_POWER_LIGHT:
			return 5;
		default:
			return 1;
	}
	return 1;
}

void DeckHeartbeat(object oPC, vector oldLoc)
{
	object oCritter = GetFirstInPersistentObject(OBJECT_SELF);
	while(GetIsObjectValid(oCritter))
	{
		if(oCritter == oPC)
		{
			vector newLoc = GetPosition(oPC);
			float diffX = (oldLoc.x - newLoc.x);
			float diffY = (oldLoc.y - newLoc.y);
			if((diffX * diffX)+(diffY * diffY) > 12.0f)
			{
				if(!ACR_SkillCheck(SKILL_BALANCE, oPC, GetWeatherBalance(), TRUE))
				{
					ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ExtraordinaryEffect(EffectKnockdown()), oPC, 6.0f);
				}
			}
			DelayCommand(6.0f, DeckHeartbeat(oPC, newLoc));
		}
		oCritter = GetNextInPersistentObject(OBJECT_SELF);
	}
}

void main()
{
	DeckHeartbeat(GetEnteringObject(), GetPosition(GetEnteringObject()));
}