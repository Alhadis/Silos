//::///////////////////////////////////////////////
//:: Name  chkValidAcc
//:: FileName  in_chk_acc
//:: Copyright (c) 2004
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Amrod
//:: Created On: 5-11-04
//:: Modified By:
//:: Modified On:
//:://////////////////////////////////////////////

// Devuelve TRUE si se encuentra el PJ en la lista de PJS
// o si se encuentra al DM en la lista de DMS
int chkValidAcc(string sName);

int chkValidAcc(string sName)
{
     object myArray = OBJECT_SELF;

     //cuentas de PJS
     int iPJS = 15; //cantidad de cuentas autorizadas
     SetLocalString (myArray , "accPJ1", "Zero-X2-");
     SetLocalString (myArray , "accPJ2", "mariano_asgoria");
     SetLocalString (myArray , "accPJ3", "Dare2Beta");
     SetLocalString (myArray , "accPJ4", "asg_vlitzer");
     SetLocalString (myArray , "accPJ5", "marce_asgoria");
     SetLocalString (myArray , "accPJ6", "felipe_tester");
     SetLocalString (myArray , "accPJ7", "Kensai_Asgorya");
     SetLocalString (myArray , "accPJ8", "Galveila");
     SetLocalString (myArray , "accPJ9", "OliverAsgoria");
     SetLocalString (myArray , "accPJ10", "Chodaa");
     SetLocalString (myArray , "accPJ11", "Helba");
     SetLocalString (myArray , "accPJ12", "--Thanatos--");
     SetLocalString (myArray , "accPJ13", "Anacreia");
     SetLocalString (myArray , "accPJ14", "tylerbeer");
     SetLocalString (myArray , "accPJ15", "Underdark Master");

     //cuentas de DMS
     int iDMS = 5; //cantidad de cuentas de DM
     SetLocalString (myArray , "accDM1", "Zero-X2-");
     SetLocalString (myArray , "accDM2", "mariano_asgoria");
     SetLocalString (myArray , "accDM3", "Dare2Beta");
     SetLocalString (myArray , "accDM4", "asg_vlitzer");
     SetLocalString (myArray , "accDM5", "marce_asgoria");


     //busca entre los dms
     int i = 1;
     while ( i <= iDMS ) {
           string accDM = GetLocalString (myArray, "accDM" + IntToString (i));
           if (accDM == sName) return TRUE;
           i++;
           }; //end while

     //busca entre los players
     i = 1;
     while ( i <= iPJS ) {
           string accPJ = GetLocalString (myArray, "accPJ" + IntToString (i));
           if (accPJ == sName) return TRUE;
           i++;
           }; //end while

     return FALSE;
}


