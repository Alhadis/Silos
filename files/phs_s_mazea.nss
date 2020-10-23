/*:://////////////////////////////////////////////
//:: Spell Name Maze : Enter area
//:: Spell FileName PHS_S_MazeA
//:://////////////////////////////////////////////
//:: Spell Effects Applied / Notes
//:://////////////////////////////////////////////
    On Enter area

    - Set plot flag.
//:://////////////////////////////////////////////
//:: Created By: Jasperre
//::////////////////////////////////////////////*/

#include "PHS_INC_SPELLS"

void main()
{
    // Set plot flag on the enterer (if not a DM)
    object oEnterer = GetEnteringObject();

    // Make sure has spell effect as else it is probably bad AI and a familiar.
    if(!GetIsDM(oEnterer) && GetHasSpellEffect(PHS_SPELL_MAZE, oEnterer))
    {
        // If it is an NPC, we set them to uncommandable.
        if(!GetIsPC(oEnterer))
        {
            SetCommandable(FALSE, oEnterer);
        }
        SetPlotFlag(oEnterer, TRUE);
        DelayCommand(6.0, ExecuteScript("phs_s_mazec", oEnterer));
    }
}
