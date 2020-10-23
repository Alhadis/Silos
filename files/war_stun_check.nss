/*
  author: shadow_in_the_dark
  name:   war_stun_check
  date:   2005-11-13

  Removes stunn effects if necessary. Check will repeated until:
  - target is damaged
  - number of checks counted to 0

  check will be performed every 3.0 sec.
*/
#include "war_inc_stun"

void main()
{

    object PC = OBJECT_SELF;
    int hp_before_stun = GetLocalInt ( PC, sStunCheckOldHP );
    int curr_hp = GetCurrentHitPoints();
    int nChecksLeft = GetLocalInt ( PC, sStunChecksLeft );
    if ( nChecksLeft == 1 )
    {
        // last check, stop stun
        RemoveStunnEffect ( OBJECT_SELF );
    }
    else if ( curr_hp < hp_before_stun )
    {
        // damaged during stun
        RemoveStunnEffect ( PC );

    }
    else
    {
        if ( curr_hp > hp_before_stun )
        {
            // healed in stun
            SetLocalInt(PC, sStunCheckOldHP, curr_hp);
        }
        SetLocalInt ( PC, sStunChecksLeft, nChecksLeft - 1 );
        DelayCommand ( nCheckPeriode, ExecuteScript ( "war_stun_check", PC ) );
    }

}

