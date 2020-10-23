void ck_F (vector vPos);

void main()
{
if (GetTag(OBJECT_SELF) == "gc_trig_kreis")
    {
    if (!GetLocalInt(GetObjectByTag("gc_sumcircle"),"goc_is_in_pentagram"))
        {
        SetLocalInt(GetObjectByTag("gc_sumcircle"), "goc_is_in_pentagram", 1);
        object oO = GetEnteringObject();
        if ((!GetIsPC(oO)) && (GetName(oO) != "Barantu")) return;
        object oKreis = GetObjectByTag("gc_sumcircle");
        vector vKreis  = GetPosition(oKreis);

        vector Flamme1 = Vector(vKreis.x-1.7f, vKreis.y+2.3f, -0.01f);
        vector Flamme2 = Vector(vKreis.x+1.6, vKreis.y+2.25, -0.01);
        vector Flamme3 = Vector(vKreis.x+2.5, vKreis.y-0.9, -0.01);
        vector Flamme4 = Vector(vKreis.x, vKreis.y-2.9, -0.01);
        vector Flamme5 = Vector(vKreis.x-2.6, vKreis.y-0.85, -0.01);

        ck_F(Flamme1);
        DelayCommand(0.5, ck_F(Flamme2));
        DelayCommand(1.0, ck_F(Flamme3));
        DelayCommand(1.5, ck_F(Flamme4));
        DelayCommand(2.0, ck_F(Flamme5));
        }
    else
        {
        DeleteLocalInt(GetObjectByTag("gc_sumcircle"), "goc_is_in_pentagram");
        object oFlammcheck = GetFirstObjectInArea(GetArea(OBJECT_SELF));
        while (GetIsObjectValid(oFlammcheck))
         {
         if (GetTag(oFlammcheck) == "goc_flamme")
          {
          DestroyObject(oFlammcheck);
          }
         oFlammcheck = GetNextObjectInArea(GetArea(OBJECT_SELF));
         }
        }
    }
if (GetTag(OBJECT_SELF) == "gc_bara_insel_enter")
    {
    object oPC = GetEnteringObject();
    if (!GetLocalInt(oPC, "gc_war_schon_bei_bara"))
     {
     AssignCommand(GetObjectByTag("goc_bara_insel"), ActionSpeakString("Das Rauschen der See tönt noch immer in deinen Ohren und du bist froh, dass du nach dem langen Rudern in der Nussschale endlich wieder festen Boden unter den Füßen hast."));
     SetLocalInt(oPC, "gc_war_schon_bei_bara", 1);
     return;
     }
    }
}

void ck_F (vector vPos)
{
 location lLoc = Location(GetArea(OBJECT_SELF), vPos ,0.0);
 CreateObject(OBJECT_TYPE_PLACEABLE, "gc_flamme", lLoc, FALSE, "goc_flamme");
}

