#include "tlj_inc_generic"
//#include "x0_i0_position"

// CONSTANTS ///////////////////////////////////////////////////////////////////

// Casino state hex values
    // Player vs dealer
    const int CASINO_STATE_PLAYER =          0x00000001;
    const int CASINO_STATE_DEALER =          0x00000002;
    // Game involvement
    const int CASINO_STATE_BLACKJACK =       0x00000004;
    const int CASINO_STATE_HOLDEM =          0x00000008;

// Cards
const int CASINO_CARD_ACE_HEARTS = 1;
const int CASINO_CARD_TWO_HEARTS = 2;
const int CASINO_CARD_THREE_HEARTS = 3;
const int CASINO_CARD_FOUR_HEARTS = 4;
const int CASINO_CARD_FIVE_HEARTS = 5;
const int CASINO_CARD_SIX_HEARTS = 6;
const int CASINO_CARD_SEVEN_HEARTS = 7;
const int CASINO_CARD_EIGHT_HEARTS = 8;
const int CASINO_CARD_NINE_HEARTS = 9;
const int CASINO_CARD_TEN_HEARTS = 10;
const int CASINO_CARD_JACK_HEARTS = 11;
const int CASINO_CARD_QUEEN_HEARTS = 12;
const int CASINO_CARD_KING_HEARTS = 13;

const int CASINO_CARD_ACE_DIAMONDS = 14;
const int CASINO_CARD_TWO_DIAMONDS = 15;
const int CASINO_CARD_THREE_DIAMONDS = 16;
const int CASINO_CARD_FOUR_DIAMONDS = 17;
const int CASINO_CARD_FIVE_DIAMONDS = 18;
const int CASINO_CARD_SIX_DIAMONDS = 19;
const int CASINO_CARD_SEVEN_DIAMONDS = 20;
const int CASINO_CARD_EIGHT_DIAMONDS = 21;
const int CASINO_CARD_NINE_DIAMONDS = 22;
const int CASINO_CARD_TEN_DIAMONDS = 23;
const int CASINO_CARD_JACK_DIAMONDS = 24;
const int CASINO_CARD_QUEEN_DIAMONDS = 25;
const int CASINO_CARD_KING_DIAMONDS = 26;

const int CASINO_CARD_ACE_CLUBS = 27;
const int CASINO_CARD_TWO_CLUBS = 28;
const int CASINO_CARD_THREE_CLUBS = 29;
const int CASINO_CARD_FOUR_CLUBS = 30;
const int CASINO_CARD_FIVE_CLUBS = 31;
const int CASINO_CARD_SIX_CLUBS = 32;
const int CASINO_CARD_SEVEN_CLUBS = 33;
const int CASINO_CARD_EIGHT_CLUBS = 34;
const int CASINO_CARD_NINE_CLUBS = 35;
const int CASINO_CARD_TEN_CLUBS = 36;
const int CASINO_CARD_JACK_CLUBS = 37;
const int CASINO_CARD_QUEEN_CLUBS = 38;
const int CASINO_CARD_KING_CLUBS = 39;

const int CASINO_CARD_ACE_SPADES = 40;
const int CASINO_CARD_TWO_SPADES = 41;
const int CASINO_CARD_THREE_SPADES = 42;
const int CASINO_CARD_FOUR_SPADES = 43;
const int CASINO_CARD_FIVE_SPADES = 44;
const int CASINO_CARD_SIX_SPADES = 45;
const int CASINO_CARD_SEVEN_SPADES = 46;
const int CASINO_CARD_EIGHT_SPADES = 47;
const int CASINO_CARD_NINE_SPADES = 48;
const int CASINO_CARD_TEN_SPADES = 49;
const int CASINO_CARD_JACK_SPADES = 50;
const int CASINO_CARD_QUEEN_SPADES = 51;
const int CASINO_CARD_KING_SPADES = 52;

// FUNCTION DECLARATIONS ///////////////////////////////////////////////////////

// Returns TRUE if oObject is a casino area. If any object other than an area
// is passed into the oObject parameter, then it will use the area that oObject
// is currently in.
int IsAreaCasino(object oObject=OBJECT_SELF);

// Set whether or not oArea is a casino area. (TRUE or FALSE)
void SetAreaCasino(int bSet, object oArea=OBJECT_SELF);

// Returns whether or not oPC has the casino voice active. (TRUE or FALSE)
int GetCasinoVoice(object oPC);

// Turn on/off the casino voice commands for oPC. (TRUE or FALSE)
void ToggleCasinoVoice(object oPC, int bToggle);

// Returns TRUE if oPC has a particular casino state.
// - nState: CASINO_STATE_*
int GetHasCasinoState(int nState, object oPC);

// Get the string name of a casino game by using one of the CASINO_STATE_* constants.
//string GetGameNameByCasinoState(int nCasinoState);

// Set/remove a particular casino state on oPC.
// - nState: CASINO_STATE_*
// - bSet: TRUE to set. FALSE to remove.
void SetCasinoState(int nState, object oPC, int bSet=TRUE);

// Completely clear the casino state on oPC.
void ClearCasinoState(object oPC);

// Copy the game state of oSource to oTarget.
// - nType:
//   -> 1: Dealer to Player
//   -> 2: Player to Dealer
//   -> 3: Dealer to Dealer OR Player to Player
//   -> 4: Leave out Player/Dealer states
void CopyCasinoGameState(object oSource, object oTarget, int nType=1);

// Returns TRUE if oDealer is busy in a game.
int IsCasinoDealerBusy(object oDealer);

// Set whether or not oDealer is busy in a game. (TRUE or FALSE)
void SetCasinoDealerBusy(object oDealer, int bSet);

// This returns the nearest casino dealer from oObject.
// - fDistance: This is the distance to look from oObject.
// - bArc: If TRUE, then the function will look in a 60 degree arc
//   from the facing point of oObject.
object GetNearestCasinoDealer(object oObject, int bArc=TRUE, float fDistance=4.0, int bReturnBusy=FALSE);

// Get the dealer in the game that oPlayer is currently partaking in.
object GetCasinoDealerInGame(object oPlayer);

// Use this function to add or remove players in a game.
// - nBet: The amount of money oPlayer is betting. Only used with nUpdateMode 1.
// - nPayOut: The amount of money oPlayer wins in the game. Only used with nUpdateMode 2 & 3.
//   If set to -1 then the payout is predetermined.
// - nUpdateMode:
//   -> 1: Add player
//   -> 2: Remove player
//   -> 3: Remove all players
void UpdateCasinoGamePlayers(object oDealer, object oPlayer=OBJECT_INVALID, int nBet=0, int nPayOut=0, int nUpdateMode=1);

// Return the total amount of players that are part of a game.
int CountCasinoGamePlayers(object oDealer);

// Return the amount of money oPlayer put down as a bet in the game.
int GetCasinoPlayerBet(object oPlayer);

// Modify the player's current bet on the game table by nAmount.
//
// - Note 1: If nAmount is less than 0 then it will reduce the current bet on
// the table by that amount without directly effecting the player's funds.
// - Note 2: If the sum of nAmount and the current bet on the table is less than
// or equal to 0 then the bet is removed entirely.
void ModifyCasinoPlayerBet(object oPlayer, int nAmount);

