//::///////////////////////////////////////////////
//:: BODY TAILOR: include file
//:: btlr_* scripts
//:://////////////////////////////////////////////
/*
   allows restrictions for wings/tails.
   sets MAX for wings, tails, heads.
   and misc switches for control.

*/
//:://////////////////////////////////////////////
//:: Created By: bloodsong
//:: based on the mil tailor by Jake E. Fitch (Milambus Mandragon)
//:://////////////////////////////////////////////

//-- CONSTANTS for the soft MAX of each type;
//-- the wing/tail 2das can't go above 255 anyway.
//-- change these to reflect the max number of whatever
//-- that you have in your module. (or that the user may have in their override)q
//-- ie: you may not have 200 female human heads, though it is possible.
int WINGMAX     =   688;
int TAILMAX     =   652;

int HEADMIN     =   1;
int HEADMAX     =   255;

int HFHEADMAX   =   243;    //-- human female
int HMHEADMAX   =   199;    //-- human male
int AFHEADMAX   =   177;    //-- halfling female
int AMHEADMAX   =   170;    //-- halfling male
int EFHEADMAX   =   194;    //-- elf female
int EMHEADMAX   =   35;     //-- elf male
int GFHEADMAX   =   10;     //-- gnome female
int GMHEADMAX   =   35;     //-- gnome male
int DFHEADMAX   =   21;     //-- dwarf female
int DMHEADMAX   =   24;     //-- dwarf male
int OFHEADMAX   =   14;     //-- halforc female
int OMHEADMAX   =   30;     //-- halforc male

int CUSTOMPARTS =    2;     //-- set this to how many pc parts you have
                            //-- before it should switch up to part 255. default is 0, 1, 2.
int MAXPHENO    =    2;     //-- set to your highest phenotype you are using. 2 if you dont have pheno haks


//--CONSTANTS for switches;  set to 0 to turn off,  1 to turn on
int SKIP2DALINES    =   0;  //--my wings/tails skip 2da lines, so finding a blank
                //--is not an end-of-file indication. use 1 if your 2das skip,
                //--and then use the restrictions list and MAX constants
                //--to define the wing/tail limits.
                //--use 1 for CEP2/Universal Wings/Tails

int ALLOWBONEARM    =   1;  //-- anybody can get a palemaster arm
int ALLOWBONEREMOVAL=   1;  //-- palemasters can remove bone arms
int ALLOWRDDWING    =   1;  //-- anybody can get red dragon wings
int ALLOWRDDREMOVAL =   1;  //-- red dragon disciples can remove wings
int ALLOWEYES       =   1;  //-- let anybody get glowing eyes


// Modification by doxic
int MAXHORN  = 15;
int MAXCOLOR = 176;
int MIN_WING = 23;
int MIN_TAIL = 1;
int MAX_WING = 688;//27;
int MAX_TAIL = 652;//13;

//--REMOVED //-- allow monks to remove glowing eyes -- THEY CANT anyway.

//--notes on EYE numbers; i dont know what the real numbers are,
//-- so i set these as tracking numbers.
//-- 0=none, 1=red, 2=green, 3=yellow

//--RESTRICTION LISTS: WINGS/TAILS
/* instructions:
   you can set individual wings/tails or ranges of them
   to be un-selectable in the body shop tailor.
   for example, if you dont want people to have angel or demon wings,
   set a case # for those, like this:
   case CREATURE_WING_TYPE_ANGEL:
   case CREATURE_WING_TYPE_DEMON:
     return TRUE;

   you can also use straight numbers, which match the 2da line numbers.
   ie: demon = 1 and angel = 2. custom wings will use plain numbers.
   the scripts should skip blank 2da lines, but to make this process
   run more smoothly, you should indicate any large gaps in your 2da files,
   using the invalid range sets, thus:
     if(n >= 43 && n <= 93)  return TRUE;

   this will skip lines 43-93.

   if you touch nothing, there won't be any restrictions.
   you can still use the soft max constants to tell the scripts
   when to loop back to the beginning.

*/

#include "d0_functions_inc"

void BtlrDebug(object oPC, string sMsg)
{
    SendMessageToPC(oPC, sMsg);
}

int IsBetween(int iNum, int iFirst, int iSecond)
{
    return iNum >= iFirst && iNum <= iSecond;
}

