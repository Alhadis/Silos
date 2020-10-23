//Written by Crom
//08/04/2012
//crom29@hotmail.fr

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//				G E N E R A L         I N F O R M A T I O N 
// /////////////////////////////////////////////////////////////////////
//
//This script adds a second authentification system to your module to prevent 
//	people to use somebody else account by skipping bioware authentification.
//
//The script register into MySQL the password of the account (this password
//	is NOT encrypted) and combinations of IP+CDKey that the player uses
//
//It will ask the player to :
//	- Set his password if the password is not registered
//	- Retype his password if his IP of CDKey has not been registered yet
//	- Nothing if the password has been set and the IP/CDKey is registered
//
//

//
//Before installing it, you should read & configure these lines :
//
//
//	You must modify your OnPCLoad script by adding this line :
//		At the top of the file :
//			#include "pw_auth_inc"
//		After void main(){
//			PWAuthOnPCLoad();
//
//
//	pw_auth needs a table where is listed all accounts and their respective passwords
//		This is the table where is stocked the list of accounts and their password
		const string TABLE_ACCOUNT = "account";
			//The name of the column where is written the name of the account
			const string TABLE_ACCOUNT_COLUMN_ACCOUNT = "name";
			//The column where is written the password of the account
			const string TABLE_ACCOUNT_COLUMN_PASSWORD = "password";

//		If you already have an account list table, you should add a password column :
//			Adding a 'password' column into the account table (replace upper constants with their values)
//				ALTER TABLE `nwnx`.`TABLE_ACCOUNT` ADD COLUMN `TABLE_ACCOUNT_COLUMN_PASSWORD` VARCHAR(64) NULL DEFAULT NULL;
//
//		If you don't have this table, you must create it and add the account registration into the OnClientEnter script
//			SQL Command to execute (replace upper constants with their values)
//				CREATE TABLE `TABLE_ACCOUNT` (`TABLE_ACCOUNT_COLUMN_ACCOUNT` varchar(45) NOT NULL, `TABLE_ACCOUNT_COLUMN_PASSWORD` varchar(64) default NULL,  PRIMARY KEY (`TABLE_ACCOUNT`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
//			Modifications to the module OnClientEnter script
//				At the top of the file :
//					#include "pw_auth_inc"
//				After void main(){
//					PWAuthRegisterAccountOnClientEnter();
//
//	You must create a 'authentification' table by executing this MySQL command (replace upper constants with their values) : 
//		CREATE TABLE `authentification` (`account_name` varchar(45) NOT NULL,`ip` varchar(15) NOT NULL,`cdkey` varchar(45) NOT NULL,`approved` tinyint(1) default '1', PRIMARY KEY  (`account_name`,`ip`,`cdkey`), KEY `fk_authentification_account1` (`account_name`), CONSTRAINT `fk_authentification_account1` FOREIGN KEY (`account_name`) REFERENCES `TABLE_ACCOUNT` (`TABLE_ACCOUNT_COLUMN_ACCOUNT`) ON DELETE NO ACTION ON UPDATE NO ACTION) ENGINE=InnoDB DEFAULT CHARSET=utf8;
//
//
//
//	It is wise to configure the lines below :


// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\	
//							S E T T I N G S
// /////////////////////////////////////////////////////////////////////
//Number of times the player will be able to type a wrong password before being kicked
const int PASSWORD_TRY_LIMIT = 3;

	
	
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\	
//						I N P U T        B O X
// /////////////////////////////////////////////////////////////////////
//Message written when the player has to set his password
const string GUI_INPUTBOX_ENTER_NEW_PASSWORD = "Merci d'entrer un nouveau Mot de Passe";

//Message written when the player has type his registered password
const string GUI_INPUTBOX_ENTER_CURRENT_PASSWORD = "Merci d'entrer votre Mot de Passe pour entrer sur le server";

//Text to display on the validate button
const string GUI_INPUTBOX_VALIDATE = "Valider";

//Text to display on the validate button
const string GUI_INPUTBOX_QUIT = "Quitter";
	


	
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\	
//					F L O A T I N G		  T E X T
// /////////////////////////////////////////////////////////////////////
//Text displayed when asking the player to type his password
//You should inform the player that this password will be visible by the admins
const string ASK_PASSWORD = "Merci d'entrer un mot de passe qui vous servira à chaque fois que vous vous connecterez sur un ordinateur/point d'accès différent.";