// Reset the player's bet in a casino game. This does not effect the player's
// current money in any way but merely performs internal clean up.
void ResetCasinoPlayerBet(object oPlayer);

// Reset a casino game so it can be played again.
void ResetCasinoGame(object oDealer);

// Get the total from rolling (nNumDice x d52 dice).
// - nNumDice: If this is less than 1, the value 1 will be used.
int d52(int nNumDice=1);

// Draw a card that has not been used yet.
int DrawRandomCasinoCard(object oDealer, int nDeckCount=1);

// Get the string name of a card by using one of the CASINO_CARD_* constants.
string GetCasinoCardName(int nCard);

// Use this function to add or remove cards in a hand.
// - nCard: CASINO_CARD_*
// - nUpdateMode:
//   -> 1: Add card
//   -> 2: Remove card
//   -> 3: Remove all cards
void UpdateCasinoCardHand(object oPC, int nCard=0, int nUpdateMode=1);

// Return the amount of decks to be used in the game.
int GetCasinoGameDeckCount(object oDealer);

// Set the amount of decks to be used in the game.
void SetCasinoGameDeckCount(object oDealer, int nDeckCount);

// Cycle to the next player's turn.
void CycleCasinoGamePlayers(object oDealer);

// Get the next player by turn.
object GetCycledCasinoPlayer(object oDealer);

// Returns TRUE if it's oPlayer's turn in the game.
int IsCasinoGamePlayerTurn(object oPlayer);

// Set whether or not it's oPlayer's turn in the game. (TRUE or FALSE)
void SetCasinoGamePlayerTurn(object oPlayer, int bTurn);

// Initiate the Blackjack game.
void BeginCasinoGameBlackjack(object oDealer);

// Begin a casino game predetermined by oDealer.
void CasinoGame(object oDealer);

// This is a wrapper around CasinoGame() function but with an added delay of
// 30 seconds and prevention of multiple calls to it.
void DelayCasinoGame(object oDealer);

// If sCommand is a no game casino command spoken by oPC then execute it.
void CasinoCommandNoGame(object oPC, string sCommand);

// Get the value of a single card in the Blackjack game.
int GetCasinoBlackJackCardValue(int nCard);

// Get the total value of oPlayer's hand in the Blackjack game.
int GetCasinoBlackJackHandValue(object oPlayer);

// Test to see if oPlayer's hand has either busted or hit a Blackjack
// - bCycle: If left at TRUE, then it will cycle to the next player if a bust
// or blackjack was detected in the player's hand
// - bDouble: If set to TRUE, then the dealer will announce the number
void CasinoBlackjackTestHand(object oDealer, object oPlayer, int bCycle=TRUE, int bDouble=FALSE);

// Perform the Dealer's turn and the finish the Blackjack game.
void CasinoBlackjackDealersTurn(object oDealer);

// If sCommand is a Blackjack casino command spoken by oPC then execute it.
void CasinoCommandBlackjack(object oPC, string sCommand);

// Initiate the Hold'em game.
void BeginCasinoGameHoldem(object oDealer);

// If sCommand is a Hold'em casino command spoken by oPC then execute it.
void CasinoCommandHoldem(object oPlayer, string sCommand);

// FUNCTION DEFINITIONS ////////////////////////////////////////////////////////

int IsAreaCasino(object oObject=OBJECT_SELF) {
    if (GetArea(oObject) == OBJECT_INVALID) return GetLocalInt(oObject, "AREA_IS_CASINO");
    else return GetLocalInt(GetArea(oObject), "AREA_IS_CASINO");
}

void SetAreaCasino(int bSet, object oArea=OBJECT_SELF) {
    SetLocalInt(oArea, "AREA_IS_CASINO", bSet);
}

int GetCasinoVoice(object oPC) {
    return GetLocalInt(oPC, "CASINO_VOICE_ON");
}

void ToggleCasinoVoice(object oPC, int bToggle) {
    if (bToggle) { // Turn on
        SetLocalInt(oPC, "CASINO_VOICE_ON", TRUE);
        FloatingTextStringOnCreature("Casino voice commands active.", oPC, FALSE);
    }
    else { // Turn off
        DeleteLocalInt(oPC, "CASINO_VOICE_ON");
        FloatingTextStringOnCreature("Casino voice commands off.", oPC, FALSE);
    }
}

int GetHasCasinoState(int nState, object oPC) {
    int nPCState = GetLocalInt(oPC, "CASINO_STATE");

    //FloatingTextStringOnCreature("Casino State Hex Value: " + IntToString(nPCState), oPC, FALSE);

    if (nPCState & nState) return TRUE;
    return FALSE;
}

/*string GetGameNameByCasinoState(int nCasinoState) {
    string sName;
    switch (nCasinoState) {
         case CASINO_STATE_BLACKJACK: sName = "Blackjack"; break;
         case CASINO_STATE_HOLDEM: sName = "Hold'em"; break;
    }
    return sName;
}*/

void SetCasinoState(int nState, object oPC, int bSet=TRUE) {
    int nPCState = GetLocalInt(oPC, "CASINO_STATE");
    //string sGameName = GetGameNameByCasinoState(nState);
    //int bGameState = (sGameName != "") ? TRUE : FALSE;

    if (bSet) {
        nPCState = nPCState | nState;
        SetLocalInt(oPC, "CASINO_STATE", nPCState);
        //if (bGameState) {
        //    FloatingTextStringOnCreature("You're now playing " + sGameName + ".", oPC, FALSE);
        //}
    }
    else {
        nPCState = nPCState & ~nState;
        SetLocalInt(oPC, "CASINO_STATE", nPCState);
        //if (bGameState) {
        //    FloatingTextStringOnCreature("You're no longer playing " + sGameName + ".", oPC, FALSE);
        //}
    }
}

void ClearCasinoState(object oPC) {
    DeleteLocalInt(oPC, "CASINO_STATE");
}

void CopyCasinoGameState(object oSource, object oTarget, int nType=1) {
    int nState = GetLocalInt(oSource, "CASINO_STATE");

    switch (nType) {
        case 1: nState = (nState & ~CASINO_STATE_DEALER) | CASINO_STATE_PLAYER; break;
        case 2: nState = (nState & ~CASINO_STATE_PLAYER) | CASINO_STATE_DEALER; break;
        case 3: break;
        case 4: nState = (nState & ~CASINO_STATE_DEALER) & ~CASINO_STATE_PLAYER; break;
    }
    SetCasinoState(nState, oTarget, TRUE);
}

int IsCasinoDealerBusy(object oDealer) {
    return GetLocalInt(oDealer, "IS_CASINO_DEALER_BUSY");
}

void SetCasinoDealerBusy(object oDealer, int bSet) {
    if (bSet) {
        SetLocalInt(oDealer, "IS_CASINO_DEALER_BUSY", TRUE);
    }
    else {
        DeleteLocalInt(oDealer, "IS_CASINO_DEALER_BUSY");
    }
}

object GetNearestCasinoDealer(object oObject, int bArc=TRUE, float fDistance=4.0, int bReturnBusy=FALSE) {
    // Variable declaration
    object oDealer = OBJECT_INVALID;
    location lObject = GetLocation(oObject);
    int nShape, bWithinRange;
    float fSize;