int GetNextWingType(int iCurrent)
{
    iCurrent++;

    if(iCurrent < MIN_WING)return MIN_WING;
    if(iCurrent > MAX_WING)return MIN_WING;

    if(IsBetween(iCurrent, 28, 33) || IsBetween(iCurrent, 45, 58) || IsBetween(iCurrent, 69, 78))
    iCurrent = GetNextWingType(iCurrent+1);

    if(IsBetween(iCurrent, 106, 680))
    return 681;

    return iCurrent;
}
int GetPrevWingType(int iCurrent)
{
    iCurrent--;

    if(iCurrent > MAX_WING)return MAX_WING;
    if(iCurrent < MIN_WING)return MAX_WING;

    if(IsBetween(iCurrent, 28, 33) || IsBetween(iCurrent, 45, 58) || IsBetween(iCurrent, 69, 78))
    iCurrent = GetPrevWingType(iCurrent-1);

    if(IsBetween(iCurrent, 106, 680))
    return 105;

    return iCurrent;
}
//checks if n is a valid number; TRUE is INvalid, FALSE is valid
int WingIsInvalid(int n)
{
    if(n > MAX_WING)return TRUE;
    if(n < MIN_WING)return TRUE;
    if(IsBetween(n, 28, 33) || IsBetween(n, 45, 58) || IsBetween(n, 69, 78) || IsBetween(n, 106, 680))
    return TRUE;

    // if(n >= [low#] && n<= [high#])  return TRUE;
//--CEP2/Universal Wings/Tails 2 Blank Section (uncomment next line to use)
   // if(n >= 58 && n <= 109)  return TRUE;
//--CEP2/Universal Wings/Tails 2 FX Section (uncomment next line to disable selection of all fx)
//--(or set the soft MAX to either 58 or 109)
  // if(n >= 110 && n <= 256)  return TRUE;
    return FALSE;
}

int GetNextTailType(int iCurrent)
{
    iCurrent++;

    if(iCurrent < MIN_TAIL)return MIN_TAIL;
    if(iCurrent > MAX_TAIL)return MIN_TAIL;

    if(IsBetween(iCurrent, 615, 650))
    iCurrent = GetNextTailType(iCurrent + 1);

    if(IsBetween(iCurrent, 14, 559))
    return 560;

    return iCurrent;
}

int GetPrevTailType(int iCurrent)
{
    iCurrent--;

    if(iCurrent > MAX_TAIL)return MAX_TAIL;
    if(iCurrent < MIN_TAIL)return MAX_TAIL;

    if(IsBetween(iCurrent, 615, 650))
    iCurrent = GetPrevTailType(iCurrent - 1);

    if(IsBetween(iCurrent, 14, 559))
    return 13;

    return iCurrent;
}

//checks if n is a valid number; TRUE is INvalid, FALSE is valid
int TailIsInvalid(int n)
{
    if(n > MAX_TAIL)return TRUE;
    if(n < MIN_TAIL)return TRUE;

    if(IsBetween(n, 14, 559) || IsBetween(n, 615, 650))
    return TRUE;

    // if(n >= [low#] && n<= [high#])  return TRUE;
//--CEP2/Universal Wings/Tails 2 Blank Section (uncomment next line to use)
   // if(n >= 59 && n <= 109)  return TRUE;
//--CEP2/Universal Wings/Tails 2 FX Section (uncomment next line to disable selection of all fx)
//--(or set the soft MAX to either 59 or 109)
  // if(n >= 110 && n <= 256)  return TRUE;
    return FALSE;
}

