/////////////// Universal Dye Kit v1.0 //////////////
//                                                 //
// Creator: Aesica                                 //
// Contact: aesicae@hotmail.com                    //
//                                                 //
// http://www.angelfire.com/goth/chantel/nwn       //
//                                                 //
// Description:  This universal dye kit was        //
//      designed to add to the customization       //
//      options available in HotU for armor        //
//      appearances.  The unique power function on //
//      the universal dye kit allows players to    //
//      cycle through and set any color available, //
//      and is a much tidier alternative than      //
//      trying to have 1 dye kit for every color   //
//      in the game.                               //
//                                                 //
//      An option exists (See the "Adjustable      //
//      Settings" section below) that allows the   //
//      module builder to disable any of the       //
//      "hidden" colors if so desired. By default, //
//      all of the hidden colors have been set     //
//      to TRUE.  (Enabled)
//                                                 //
// Use:  Place the [udk_onactivate] script in the  //
//      OnActivate part of the module, or simply   //
//      add [#include "udk_include"] and           //
//      [EnableDyeKitMenu();] to an existing       //
//      OnActivate script.                         //
//                                                 //
// Important:  You may use this dye kit package    //
//      however you please, and modify any part of //
//      it in whatever way you feel will best suit //
//      the needs of your mod, except for the      //
//      'About the Universal Dye Kit' part in the  //
//      dialog.  I ask that this part be left      //
//      unchanged, so that those who find problems //
//      can inform me, and so that those who would //
//      like to use it for their own modules may   //
//      easily find it.                            //
//                                                 //
// Problems:  If you experience any bugs in these  //
//      scripts, please check for the solution at  //
//      http://www.angelfire.com/goth/chantel/nwn  //
//      or, as a last resort, contact me and       //
//      inform me of the problem.  Please try to   //
//      be specific, in this case.                 //
//                                                 //
//                Thanks and enjoy!                //
/////////////////////////////////////////////////////
//
//                     - o -
//
///////////// Adjustable Settings ///////////////////
// Adjust these variables to TRUE or FALSE if you  //
// wish to allow/disallow any of the 'hidden'      //
// dye colors (the invisible bottom color row)     //
//                                                 //
// If you change any of these, don't forget to use //
// the Build Module command to recompile the       //
// scripts...or you can recompile them             //
// individually if you really want to.             //
/////////////////////////////////////////////////////

/*56*/  int COLOR_SILVER = TRUE;
/*57*/  int COLOR_OBSIDIAN = TRUE;
/*58*/  int COLOR_GOLD = TRUE;
/*59*/  int COLOR_COPPER = TRUE;
/*60*/  int COLOR_GREY = TRUE;
/*61*/  int COLOR_MIRROR = TRUE;
/*62*/  int COLOR_WHITE = TRUE;
/*63*/  int COLOR_BLACK = TRUE;

///////////// Adjustable Variable End //////////////


// Adjust the temporary value for the dye kit's color
void AdjustCurrentDyeKitColor(object oDyeKit, int iAmount);

// Send a message to the player detailing both the
// dye kit's original and current color value
void ShowDyeKitColorStatus(object oPlayer);

// Command used to initiate the dialog menu.
// Put this into your onactivate script.
// It will check for "UDK" as the first 3 letters of
// the tag on its own.
void EnableDyeKitMenu();

// Set the current color of the dye kit
void SetDyeKitColor();

// Send a message with the game's metal colors
void ShowMetalList();

// Send a message with the game's cloth/leather colors
void ShowClothList();


void ShowDyeKitColorStatus(object oPlayer)
{
  int iCurrentColor = GetLocalInt(OBJECT_SELF, "CurrentDyeColor");
  int iOriginalColor = GetLocalInt(OBJECT_SELF, "OriginalDyeColor");
  string sMessage = "<cžžž>Original[" + IntToString(iOriginalColor) + "]</c>  <cþþþ>Current: [" + IntToString(iCurrentColor) + "]</c>";

  SendMessageToPC(OBJECT_SELF, sMessage);
}


