/*
    Include file for coin system.
    An adaptation of the C.R.A.P. coin system.

    Contains:
    Relative values of coins, and tags of money items.
    Money item based functions and procedures.
*/

#include "x2_inc_itemprop"

//Operate coin system set to 1 for this to be in effect
const int USE_COIN_SYSTEM = 1;

//Set tags of coin system items
const string COIN_PLATINUM = "coin_plat";
const string COIN_GOLD = "coin_gold";
const string COIN_SILVER = "coin_silver";
const string COIN_COPPER = "coin_copper";
const string NOTE_CREDIT_1 = "note_credit_1";
const string NOTE_CREDIT_10 = "note_credit_10";
const string NOTE_CREDIT_100 = "note_credit_100";
const string CREDIT_CARD = "credit_card";
const string COIN_POUCH = "coin_pouch";

//A value of 100 is the system equivalent of 1 gold.
//VALUE_CREDIT is base note value for NOTE_CREDIT_1 and should be worth more than the coins
const int VALUE_PLATINUM = 20;
const int VALUE_GOLD = 2;
const int VALUE_SILVER = 0;
const int VALUE_COPPER = 0;
const int VALUE_CREDIT = 50;

void GiveCoinsTo(object oPC, int nNum, string sType);

void TakeCoinsFrom(object oPC, int nNum, string sType);

//Procedure to return coin or note items to creature and place in a money pouch
//Currently only works with one container
void GiveCoinsTo(object oPC, int nNum, string sType)
{
    object oContainer = GetItemPossessedBy(oPC, "COIN_POUCH");
    int nCount;

    //if there's no container, or the container is full, it all goes in PC's pockets
    if(!GetIsObjectValid(oContainer))
        oContainer = oPC;
    else
    {
        object oItem = GetFirstItemInInventory(oContainer);
        while(oItem != OBJECT_INVALID)
        {
            nCount++;
            oItem = GetNextItemInInventory(oContainer);
        }
        if(nCount >= 35)
            oContainer = oPC;
    }

    if(nNum <= 100)
    {
        //if it's no more than 1 stack then just drop in the items
        CreateItemOnObject(sType, oContainer, nNum);
        return;
    }
    else
    {
        //if it's more than a stack give as many as needed, but watch that container capacity
        while(nNum > 100)
        {
            nCount++;
            CreateItemOnObject(sType, oContainer, 100);
            nNum = nNum - 100;
            //switch to PC's pockets if container becomes full
            if(nCount >= 35)
                oContainer = oPC;
        }
        CreateItemOnObject(sType, oContainer, nNum);
    }
}

//Procedure to take coins or note items from creature and place in a money pouch
//Currently only works with one container
void TakeCoinsFrom(object oPC, int nNum, string sType)
{
    object oContainer = GetItemPossessedBy(oPC, "COIN_POUCH");
    int nCount;

    //if there's no container, or the container is full, it all goes in PC's pockets
    if(!GetIsObjectValid(oContainer))
        oContainer = oPC;
    else
    {
        object oItem = GetFirstItemInInventory(oContainer);
        while(oItem != OBJECT_INVALID)
        {
            nCount++;
            oItem = GetNextItemInInventory(oContainer);
        }
        if(nCount >= 35)
            oContainer = oPC;
    }

    if(nNum <= 100)
    {
        //if it's no more than 1 stack then just drop in the items
        CreateItemOnObject(sType, oContainer, nNum);
        return;
    }
    else
    {
        //if it's more than a stack give as many as needed, but watch that container capacity
        while(nNum > 100)
        {
            nCount++;
            CreateItemOnObject(sType, oContainer, 100);
            nNum = nNum - 100;
            //switch to PC's pockets if container becomes full
            if(nCount >= 35)
                oContainer = oPC;
        }
        CreateItemOnObject(sType, oContainer, nNum);
    }
}

