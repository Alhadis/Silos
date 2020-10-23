// WOD INCLUDE FILE //
#include "x3_inc_string"

//void main(){}
// FUNCTION DEC //

int getBlood(object oPC);

void setBlood(object oPC, int value);

void displayBlood(object oPC);

void decBlood(object oPC, int inc);

void incBlood(object oPC, int inc);

// Checks if the blood pool is empty. Returns 0 or 1
int checkBlood (object oPC);

void frenzy(object oPC);

// Function Imp

int getBlood(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");
    int currentBlood = GetLocalInt(oItem,"bloodcount");
    return currentBlood;

}

void setBlood(object oPC,int value)
{
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");
    SetLocalInt(oItem,"bloodcount", value);
}

void displayBlood(object oPC)
{
   int currentBlood = getBlood(oPC);
   string redBlood = StringToRGBString("|", "700");
   string sMessage = "Blood ";

   if(currentBlood <= 0)
   {
        sMessage = "Out of blood";
        //Damage the player or something
   }
   else
   {
    sMessage += IntToString(currentBlood) + ": ";
       while(currentBlood > 0)
       {
            sMessage += redBlood;
            currentBlood--;
       }
   }
   SendMessageToPC(oPC, sMessage);
}

void decBlood(object oPC,int inc)
{
    int currentBlood = getBlood(oPC);
    currentBlood-= inc;
    setBlood(oPC,currentBlood);
}

void incBlood(object oPC, int inc)
{
    int currentBlood = getBlood(oPC);
    currentBlood+= inc;
    setBlood(oPC,currentBlood);
}

int checkBlood(object oPC)
{
    int currentBlood = getBlood(oPC);
    if(currentBlood <= 0)
        return FALSE;
    else
        return TRUE;
}

void frenzy(object oPC)
{
        if(!(WillSave(oPC, 10 + GetLocalInt(oPC, "frenzy"))))
        {
            BlackScreen(oPC);
            effect frenzyActive =  EffectVisualEffect(8227);
            DelayCommand(5.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, frenzyActive, oPC, 60.0));
            FloatingTextStringOnCreature("The beast has taken over!", oPC);
            SendMessageToPC(oPC,"The beast has taken over due to your lack of blood.");
            effect confuse = EffectConfused();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,confuse, oPC, 60.0);
            SetCutsceneMode(oPC, TRUE);
            DelayCommand(60.0,FadeFromBlack(oPC));
            DelayCommand(60.0,SetCutsceneMode(oPC, FALSE));

        }
        else
        {
            SetLocalInt(oPC,"frenzy",GetLocalInt(oPC,"frenzy") + 1);
        }
}
