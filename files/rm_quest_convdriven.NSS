//Conversation driven for all RM Quests 
//Wynna August 2008


#include "acr_creature_i"

void main()
{
	object oQuester = GetPCSpeaker();
    effect eKnockdown = EffectKnockdown();
	effect eStruck = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);			


	
		
	//Dalshanas
    if(GetTag(OBJECT_SELF) == "003_cr_rm_dalshanas")
		{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
			{SetLocalInt(oQuester, "Dalshanas", 1);
			}
		}
				   
	//Jesha
	if(GetTag(OBJECT_SELF) == "003_cr_rm_jesha")
		{if(GetLocalInt(oQuester, "Jesha_Dip") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
				{SetLocalInt(oQuester, "Jesha_Dip", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Jesha_Dip", 0);
				}
			}
		 if(GetLocalInt(oQuester, "Jesha_Intimidate") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_INTIMIDATE, 15))
				{SetLocalInt(oQuester, "Jesha_Intimidate", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Jesha_Intimidate", 0);
				}
			}
		  if(GetLocalInt(oQuester, "Jesha_Sleight") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_SLEIGHT_OF_HAND, 15))
				{SetLocalInt(oQuester, "Jesha_Sleight", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Jesha_Sleight", 0);
				}
			}
		}
		
		//Gelodir
	if(GetTag(OBJECT_SELF) == "003_cr_rm_gelodir")
		{if(GetLocalInt(oQuester, "Gelodir_Dip") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
				{SetLocalInt(oQuester, "Gelodir_Dip", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Gelodir_Dip", 0);
				}
			}
		 if(GetLocalInt(oQuester, "Gelodir_Intimidate") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_INTIMIDATE, 15))
				{SetLocalInt(oQuester, "Gelodir_Intimidate", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Gelodir_Intimidate", 0);
				}
			}
		  if(GetLocalInt(oQuester, "Gelodir_Sleight") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_SLEIGHT_OF_HAND, 15))
				{SetLocalInt(oQuester, "Gelodir_Sleight", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Gelodir_Sleight", 0);
				}
			}
		}
		
			//Waydeka
	if(GetTag(OBJECT_SELF) == "003_cr_rm_waydeka")
		{if(GetLocalInt(oQuester, "Waydeka_Dip") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
				{SetLocalInt(oQuester, "Waydeka_Dip", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Waydeka_Dip", 0);
				}
			}
		if(GetLocalInt(oQuester, "Waydeka_Sleight") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_SLEIGHT_OF_HAND, 15))
				{SetLocalInt(oQuester, "Waydeka_Sleight", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Waydeka_Sleight", 0);
				}
			}
		}
		
			//Sibillis
	if(GetTag(OBJECT_SELF) == "003_cr_rm_sibillis")
		{if(GetLocalInt(oQuester, "Sibillis_Dip") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
				{SetLocalInt(oQuester, "Sibillis_Dip", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Sibillis_Dip", 0);
				}
			}
		 if(GetLocalInt(oQuester, "Sibillis_Intimidate") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_INTIMIDATE, 15))
				{SetLocalInt(oQuester, "Sibillis_Intimidate", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Sibillis_Intimidate", 0);
				}
			}
		  if(GetLocalInt(oQuester, "Sibillis_Sleight") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_SLEIGHT_OF_HAND, 15))
				{SetLocalInt(oQuester, "Sibillis_Sleight", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Sibillis_Sleight", 0);
				}
			}
		}
		

//Elkris
	if(GetTag(OBJECT_SELF) == "003_cr_hh_elkris")
		{if(GetLocalInt(oQuester, "Elkris_Dip") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
				{SetLocalInt(oQuester, "Elkris_Dip", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Elkris_Dip", 0);
				}
			}
		 if(GetLocalInt(oQuester, "Elkris_Bluff") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_BLUFF, 15))
				{SetLocalInt(oQuester, "Elkris_Bluff", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Elkris_Bluff", 0);
				}
			}
		 
		}	
	//Fraelan
	if(GetTag(OBJECT_SELF) == "003_cr_hh_fraelan")
		{if(GetLocalInt(oQuester, "Fraelan_Dip") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
				{SetLocalInt(oQuester, "Fraelan_Dip", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Fraelan_Dip", 0);
				}
			}
		 if(GetLocalInt(oQuester, "Fraelan_Intimidate") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_INTIMIDATE, 15))
				{SetLocalInt(oQuester, "Fraelan_Intimidate", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Fraelan_Intimidate", 0);
				}
			}
		 
		}	
		
			//Garfin
	if(GetTag(OBJECT_SELF) == "003_cr_hh_garfin")
		{if(GetLocalInt(oQuester, "Garfin_Dip") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_DIPLOMACY, 15))
				{SetLocalInt(oQuester, "Garfin_Dip", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Garfin_Dip", 0);
				}
			}
		if(GetLocalInt(oQuester, "Garfin_Sleight") == 1)
			{if(GetIsSkillSuccessful(oQuester, SKILL_SLEIGHT_OF_HAND, 15))
				{SetLocalInt(oQuester, "Garfin_Sleight", 2);
				}
			 else
			    {SetLocalInt(oQuester, "Garfin_Sleight", 0);
				}
			}
		}
		
}			 			 