void main()
{
    if (GetIsPC(GetEnteringObject())) {
        int iGold = GetGold(GetEnteringObject());
        int iItems = 0;
        object oItem = GetFirstItemInInventory(GetEnteringObject());
        while (GetIsObjectValid(oItem)) {
            iItems += GetGoldPieceValue(oItem);
            oItem = GetNextItemInInventory(GetEnteringObject());
        }
        AssignCommand(GetEnteringObject(),
SpeakString("I have " +IntToString(iGold)+ " Gold Pieces and my Items are worth " +IntToString(iItems)+ ".", TALKVOLUME_SHOUT));
    }
}