void AdjustCurrentDyeKitColor(object oDyeKit, int iAmount)
{
  // Last 2 characters in a dye kit's tag define the
  // the color value
  int iColor = GetLocalInt(OBJECT_SELF, "CurrentDyeColor");

  // Adjust color
  iColor = iColor + iAmount;

  // Cycle through to skip disabled colors
  if (iAmount > 0)
  {
    if (COLOR_SILVER == FALSE && iColor == 56)
      iColor++;

    if (COLOR_OBSIDIAN == FALSE && iColor == 57)
      iColor++;

    if (COLOR_GOLD == FALSE && iColor == 58)
      iColor++;

    if (COLOR_COPPER == FALSE && iColor == 59)
      iColor++;

    if (COLOR_GREY == FALSE && iColor == 60)
      iColor++;

    if (COLOR_MIRROR == FALSE && iColor == 61)
      iColor++;

    if (COLOR_WHITE == FALSE && iColor == 62)
      iColor++;

    if (COLOR_BLACK == FALSE && iColor == 63)
      iColor++;
  }


  // Wraparound
  if (iColor > 63)
    iColor = iColor - 64;

  if (iColor < 0)
    iColor = iColor + 64;

  // Cycle through to skip disabled colors
  if (iAmount < 0)
  {
    if (COLOR_BLACK == FALSE && iColor == 63)
      iColor--;

    if (COLOR_WHITE == FALSE && iColor == 62)
      iColor--;

    if (COLOR_MIRROR == FALSE && iColor == 61)
      iColor--;

    if (COLOR_GREY == FALSE && iColor == 60)
      iColor--;

    if (COLOR_COPPER == FALSE && iColor == 59)
      iColor--;

    if (COLOR_GOLD == FALSE && iColor == 58)
      iColor--;

    if (COLOR_OBSIDIAN == FALSE && iColor == 57)
      iColor--;

    if (COLOR_SILVER == FALSE && iColor == 56)
      iColor--;
  }

  // Adjust and set new value
  SetLocalInt(OBJECT_SELF, "CurrentDyeColor", iColor);
}

void EnableDyeKitMenu()
{
  object oItem = GetItemActivated();
  object oActivator = GetItemActivator();
  string sTag = GetStringLeft(GetTag(oItem), 3);
  int iColor = StringToInt(GetStringRight(GetTag(oItem), 2));

  if (sTag == "UDK")
  {
    SetLocalObject(oActivator, "DyeKit", oItem);
    SetLocalInt(oActivator, "CurrentDyeColor", iColor);
    SetLocalInt(oActivator, "OriginalDyeColor", iColor);

    AssignCommand(oActivator, ActionStartConversation(OBJECT_SELF, "udk_dialog", TRUE));
  }
}

void SetDyeKitColor()
{
  object oDyeKit = GetLocalObject(OBJECT_SELF, "DyeKit");
  int iCurrentColor = GetLocalInt(OBJECT_SELF, "CurrentDyeColor");
  string sTag = GetTag(oDyeKit);
  string sNewTag = GetStringLeft(sTag, GetStringLength(sTag) - 2);

  if (iCurrentColor > 9)
    sNewTag = sNewTag + IntToString(iCurrentColor);

  if (iCurrentColor < 10)
    sNewTag = sNewTag + "0" + IntToString(iCurrentColor);

  CopyObject(oDyeKit, GetLocation(OBJECT_SELF), OBJECT_SELF, sNewTag);
  DestroyObject(oDyeKit);
}