    // Determine if it's an arc or not
    if (bArc) {
        fSize = 60.0;
        nShape = SHAPE_CONE;
    }
    else {
        fSize = fDistance;
        nShape = SHAPE_SPHERE;
        bWithinRange = TRUE;
    }

    //FloatingTextStringOnCreature("Size: "+FloatToString(fSize)+" && Shape: "+IntToString(nShape), oObject, FALSE);

    // Begin the search in the specified shape, either sphere or cone
    object oSearch = GetFirstObjectInShape(nShape, fSize, lObject);
    while (GetIsObjectValid(oSearch)) {

        //FloatingTextStringOnCreature("Object in shape: "+GetName(oSearch), oObject, FALSE);

        if (bArc) {
            if (GetDistanceBetweenLocations(lObject, GetLocation(oSearch)) <= fDistance) {
                bWithinRange = TRUE;
            }
        }

        if (bWithinRange) {
            if (GetHasCasinoState(CASINO_STATE_DEALER, oSearch)) {
                if (!(!bReturnBusy && IsCasinoDealerBusy(oSearch))) {
                    // If we found two dealers or more, then compare the distances between
                    // each one and oObject and choose the one with the shortest distance.
                    if (oDealer == OBJECT_INVALID) {
                        oDealer = oSearch;
                    }
                    else if (GetDistanceBetween(oObject, oSearch) < GetDistanceBetween(oObject, oDealer)) {
                        oDealer = oSearch;
                    }
                }
            }

            if (bArc) {
                bWithinRange = FALSE;
            }
        }
        oSearch = GetNextObjectInShape(nShape, fSize, lObject);
    }

    // return our findings
    return oDealer;
}

object GetCasinoDealerInGame(object oPlayer) {
    return GetLocalObject(oPlayer, "CASINO_GAME_LIST_DEALER");
}

// - nUpdateMode:
//   -> 1: Add player
//   -> 2: Remove player
//   -> 3: Remove all players
void UpdateCasinoGamePlayers(object oDealer, object oPlayer=OBJECT_INVALID, int nBet=0, int nPayOut=0, int nUpdateMode=1) {

    // Variable declaration
    string sPlayerName = GetName(oPlayer);
    string sSuffix = "01";
    int nList = 1;

    // Get the initial listing of 01.
    string sList = GetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);

    // Start with 01 and increment by 1 while there's an existing string to
    // work with on the listing. An existing string counts as either a PC name
    // or "INVALID".
    while (sList != "") {

        // If we're adding a player to the list AND the current listing string
        // came up as "INVALID" then break the loop. This is so we can fill up
        // the INVALID listing slot with the new player and avoid breaking the
        // list.
        if (nUpdateMode == 1 && sList == "INVALID") break;

        // Clean up any errors and missing players in the list
        if (GetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix) == OBJECT_INVALID) {
            SetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix, "INVALID");
            DeleteLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
        }

        // If we're removing a player and the current listing is the PC's
        // name  then delete the listing and replace it with a null string,
        // "INVALID".
        if (nUpdateMode == 2) {
            if (sList == sPlayerName) {
                SetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix, "INVALID");
                //if (!GetHasCasinoState(CASINO_STATE_DEALER, oPlayer)) {
                    ClearCasinoState(oPlayer);
                //}
                if (nPayOut > 0) {
                    GiveGoldToCreature(oPlayer, nPayOut);
                }
                ResetCasinoPlayerBet(oPlayer);
                SetCasinoGamePlayerTurn(oPlayer, FALSE);
                UpdateCasinoCardHand(oPlayer, 0, 3);
                DeleteLocalObject(oPlayer, "CASINO_GAME_LIST_DEALER");
                DeleteLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
                break;
            }
        }

        // If we're removing all players (nUpdateMode 3), then delete the
        // current listing entirely.
        else if (nUpdateMode == 3) {
            DeleteLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
            if (sList != "INVALID") {
                oPlayer = GetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
                //if (!GetHasCasinoState(CASINO_STATE_DEALER, oPlayer)) {
                    ClearCasinoState(oPlayer);
                //}
                if (nPayOut > 0) {
                    GiveGoldToCreature(oPlayer, nPayOut);
                }
                ResetCasinoPlayerBet(oPlayer);
                SetCasinoGamePlayerTurn(oPlayer, FALSE);
                UpdateCasinoCardHand(oPlayer, 0, 3);
                DeleteLocalObject(oPlayer, "CASINO_GAME_LIST_DEALER");
                DeleteLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
            }
        }

        // Increment
        nList++;
        sSuffix = GetNumberSuffix(nList);
        sList = GetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
    }

    // If we're adding a player (nUpdateMode 1) AND the current listing is
    // either blank or came up as "INVALID" then add the PC to it.
    if (nUpdateMode == 1) {

        //AssignCommand(oDealer, SpeakString("PLAYER ADDED IN LIST #: "+sSuffix));

        ModifyCasinoPlayerBet(oPlayer, nBet);
        SetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix, sPlayerName);
        SetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix, oPlayer);
        SetLocalObject(oPlayer, "CASINO_GAME_LIST_DEALER", oDealer);
        CopyCasinoGameState(oDealer, oPlayer);
    }
}

int CountCasinoGamePlayers(object oDealer) {
    int nCount;
    int nList = 1;
    string sSuffix = "01";
    string sList = GetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);

    while (sList != "") {
        if (sList != "INVALID") {
            // Clean up any errors and missing players
            if (GetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix) == OBJECT_INVALID) {
                SetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix, "INVALID");
                DeleteLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
            }
            else nCount++;
        }
        nList++;
        sSuffix = GetNumberSuffix(nList);
        sList = GetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_" + sSuffix);
    }

    return nCount;
}

int GetCasinoPlayerBet(object oPlayer) {
    return GetLocalInt(oPlayer, "CASINO_GAME_PLAYER_BET");
}

void ModifyCasinoPlayerBet(object oPlayer, int nAmount) {
    int nModify = nAmount + GetLocalInt(oPlayer, "CASINO_GAME_PLAYER_BET");
    if (nModify <= 0) DeleteLocalInt(oPlayer, "CASINO_GAME_PLAYER_BET");
    else {
        AssignCommand(oPlayer, TakeGoldFromCreature(nAmount, oPlayer, TRUE));
        SetLocalInt(oPlayer, "CASINO_GAME_PLAYER_BET", nModify);
    }
}

void ResetCasinoPlayerBet(object oPlayer) {
    DeleteLocalInt(oPlayer, "CASINO_GAME_PLAYER_BET");
}

void ResetCasinoGame(object oDealer) {
    DelayCommand(1.0, UpdateCasinoGamePlayers(oDealer, OBJECT_INVALID, 0, 0, 3));
    UpdateCasinoCardHand(oDealer, 0, 3);

    int i;
    for (i = 1; i < 53; i++) {
        DeleteLocalInt(oDealer, "CASINO_CARD_COUNT_"+GetNumberSuffix(i));
    }

    SetCasinoDealerBusy(oDealer, FALSE);
}

