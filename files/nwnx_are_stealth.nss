// Sets whether OBJECT_SELF can be detected by obj.
void SetStealthRevealed(object obj);

// Sets whether OBJECT_SELF can be detected by their own party.
void SetStealthPartyRevealed(int state);

// Sets whether OBJECT_SELF can share their detected creatures with their own party.
void SetStealthDetectRevealed(int state);

// Sets the callback script which determines whether HIPS should be applied.
// Should call SetStealthSkipHIPS().
void SetStealthHIPSCallback(string script);

// Determines whether the currently executing HIPS event should process.
void SetStealthSkipHIPS(int state);

void SetStealthRevealed(object obj)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_STEALTH!REVEAL", ObjectToString(obj));
}

void SetStealthPartyRevealed(int state)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_STEALTH!REVEALPARTY", state ? "TRUE" : "FALSE");
}

void SetStealthDetectRevealed(int state)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_STEALTH!DETECTPARTY", state ? "TRUE" : "FALSE");
}

void SetStealthHIPSCallback(string script)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_STEALTH!REGISTER_HIPS_CALLBACK", script);
}

void SetStealthSkipHIPS(int state)
{
    SetLocalString(GetModule(), "NWNX!ARELITH_STEALTH!SKIP_HIPS", state ? "TRUE" : "FALSE");
}