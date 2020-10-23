int isDrow(object oCreature = OBJECT_SELF);
int isDuergar(object oCreature = OBJECT_SELF);
int isSvirfneblin(object oCreature = OBJECT_SELF);

// Variable names
const string VAR_I_AM_DROW = "I_AM_DROW";
const string VAR_I_AM_DUERGAR = "I_AM_DUERGAR";
const string VAR_I_AM_SVIRFNEBLIN = "I_AM_SVIRFNEBLIN";

int isDrow(object oCreature = OBJECT_SELF)
{
   // if previously set by this method, return quickly
   int nIsDrow = GetLocalInt(oCreature, VAR_I_AM_DROW);
   if (nIsDrow == TRUE) return TRUE;
   if (nIsDrow == -1) return FALSE;

   // Must be elven
   if (GetRacialType(oCreature) != RACIAL_TYPE_ELF) return FALSE;

   // Subrace == Drow?
   if (FindSubString(GetStringLowerCase(GetSubRace(oCreature)), "drow") != -1)
   {
      SetLocalInt(oCreature, VAR_I_AM_DROW, TRUE);
      return TRUE;
   }

   // Tag or name contains "drow"?
   if (FindSubString(GetStringLowerCase(GetTag(oCreature) + "~" +
      GetName(oCreature)), "drow") != -1)
   {
      SetLocalInt(oCreature, VAR_I_AM_DROW, TRUE);
      return TRUE;
   }

   SetLocalInt(oCreature, VAR_I_AM_DROW, -1);
   return TRUE;
}

int isDuergar(object oCreature = OBJECT_SELF)
{
   // if previously set by this method, return quickly
   int nIsDuergar = GetLocalInt(oCreature, VAR_I_AM_DUERGAR);
   if (nIsDuergar == TRUE) return TRUE;
   if (nIsDuergar == -1) return FALSE;

   // Must be dwarven
   if (GetRacialType(oCreature) != RACIAL_TYPE_DWARF) return FALSE;

   // Subrace == Duergar?
   if (FindSubString(GetStringLowerCase(GetSubRace(oCreature)), "duergar") != -1)
   {
      SetLocalInt(oCreature, VAR_I_AM_DUERGAR, TRUE);
      return TRUE;
   }

   // Tag or name contains "duergar"?
   if (FindSubString(GetStringLowerCase(GetTag(oCreature) + "~" +
      GetName(oCreature)), "duergar") != -1)
   {
      SetLocalInt(oCreature, VAR_I_AM_DUERGAR, TRUE);
      return TRUE;
   }

   SetLocalInt(oCreature, VAR_I_AM_DUERGAR, -1);
   return TRUE;
}

int isSvirfneblin(object oCreature = OBJECT_SELF)
{
   // if previously set by this method, return quickly
   int nIsSvirfneblin = GetLocalInt(oCreature, VAR_I_AM_SVIRFNEBLIN);
   if (nIsSvirfneblin == TRUE) return TRUE;
   if (nIsSvirfneblin == -1) return FALSE;

   // Must be gnomish
   if (GetRacialType(oCreature) != RACIAL_TYPE_GNOME) return FALSE;

   // Subrace == Svirfneblin?
   if (FindSubString(GetStringLowerCase(GetSubRace(oCreature)), "svirfneblin") != -1)
   {
      SetLocalInt(oCreature, VAR_I_AM_SVIRFNEBLIN, TRUE);
      return TRUE;
   }

   // Tag or name contains "svirfneblin"?
   if (FindSubString(GetStringLowerCase(GetTag(oCreature) + "~" +
      GetName(oCreature)), "svirfneblin") != -1)
   {
      SetLocalInt(oCreature, VAR_I_AM_SVIRFNEBLIN, TRUE);
      return TRUE;
   }

   SetLocalInt(oCreature, VAR_I_AM_SVIRFNEBLIN, -1);
   return TRUE;
}

//void main() {} // testing/compiling purposes
