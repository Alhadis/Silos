/*:://////////////////////////////////////////////
//:: Spell Name Imprisonment : On Enter
//:: Spell FileName PHS_S_ImprisonA
//:://////////////////////////////////////////////
//:: Spell Effects Applied / Notes
//:://////////////////////////////////////////////
    Set plot flag, set to uncommandable, if not a DM.
//:://////////////////////////////////////////////
//:: Created By: Jasperre
//::////////////////////////////////////////////*/

#include "PHS_INC_SPELLS"

void main()
{
    // Set plot flag on the enterer (if not a DM)
    object oEnterer = GetEnteringObject();

    // Make sure has spell effect as else it is probably bad AI and a familiar.
    if(!GetIsDM(oEnterer) && GetHasSpellEffect(PHS_SPELL_IMPRISONMENT, oEnterer))
    {
        // We set them to uncommandable.
        SetCommandable(FALSE, oEnterer);
        // Set plot flag to true, to stop any damage
        SetPlotFlag(oEnterer, TRUE);
        if(GetIsPC(oEnterer))
        {
            // Death screen for players
           // DelayCommand(3.0, PopUpDeathGUIPanel(oEnterer, FALSE , TRUE, 0, "You have been imprisoned on a deserted plane, and can only be freed by Freedom"));
        }
    }
    else if(GetIsDM(oEnterer))
    {
        PHS_RemoveSpellEffectsFromTarget(PHS_SPELL_IMPRISONMENT, oEnterer);
    }
}
