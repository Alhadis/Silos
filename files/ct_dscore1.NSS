void main()
{
object oPC = GetLastAttacker();
int DEX = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
int charscore = GetLocalInt(oPC, "dartscore");

int currenthit = (d20() + DEX);


if(currenthit <= 1)
DelayCommand(0.2, ActionSpeakString("You hit the border, 0 points"));

if (currenthit >=2 && currenthit <= 4)
DelayCommand(0.2, ActionSpeakString("You hit white, that's one point"));

if (currenthit >= 5 && currenthit <= 8)
DelayCommand(0.2, ActionSpeakString("You hit brown, that's two points"));

if (currenthit >= 9 && currenthit <= 12)
DelayCommand(0.2, ActionSpeakString("You hit blue, that's three points"));

if (currenthit >= 13 && currenthit <= 16)
DelayCommand(0.2, ActionSpeakString("You hit red, that's four points"));

if (currenthit >= 17)
DelayCommand(0.2, ActionSpeakString("Bullseye! That's five points"));
}