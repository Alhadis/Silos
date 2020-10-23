void main()
{


object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;



if (GetLocalInt(OBJECT_SELF, "npc_opal")== 1)
   {
   object oPC = GetEnteringObject();
   object oNPC = GetNearestObjectByTag("npc_prost_opal");

        if (GetAbilityScore(oPC, ABILITY_CHARISMA)<= 6)
                {
                  AssignCommand(oNPC, SpeakString("*She glances in your direction with a look of disgust on her comely features*"));
                }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 10))
                {
                   AssignCommand(oNPC, SpeakString("*She offers a forced smile at you as you enter*"));
                   }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 12))
               {
               AssignCommand(oNPC, SpeakString("*She welcomes you with a cheeky grin and a quick blink of her lashes*"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 16))
               {
               AssignCommand(oNPC, SpeakString("*Welcome handsome, come closer..."));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 18))
               {
               AssignCommand(oNPC, SpeakString("*She blushes deeply and for a moment there you think she might faint upon seeing your striking beauty"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 20))
               {
               AssignCommand(oNPC, SpeakString("*The woman seems to be totally unprepared by your striking beauty"));
               }
   }


else if (GetLocalInt(OBJECT_SELF, "npc_crimson")== 1)
   {
   object oPC = GetEnteringObject();
   object oNPC = GetNearestObjectByTag("npc_prost_crimson");

        if (GetAbilityScore(oPC, ABILITY_CHARISMA)<= 6)
                {
                  AssignCommand(oNPC, SpeakString("*She glances in your direction with a look of disgust on her comely features*"));
                }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 10))
                {
                   AssignCommand(oNPC, SpeakString("*She offers a forced smile at you as you enter*"));
                   }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 12))
               {
               AssignCommand(oNPC, SpeakString("*She welcomes you with a cheeky grin and a quick blink of her lashes*"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 16))
               {
               AssignCommand(oNPC, SpeakString("*Welcome handsome, come closer..."));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 18))
               {
               AssignCommand(oNPC, SpeakString("*She blushes deeply and for a moment there you think she might faint upon seeing your striking beauty"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 20))
               {
               AssignCommand(oNPC, SpeakString("*The woman seems to be totally unprepared by your striking beauty"));
               }
   }

   else if (GetLocalInt(OBJECT_SELF, "npc_angel")== 1)
   {
   object oPC = GetEnteringObject();
   object oNPC = GetNearestObjectByTag("npc_prost_angel");

        if (GetAbilityScore(oPC, ABILITY_CHARISMA)<= 6)
                {
                  AssignCommand(oNPC, SpeakString("*She glances in your direction with a look of disgust on her comely features*"));
                }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 10))
                {
                   AssignCommand(oNPC, SpeakString("*She offers a forced smile at you as you enter*"));
                   }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 12))
               {
               AssignCommand(oNPC, SpeakString("*She welcomes you with a cheeky grin and a quick blink of her lashes*"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 16))
               {
               AssignCommand(oNPC, SpeakString("*Welcome handsome, come closer..."));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 18))
               {
               AssignCommand(oNPC, SpeakString("*She blushes deeply and for a moment there you think she might faint upon seeing your striking beauty"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 20))
               {
               AssignCommand(oNPC, SpeakString("*The woman seems to be totally unprepared by your striking beauty! She gasps*"));
               }
   }

      else if (GetLocalInt(OBJECT_SELF, "npc_misterx")== 1)
   {
   object oPC = GetEnteringObject();
   object oNPC = GetNearestObjectByTag("npc_prost_misterx");

        if (GetAbilityScore(oPC, ABILITY_CHARISMA)<= 6)
                {
                  AssignCommand(oNPC, SpeakString("Let's get over with this..."));
                }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 10))
                {
                   AssignCommand(oNPC, SpeakString("Once you go black, you never go back..."));
                   }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 12))
               {
               AssignCommand(oNPC, SpeakString("I've been waiting for you..."));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 16))
               {
               AssignCommand(oNPC, SpeakString("*Mister examines you from top to toe, he then offers you a wide smile*"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 18))
               {
               AssignCommand(oNPC, SpeakString("*Mister X takes a half step back with surprise, he then smiles and motions you closer with his finger*"));
               }

        else if ((GetAbilityScore(oPC, ABILITY_CHARISMA)<= 20))
               {
               AssignCommand(oNPC, SpeakString("Mister X looks at you for a short moment before he says 'You are truly sent from the gods, and I shall treat you as their equal!'"));
               }
   }





 }