int isValidHeadMale(int iCurrent, int iRace) {

  switch(iRace)
  {
    case APPEARANCE_TYPE_DWARF:
      if ( (iCurrent <= 13)
        || (iCurrent == 15)
        || (iCurrent == 19)
        || (iCurrent >= 21 && iCurrent <= 24) )
      {
        return TRUE;
      }
      break;

    case APPEARANCE_TYPE_ELF:
      if ( (iCurrent ==  1)
        || (iCurrent ==  4)
        || (iCurrent >=  6 && iCurrent <=  8)
        || (iCurrent == 10)
        || (iCurrent == 11)
        || (iCurrent == 13)
        || (iCurrent == 14)
        || (iCurrent >= 16 && iCurrent <= 22)
        || (iCurrent == 25)
        || (iCurrent >= 29 && iCurrent <= 34) )
      {
        return TRUE;
      }
      break;

    case APPEARANCE_TYPE_GNOME:
      if ( (iCurrent == 1)
        || (iCurrent >= 11 && iCurrent <= 13)
        || (iCurrent == 15)
        || (iCurrent == 16)
        || (iCurrent >= 19 && iCurrent <= 23)
        || (iCurrent == 34)
        || (iCurrent == 35) )
      {
        return TRUE;
      }
      break;

    case APPEARANCE_TYPE_HALF_ELF:
      if ( (iCurrent ==   1)
        || (iCurrent ==   4)
        || (iCurrent ==   5)
        || (iCurrent >=   7 && iCurrent <=  10)
        || (iCurrent ==  12)
        || (iCurrent ==  13)
        || (iCurrent >=  15 && iCurrent <=  35)
        || (iCurrent ==  39)
        || (iCurrent >=  42 && iCurrent <=  44)
        || (iCurrent >=  48 && iCurrent <=  52)
        || (iCurrent >=  55 && iCurrent <=  62)
        || (iCurrent >= 115 && iCurrent <= 123)
        || (iCurrent == 135)
        || (iCurrent == 138)
        || (iCurrent >= 145 && iCurrent <= 159)
        || (iCurrent >= 164 && iCurrent <= 178)
        || (iCurrent == 181)
        || (iCurrent == 182)
        || (iCurrent >= 184 && iCurrent <= 191)
        || (iCurrent == 193) )
      {
        return TRUE;
      }
      break;

    case APPEARANCE_TYPE_HUMAN:
      if ( iCurrent == 127                     ||
           iCurrent == 138                     ||
          (iCurrent >= 1   && iCurrent <= 18)  ||
          (iCurrent >= 20  && iCurrent <= 36)  ||
          (iCurrent >= 39  && iCurrent <= 40)  ||
          (iCurrent >= 42  && iCurrent <= 44)  ||
          (iCurrent >= 47  && iCurrent <= 62)  ||
          (iCurrent >= 100 && iCurrent <= 112) ||
          (iCurrent >= 115 && iCurrent <= 125) ||
          (iCurrent >= 129 && iCurrent <= 132) ||
          (iCurrent >= 134 && iCurrent <= 136) ||
          (iCurrent >= 140 && iCurrent <= 142) ||
          (iCurrent >= 145 && iCurrent <= 159) ||
          (iCurrent >= 163 && iCurrent <= 180) ||
          (iCurrent >= 182 && iCurrent <= 194) ||
          (iCurrent >= 196 && iCurrent <= 199))
      {
        return TRUE;
      }
      break;
    case APPEARANCE_TYPE_HALFLING:
      if ( (iCurrent <= 8)
        || (iCurrent == 10)
        || (iCurrent >= 12 && iCurrent <= 14)
        || (iCurrent >= 19 && iCurrent <= 24)
        || (iCurrent == 26) )
      {
        return TRUE;
      }
      break;
    case APPEARANCE_TYPE_HALF_ORC:
      if ( (iCurrent <= 17)
        || (iCurrent >= 20 && iCurrent <= 25)
        || (iCurrent == 30)
        || (iCurrent == 31) )
      {
        return TRUE;
      }
      break;
  }
  /* other appearance types are not handled */
  return FALSE;
}

