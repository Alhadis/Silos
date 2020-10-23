/*! \file  bbs_scribe_t_get.nss
    \brief Setzt den Titel nach der Eingabe.\n
           Last Update: BDr 18.11.2008
*/

/*! main funktion */
void main()
{
   string sTalk = GetLocalString( OBJECT_SELF, "Stack" );

   if( sTalk != "" )
   {
      if( GetStringLength( sTalk ) > 30 )
         sTalk = GetStringLeft( sTalk, 30 );

      SetLocalString( OBJECT_SELF, "Title", sTalk );
      SetLocalString( OBJECT_SELF, "Stack", "" );
   }
}
