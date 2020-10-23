string sColors = "                                            !!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥§©©ª«¬­®¯°±²³´µ¶·¸¸º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïñòóôõö÷øùúûüýþþþ";
// Returns Pseudo-Ascii Character (for color use only, not accurate Ascii)
string ASCII(int iAsciiCode) // 0 - 255
{
    int ASCIIReturn = iAsciiCode;
    if (ASCIIReturn<0) ASCIIReturn = 0;
    else if (ASCIIReturn>255) ASCIIReturn = 255;
    return GetSubString(sColors,iAsciiCode+1,1);
}

// Returns Pseudo-Ascii Integer Value (for color use only, not accurate Ascii)
int ASCIIToInt(string sLookup)
{
    return FindSubString(sColors, sLookup)-1;
}

// Returns a Color Code Based on Pseudo-Ascii
string RGB(int iR, int iG, int iB) // 0-255
{
    return "<c"+ASCII(iR)+ASCII(iG)+ASCII(iB)+">";
}

const string TEXT_COLOR_RED    =  "þ  ";
const string TEXT_COLOR_ORANGE =  "þœ ";
const string TEXT_COLOR_YELLOW =  "þþ ";
const string TEXT_COLOR_GREEN  =  " þ ";
const string TEXT_COLOR_BLUE   =  "  þ";
const string TEXT_COLOR_CYAN   =  " þþ";
const string TEXT_COLOR_PURPLE =  "þ þ";
const string TEXT_COLOR_WHITE  =  "þþþ";
const string TEXT_COLOR_GREY   =  "~~~";
const string TEXT_COLOR_CRIMSON = "‘  ";
const string TEXT_COLOR_EMERALD = " ~ ";
const string TEXT_COLOR_BROWN   = "Ç~6";
const string TEXT_COLOR_AZURE   = "~~þ";


string RGBColorText(string RGBCode, string sText)
{
  return "<c"+ RGBCode +">"+ sText +"</c>";
}

//ColorText Function, uses either a color token or a 3-Digit Color Code
//Codes can be copied and pasted to item and placable names, descriptions, etc :)
string ColorText(string ColorCode, string sText)
{
       if (ColorCode == "crimson")      ColorCode = "<c‘  >";
  else if (ColorCode == "red")          ColorCode = "<cþ  >";
  else if (ColorCode == "plum")         ColorCode = "<cþww>";
  else if (ColorCode == "tangerine")    ColorCode = "<cÇZ >";
  else if (ColorCode == "orange")       ColorCode = "<cþœ >";
  else if (ColorCode == "peach")        ColorCode = "<cþÇ >";
  else if (ColorCode == "amber")        ColorCode = "<cœœ >";
  else if (ColorCode == "yellow")       ColorCode = "<cþþ >";
  else if (ColorCode == "lemon")        ColorCode = "<cþþw>";
  else if (ColorCode == "emerald")      ColorCode = "<c ~ >";
  else if (ColorCode == "green")        ColorCode = "<c þ >";
  else if (ColorCode == "lime")         ColorCode = "<cwþw>";
  else if (ColorCode == "midnight")     ColorCode = "<c  t>";
  else if (ColorCode == "navy")         ColorCode = "<c  ‘>";
  else if (ColorCode == "blue")         ColorCode = "<c  þ>";
  else if (ColorCode == "azure")        ColorCode = "<c~~þ>";
  else if (ColorCode == "skyblue")      ColorCode = "<cÇÇþ>";
  else if (ColorCode == "violet")       ColorCode = "<c¥ ¥>";
  else if (ColorCode == "purple")       ColorCode = "<cþ þ>";
  else if (ColorCode == "lavender")     ColorCode = "<cþ~þ>";
  else if (ColorCode == "black")        ColorCode = "<c   >";
  else if (ColorCode == "slate")        ColorCode = "<c666>";
  else if (ColorCode == "darkgrey")     ColorCode = "<cZZZ>";
  else if (ColorCode == "grey")         ColorCode = "<c~~~>";
  else if (ColorCode == "lightgrey")    ColorCode = "<c¯¯¯>";
  else if (ColorCode == "white")        ColorCode = "<cþþþ>";
  else if (ColorCode == "turquoise")    ColorCode = "<c ¥¥>";
  else if (ColorCode == "jade")         ColorCode = "<c tt>";
  else if (ColorCode == "cyan")         ColorCode = "<c þþ>";
  else if (ColorCode == "cerulean")     ColorCode = "<cœþþ>";
  else if (ColorCode == "aqua")         ColorCode = "<cZÇ¯>";
  else if (ColorCode == "silver")       ColorCode = "<c¿¯Ç>";
  else if (ColorCode == "rose")         ColorCode = "<cÎFF>";
  else if (ColorCode == "pink")         ColorCode = "<cþV¿>";
  else if (ColorCode == "wood")         ColorCode = "<c‘Z(>";
  else if (ColorCode == "brown")        ColorCode = "<cÇ~6>";
  else if (ColorCode == "tan")          ColorCode = "<cß‘F>";
  else if (ColorCode == "flesh")        ColorCode = "<cû¥Z>";
  else if (ColorCode == "ivory")        ColorCode = "<cþÎ¥>";
  else if (ColorCode == "gold")         ColorCode = "<cþ¿6>";
  else if (ColorCode == "random")
    {
        switch (d3())
        {
            case 1: ColorCode = RGB(Random(128)+128,Random(192)+64,Random(192)+64); break;
            case 2: ColorCode = RGB(Random(192)+64,Random(128)+128,Random(192)+64); break;
            case 3: ColorCode = RGB(Random(192)+64,Random(192)+64,Random(128)+128); break;
        }
    }

    return ColorCode + sText + "</c>";
}

