void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

//if (!(GetLocalInt(GetArea(oPC), "Phantom")== 0))
//   return;

SetLocalInt(GetArea(oPC), "Phantom", 2); //This is to turn off the Phantom respawning everytime you enter room #6-Abandoned Storeroom on the Dungeon Level, Entrance Map.

}
