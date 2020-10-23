///////////////////////////////////////////////////////////////////////////////
// This script is for use with the personal ID scripts. It contains several
// functions for retrieving, storing, and resetting various information on PC
// ID cards and government ID databases.
///////////////////////////////////////////////////////////////////////////////

#include "tlj_inc_nbde"
#include "tlj_inc_events"

// VARIABLES & CONSTANTS //////////////////////////////////////////////////////

// This struct variable is for the various identity information stored on a
// PC's ID card.
struct IDCardStruct {string name; string id; string race; string sex; string age; int picture; int genuine;};

// This struct variable is for the various information stored on government
// databases involving PC identity.
struct IDRecordStruct {string name; string race; string sex; string age; int authorization; int criminal; string crimes; string employment; string other;};

// This is the tag of the ID card item that the PC carries around. SetIDCardData
// & GetIDCardData stores and retrieves information in this card respectively.
// It is case sensitive.
const string ID_CARD_TAG = "TLJ_ID_CARD";

// This is the name of the module's database. SetIDRecordData & GetIDRecordData
// stores and retrieves information in this database respectively. It is case
// sensitive.
const string DATABASE = "TLJ";

// FUNCTION DECLARATIONS //////////////////////////////////////////////////////

// This sets strIDCard data on oIDCard
void SetIDCardData(object oIDCard, struct IDCardStruct strIDCard);

// This sets ID record data of a PC into the module's database
// - nDatabase: The government database that the record is being stored in
// - sID: The ID number of the PC
// - strIDRecord: The struct containing the PC's ID data
//
// Note: This function writes several variables into the module's database at
// once and it is advised to use it inside a DelayCommand() to bring
// performance issues to a minimum.
void SetIDRecordData(int nDatabase, string sID, struct IDRecordStruct strIDRecord);

// This struct function retrieves the following from oPC's ID Card:
// - string name: The name of oPC
// - string id: The ID number of oPC
// - string race: The species of oPC
// - string sex: The sex of oPC
// - string age: The age of oPC
// - int picture: (1 or 2) if oPC has a valid picture
// - int genuine: The authenticity of the ID (1 - 4)
struct IDCardStruct GetIDCardData(object oIDCard);

// This struct function retrieves the following on a PC from nDatabase with sID:
// - string name: The name of the PC (Default: Unknown)
// - string race: The race of the PC (Default: Unknown)
// - string sex: The sex of oPC (Default: Unknown)
// - string age: The age of the PC (Default: Unknown)
// - int authorization: The authorization level of the PC (1 - 4)
// - int criminal: (1 or 2) if oPC is a wanted criminal
// - string crimes: A list of crimes committed by the PC (Default: None)
// - string employment: The current employment of the PC (Default: Unknown)
// - string other: Any additional information on the PC (Default: None)
struct IDRecordStruct GetIDRecordData(int nDatabase, string sID);

// This struct function generates default data for use on oPC's ID card
// - name: Pulled from oPC's character sheet
// - id: Randomly generated 6 digit number
// - race: Pulled from oPC's character sheet
// - sex: Pulled from oPC's character sheet
// - age: Pulled from oPC's character sheet
// - picture: 2
struct IDCardStruct GetIDCardDataDefaults(object oPC);

// This function returns one of the FACTION_* constants
// - oObject: This is either an ID scanner item, a Records Terminal, or the PC
//   in the DM ID tool conversation.
//int GetIDDatabase(object oObject);

// This returns the string name of one of the ID_DATABASE_* constants.
string GetRecordDatabaseName(int nDatabase);

// FUNCTION DEFINITIONS ///////////////////////////////////////////////////////

// Get a 6 digit ID number
string GetGeneratedIDNumber() {
    // Roll random numbers for the digits (0-9)
    string s1 = IntToString(d10() - 1);
    string s2 = IntToString(d10() - 1);
    string s3 = IntToString(d10() - 1);
    string s4 = IntToString(d10() - 1);
    string s5 = IntToString(d10() - 1);
    string s6 = IntToString(d10() - 1);
    // Create the number by putting together the 6 digits
    string sID = s1 + s2 + s3 + s4 + s5 + s6;
    return sID;
}