int isValidHeadFemale(int iCurrent, int iRace) {

    switch(iRace)
    {
        case APPEARANCE_TYPE_DWARF:
            if ( (iCurrent == 1)
            || (iCurrent >= 4 && iCurrent <= 9)
            || (iCurrent == 11)
            || (iCurrent == 12)
            || (iCurrent == 14)
            || (iCurrent == 18)
            || (iCurrent == 20)
            || (iCurrent == 21) )
            {
                return TRUE;
            }
        break;

        case APPEARANCE_TYPE_ELF:
          if ( (iCurrent >=   6 && iCurrent <=  13)
            || (iCurrent >=  15 && iCurrent <=  23)
            || (iCurrent >=  29 && iCurrent <=  33)
            || (iCurrent ==  36)
            || (iCurrent ==  37)
            || (iCurrent >=  39 && iCurrent <=  42)
            || (iCurrent >=  47 && iCurrent <=  49)
            || (iCurrent >= 179 && iCurrent <= 182)
            || (iCurrent >= 190 && iCurrent <= 198) )
          {
            return TRUE;
          }
        break;

        case APPEARANCE_TYPE_GNOME:
          if (iCurrent == 7 ||
              iCurrent == 9 ||
              iCurrent == 10)
          {
            return TRUE;
          }
          break;

        case APPEARANCE_TYPE_HALF_ELF:
        case APPEARANCE_TYPE_HUMAN:
          if ( iCurrent == 42                      ||
              (iCurrent >= 1   && iCurrent <= 38)  ||
              (iCurrent >= 45  && iCurrent <= 64)  ||
              (iCurrent >= 100 && iCurrent <= 136) ||
              (iCurrent >= 138 && iCurrent <= 143) ||
              (iCurrent >= 145 && iCurrent <= 149) ||
              (iCurrent >= 156 && iCurrent <= 183) ||
              (iCurrent >= 187 && iCurrent <= 191) ||
              (iCurrent >= 195 && iCurrent <= 208) ||
              (iCurrent >= 210 && iCurrent <= 219) ||
              (iCurrent >= 221 && iCurrent <= 226) ||
              (iCurrent >= 228 && iCurrent <= 243))
          {
            return TRUE;
          }
          break;

        case APPEARANCE_TYPE_HALFLING:
          if (iCurrent == 1 ||
              iCurrent == 5 ||
              iCurrent == 8 ||
              iCurrent == 172 ||
             (iCurrent >= 11 && iCurrent <=  15) ||
             (iCurrent >= 161 && iCurrent <= 167))
          {
            return TRUE;
          }

        case APPEARANCE_TYPE_HALF_ORC:
          if (iCurrent == 1 ||
              iCurrent == 9 ||
              iCurrent == 10 ||
              iCurrent == 12 ||
              iCurrent == 15)
          {
            return TRUE;
          }
          break;
  }
  /* other appearance types are not handled */
  return FALSE;
}


int get_head_max(int iRace, int iGender) {
  if (iGender == GENDER_FEMALE) {
    switch (iRace) {
      case 0: return DFHEADMAX;
      case 1: return EFHEADMAX;
      case 2: return GFHEADMAX;
      case 4:
      case 6: return HFHEADMAX;
      case 3: return AFHEADMAX;
      case 5: return OFHEADMAX;
    }
  }
  // males and everything else /
  else {
    switch (iRace) {
      case 0: return DMHEADMAX;
      case 1: return EMHEADMAX;
      case 2: return GMHEADMAX;
      case 4:
      case 6: return HMHEADMAX;
      case 3: return AMHEADMAX;
      case 5: return OMHEADMAX;
    }
  }
  return 255;
}

int GetNextValidHead(int iCurrent, int iRace, int iGender) {
    int iMax = HEADMAX;// get_head_max(iRace, iGender);
    int i = iCurrent;

    do {
        i = 1 + (i % iMax);

        if (iGender == GENDER_FEMALE) {
            if (isValidHeadFemale(i, iRace) || GetHasSLTool(GetPCSpeaker()))
            return i;
        }
        else {
            if (isValidHeadMale(i, iRace) || GetHasSLTool(GetPCSpeaker()))
            return i;
        }
    } while (i != iCurrent);

    return iCurrent;
}

int GetPrevValidHead(int iCurrent, int iRace, int iGender) {
    int iMax = HEADMAX;//get_head_max(iRace, iGender);
    int i = iCurrent;

    do {
        i--;

        if (i < HEADMIN)
        i = iMax;

        if (iGender == GENDER_FEMALE) {
            if (isValidHeadFemale(i, iRace) || GetHasSLTool(GetPCSpeaker()))
            return i;
        }
        else {
            if (isValidHeadMale(i, iRace) || GetHasSLTool(GetPCSpeaker()))
            return i;
        }
    } while (i != iCurrent);

    return iCurrent;
}


//--OUTSIDE FUNCTIONS-----------------------------------------------
//-- do not modify stuff below