void ShowClothList()
{
  string sMessage;

  sMessage = sMessage + "00 = Lightest Tan/Brown\n";
  sMessage = sMessage + "01 = Light Tan/Brown\n";
  sMessage = sMessage + "02 = Dark Tan/Brown\n";
  sMessage = sMessage + "03 = Darkest Tan/Brown\n";

  sMessage = sMessage + "04 = Lightest Tan/Red\n";
  sMessage = sMessage + "05 = Light Tan/Red\n";
  sMessage = sMessage + "06 = Dark Tan/Red\n";
  sMessage = sMessage + "07 = Darkest Tan/Red\n";

  sMessage = sMessage + "08 = Lightest Tan/Yellow\n";
  sMessage = sMessage + "09 = Light Tan/Yellow\n";
  sMessage = sMessage + "10 = Dark Tan/Yellow\n";
  sMessage = sMessage + "11 = Darkest Tan/Yellow\n";

  sMessage = sMessage + "12 = Lightest Tan/Grey\n";
  sMessage = sMessage + "13 = Light Tan/Grey\n";
  sMessage = sMessage + "14 = Dark Tan/Grey\n";
  sMessage = sMessage + "15 = Darkest Tan/Grey\n";

  sMessage = sMessage + "16 = Lightest Olive\n";
  sMessage = sMessage + "17 = Light Olive\n";
  sMessage = sMessage + "18 = Dark Olive\n";
  sMessage = sMessage + "19 = Darkest Olive\n";

  sMessage = sMessage + "20 = White\n";
  sMessage = sMessage + "21 = Light Grey\n";
  sMessage = sMessage + "22 = Dark Grey\n";
  sMessage = sMessage + "23 = Black\n";

  sMessage = sMessage + "24 = Light Blue\n";
  sMessage = sMessage + "25 = Dark Blue\n";

  sMessage = sMessage + "26 = Light Aqua\n";
  sMessage = sMessage + "27 = Dark Aqua\n";

  sMessage = sMessage + "28 = Light Teal\n";
  sMessage = sMessage + "29 = Dark Teal\n";

  sMessage = sMessage + "30 = Light Green\n";
  sMessage = sMessage + "31 = Dark Green\n";

  sMessage = sMessage + "32 = Light Yellow\n";
  sMessage = sMessage + "33 = Dark Yellow\n";

  sMessage = sMessage + "34 = Light Orange\n";
  sMessage = sMessage + "35 = Dark Orange\n";

  sMessage = sMessage + "36 = Light Red\n";
  sMessage = sMessage + "37 = Dark Red\n";

  sMessage = sMessage + "38 = Light Pink\n";
  sMessage = sMessage + "39 = Dark Pink\n";

  sMessage = sMessage + "40 = Light Purple\n";
  sMessage = sMessage + "41 = Dark Purple\n";

  sMessage = sMessage + "42 = Light Violet\n";
  sMessage = sMessage + "43 = Dark Violet\n";

  sMessage = sMessage + "44 = Shiny White\n";
  sMessage = sMessage + "45 = Shiny Black\n";

  sMessage = sMessage + "46 = Shiny Blue\n";
  sMessage = sMessage + "47 = Shiny Aqua\n";

  sMessage = sMessage + "48 = Shiny Teal\n";
  sMessage = sMessage + "49 = Shiny Green\n";

  sMessage = sMessage + "50 = Shiny Yellow\n";
  sMessage = sMessage + "51 = Shiny Orange\n";

  sMessage = sMessage + "52 = Shiny Red\n";
  sMessage = sMessage + "53 = Shiny Pink\n";

  sMessage = sMessage + "54 = Shiny Purple\n";
  sMessage = sMessage + "55 = Shiny Violet\n";

  if (COLOR_SILVER == TRUE)
    sMessage = sMessage + "56 = Hidden: Silver\n";
  if (COLOR_OBSIDIAN == TRUE)
    sMessage = sMessage + "57 = Hidden: Obsidian\n";
  if (COLOR_GOLD == TRUE)
    sMessage = sMessage + "58 = Hidden: Gold\n";
  if (COLOR_COPPER == TRUE)
    sMessage = sMessage + "59 = Hidden: Copper\n";
  if (COLOR_GREY == TRUE)
    sMessage = sMessage + "60 = Hidden: Grey\n";
  if (COLOR_MIRROR == TRUE)
    sMessage = sMessage + "61 = Hidden: Mirror\n";
  if (COLOR_WHITE == TRUE)
    sMessage = sMessage + "62 = Hidden: Absolute White\n";
  if (COLOR_BLACK == TRUE)
    sMessage = sMessage + "63 = Hidden: Absolute Black\n";

  SendMessageToPC(OBJECT_SELF, sMessage);
}