void SetIDCardData(object oIDCard, struct IDCardStruct strIDCard) {
    struct IDCardStruct strOldIDCard = GetIDCardData(oIDCard);

    if (strIDCard.name == "") strIDCard.name = strOldIDCard.name; // name
    SetLocalString(oIDCard, "NAME", strIDCard.name);
    if (strIDCard.name != "") { // We also set the card's name
        SetName(oIDCard, strIDCard.name + "'s ID Card");
    }

    if (strIDCard.id == "") strIDCard.id = strOldIDCard.id; // ID
    SetLocalString(oIDCard, "ID_NUMBER", strIDCard.id);

    if (strIDCard.race == "") strIDCard.race = strOldIDCard.race; // race
    SetLocalString(oIDCard, "RACE", strIDCard.race);

    if (strIDCard.sex == "") strIDCard.sex = strOldIDCard.sex; // sex
    SetLocalString(oIDCard, "SEX", strIDCard.sex);

    if (strIDCard.age == "") strIDCard.age = strOldIDCard.age; // age
    SetLocalString(oIDCard, "AGE", strIDCard.age);

    if (!strIDCard.picture) strIDCard.picture = strOldIDCard.picture; // picture
    SetLocalInt(oIDCard, "PICTURE", strIDCard.picture);

    if (!strIDCard.genuine) strIDCard.genuine = strOldIDCard.genuine; // genuine
    SetLocalInt(oIDCard, "GENUINE", strIDCard.genuine);
}

void SetIDRecordData(int nDatabase, string sID, struct IDRecordStruct strIDRecord) {
    string sDatabase = "ID_DB_" + IntToString(nDatabase);
    struct IDRecordStruct strOldIDRecord = GetIDRecordData(nDatabase, sID);

    if (strIDRecord.name == "") strIDRecord.name = strOldIDRecord.name; // name
    NBDE_SetCampaignString(DATABASE, sDatabase + sID + "NAME", strIDRecord.name);

    if (strIDRecord.race == "") strIDRecord.race = strOldIDRecord.race; // race
    NBDE_SetCampaignString(DATABASE, sDatabase + sID + "RACE", strIDRecord.race);

    if (strIDRecord.sex == "") strIDRecord.sex = strOldIDRecord.sex; // sex
    NBDE_SetCampaignString(DATABASE, sDatabase + sID + "SEX", strIDRecord.sex);

    if (strIDRecord.age == "") strIDRecord.age = strOldIDRecord.age; // age
    NBDE_SetCampaignString(DATABASE, sDatabase + sID + "AGE", strIDRecord.age);

    if (!strIDRecord.authorization) strIDRecord.authorization = strOldIDRecord.authorization; // authorization
    NBDE_SetCampaignInt(DATABASE, sDatabase + sID + "AUTHORIZATION", strIDRecord.authorization);

    if (!strIDRecord.criminal) strIDRecord.criminal = strOldIDRecord.criminal; // criminal
    NBDE_SetCampaignInt(DATABASE, sDatabase + sID + "CRIMINAL", strIDRecord.criminal);

    if (strIDRecord.crimes == "") strIDRecord.crimes = strOldIDRecord.crimes; // crimes
    NBDE_SetCampaignString(DATABASE, sDatabase + sID + "CRIMES", strIDRecord.crimes);

    if (strIDRecord.employment == "") strIDRecord.employment = strOldIDRecord.employment; // employment
    NBDE_SetCampaignString(DATABASE, sDatabase + sID + "EMPLOYMENT", strIDRecord.employment);

    if (strIDRecord.other == "") strIDRecord.other = strOldIDRecord.other; // other
    NBDE_SetCampaignString(DATABASE, sDatabase + sID + "OTHER", strIDRecord.other);
}

struct IDCardStruct GetIDCardData(object oIDCard) {
    // Variable declaration
    struct IDCardStruct strIDCard;

    // Pull the data from the ID card
    strIDCard.name = GetLocalString(oIDCard, "NAME");
    strIDCard.id = GetLocalString(oIDCard, "ID_NUMBER");
    strIDCard.race = GetLocalString(oIDCard, "RACE");
    strIDCard.sex = GetLocalString(oIDCard, "SEX");
    strIDCard.age = GetLocalString(oIDCard, "AGE");
    strIDCard.picture = GetLocalInt(oIDCard, "PICTURE");
    strIDCard.genuine = GetLocalInt(oIDCard, "GENUINE");

    return strIDCard;
}

struct IDRecordStruct GetIDRecordData(int nDatabase, string sID) {
    // Variable declaration
    struct IDRecordStruct strIDRecord;
    string sDatabase = "ID_DB_" + IntToString(nDatabase);

    // Pull the info from the database... if the database entries
    // are blank then they're set to a defined default state.
    string sName = NBDE_GetCampaignString(DATABASE, sDatabase + sID + "NAME");
    if (sName == "") sName = "Unknown";
    strIDRecord.name = sName;

    string sRace = NBDE_GetCampaignString(DATABASE, sDatabase + sID + "RACE");
    if (sRace == "") sRace = "Unknown";
    strIDRecord.race = sRace;