//text displayed when the player has successfully registered his password
const string PASSWORD_REGISTERED = "Mot de passe enregistré !\nPensez à le noter quelque part ;)";

//Text displayed when the player has written a wrong password
const string PASSWORD_INCORRECT_PLEASE_RETYPE = "Mot de passe incorrect, merci d'entrer votre Mot de Passe 'Lcda' pour entrer sur le server";

//Text displayed when the player's account case is wrong
const string INCORRECT_CASE = "La casse (majuscules/minuscules) de votre compte est incorrecte ! Merci de vous connecter avec le compte : "; 




























// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//					DO NOT TOUCH THESE LINES
// /////////////////////////////////////////////////////////////////////
#include "nwnx_sql"
void PWAuthOnPCLoad()
{
	object oPC = GetEnteringObject();
	string sAccount = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
	
	SQLExecDirect("SELECT `"+TABLE_ACCOUNT_COLUMN_PASSWORD+"`,(BINARY `"+TABLE_ACCOUNT_COLUMN_ACCOUNT+"`='"+sAccount+"'),`"+TABLE_ACCOUNT_COLUMN_ACCOUNT+"` FROM `"+TABLE_ACCOUNT+"` WHERE LOWER(`"+TABLE_ACCOUNT_COLUMN_ACCOUNT+"`) = LOWER('"+sAccount+"')");

	string sPassword = "";
	if(SQLFetch())
		sPassword = SQLGetData(1);
	
	if(sPassword == "")//No password registered for this account
	{
		ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);
		
		SetLocalInt(oPC, "nPassWordAction", 1);// 1 means "Register password + IP & CDKey"
		DelayCommand(2.0, FloatingTextStringOnCreature(ASK_PASSWORD, oPC, FALSE, 15.0, 16711680, 16750848));
		DisplayInputBox(oPC, 0, GUI_INPUTBOX_ENTER_NEW_PASSWORD, "gui_pw_auth", "gui_pw_auth", TRUE, "SCREEN_STRINGINPUT_MESSAGEBOX",0,GUI_INPUTBOX_VALIDATE,0,GUI_INPUTBOX_QUIT,"");
	}
	else
	{
		if(SQLGetData(2) == "0")//Account case mismatch
		{
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);
			SetLocalInt(OBJECT_SELF, "nPassWordAction", -1);//Boot PC
			DisplayMessageBox(oPC, 0, INCORRECT_CASE+"'"+SQLGetData(3)+"'", "gui_pw_auth", "", FALSE, "SCREEN_MESSAGEBOX_DEFAULT", 0, "Quitter");
			return;
		}
		
		//Check if the CDKey & IP are registered
		SQLExecDirect("SELECT approved FROM `authentification` WHERE account_name='"+sAccount+"' AND ip='"+GetPCIPAddress(oPC)+"' AND cdkey='"+GetPCPublicCDKey(oPC)+"'");
	
		if(SQLFetch() && StringToInt(SQLGetData(1)))
		{
			//IP & CDKey correctly registered
		}
		else
		{
			//Ask password to register the new IP/CDKey
			
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);
			
			SetLocalInt(oPC, "nPassWordAction", 2);//2 means "Register IP & CDKey"
			DisplayInputBox(oPC, 0, GUI_INPUTBOX_ENTER_CURRENT_PASSWORD, "gui_pw_auth", "gui_pw_auth", TRUE, "SCREEN_STRINGINPUT_MESSAGEBOX",0,GUI_INPUTBOX_VALIDATE,0,GUI_INPUTBOX_QUIT,"");
		}
	}
} 


void PWAuthRegisterAccountOnClientEnter()
{
	object oPC = GetEnteringObject();
	
	string sAccount = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
	SQLExecDirect("SELECT "+TABLE_ACCOUNT_COLUMN_ACCOUNT+" FROM `"+TABLE_ACCOUNT+"` WHERE "+TABLE_ACCOUNT_COLUMN_ACCOUNT+"='"+sAccount+"'");
	
	if(!SQLFetch())
		SQLExecDirect("INSERT INTO `"+TABLE_ACCOUNT+"` ("+TABLE_ACCOUNT_COLUMN_ACCOUNT+") VALUES ('"+sAccount+"')");
}