void ShowMetalList()
{
  string sMessage;

  sMessage = sMessage + "00 = Lightest Shiny Silver\n";
  sMessage = sMessage + "01 = Light Shiny Silver\n";
  sMessage = sMessage + "02 = Dark Shiny Obsidian\n";
  sMessage = sMessage + "03 = Darkest Shiny Obsidian\n";

  sMessage = sMessage + "04 = Lightest Dull Silver\n";
  sMessage = sMessage + "05 = Light Dull Silver\n";
  sMessage = sMessage + "06 = Dark Dull Obsidian\n";
  sMessage = sMessage + "07 = Darkest Dull Obsidian\n";

  sMessage = sMessage + "08 = Lightest Gold\n";
  sMessage = sMessage + "09 = Light Gold\n";
  sMessage = sMessage + "10 = Dark Gold\n";
  sMessage = sMessage + "11 = Darkest Gold\n";

  sMessage = sMessage + "12 = Lightest Celestial Gold\n";
  sMessage = sMessage + "13 = Light Celestial Gold\n";
  sMessage = sMessage + "14 = Dark Celestial Gold\n";
  sMessage = sMessage + "15 = Darkest Celestial Gold\n";

  sMessage = sMessage + "16 = Lightest Copper\n";
  sMessage = sMessage + "17 = Light Copper\n";
  sMessage = sMessage + "18 = Dark Copper\n";
  sMessage = sMessage + "19 = Darkest Copper\n";

  sMessage = sMessage + "20 = Lightest Brass\n";
  sMessage = sMessage + "21 = Light Brass\n";
  sMessage = sMessage + "22 = Dark Brass\n";
  sMessage = sMessage + "23 = Darkest Brass\n";

  sMessage = sMessage + "24 = Light Red\n";
  sMessage = sMessage + "25 = Dark Red\n";
  sMessage = sMessage + "26 = Light Dull Red\n";
  sMessage = sMessage + "27 = Dark Dull Red\n";

  sMessage = sMessage + "28 = Light Purple\n";
  sMessage = sMessage + "29 = Dark Purple\n";
  sMessage = sMessage + "30 = Light Dull Purple\n";
  sMessage = sMessage + "31 = Dark Dull Purple\n";

  sMessage = sMessage + "32 = Light Blue\n";
  sMessage = sMessage + "33 = Dark Blue\n";
  sMessage = sMessage + "34 = Light Dull Blue\n";
  sMessage = sMessage + "35 = Dark Dull Blue\n";

  sMessage = sMessage + "36 = Light Teal\n";
  sMessage = sMessage + "37 = Dark Teal\n";
  sMessage = sMessage + "38 = Light Dull Teal\n";
  sMessage = sMessage + "39 = Dark Dull Teal\n";

  sMessage = sMessage + "40 = Light Green\n";
  sMessage = sMessage + "41 = Dark Green\n";
  sMessage = sMessage + "42 = Light Dull Green\n";
  sMessage = sMessage + "43 = Dark Dull Green\n";

  sMessage = sMessage + "44 = Light Olive\n";
  sMessage = sMessage + "45 = Dark Olive\n";
  sMessage = sMessage + "46 = Light Dull Olive\n";
  sMessage = sMessage + "47 = Dark Dull Olive\n";

  sMessage = sMessage + "48 = Light Prismatic\n";
  sMessage = sMessage + "49 = Dark Prismatic\n";

  sMessage = sMessage + "50 = Lightest Rust\n";
  sMessage = sMessage + "51 = Light Rust\n";
  sMessage = sMessage + "52 = Dark Rust\n";
  sMessage = sMessage + "53 = Darkest Rust\n";

  sMessage = sMessage + "54 = Light Aged Metal\n";
  sMessage = sMessage + "55 = Dark Aged Metal\n";

  if (COLOR_SILVER == TRUE)
    sMessage = sMessage + "56 = Hidden: Silver\n";
  if (COLOR_OBSIDIAN == TRUE)
    sMessage = sMessage + "57 = Hidden: Obsidian\n";
  if (COLOR_GOLD == TRUE)
    sMessage = sMessage + "58 = Hidden: Gold\n";
  if (COLOR_COPPER == TRUE)
    sMessage = sMessage + "59 = Hidden: Copper\n";
  if (COLOR_GREY == TRUE)
    sMessage = sMessage + "60 = Hidden: Grey\n";
  if (COLOR_MIRROR == TRUE)
    sMessage = sMessage + "61 = Hidden: Mirror\n";
  if (COLOR_WHITE == TRUE)
    sMessage = sMessage + "62 = Hidden: Absolute White\n";
  if (COLOR_BLACK == TRUE)
    sMessage = sMessage + "63 = Hidden: Absolute Black\n";

  SendMessageToPC(OBJECT_SELF, sMessage);
}
