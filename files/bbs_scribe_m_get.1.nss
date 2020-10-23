/*! \file  bbs_scribe_m_get.nss
    \brief Setzt die Nachricht nach der Eingabe.\n
           Last Update: BDr 05.05.2009
*/

/*! main funktion */
void main()
{
   string sTalk = GetLocalString( OBJECT_SELF, "Stack" );

   if( sTalk != "" )
   {
      if( GetStringLength( sTalk ) > 200 )
      sTalk = GetStringLeft( sTalk, 200 );

      SetLocalString( OBJECT_SELF, "Message", sTalk );
      SetLocalString( OBJECT_SELF, "Stack", "" );
   }
}