int d52(int nNumDice=1) {
    int nd52;
    if (nNumDice < 1) nNumDice = 1;
    int i;
    for (i; i < nNumDice; i++) {
        nd52 += Random(52) + 1;
    }
    return nd52;
}

int DrawRandomCasinoCard(object oDealer, int nDeckCount=1) {
    if (nDeckCount < 1) nDeckCount = 1;

    // Random card from the deck
    int nCard = d52();
    string sSuffix = GetNumberSuffix(nCard);
    int nCardCount = GetLocalInt(oDealer, "CASINO_CARD_COUNT_"+sSuffix);

    //AssignCommand(oDealer, SpeakString("RANDOM CARD DRAW :: nDeckCount: "+IntToString(nDeckCount)+" nCard: "+IntToString(nCard)+" nCardCount: "+IntToString(nCardCount)));

    // Increment the card if it was already used.
    if (nCardCount == nDeckCount) {

        int i;
        for (i; nCardCount == nDeckCount; i++) {

            //AssignCommand(oDealer, SpeakString("RANDOM CARD REDRAW!!!"));

            //if (i == 52) break;

            nCard++;
            if (nCard > 52) nCard = 1;
            sSuffix = GetNumberSuffix(nCard);
            nCardCount = GetLocalInt(oDealer, "CASINO_CARD_COUNT_"+sSuffix);

            //AssignCommand(oDealer, SpeakString("nDeckCount: "+IntToString(nDeckCount)+" nCard: "+IntToString(nCard)+" nCardCount: "+IntToString(nCardCount)));
        }
    }

    nCardCount++;
    SetLocalInt(oDealer, "CASINO_CARD_COUNT_" + sSuffix, nCardCount);
    return nCard;
}

string GetCasinoCardName(int nCard) {
    string sCard;
    switch (nCard) {
        case CASINO_CARD_ACE_CLUBS: sCard = "Ace of Clubs"; break;
        case CASINO_CARD_ACE_DIAMONDS: sCard = "Ace of Diamonds"; break;
        case CASINO_CARD_ACE_HEARTS: sCard = "Ace of Hearts"; break;
        case CASINO_CARD_ACE_SPADES: sCard = "Ace of Spades"; break;
        case CASINO_CARD_EIGHT_CLUBS: sCard = "Eight of Clubs"; break;
        case CASINO_CARD_EIGHT_DIAMONDS: sCard = "Eight of Diamonds"; break;
        case CASINO_CARD_EIGHT_HEARTS: sCard = "Eight of Hearts"; break;
        case CASINO_CARD_EIGHT_SPADES: sCard = "Eight of Spades"; break;
        case CASINO_CARD_FIVE_CLUBS: sCard = "Five of Clubs"; break;
        case CASINO_CARD_FIVE_DIAMONDS: sCard = "Five of Diamonds"; break;
        case CASINO_CARD_FIVE_HEARTS: sCard = "Five of Hearts"; break;
        case CASINO_CARD_FIVE_SPADES: sCard = "Five of Spades"; break;
        case CASINO_CARD_FOUR_CLUBS: sCard = "Four of Clubs"; break;
        case CASINO_CARD_FOUR_DIAMONDS: sCard = "Four of Diamonds"; break;
        case CASINO_CARD_FOUR_HEARTS: sCard = "Four of Hearts"; break;
        case CASINO_CARD_FOUR_SPADES: sCard = "Four of Spades"; break;
        case CASINO_CARD_JACK_CLUBS: sCard = "Jack of Clubs"; break;
        case CASINO_CARD_JACK_DIAMONDS: sCard = "Jack of Diamonds"; break;
        case CASINO_CARD_JACK_HEARTS: sCard = "Jack of Hearts"; break;
        case CASINO_CARD_JACK_SPADES: sCard = "Jack of Spades"; break;
        case CASINO_CARD_KING_CLUBS: sCard = "King of Clubs"; break;
        case CASINO_CARD_KING_DIAMONDS: sCard = "King of Diamonds"; break;
        case CASINO_CARD_KING_HEARTS: sCard = "King of Hearts"; break;
        case CASINO_CARD_KING_SPADES: sCard = "King of Spades"; break;
        case CASINO_CARD_NINE_CLUBS: sCard = "Nine of Clubs"; break;
        case CASINO_CARD_NINE_DIAMONDS: sCard = "Nine of Diamonds"; break;
        case CASINO_CARD_NINE_HEARTS: sCard = "Nine of Hearts"; break;
        case CASINO_CARD_NINE_SPADES: sCard = "Nine of Spades"; break;
        case CASINO_CARD_QUEEN_CLUBS: sCard = "Queen of Clubs"; break;
        case CASINO_CARD_QUEEN_DIAMONDS: sCard = "Queen of Diamonds"; break;
        case CASINO_CARD_QUEEN_HEARTS: sCard = "Queen of Hearts"; break;
        case CASINO_CARD_QUEEN_SPADES: sCard = "Queen of Spades"; break;
        case CASINO_CARD_SEVEN_CLUBS: sCard = "Seven of Clubs"; break;
        case CASINO_CARD_SEVEN_DIAMONDS: sCard = "Seven of Diamonds"; break;
        case CASINO_CARD_SEVEN_HEARTS: sCard = "Seven of Hearts"; break;
        case CASINO_CARD_SEVEN_SPADES: sCard = "Seven of Spades"; break;
        case CASINO_CARD_SIX_CLUBS: sCard = "Six of Clubs"; break;
        case CASINO_CARD_SIX_DIAMONDS: sCard = "Six of Diamonds"; break;
        case CASINO_CARD_SIX_HEARTS: sCard = "Six of Hearts"; break;
        case CASINO_CARD_SIX_SPADES: sCard = "Six of Spades"; break;
        case CASINO_CARD_TEN_CLUBS: sCard = "Ten of Clubs"; break;
        case CASINO_CARD_TEN_DIAMONDS: sCard = "Ten of Diamonds"; break;
        case CASINO_CARD_TEN_HEARTS: sCard = "Ten of Hearts"; break;
        case CASINO_CARD_TEN_SPADES: sCard = "Ten of Spades"; break;
        case CASINO_CARD_THREE_CLUBS: sCard = "Three of Clubs"; break;
        case CASINO_CARD_THREE_DIAMONDS: sCard = "Three of Diamonds"; break;
        case CASINO_CARD_THREE_HEARTS: sCard = "Three of Hearts"; break;
        case CASINO_CARD_THREE_SPADES: sCard = "Three of Spades"; break;
        case CASINO_CARD_TWO_CLUBS: sCard = "Two of Clubs"; break;
        case CASINO_CARD_TWO_DIAMONDS: sCard = "Two of Diamonds"; break;
        case CASINO_CARD_TWO_HEARTS: sCard = "Two of Hearts"; break;
        case CASINO_CARD_TWO_SPADES: sCard = "Two of Spades"; break;
    }
    return sCard;
}

