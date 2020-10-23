string GetPlayerPassword();
string GetDMPassword();

void SetPlayerPassword(string password);
void SetDMPassword(string password);

void ClearPlayerPassword();

string GetPlayerPassword()
{
    SetLocalString(GetModule(), "NWNX!ARELITH_ADMIN!GET_PLAYER_PASSWORD", " ");
    return GetLocalString(GetModule(), "NWNX!ARELITH_ADMIN!GET_PLAYER_PASSWORD");
}

string GetDMPassword()
{
    SetLocalString(GetModule(), "NWNX!ARELITH_ADMIN!GET_DM_PASSWORD", " ");
    return GetLocalString(GetModule(), "NWNX!ARELITH_ADMIN!GET_DM_PASSWORD");
}

void SetPlayerPassword(string password)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_ADMIN!SET_PLAYER_PASSWORD", password);
}

void SetDMPassword(string password)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_ADMIN!SET_DM_PASSWORD", password);
}

void ClearPlayerPassword()
{
    SetLocalString(GetModule(), "NWNX!ARELITH_ADMIN!CLEAR_PLAYER_PASSWORD", " ");
}