#include "x2_inc_switches"
#include "nwk_maps"
#include "nwk_team_onscore"
#include "nwk_mvp"
#include "pvp_t_switch"

void main()
{
        //initialise the actual ultimative MvP Score
        InitUltimativeMvP ();
        //only initialisation
        SetLocalInt ( GetModule (), "map_number", 1 );
        //set strategy for map selection
        SetLocalInt ( GetModule (), MAP_SELECT_STRATEGY, STRATEGY_RANDOM );
        //SetLocalInt ( GetModule (), MAP_SELECT_STRATEGY, STRATEGY_ROUNDTRIP );
        //start with map 1 ( next after the last one )
        SetLocalInt( GetModule (), "map_order", 20 /* TOTAL_NUMBER_OF_MAPS */ );
        //ensure that all is prepared
        clearAllMaps ();
        //create the first map
        changeMaps ( "INIT_MODULE" );
        //spells are handled by this script
        SetModuleOverrideSpellscript ( "nwk_mod_spell" );
        //expertise shall be broken if player cast spell
        SetLocalInt ( GetModule(), MODULE_VAR_AI_STOP_EXPERTISE_ABUSE, TRUE );
        //initialise win history
        ClearWinningTeamHistory ();
        //disable in game team switch
        DisableInGameTeamSwitch ();

}