void UpdateCasinoCardHand(object oPC, int nCard, int nUpdateMode=1) {

    // Variable declaration
    int nListNum = 1;
    string sListNum = "01";
    string sCurrentHand = "Current Hand: "; // Initiate the card hand string

    // Get the initial listing of 01
    int nList = GetLocalInt(oPC, "CASINO_CARD_HAND_LIST_"+sListNum);

    // Start with 01 and increment by 1 while there's an existing int to
    // work with on the listing. An existing int counts as either a card
    // number or -1.
    while (nList != 0) {

        // If we're adding a card to the list AND the current listing int
        // came up as -1 then break the loop. This is so we can fill up
        // the -1 listing slot with the new card and avoid breaking the
        // list.
        if (nUpdateMode == 1 && nList == -1) break;

        // If we're removing a card and the current listing is the card's
        // number then delete the listing and replace it with a null int, -1
        if (nUpdateMode == 2 && nList == nCard) {
            SetLocalInt(oPC, "CASINO_CARD_HAND_LIST_"+sListNum, -1);
        }

        // If we're not removing this card, then
        // add the card name to the hand string.
        else if (nUpdateMode != 3){
            if (nList != -1) {
                sCurrentHand += GetCasinoCardName(nList) + " ";
            }
        }

        // If we're removing all cards (nUpdateMode 3),
        // then delete the current listing entirely.
        else {
            DeleteLocalInt(oPC, "CASINO_CARD_HAND_LIST_"+sListNum);
        }

        // Increment
        nListNum++;
        sListNum = GetNumberSuffix(nListNum);
        nList = GetLocalInt(oPC, "CASINO_CARD_HAND_LIST_"+sListNum);
    }

    if (nUpdateMode != 3) {
        // If we're adding a card (nUpdateMode 1) AND the current listing is
        // either blank or came up as -1 then add the card number to it.
        if (nUpdateMode == 1) {
            SetLocalInt(oPC, "CASINO_CARD_HAND_LIST_"+sListNum, nCard);
            sCurrentHand += GetCasinoCardName(nCard);
        }
        // Relay to the current hand to the PC
        SendMessageToPC(oPC, sCurrentHand);
    }
}

int GetCasinoGameDeckCount(object oDealer) {
    return GetLocalInt(oDealer, "CASINO_BLACKJACK_RULE_DECKCOUNT");
}

void SetCasinoGameDeckCount(object oDealer, int nDeckCount) {
    SetLocalInt(oDealer, "CASINO_BLACKJACK_RULE_DECKCOUNT", nDeckCount);
}

void CycleCasinoGamePlayers(object oDealer) {
    object oPlayer;
    string sList, sSuffix;

    int i = GetLocalInt(oDealer, "CASINO_GAME_CYCLE_PLAYER_NUM") + 1;

    if (i > CountCasinoGamePlayers(oDealer)) {
        DeleteLocalInt(oDealer, "CASINO_GAME_CYCLE_PLAYER_NUM");
        if (GetHasCasinoState(CASINO_STATE_BLACKJACK, oDealer)) { // Blackjack
            CasinoBlackjackDealersTurn(oDealer);
        }
        //oPlayer = oDealer;
        return;
    }

    else {
        for (i; ; i++) {
            sSuffix = GetNumberSuffix(i);
            sList = GetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_"+sSuffix);

            if (sList != "") {
                if (sList != "INVALID") {
                    SetLocalInt(oDealer, "CASINO_GAME_CYCLE_PLAYER_NUM", i);
                    oPlayer = GetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_"+sSuffix);
                    break;
                }
                else {
                    //AssignCommand(oDealer, SpeakString("CYCLED TO INVALID LISTING"));
                }
            }
            else {
                //AssignCommand(oDealer, SpeakString("CYCLED TO BLANK LISTING"));
                break;
            }
        }
    }

    if (oPlayer == OBJECT_INVALID) {
        AssignCommand(oDealer, SpeakString("ERROR: PLAYER IN LIST #"+sSuffix+" DOES NOT EXIST", TALKVOLUME_SILENT_SHOUT));
    }
    else {
        SetCasinoGamePlayerTurn(oPlayer, TRUE);
        DelayCommand(1.0, AssignCommand(oDealer, SpeakString("::"+GetName(oPlayer)+"'s turn::")));
    }
}

object GetCycledCasinoPlayer(object oDealer) {
    object oPlayer;
    string sList, sSuffix;

    int i = GetLocalInt(oDealer, "CASINO_GAME_CYCLE_PLAYER_NUM") + 1;
    if (i > CountCasinoGamePlayers(oDealer)) {
        DeleteLocalInt(oDealer, "CASINO_GAME_CYCLE_PLAYER_NUM");
        oPlayer = oDealer;
    }

    else {
        for (i; ; i++) {
            sSuffix = GetNumberSuffix(i);
            sList = GetLocalString(oDealer, "CASINO_GAME_LIST_PLAYER_"+sSuffix);

            if (sList != "") {
                if (sList != "INVALID") {
                    SetLocalInt(oDealer, "CASINO_GAME_CYCLE_PLAYER_NUM", i);
                    oPlayer = GetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_"+sSuffix);
                    break;
                }
                else {
                    //AssignCommand(oDealer, SpeakString("CYCLED TO INVALID LISTING"));
                }
            }
            else {
                //AssignCommand(oDealer, SpeakString("CYCLED TO BLANK LISTING"));
                break;
            }
        }
    }
    return oPlayer;
}

int IsCasinoGamePlayerTurn(object oPlayer) {
    return GetLocalInt(oPlayer, "CASINO_GAME_PLAYER_TURN");
}

void SetCasinoGamePlayerTurn(object oPlayer, int bTurn) {
    if (!bTurn) {
        DeleteLocalInt(oPlayer, "CASINO_GAME_PLAYER_TURN");
    }
    else {
        SetLocalInt(oPlayer, "CASINO_GAME_PLAYER_TURN", TRUE);
    }
}