    string sSex = NBDE_GetCampaignString(DATABASE, sDatabase + sID + "SEX");
    if (sSex == "") sSex = "Unknown";
    strIDRecord.sex = sSex;

    string sAge = NBDE_GetCampaignString(DATABASE, sDatabase + sID + "AGE");
    if (sAge == "") sAge = "Unknown";
    strIDRecord.age = sAge;

    strIDRecord.authorization = NBDE_GetCampaignInt(DATABASE, sDatabase + sID + "AUTHORIZATION");

    strIDRecord.criminal = NBDE_GetCampaignInt(DATABASE, sDatabase + sID + "CRIMINAL");

    string sCrimes = NBDE_GetCampaignString(DATABASE, sDatabase + sID + "CRIMES");
    if (sCrimes == "") sCrimes = "None";
    strIDRecord.crimes = sCrimes;

    string sEmployment = NBDE_GetCampaignString(DATABASE, sDatabase + sID + "EMPLOYMENT");
    if (sEmployment == "") sEmployment = "Unknown";
    strIDRecord.employment = sEmployment;

    string sOther = NBDE_GetCampaignString(DATABASE, sDatabase + sID + "OTHER");
    if (sOther == "") sOther = "None";
    strIDRecord.other = sOther;

    return strIDRecord;
}

struct IDCardStruct GetIDCardDataDefaults(object oPC) {
    // Variable declaration
    struct IDCardStruct strIDCard;

    // Take the name from oPC
    strIDCard.name = GetName(oPC);

    // Generate a random 6 digit number & make sure it's not already being used
    strIDCard.id = GetGeneratedIDNumber();
    string sRecName = NBDE_GetCampaignString(DATABASE, "ID_DB_" + IntToString(OBJECT_FACTION_IMPERIAL) + strIDCard.id + "NAME");

    // This loop causes performance issues so it'll remain commented out for
    // now until it gets a fix. It's supposed to look up in the Imperial
    // database and see if the chosen ID number is already being used or not.
    while (sRecName != "") {
        strIDCard.id = GetGeneratedIDNumber();
        sRecName = NBDE_GetCampaignString(DATABASE, "ID_DB_" + IntToString(OBJECT_FACTION_IMPERIAL) + strIDCard.id + "NAME");
    }

    // Take the subrace from oPC... if that's blank then take the race from oPC
    strIDCard.race = GetSubRace(oPC);
    if (strIDCard.race == "") strIDCard.race = Get2DAString("racialtypes", "Label", GetRacialType(oPC));

    // Take the sex from oPC
    int nSex = GetGender(oPC);
    string sSex;
    if (nSex == GENDER_FEMALE) sSex = "Female";
    else sSex = "Male";
    strIDCard.sex = sSex;

    // Take the age from oPC
    strIDCard.age = IntToString(GetAge(oPC));

    // Set the picture to 2 (
    strIDCard.picture = 2;

    return strIDCard;
}

/*int GetIDDatabase(object oObject) {
    return GetFaction(oObject);
}*/

string GetRecordDatabaseName(int nDatabase) {
    switch (nDatabase) {
        case OBJECT_FACTION_ABRIDON: return "Abridon";
        case OBJECT_FACTION_ALLIANCE: return "Alliance";
        case OBJECT_FACTION_BAKURA: return "Bakura";
        case OBJECT_FACTION_BASTION: return "Bastion";
        case OBJECT_FACTION_BESPIN: return "Bespin";
        case OBJECT_FACTION_CORELLIA: return "Corellian";
        case OBJECT_FACTION_CORUSCANT: return "Coruscant";
        case OBJECT_FACTION_DANTOOINE: return "Dantooine";
        case OBJECT_FACTION_DURO: return "Duro";
        case OBJECT_FACTION_IMPERIAL: return "Imperial";
        case OBJECT_FACTION_KASHYYYK: return "Kashyyyk";
        case OBJECT_FACTION_MUSTAFAR: return "Mustafar";
        case OBJECT_FACTION_NABOO: return "Naboo";
        case OBJECT_FACTION_NAR_SHADDAA: return "Nar Shaddaa";
        case OBJECT_FACTION_NOVA_RYLOS: return "Nova Rylos";
        case OBJECT_FACTION_RYLOTH: return "Ryloth";
        case OBJECT_FACTION_SERENNO: return "Serenno";
        case OBJECT_FACTION_TANIS: return "Tanis";
        case OBJECT_FACTION_TATOOINE: return "Tatooine";
    }
    return "";
}

//void main() {}
