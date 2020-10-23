/*! \file  bbs_scribe_give.nss
    \brief Gibt dem Spieler die Nachricht\n
           Last Update: BDr 05.05.2009
*/

/*! main funktion */
#include "d0_functions_inc"
void main()
{
   object Notice = CreateItemOnObject("bbs_notice", GetPCSpeaker());

   if( Notice != OBJECT_INVALID )
   {
      SetLocalString(Notice, "Title",   ColorText(GetLocalString(OBJECT_SELF, "Title"), nwcRed));
      SetLocalString(Notice, "Message", GetLocalString(OBJECT_SELF, "Message"));
      SetDescription(Notice, GetLocalString( OBJECT_SELF, "Message"));
      SetName(Notice, "Nachricht: '"+ColorText(GetLocalString(OBJECT_SELF, "Title"), nwcRed)+"'");
   }
}
