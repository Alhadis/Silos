//::///////////////////////////////////////////////
//:: Erase
//:: SP_erase.nss
//:: 2011 Brian Meyer (Pain) 
//:://////////////////////////////////////////////
/*
	Transmutation
	Level:	Brd 1, Sor/Wiz 1
	Components:	V, S
	Casting Time:	1 standard action
	Range:	Touch
	Target:	One scroll or two pages
	Duration:	Instantaneous
	Saving Throw:	See text
	Spell Resistance:	No
	Erase removes writings of either magical or mundane nature from a scroll or from
	one or two pages of paper, parchment, or similar surfaces. With this spell, you
	can remove explosive runes, a glyph of warding, a sepia snake sigil, or an
	arcane mark, but not illusory script or a symbol spell. Nonmagical writing is
	automatically erased if you touch it and no one else is holding it. Otherwise,
	the chance of erasing nonmagical writing is 90%.
	
	Magic writing must be touched to be erased, and you also must succeed on a
	caster level check (1d20 + caster level) against DC 15. (A natural 1 or 2 is
	always a failure on this check.) If you fail to erase explosive runes, a glyph
	of warding, or a sepia snake sigil, you accidentally activate that writing
	instead.
*/

#include "_HkSpell"
#include "_SCInclude_Language"

void main()
{
	//--------------------------------------------------------------------------
	//Prep the spell
	//--------------------------------------------------------------------------
	object oCaster = OBJECT_SELF;
	int iSpellId = SPELL_ERASE; // put spell constant here
	int iClass = CLASS_TYPE_NONE;
	int iSpellLevel = 1;
	int iImpactSEF = VFX_HIT_SPELL_CONJURATION;
	int iAttributes = SCMETA_ATTRIBUTES_SOMANTICCOMP | SCMETA_ATTRIBUTES_VOCALCOMP;
	//--------------------------------------------------------------------------
	//Run Precast Code
	//--------------------------------------------------------------------------
	if (!HkPreCastHook( oCaster, iSpellId, SCMETA_DESCRIPTOR_LANGUAGE, iClass, iSpellLevel, SPELL_SCHOOL_TRANSMUTATION, SPELL_SUBSCHOOL_NONE, iAttributes ) )
	{
		return;
	}

	//--------------------------------------------------------------------------
	//Declare major variables
	//--------------------------------------------------------------------------
	int iCasterLevel = HkGetCasterLevel(oCaster);
	object  oTarget = HkGetSpellTarget();
	int iDuration = HkGetSpellDuration( oCaster, 30 );
	float   fDuration       = HkApplyMetamagicDurationMods( HkApplyDurationCategory(iDuration, SC_DURCATEGORY_TENMINUTES) );
	//int iDC = HkGetSpellSaveDC(oCaster, oTarget);
	//int iMetamagic = HkGetMetaMagicFeat();
	//location lTarget = HkGetSpellTargetLocation();
	//int iSpellPower = HkGetSpellPower(oCaster, 10);
	//int iDamageType = HkGetDamageType(DAMAGE_TYPE_NONE);
	//int iSaveType = HkGetSaveType(SAVING_THROW_TYPE_NONE);
	//int iSaveDC = HkGetSpellSaveDC();
	
	location lImpactLoc = HkGetSpellTargetLocation(); // GetLocation( oCreator );
	effect eImpactVis = EffectVisualEffect( iImpactSEF );
	ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVis, lImpactLoc);
	
	int iDurType = HkApplyMetamagicDurationTypeMods(DURATION_TYPE_TEMPORARY);
	
    //--------------------------------------------------------------------------
    // Effects
    //--------------------------------------------------------------------------
    effect eDurVis = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);  // Duration effect
    effect eImpVis = EffectVisualEffect(VFX_IMP_HEAD_MIND);

    	
	//--------------------------------------------------------------------------
	//Apply effects
	//--------------------------------------------------------------------------
    //SignalEvent(oCaster, EventSpellCastAt(oCaster, iSpellId, FALSE));
    //HkApplyEffectToObject(DURATION_TYPE_INSTANT, eImpVis, oCaster);
    //HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDurVis, oCaster, fDuration);
	
	// redisplay the book if it's open now, note this does not work if the gui is closed, but it should be open - if not there is a an issue so that is a good thing
	object oBook = GetLocalObject(oCaster, "CSLBOOK_VIEWING");
	if ( GetIsObjectValid( oBook) )
	{
		int iSpreadNumber = GetLocalInt(oBook, "CSLBOOK_CURRENTSPREAD");
		
		// hidden pages are not included, just zapping all the variables and redisplaying the book
		SetLocalString(oBook, "LEFTPAGE_"+IntToString(iSpreadNumber)+"_"+"_TEXTSTRING", "" );
		SetLocalString(oBook, "LEFTPAGE_"+IntToString(iSpreadNumber)+"_"+"_PICTURE", "" );
		SetLocalString(oBook, "LEFTPAGE_"+IntToString(iSpreadNumber)+"_"+"_LANGUAGE", "" );
		SetLocalString(oBook, "RIGHTPAGE_"+IntToString(iSpreadNumber)+"_"+"_TEXTSTRING", "" );
		SetLocalString(oBook, "RIGHTPAGE_"+IntToString(iSpreadNumber)+"_"+"_PICTURE", "" );
		SetLocalString(oBook, "RIGHTPAGE_"+IntToString(iSpreadNumber)+"_"+"_LANGUAGE", "" );
		
		SCBook_DisplaySpread( iSpreadNumber, oBook, oCaster );
	}
	
    HkPostCast(oCaster);
}


