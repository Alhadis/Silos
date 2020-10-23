int GetMaxPlayersInTempDB();

void DeleteTempMoschDB();

string GetRankingList(int nPlace, object oDebug=OBJECT_INVALID);

int GetKillCounter(object oPlayer);

int GetKillCounterByPCPlayerName(string sPCPlayerName);

int GetIsPlayerAddedToTempDB(object oPlayer);

void IncreaseKillCounter(object oPlayer);

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

void DeleteTempMoschDB()
{
  int nMaxPlayersStored = GetMaxPlayersInTempDB();
  int i;
  string sPlayerStored;

  for(i=1; i <= nMaxPlayersStored; i++)
  {
     sPlayerStored = GetLocalString(GetModule(), "MOSCH_PLAYER_"+IntToString(i));

     DeleteLocalString(GetModule(), "MOSCH_PLAYER_"+IntToString(i));
     DeleteLocalInt(GetModule(), "MOSCH_NPCS_KILLED_"+sPlayerStored);
  }

  DeleteLocalInt(GetModule(), "MOSCH_MAX_PLAYERS");
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

int GetIsPlayerStringInSaveList(string sPlayerString, string sSaveList)
{
   int nSubString   = FindSubString(sSaveList, sPlayerString);

   if(nSubString == -1) return FALSE;

  return TRUE;
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

string GetRankingList(int nPlace, object oDebug=OBJECT_INVALID)
{
  int nMaxPlayersStored = GetMaxPlayersInTempDB();
  int i, i2, nValue, nStatus;
  string sPlayerStored, sReturnString, sSaveList;

  if(nPlace > nMaxPlayersStored)
  return "";

  for(i=1; i<=nPlace;i++)
  {
     //AdvDebug(oDebug, "For-Schleife: "+IntToString(i));
     sReturnString = "";
     nValue        = 0;

     // Lets find the Player with the most kills, but the one not already listed
     for(i2=1;i2<=nMaxPlayersStored;i2++)
     {
        sPlayerStored  = GetLocalString(GetModule(), "MOSCH_PLAYER_"+IntToString(i2));
        nStatus        = GetLocalInt(GetModule(), "MOSCH_NPCS_KILLED_"+sPlayerStored);

        if(nStatus >= nValue &&
          !GetIsPlayerStringInSaveList(sPlayerStored, sSaveList))
        {
           nValue        = nStatus;
           sReturnString = sPlayerStored;

           //AdvDebug(oDebug, "nValue: "+IntToString(nStatus)+", sReturnString: "+sReturnString);
        }
     }

     sSaveList += sReturnString+"|";
     //AdvDebug(oDebug, "sSaveList: "+sSaveList);
     //AdvDebug(oDebug, "__________________________________________");
  }

     //AdvDebug(oDebug, "End: sSaveList: "+sSaveList);
     //AdvDebug(oDebug, "End: sReturnString: "+sReturnString);
     //AdvDebug(oDebug, "__________________________________________");

 return sReturnString;
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

int GetMaxPlayersInTempDB()
{
  int nMaxPlayersStored = GetLocalInt(GetModule(), "MOSCH_MAX_PLAYERS");

 return nMaxPlayersStored;
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

int GetIsPlayerAddedToTempDB(object oPlayer)
{
   int nMaxPlayersStored = GetMaxPlayersInTempDB();
   string sPlayerStored  = GetLocalString(GetModule(), "MOSCH_PLAYER_1");
   int i;

   for(i=1;i <= nMaxPlayersStored;i++)
   {
      sPlayerStored  = GetLocalString(GetModule(), "MOSCH_PLAYER_"+IntToString(i));

      if(GetPCPlayerName(oPlayer) == sPlayerStored)
      {
        return TRUE;
        break;
      }
   }

  return FALSE;
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

int GetKillCounter(object oPlayer)
{
  int nStatus = GetLocalInt(GetModule(), "MOSCH_NPCS_KILLED_"+GetPCPlayerName(oPlayer));

  return nStatus;
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

int GetKillCounterByPCPlayerName(string sPCPlayerName)
{
  int nStatus = GetLocalInt(GetModule(), "MOSCH_NPCS_KILLED_"+sPCPlayerName);

  return nStatus;
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

void AddPlayerToTempDB(object oPlayer)
{
   int nMaxPlayersStored = GetMaxPlayersInTempDB()+1;

   if(!GetIsPlayerAddedToTempDB(oPlayer))
   {
       SetLocalString(GetModule(), "MOSCH_PLAYER_"+IntToString(nMaxPlayersStored), GetPCPlayerName(oPlayer));
       SetLocalInt(GetModule(), "MOSCH_MAX_PLAYERS", nMaxPlayersStored);
   }
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

void IncreaseKillCounter(object oPlayer)
{
   int nStatus = GetLocalInt(GetModule(), "MOSCH_NPCS_KILLED_"+GetPCPlayerName(oPlayer)) +1;

   SetLocalInt(GetModule(), "MOSCH_NPCS_KILLED_"+GetPCPlayerName(oPlayer), nStatus);
   AddPlayerToTempDB(oPlayer);
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

void DeleteMoschInteger(object oPC)
{
    DeleteLocalString(oPC, "MOS_List_Entry");
    DeleteLocalString(oPC, "MOS_List_String");

    DelayCommand(0.5, DeleteLocalInt(oPC, "MOS_List_Token_Position"));
    DelayCommand(0.5, DeleteLocalInt(oPC, "MOS_List_Next"));
    DelayCommand(0.5, DeleteLocalInt(oPC, "MOS_List_Prev"));
    DelayCommand(0.5, DeleteLocalInt(oPC, "MOS_MENUPAGE"));
    DelayCommand(0.5, DeleteLocalInt(oPC, "sTool_SetVar"));
}

//**------------------------------------------------------------------------**\\
//**------------------------------------------------------------------------**\\

//void main(){}