int LoInt(int iInt1, int iInt2) {return (iInt1>iInt2)?iInt2:iInt1;}

int HiInt(int iInt1, int iInt2) {return (iInt1>iInt2)?iInt1:iInt2;}

string JumbleCode(string JColor1, string JColor2)
{
    string sR1=(GetSubString(JColor1,0,1));
    string sG1=(GetSubString(JColor1,1,1));
    string sB1=(GetSubString(JColor1,2,1));

    string sR2=(GetSubString(JColor2,0,1));
    string sG2=(GetSubString(JColor2,1,1));
    string sB2=(GetSubString(JColor2,2,1));

    int RHi=HiInt(ASCIIToInt(sR1),ASCIIToInt(sR2));
    int RLo=LoInt(ASCIIToInt(sR1),ASCIIToInt(sR2));
    int GHi=HiInt(ASCIIToInt(sG1),ASCIIToInt(sG2));
    int GLo=LoInt(ASCIIToInt(sG1),ASCIIToInt(sG2));
    int BHi=HiInt(ASCIIToInt(sB1),ASCIIToInt(sB2));
    int BLo=LoInt(ASCIIToInt(sB1),ASCIIToInt(sB2));

    return ASCII(Random(RHi-RLo)+RLo+1)+ASCII(Random(GHi-GLo)+GLo+1)+ASCII(Random(BHi-BLo)+BLo+1);
}

//Jumble Text randomly selects a color between Color1 and Color2
string JumbledText(string Color1, string Color2, string JumbleString)
{
    int j;
    string ReturnString;
    while (j<(GetStringLength(JumbleString)))
    {
        ReturnString = ReturnString+"<c"+JumbleCode(Color1,Color2)+">"+GetSubString(JumbleString,j,1)+"</c>";
        j++;
    }
    return ReturnString;
}

string ChaoticText(string RandomString)
{
    int i=1;
    string ReturnString;

    while (i<(GetStringLength(RandomString)+1))
    {
        ReturnString = ReturnString + ColorText("random",GetSubString(RandomString,i-1,1));
        i++;
    }
    return ReturnString;
}