void BeginCasinoGameBlackjack(object oDealer) {

    //AssignCommand(oDealer, SpeakString("BLACKJACK INITIATED"));
    SetCasinoDealerBusy(oDealer, TRUE);

    // Rules settings
    int nDeckCount = GetCasinoGameDeckCount(oDealer);

    // Hand out the initial two cards to all players
    object oPlayer;
    int nCard1, nCard2, nFoundPlayers, i, d;
    int nTotalPlayers = CountCasinoGamePlayers(oDealer);
    for (i = 1; nFoundPlayers < nTotalPlayers; i++) {
        //AssignCommand(oDealer, SpeakString("i: " + IntToString(i)));
        oPlayer = GetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_"+GetNumberSuffix(i));
        if (oPlayer != OBJECT_INVALID) {
            nFoundPlayers++;
            d += 2;
            //AssignCommand(oDealer, SpeakString("PC Name: " + GetName(oPlayer)));
            nCard1 = DrawRandomCasinoCard(oDealer, nDeckCount);
            nCard2 = DrawRandomCasinoCard(oDealer, nDeckCount);
            DelayCommand(IntToFloat(d), AssignCommand(oDealer, SpeakString("::Deals the "+GetCasinoCardName(nCard1)+" and the "+GetCasinoCardName(nCard2)+" face up to "+GetName(oPlayer)+"::")));
            DelayCommand(IntToFloat(d), UpdateCasinoCardHand(oPlayer, nCard1));
            DelayCommand(IntToFloat(d)+0.5, UpdateCasinoCardHand(oPlayer, nCard2));
            DelayCommand(IntToFloat(d)+1.0, CasinoBlackjackTestHand(oDealer, oPlayer, FALSE));
        }
    }

    // Incase any player busted, which means an automatic boot out of the game,
    // recount the players to check if we still have at least 1 player.
    if (CountCasinoGamePlayers(oDealer) > 0) {
        // Draw out the dealer's cards.
        // Hole card
        nCard1 = DrawRandomCasinoCard(oDealer, nDeckCount);
        DelayCommand(IntToFloat(d)+2.0, UpdateCasinoCardHand(oDealer, nCard1));
        // Up face card
        nCard2 = DrawRandomCasinoCard(oDealer, nDeckCount);
        DelayCommand(IntToFloat(d)+2.5, UpdateCasinoCardHand(oDealer, nCard2));

        DelayCommand(IntToFloat(d)+2.0, AssignCommand(oDealer, SpeakString("::Deals two cards to self, flipping one face up, revealing the "+GetCasinoCardName(nCard2)+"::")));
        //DelayCommand(IntToFloat(d)+2.0, AssignCommand(oDealer, SpeakString("HOLE CARD: "+GetCasinoCardName(nCard1))));
        //DelayCommand(IntToFloat(d)+2.5, UpdateCasinoCardHand(oDealer, DrawRandomCasinoCard(oDealer, nDeckCount)));

        // First turn of the game
        DelayCommand(IntToFloat(d)+4.0, CycleCasinoGamePlayers(oDealer));
    }
    else {
        // Clean up the player list and set the dealer to idle
        DelayCommand(IntToFloat(d)+2.0, ResetCasinoGame(oDealer));
    }
}

void CasinoGame(object oDealer) {

    if (CountCasinoGamePlayers(oDealer) > 0) {

        AssignCommand(oDealer, SpeakString("Ladies and gentlemen, betting is closed."));

        if (GetHasCasinoState(CASINO_STATE_BLACKJACK, oDealer)) { // Play Blackjack
            BeginCasinoGameBlackjack(oDealer);
        }
        if (GetHasCasinoState(CASINO_STATE_HOLDEM, oDealer)) { // Play Hold'em
            BeginCasinoGameHoldem(oDealer);
        }
    }
    // If the players bailed out before the game
    // started then clean up the player list
    else {
        AssignCommand(oDealer, SpeakString("ERROR: NO PLAYERS AT GAME START... REMOVING PLAYER LIST", TALKVOLUME_SILENT_SHOUT));
        DelayCommand(1.0, UpdateCasinoGamePlayers(oDealer, OBJECT_INVALID, 0, 0, 3));
    }
}

void DelayCasinoGame(object oDealer) {

    // Start the delay if it isn't already running.
    if (!GetLocalInt(oDealer, "CASINO_GAME_DELAY_ON")) {
        SetLocalInt(oDealer, "CASINO_GAME_DELAY_ON", TRUE);

        AssignCommand(oDealer, SpeakString("Ladies and gentlemen, please place your bets. We will begin in fifteen."));
        //DelayCommand(30.0, AssignCommand(oDealer, SpeakString("GAME DELAY FINISHED")));
        DelayCommand(15.0, DeleteLocalInt(oDealer, "CASINO_GAME_DELAY_ON"));
        DelayCommand(15.0, CasinoGame(oDealer));
    }
}

void CasinoCommandNoGame(object oPC, string sCommand) {
    object oDealer = GetNearestCasinoDealer(oPC);
    if (oDealer == OBJECT_INVALID) {
        //FloatingTextStringOnCreature("ERROR: INVALID DEALER", oPC, FALSE);
        return;
    }

    sCommand = GetStringLowerCase(sCommand);

    // Did we place a bet? Placing a bet adds the player to the game
    if (FindSubString(sCommand, "bet ") != -1 && FindSubString(sCommand, "((") == -1 && FindSubString(sCommand, "//") == -1) {
        string sBet = GetStringRight(sCommand, GetStringLength(sCommand) - 4);
        int nBet = StringToInt(sBet);

        // We can't bet NO money
        if (nBet > 0) {
            // Cap the bet at 100 million
            if (nBet > 100000000) {
                nBet = 100000000;
                sBet = "100000000";
            }
            if (nBet <= GetGold(oPC)) { // Make sure we don't bet more than what we have.

                SetPCChatMessage("::Joins the game, placing a bet of "+sBet+" onto the table::");

                //SetLocalInt(oPC, "CONFIRM_PLAY", TRUE);

                // Speak
                AssignCommand(oDealer, SetFacingPoint(GetPosition(oPC)));
                // Add oPC as a player to oDealer's game
                SetLocalInt(oPC, "INITIATED_CASINO_GAME", TRUE);
                DelayCommand(1.0, UpdateCasinoGamePlayers(oDealer, oPC, nBet));
                DelayCommand(2.0, DelayCasinoGame(oDealer));
            }
            else {
                FloatingTextStringOnCreature("You don't have that kind of money.", oPC, FALSE);
            }
        }
        else {
            FloatingTextStringOnCreature("Invalid bet.", oPC, FALSE);
        }

    }
}

int GetCasinoBlackJackCardValue(int nCard) {
    int nValue;
    switch (nCard) {
        case CASINO_CARD_ACE_CLUBS:
        case CASINO_CARD_ACE_DIAMONDS:
        case CASINO_CARD_ACE_HEARTS:
        case CASINO_CARD_ACE_SPADES: nValue = 1; break;
        case CASINO_CARD_TWO_CLUBS:
        case CASINO_CARD_TWO_DIAMONDS:
        case CASINO_CARD_TWO_HEARTS:
        case CASINO_CARD_TWO_SPADES:  nValue = 2; break;
        case CASINO_CARD_THREE_CLUBS:
        case CASINO_CARD_THREE_DIAMONDS:
        case CASINO_CARD_THREE_HEARTS:
        case CASINO_CARD_THREE_SPADES:  nValue = 3; break;
        case CASINO_CARD_FOUR_CLUBS:
        case CASINO_CARD_FOUR_DIAMONDS:
        case CASINO_CARD_FOUR_HEARTS:
        case CASINO_CARD_FOUR_SPADES:  nValue = 4; break;
        case CASINO_CARD_FIVE_CLUBS:
        case CASINO_CARD_FIVE_DIAMONDS:
        case CASINO_CARD_FIVE_HEARTS:
        case CASINO_CARD_FIVE_SPADES:  nValue = 5; break;
        case CASINO_CARD_SIX_CLUBS:
        case CASINO_CARD_SIX_DIAMONDS:
        case CASINO_CARD_SIX_HEARTS:
        case CASINO_CARD_SIX_SPADES:  nValue = 6; break;
        case CASINO_CARD_SEVEN_CLUBS:
        case CASINO_CARD_SEVEN_DIAMONDS:
        case CASINO_CARD_SEVEN_HEARTS:
        case CASINO_CARD_SEVEN_SPADES:  nValue = 7; break;
        case CASINO_CARD_EIGHT_CLUBS:
        case CASINO_CARD_EIGHT_DIAMONDS:
        case CASINO_CARD_EIGHT_HEARTS:
        case CASINO_CARD_EIGHT_SPADES:  nValue = 8; break;
        case CASINO_CARD_NINE_CLUBS:
        case CASINO_CARD_NINE_DIAMONDS:
        case CASINO_CARD_NINE_HEARTS:
        case CASINO_CARD_NINE_SPADES:  nValue = 9; break;
        case CASINO_CARD_TEN_CLUBS:
        case CASINO_CARD_TEN_DIAMONDS:
        case CASINO_CARD_TEN_HEARTS:
        case CASINO_CARD_TEN_SPADES:
        case CASINO_CARD_JACK_CLUBS:
        case CASINO_CARD_JACK_DIAMONDS:
        case CASINO_CARD_JACK_HEARTS:
        case CASINO_CARD_JACK_SPADES:
        case CASINO_CARD_QUEEN_CLUBS:
        case CASINO_CARD_QUEEN_DIAMONDS:
        case CASINO_CARD_QUEEN_HEARTS:
        case CASINO_CARD_QUEEN_SPADES:
        case CASINO_CARD_KING_CLUBS:
        case CASINO_CARD_KING_DIAMONDS:
        case CASINO_CARD_KING_HEARTS:
        case CASINO_CARD_KING_SPADES:  nValue = 10; break;
    }
    return nValue;
}

