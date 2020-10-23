// Crom, 20/08/2011 14h
// crom29@hotmail.fr
	
	
void Secu()
{


	object oPC = GetEnteringObject();
	string sPCPlayerName = GetPCPlayerName(oPC);
	
	string sPassWord = GetCampaignString("SECU", "PWD_"+sPCPlayerName);

	if(sPassWord == "")//No password registered for this account
	{
		ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);
			
		SetLocalInt(oPC, "nPassWordAction", 1);// 1 means "Register password + IP & CDKey"
		DelayCommand(2.0, FloatingTextStringOnCreature("Suite a certains problèmes venant de Bioware, le Staff a mis en place une sécurité supplémentaire pour vos personnages. Merci d'entrer un mot de passe qui vous servira à chaque fois que vous vous connecterez sur un ordinateur différent.\nNote: Le staff aura accès à ce mot de passe, il est donc déconseillé de mettre votre mot de passe Bioware ;)", oPC, FALSE, 15.0, 16711680, 16750848));
		DisplayInputBox(oPC, 0, "Merci d'entrer un nouveau Mot de Passe", "gui_secu_script", "gui_secu_script", TRUE, "SCREEN_STRINGINPUT_MESSAGEBOX",0,"Valider",0,"Quitter","");
	}
	else
	{
		//Check if the CDKey & IP are registered
		int bCDKey = GetCampaignInt("SECU", sPCPlayerName + "#" + sPassWord + "#" + GetPCPublicCDKey(oPC));
        int bIPAddr = GetCampaignInt("SECU", sPCPlayerName + "#" + sPassWord + "#" + GetPCIPAddress(oPC)); 
		
		
		
		if(bCDKey && bIPAddr)
		{
			//IP & CDKey correctly registered
		}
		else
		{
			//Ask password to register the new IP/CDKey
			
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);
			
			SetLocalInt(oPC, "nPassWordAction", 2);//2 means "Register IP & CDKey"
			DisplayInputBox(oPC, 0, "Merci d'entrer votre Mot de Passe '"+GetModuleName()+"' pour entrer sur le server", "gui_secu_script", "gui_secu_script", TRUE, "SCREEN_STRINGINPUT_MESSAGEBOX",0,"Valider",0,"Quitter","");
		}
	}
}



void main(){

  Secu();

}
