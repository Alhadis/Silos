void main()
{
 object oPC = GetItemActivator();
 object oHelm = GetItemActivated();
 if(GetIsObjectValid(oHelm)==TRUE)
 {
  effect eFearImmune = EffectImmunity(IMMUNITY_TYPE_FEAR);
  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFearImmune, oPC, 60.0);
  int x = d12();
  switch(x)
  {
   case 1:
   AssignCommand(oPC, ActionSpeakString("Hooray, Hooray the Hero comes, To save us from these awful times. To save, to save the maidens fair. To burn, to burn the Dragon's Lair.", TALKVOLUME_TALK));
   break;
   case 2:
   AssignCommand(oPC, ActionSpeakString("March onward fearless man, With an unsheathed sword in hand. You'll fight orcs as only you can, To help the troubled land",TALKVOLUME_TALK));
   break;
   case 3:
   AssignCommand(oPC, ActionSpeakString("The shining helmet is your wreath, The heavy weapon is your plough. An enemy if you should meet, More worthy he is not than thou.", TALKVOLUME_TALK));
   break;
   case 4:
   AssignCommand(oPC, ActionSpeakString("Strong as a bear, fast as the wind, hail, oh hero, We'll greet you as king. Your strength is our prayers, Your speed is our dream, With your mighty weapon, you are sure to win.", TALKVOLUME_TALK));
   break;
   case 5:
   AssignCommand(oPC, ActionSpeakString("You are kind and friendly, to whom you think is worthy. But pitiless and deadly, to those whose soul is dirty.", TALKVOLUME_TALK));
   break;
   case 6:
   AssignCommand(oPC, ActionSpeakString("Ride on your mighty steed, to rescue those in need. You, nasty foes, repent your sins! The hero comes who always wins.", TALKVOLUME_TALK));
   break;
   case 7:
   AssignCommand(oPC, ActionSpeakString("Huzzah! Huzzah! The peoples' cries still sound, For their hero they have found! It is the courageous knight, who is not afraid to fight!", TALKVOLUME_TALK));
   break;
   case 8:
   AssignCommand(oPC, ActionSpeakString("Gods give your awesome steed the speed of eagle's wing. He'll carry you to your next feat, where justice you shall bring.", TALKVOLUME_TALK));
   break;
   case 9:
   AssignCommand(oPC, ActionSpeakString("Hardships are a mere joke to an honorable knight like you. You help and save defenseless folk, that's what you always do.", TALKVOLUME_TALK));
   break;
   case 10:
   AssignCommand(oPC, ActionSpeakString("Even when you are on your knees your mind is still at peace. Even when your death is near, you'll meet it with a sneer. For you are fearless at heart, no matter what your part.", TALKVOLUME_TALK));
   break;
   case 11:
   AssignCommand(oPC, ActionSpeakString("When orcs surrounded our village, To plunder, burn and pillage. When our hope was almost gone, lost in cries and screams and moans, You came, you came and fought, the savior that we had sought.", TALKVOLUME_TALK));
   break;
   case 12:
   AssignCommand(oPC, ActionSpeakString("Go and rest, brave sir knight. In the cozy Inn, there is wine, there is light and people of your kin. Rest well because tomorrow, new dangers you shall follow.", TALKVOLUME_TALK));
   break;
  }
 }
}