// Remove an effect of the given type
void RemoveEffectOfType(object oTarget, int nEffectType)
{
    effect eEff = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eEff)) {
        if ( GetEffectType(eEff) == nEffectType) {
            RemoveEffect(oTarget, eEff);
        }
        eEff = GetNextEffect(oTarget);
    }
}



//--sticks nFX eyes on oCreature
//--with routine by the guy who figured out how to figure out eye numbers,
//-- but didnt put his/her name on the scripts
void ApplyEyes(int nFX, object oCreature)
{
  int nGender = GetGender(oCreature);
  int nRace = GetAppearanceType(oCreature);
  //--FX EYE # LIST: 0=none, 1=red, 2=green, 3=yellow.  there.

  switch(nRace)
  {//-- this will make the races translate to proper advances on the fx constants.  trust me.
    case 0: nRace = 2; break;
    case 1: nRace = 4; break;
    case 2: nRace = 6; break;
    case 3: nRace = 8; break;
    case 4: nRace = 0; break;
    case 5: nRace = 10; break;
    default: nRace = 0; break;
  }

  switch (nFX)
  {
  case 1:
    {
    RemoveEffectOfType(oCreature, EFFECT_TYPE_VISUALEFFECT);
    effect eEyes = SupernaturalEffect(EffectVisualEffect( VFX_EYES_RED_FLAME_HUMAN_MALE+nGender+nRace));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEyes, oCreature);
    break;
    }
  case 2:
    {
    RemoveEffectOfType(oCreature, EFFECT_TYPE_VISUALEFFECT);
    effect eEyes = SupernaturalEffect(EffectVisualEffect( VFX_EYES_GREEN_HUMAN_MALE+nGender+nRace));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEyes, oCreature);
    break;
    }
  case 3:
    {
    RemoveEffectOfType(oCreature, EFFECT_TYPE_VISUALEFFECT);

    effect eEyes1 = SupernaturalEffect(EffectVisualEffect( VFX_EYES_GREEN_HUMAN_MALE+nGender+nRace));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEyes1, oCreature);

    effect eEyes2 = SupernaturalEffect(EffectVisualEffect( VFX_EYES_RED_FLAME_HUMAN_MALE+nGender+nRace));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEyes2, oCreature);
    break;
    }
  case 0:
    {
    RemoveEffectOfType(oCreature, EFFECT_TYPE_VISUALEFFECT);
    break;
    }
  }
}




string Get2DACheck(string sFile, int iRow)
{
   //-- this reads a string from the module...!?
    string sACBonus = GetLocalString(GetModule(), sFile + IntToString(iRow));
    //-- if the module string is blank...
    if (sACBonus == "")
    {  //--read the 2da of the file, for the MODEL column, on our current row.
        sACBonus = Get2DAString(sFile, "MODEL", iRow);

    if (sACBonus == "" && iRow != 0)//-- dont skip blank row 0, none
        {//-- if that is blank, we SKIP that line.
            sACBonus = "SKIP";
           //-- unless the LABEL row is also blank...
            string sCost = Get2DAString(sFile, "LABEL", iRow);
            if (sCost == "" && !SKIP2DALINES) sACBonus = "FAIL";
            //--AND we are not skipping blank 2da lines.
            //-- in which case its a FAIL.
        }
       //--store the 2da row/column value on the module.
        SetLocalString(GetModule(), sFile + IntToString(iRow), sACBonus);
    }
   //--this returns a number-string, or SKIP or FAIL.
    return sACBonus;
}



int GetCachedLimit(string sFile)
{
    if(!SKIP2DALINES)
    {//-- we're not skipping blank lines
      if(sFile == "wingmodel.2da")
      {  return WINGMAX;  }
      else //--its tails
      {  return TAILMAX;  }
    }
    //-- if we ARE skipping blank lines, we can find the max
    //-- line number of the 2da using this

    int iLimit = GetLocalInt(GetModule(), sFile + "Limit");

    if (iLimit == 0)
    {
        int iCount = 0;

        while (Get2DAString(sFile, "MODEL", iCount + 1) != "")
        {
            iCount++;
        }

        iLimit = iCount;
    }

    if (iLimit >= 256) iLimit = 255; //--error checking, gah.
    SetLocalInt(GetModule(), sFile + "Limit", iLimit);
    return iLimit;
}



//void main(){}