int GetCasinoBlackJackHandValue(object oPlayer) {
    // Variable declaration
    int nValue, nAces;
    string sListNum = "01";

    // Get the initial listing of 01
    int nList = GetLocalInt(oPlayer, "CASINO_CARD_HAND_LIST_"+sListNum);

    // Search through the hand and add up the card values
    int i = 1;
    for (i; nList != 0; i++) {
        if (nList != -1) {
            switch (nList) {
                case CASINO_CARD_ACE_CLUBS:
                case CASINO_CARD_ACE_DIAMONDS:
                case CASINO_CARD_ACE_HEARTS:
                case CASINO_CARD_ACE_SPADES: nAces++; break;
            }
            nValue += GetCasinoBlackJackCardValue(nList);
        }
        sListNum = GetNumberSuffix(i+1);
        nList = GetLocalInt(oPlayer, "CASINO_CARD_HAND_LIST_"+sListNum);
    }

    // Switch ace values if it benefits the hand
    if (nAces > 0 && nValue <= 11) {
        for (i = 0; i < nAces; i++) {
            nValue += 10;
            if (nValue > 11) break;
        }
    }

    return nValue;
}

void CasinoBlackjackTestHand(object oDealer, object oPlayer, int bCycle=TRUE, int bDouble=FALSE) {

    int nValue = GetCasinoBlackJackHandValue(oPlayer);

    // If over 21, then the hand busted
    if (nValue > 21) {
        AssignCommand(oDealer, SpeakString(IntToString(nValue)+"-Bust."));
        // remove player from game
        //DeleteLocalInt(oPlayer, "INITIATED_CASINO_GAME");
        //DelayCommand(1.0, UpdateCasinoGamePlayers(oDealer, oPlayer, 0, 0, 2));
        // Next player's turn
        if (bCycle) CycleCasinoGamePlayers(oDealer);
    }
    // If exactly 21, then the hand is a Blackjack
    else if (nValue == 21) {
        // calculate payout 2:3
        //int nPayout = GetCasinoPlayerBet(oPlayer);
        //    nPayout += nPayout / 2 * 3;
        AssignCommand(oDealer, SpeakString("21-Blackjack."/* ::Moves the payout of "+IntToString(nPayout)+" to the player::"*/));
        // Give payout and remove player from game
        //UpdateCasinoGamePlayers(oDealer, oPlayer, 0, nPayout, 2);
        // Next player's turn
        if (bCycle) CycleCasinoGamePlayers(oDealer);
    }
    else if (bDouble) {
        AssignCommand(oDealer, SpeakString(IntToString(nValue)));
    }
}

void CasinoBlackjackPayout(object oDealer, int nDealerHand) {

    // Variable declaration
    object oPlayer = GetCycledCasinoPlayer(oDealer);
    int i, d, nPlayerHand, nPayout;

    for (i = 1; oPlayer != oDealer; i++) {
        nPlayerHand = GetCasinoBlackJackHandValue(oPlayer);
        d += 2;
        // Push?
        if (nPlayerHand == nDealerHand) {
            DelayCommand(IntToFloat(d), AssignCommand(oDealer, SpeakString("Push. ::Returns "+GetName(oPlayer)+"'s bet.")));
            DelayCommand(IntToFloat(d), UpdateCasinoGamePlayers(oDealer, oPlayer, 0, GetCasinoPlayerBet(oPlayer), 2));
        }
        // Blackjack?
        else if (nPlayerHand == 21) {
            // Calculate payout of 3:2
            nPayout = GetCasinoPlayerBet(oPlayer);
            nPayout += nPayout / 2 * 3;
            DelayCommand(IntToFloat(d), UpdateCasinoGamePlayers(oDealer, oPlayer, 0, nPayout, 2));
            DelayCommand(IntToFloat(d), AssignCommand(oDealer, SpeakString("::Moves a payout of "+IntToString(nPayout)+" to "+GetName(oPlayer)+"::")));
        }
        // Did the dealer bust or did the player get a higher hand without busting?
        else if ((nDealerHand > 21 || nPlayerHand > nDealerHand) && nPlayerHand < 22) {
            // Calculate payout of 1:1
            nPayout = GetCasinoPlayerBet(oPlayer);
            nPayout *= 2;
            DelayCommand(IntToFloat(d), UpdateCasinoGamePlayers(oDealer, oPlayer, 0, nPayout, 2));
            DelayCommand(IntToFloat(d), AssignCommand(oDealer, SpeakString("::Moves a payout of "+IntToString(nPayout)+" to "+GetName(oPlayer)+"::")));
        }
        // The dealer won
        else {
            DelayCommand(IntToFloat(d), AssignCommand(oDealer, SpeakString("::Removes "+GetName(oPlayer)+"'s bet from the table.")));
        }

        oPlayer = GetCycledCasinoPlayer(oDealer);
    }

    DelayCommand(IntToFloat(d)+2.0, ResetCasinoGame(oDealer));
}

void CasinoBlackjackDealersTurn(object oDealer) {
    // Get the dealer's hand value
    int nDealerHand = GetCasinoBlackJackHandValue(oDealer);
    int d;

    if (CountCasinoGamePlayers(oDealer) > 0) {

        // Reveal the hole card
        int nHoleCard = GetLocalInt(oDealer, "CASINO_CARD_HAND_LIST_01");
        AssignCommand(oDealer, SpeakString("::Flips the hole card, revealing the "+GetCasinoCardName(nHoleCard)+"::"));

        // If less than 17, hit. Otherwise, stand.
        int i, nHitCard;
        for (i = 1; nDealerHand < 17; i++) {
            d += 2;
            nHitCard = DrawRandomCasinoCard(oDealer, GetCasinoGameDeckCount(oDealer));
            nDealerHand += GetCasinoBlackJackCardValue(nHitCard);
            DelayCommand(IntToFloat(d), AssignCommand(oDealer, SpeakString("::Draws the "+GetCasinoCardName(nHitCard)+" card for self::")));
            DelayCommand(IntToFloat(d), UpdateCasinoCardHand(oDealer, nHitCard));
        }

        // If the dealer busted, then all players win
        if (nDealerHand > 21) {
            DelayCommand(IntToFloat(d)+2.0, AssignCommand(oDealer, SpeakString(IntToString(nDealerHand)+"-Bust. All players win.")));
        }
        // If the dealer has a blackjack then he autowins
        else if (nDealerHand == 21){
            DelayCommand(IntToFloat(d)+2.0, AssignCommand(oDealer, SpeakString("21-Blackjack")));
        }
        else {
            DelayCommand(IntToFloat(d)+2.0, AssignCommand(oDealer, SpeakString(IntToString(nDealerHand))));
        }
    }

    // Handle payouts and finish the game
    DelayCommand(IntToFloat(d)+2.0, CasinoBlackjackPayout(oDealer, nDealerHand));
}

