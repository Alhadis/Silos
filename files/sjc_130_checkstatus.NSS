#include "acr_db_persist_i"

void main()
{
int iHasShamanQuest = ACR_GetPersistentInt(GetEnteringObject(), "SJC_SHAMANINITDONE");
int iHasDoneInitiation = ACR_GetPersistentInt(GetEnteringObject(), "SJC_DONEINITIATION");
location lSpawnPoint = GetLocation(GetObjectByTag("130_spawntamlin"));
if (iHasShamanQuest == 1 && iHasDoneInitiation == 0)
	{
	CreateObject(OBJECT_TYPE_CREATURE, "sjc_tamlin", lSpawnPoint);
	} 
}