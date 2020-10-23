
void effectCenter (object oCenter)
{
location lCenter = GetLocation(oCenter);

object oPC = GetEnteringObject();

SpeakString("EffecCenter");      //debug string
DelayCommand(0.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HORRID_WILTING), lCenter));
 effect eDamage = EffectDamage(d10(2), DAMAGE_TYPE_ACID);
 ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
  effect eDamage1a = EffectDamage(d10(3), DAMAGE_TYPE_FIRE);
 DelayCommand(2.50,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage1a, oPC));
DelayCommand(7.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM ), lCenter));
 DelayCommand(7.00,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage1a, oPC));
DelayCommand(11.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_NATURES_BALANCE), lCenter));
DelayCommand(15.70,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWKILL), lCenter));
 effect eDamage1b = EffectDamage(d10(2), DAMAGE_TYPE_NEGATIVE);
 DelayCommand(15.70,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage1b, oPC));
DelayCommand(18.10,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ICESTORM), lCenter));
 effect eDamage2 = EffectDamage(d10(3), DAMAGE_TYPE_COLD);
 DelayCommand(18.10,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage2, oPC));
DelayCommand(21.30,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_IMPLOSION), lCenter));
 effect eDamage2a = EffectDamage(d10(3), DAMAGE_TYPE_NEGATIVE);
 DelayCommand(21.30,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage2a, oPC));
DelayCommand(21.30,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_BIGBYS_CLENCHED_FIST), lCenter));
DelayCommand(25.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), lCenter));

DelayCommand(25.50,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_CHARM), lCenter));
DelayCommand(27.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WEIRD), lCenter));
 effect eDamage5a = EffectDamage(d10(2), DAMAGE_TYPE_NEGATIVE);
 DelayCommand(27.00,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage5a, oPC));
DelayCommand(28.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION), lCenter));
DelayCommand(32.50,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), lCenter));
 effect eDamage7 = EffectDamage(d8(4), DAMAGE_TYPE_ELECTRICAL);
 DelayCommand(32.50,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage7, oPC));
DelayCommand(34.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_BIGBYS_CLENCHED_FIST), lCenter));
 effect eDamage7c = EffectDamage(d6(2), DAMAGE_TYPE_MAGICAL);
 DelayCommand(34.00,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage7c, oPC));
DelayCommand(35.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_BIGBYS_INTERPOSING_HAND), lCenter));
DelayCommand(36.10,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM ), lCenter));
 effect eDamage8 = EffectDamage(d20(3), DAMAGE_TYPE_NEGATIVE);
 DelayCommand(36.10,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage8, oPC));
}

void effectCoCenter (location lCenter)
{

SpeakString("EffectStone1");
DelayCommand(0.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HORRID_WILTING), lCenter));
DelayCommand(2.50,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), lCenter));
DelayCommand(5.30,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_MIND ), lCenter));
DelayCommand(7.30,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY  ), lCenter));
DelayCommand(9.10,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1  ), lCenter));
DelayCommand(11.20,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN  ), lCenter));
DelayCommand(15.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_IMPLOSION ), lCenter));
DelayCommand(16.80,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_MIND), lCenter));
DelayCommand(17.50,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ICESTORM), lCenter));
DelayCommand(18.20,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HORRID_WILTING ), lCenter));
DelayCommand(22.00,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY ), lCenter, 2.0));
DelayCommand(22.00,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PROT_PREMONITION  ), lCenter, 7.0));
DelayCommand(23.20,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM ), lCenter));
DelayCommand(25.35,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_BIGBYS_CRUSHING_HAND), lCenter));
DelayCommand(30.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION), lCenter));
DelayCommand(30.50,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_S), lCenter));
DelayCommand(32.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M ), lCenter));
DelayCommand(33.50,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_PULSE_COLD), lCenter));
DelayCommand(33.70,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_PULSE_NATURE ), lCenter));
DelayCommand(33.90,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_PULSE_WATER  ), lCenter));
DelayCommand(33.10,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_PULSE_HOLY ), lCenter));
DelayCommand(34.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_BIGBYS_CLENCHED_FIST), lCenter));
DelayCommand(35.00,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_BIGBYS_INTERPOSING_HAND), lCenter));
DelayCommand(36.10,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM ), lCenter));

}  //ende effectCoCenter

//erzeugt locations mit fRadius abstand vom zentrum weg, fDegrees winkel
location getNewCircLoc (object oCenter = OBJECT_SELF, float fRadius = 1.00, float fDegrees = 0.00)
{
location lTarget;
vector vOrigin = GetPosition(oCenter);
vector vAngle = AngleToVector(fDegrees);    //Vektor fuer Gradabweicheung
vector vComb = vOrigin+ (fRadius * vAngle);

lTarget = Location(GetArea(oCenter), vComb, fDegrees-180);
    object oValidation = GetFirstObjectInShape(SHAPE_SPHERE, 1.0, lTarget);
    if (oValidation != OBJECT_INVALID)
    {
     SpeakString("Location ist schon mit Objekt besetzt");
    }

return lTarget;
} //ende location erzeugen




void main()
{
float fdelay = 5.00 ;      //sollte auf jeden Fall ueber 5 sek gelassen werden

object oMainCenter = OBJECT_SELF;
location lCoCent1 = getNewCircLoc(OBJECT_SELF, 10.00, 30.00);
location lCoCent2 = getNewCircLoc(OBJECT_SELF, 10.00, 150.00);
location lCoCent3 = getNewCircLoc(OBJECT_SELF, 10.00, 270.00);

object oPC = GetEnteringObject();

    //while (oPC != OBJECT_INVALID)        //Effekte die auf alle Zuseher wirken sollen
    //{
     float fdelayL = fdelay;

            if(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC) != OBJECT_INVALID)
                DelayCommand(fdelayL,DestroyObject(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC)));
            if(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC) != OBJECT_INVALID)
                DelayCommand(fdelayL,DestroyObject(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC)));
            if(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC) != OBJECT_INVALID)
                DelayCommand(fdelayL,DestroyObject(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC)));
            if(GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC) != OBJECT_INVALID)
                DelayCommand(fdelayL,DestroyObject(GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC)));

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneDominated(), oPC, 41.0);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 41.0);
    // oPC = GetNextPC();
    //}    //ende while

DelayCommand(fdelay,effectCenter(oMainCenter));  //ruft die verschiedenen effektfunkt auf
DelayCommand(fdelay,effectCoCenter(lCoCent1));
DelayCommand(fdelay,effectCoCenter(lCoCent2));
DelayCommand(fdelay,effectCoCenter(lCoCent3));


} //ende main
