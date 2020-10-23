/*! \file  bbs_scribe_start.nss
    \brief startet die aufnahme der Nachricht\n
           Last Update: BDr 18.11.2008
*/


/*! main funktion */
void main()
{
  SetLocalObject(OBJECT_SELF, "Customer", GetPCSpeaker());
  SetLocalString(OBJECT_SELF, "Stack", "");
  SetLocalString(OBJECT_SELF, "Title", "");
  SetLocalString(OBJECT_SELF, "Message", "");
}
