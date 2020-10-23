/*
  author: shadow_in_the_dark
  name:   nwk_dom_onenter
  date:   05/05/23

  OnEnterArea Event of the domination area

*/
#include "nwk_const_teams"
#include "nwk_dom_inc"
void main()
{
    if ( GetIsActiveArea ( OBJECT_SELF ) )
    {
        object oPlayer = GetEnteringObject ();
        HandleOnEnterDominationAreaEvent ( oPlayer, OBJECT_SELF );
    }
}