void CasinoCommandBlackjack(object oPC, string sCommand) {
    if (IsCasinoGamePlayerTurn(oPC)) {

        object oDealer = GetCasinoDealerInGame(oPC);
        if (oDealer == OBJECT_INVALID) {
            //FloatingTextStringOnCreature("ERROR: INVALID DEALER", oPC, FALSE);
            return;
        }

        sCommand = GetStringLowerCase(sCommand);

        if (FindSubString(sCommand, "hit") != -1) {

            DeleteLocalInt(oPC, "INITIATED_CASINO_GAME");

            SetPCChatMessage("::Motions to self::");
            int nHitCard = DrawRandomCasinoCard(oDealer, GetCasinoGameDeckCount(oDealer));
            DelayCommand(2.0, AssignCommand(oDealer, SpeakString("Hit. ::Deals the "+GetCasinoCardName(nHitCard)+" face up to "+GetName(oPC)+"::")));
            DelayCommand(2.0, UpdateCasinoCardHand(oPC, nHitCard));
            DelayCommand(3.0, CasinoBlackjackTestHand(oDealer, oPC));
        }

        else if (FindSubString(sCommand, "stand") != -1) {
            SetPCChatMessage("::Slides hand cards underneath bet::");
            DelayCommand(2.0, AssignCommand(oDealer, SpeakString("Stand at "+IntToString(GetCasinoBlackJackHandValue(oPC)))));
            // Next player's turn
            SetCasinoGamePlayerTurn(oPC, FALSE);
            DelayCommand(4.0, CycleCasinoGamePlayers(oDealer));
        }

        else if (FindSubString(sCommand, "double") != -1 && GetLocalInt(oPC, "INITIATED_CASINO_GAME")) {
            int nDoubleWager = GetCasinoPlayerBet(oPC);
            if (GetGold(oPC) >= nDoubleWager) {
                ModifyCasinoPlayerBet(oPC, nDoubleWager);
                SetPCChatMessage("::Slides "+IntToString(nDoubleWager)+" next to the initial bet::");
                int nHitCard = DrawRandomCasinoCard(oDealer, GetCasinoGameDeckCount(oDealer));
                DelayCommand(2.0, AssignCommand(oDealer, SpeakString("Double down. ::Deals the "+GetCasinoCardName(nHitCard)+" face up to "+GetName(oPC)+"::")));
                DelayCommand(2.0, UpdateCasinoCardHand(oPC, nHitCard));
                DelayCommand(3.0, CasinoBlackjackTestHand(oDealer, oPC, FALSE, TRUE));
                DelayCommand(4.0, CycleCasinoGamePlayers(oDealer));
            }
            else {
                FloatingTextStringOnCreature("You don't have enough money for a double down.", oPC, FALSE);
            }
        }

        else if (FindSubString(sCommand, "split") != -1) {

        }

        else if (FindSubString(sCommand, "surrender") != -1) {

        }
    }
}

void BeginCasinoGameHoldem(object oDealer) {
    AssignCommand(oDealer, SpeakString("HOLD'EM INITIATED"));

    SetCasinoDealerBusy(oDealer, TRUE);

    // Rules settings
    int nDeckCount = GetCasinoGameDeckCount(oDealer);

    // Hand out the initial two cards to all players
    object oPlayer;
    int nFoundPlayers, i, d;
    int nTotalPlayers = CountCasinoGamePlayers(oDealer);
    for (i = 1; nFoundPlayers < nTotalPlayers; i++) {
        oPlayer = GetLocalObject(oDealer, "CASINO_GAME_LIST_PLAYER_"+GetNumberSuffix(i));
        if (oPlayer != OBJECT_INVALID) {
            nFoundPlayers++;
            d += 2;
            DelayCommand(IntToFloat(d), AssignCommand(oDealer, SpeakString("::Deals "+GetName(oPlayer)+"'s two hole cards::")));
            DelayCommand(IntToFloat(d), UpdateCasinoCardHand(oPlayer, DrawRandomCasinoCard(oDealer, nDeckCount)));
            DelayCommand(IntToFloat(d)+0.5, UpdateCasinoCardHand(oPlayer, DrawRandomCasinoCard(oDealer, nDeckCount)));
        }
    }

    // Draw out the five community cards.
    int nCard1 = DrawRandomCasinoCard(oDealer, nDeckCount);
    DelayCommand(IntToFloat(d)+2.0, UpdateCasinoCardHand(oDealer, nCard1));

    int nCard2 = DrawRandomCasinoCard(oDealer, nDeckCount);
    DelayCommand(IntToFloat(d)+2.4, UpdateCasinoCardHand(oDealer, nCard2));

    int nCard3 = DrawRandomCasinoCard(oDealer, nDeckCount);
    DelayCommand(IntToFloat(d)+2.8, UpdateCasinoCardHand(oDealer, nCard3));

    int nCard4 = DrawRandomCasinoCard(oDealer, nDeckCount);
    DelayCommand(IntToFloat(d)+3.2, UpdateCasinoCardHand(oDealer, nCard4));

    int nCard5 = DrawRandomCasinoCard(oDealer, nDeckCount);
    DelayCommand(IntToFloat(d)+3.6, UpdateCasinoCardHand(oDealer, nCard5));

    DelayCommand(IntToFloat(d)+4.0, AssignCommand(oDealer, SpeakString("::Deals two cards to self, flipping one face up, revealing the "+GetCasinoCardName(nCard2)+"::")));

    // First turn of the game
    DelayCommand(IntToFloat(d)+8.0, CycleCasinoGamePlayers(oDealer));
}

void CasinoCommandHoldem(object oPlayer, string sCommand) {
    if (IsCasinoGamePlayerTurn(oPlayer)) {

        object oDealer = GetCasinoDealerInGame(oPlayer);
        if (oDealer == OBJECT_INVALID) {
            FloatingTextStringOnCreature("ERROR: INVALID DEALER", oPlayer, FALSE);
        }

        if (FindSubString(sCommand, "fold") != -1) {
            SetPCChatMessage("::Returns the hand cards to the dealer::");
            DelayCommand(2.0, AssignCommand(oDealer, SpeakString("Fold.")));
            DelayCommand(4.0, ResetCasinoGame(oDealer));
        }
    }
}

//void main() {}
