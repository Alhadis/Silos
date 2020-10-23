//Kleines Ambienteschmankerl als Ausgleich der unbeschriebenen Kochstelle
void main()
{
object oGrandOpening = GetEnteringObject();
if (GetName(oGrandOpening,TRUE) == "Terry G. Willenset") return;
if (GetLocalInt(oGrandOpening, "ck_th_vi_kit") == 1) return;
AssignCommand(oGrandOpening, ActionSpeakString("*Das betreten dieses Raumes gleicht einem Portal in den Limbus. Das Chaos, was in dieser Küche herrscht, ist mit nichts zu vergleichen, was Ihr jemals zuvor erspäht habt und es scheint, als würde die Stapelbarkeit der Dinge in diesem Raum anderen Naturgesetzen unterliegen*"));
SetLocalInt(oGrandOpening, "ck_th_vi_kit",1);
if (GetGender(oGrandOpening) == GENDER_FEMALE)
    {
    int iSave1 = GetWillSavingThrow(oGrandOpening);
    int iSave2 = Random(20);
    int iSave = iSave1+iSave2;
    if (iSave <= 30)
        {
        DelayCommand(2.5, SendMessageToPC(oGrandOpening,
        "<cdd¡>Willenswurf gegen Putzfimmel:Misserfolg("
        +IntToString(iSave1)+
        "+"
        +IntToString(iSave2)+
        "="
        +IntToString(iSave)+
        ")</c><c¢dG>: Ihr verspürt den starken Drang das Chaos beseitigen zu wollen.</c>"));
        }
    return;
    }
}
