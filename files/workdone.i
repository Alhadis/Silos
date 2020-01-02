&+Yo &+WMarty [23 mar 1998] &+Yo&+R-&+B=====================================================&+R-

* Added autoeat/wimpyeat function.
* Fixed bug where NoCorpse mobiles would take their inventory with them.
* Updated main helpfile to add new commands.

&+Yo &+WMarty [19 mar 1998] &+Yo&+R-&+B=====================================================&+R-

* Added scoreprompt, completely switched over to the new compiler.
* Added intonation to say command.

&+Yo &+WMarty [12 mar 1998] &+Yo&+R-&+B=====================================================&+R-

* Added donations room.. Needs to be checked for expected behaviour

&+Yo &+WMarty [7 mar 1998] &+Yo&+R-&+B======================================================&+R-

* Do most of the developing and adding on the testmud, since that has the new
  spellsystem in.
* Fixed a bug in get command. get all <container> didnt work.. works now. i
  Thanks to Thrawn for pointing it out.

&+Yo &+WMarty [6 mar 1998] &+Yo&+R-&+B======================================================&+R-

* Finished adding code for Darkness.
* Made Player Statistics Program.

&+Yo &+WMarty [feb/mar 1998] &+Yo&+R-&+B====================================================&+R-

During some free time between school and work I have been working on several 
things. The biggest one was a completely new spell system. This new spell 
system is based on people learning a spell rather than getting them as you
progress through the ranks.

This new Spell system also brings along some nasty things and some good things.
First the nasty things. 
* With this new system you wont be able to cast as many spells as you can type
  in a second. You can cast one spell per round.
* Most spells wont last forever!

Benefits:
* More Spells! Here's a short summary of what you can get at the moment. More
  to come later ofcourse:
  - Picklock  : Never have to find a key anymore with this one.
  - Calm      : Calms a mobile down, so they wont start attacking everyone.
  - Hide      : Hide yourself or someone else behind a shroud of invisibility
  - Illuminate: Light something without having a lightsource at hand.
 
&+Yo &+WMarty [27 feb 1998] &+Yo&+R-&+B=====================================================&+R-

* Fixed a bug concerning the quickwriter and linkdead people.. Some 
  Quickwriters grew out of proportion, causing the mud to crash.
* Updated a bunch of zones.

&+Yo &+WMarty [26 feb 1998] &+Yo&+R-&+B=====================================================&+R-

* Fixed a bug in the linkdead code

&+Yo &+WDelphi [Jan/Feb 1998] &+Yo&+R-&+B====================================================&+R-

* Created logo and gathered images for web pages
* Worked out the foundation for all the pages and got it online
* Researching ways to advertise our web pages
* Fixed all typos listed in the syslog
* Added wiz rooms
* Changed and added some things to the Canine zone
* Updated the Powers and Home zones
* Recruited new powers for the mud
* Updated some and continue to update Info files

&+Yo &+WMarty [8 feb 1998] &+Yo&+R-&+B======================================================&+R-

* Fixed bug in the syslogs.
* Added auto defrob/refrob for senior level. If you are a senior now and you
  do not have all the quests you will be defrobbed to normal wizard level. If
  you complete all quests as wizard you will be promoted to the senior wizard
  level automatically.
* Added some extra messages for powers on zap and exorcise command.

&+Yo &+WMarty [1 feb 1998] &+Yo&+R-&+B======================================================&+R-

Various fixes to the zones:
   - Added some fastheal objects
   - Added several old and new specials
   - Fixed some specials

* Bug in email command fixed.
* People using asmortal will be transported to the start location when they 
  assume their mortal form.
* Only Archwizards and higher can set their quests now.
* Seperated the log files into 3 different logs so it is clearer when a bug
  or suggestion is logged.
* Made it so immortals can view someone elses inventory
* Fixed the banned host problem caused by using a seperate process for dns
  lookup.
* You can't cast (or attempt to) cast some spells while asleep anymore.
* Made it so you have to move the painting to push the button in findpainting
* Made it say something when you attempt to wield the weapon you already have
  wielded.
* made it so you can get the shields from the pillared halls
* made it so you could remove the chalice from the altar
* made the altar in fungoid cavern serve its purpose.
* rub is an action again.
* added quespoint calibration, so we can change the points a quest is
  worth and so some players have correct qp (some didnt, due to a bug
  earlier on in the questpoint system).
* fixed rhindon description bug.. mentioned ages ago ;)
* Added fastheal object flag

&+WMarty							14 January
&+B=========================================================================
&+c - Upgraded the system kernel to version 2.0.33. Solved some problems

&+WMarty							14 January
&+B=========================================================================
&+c - Fixed a bug in the spell system which made every attempt to cast a 
&+c   spell turn into a failure.

&+WMarty							13 January
&+B=========================================================================
&+c - DarkScapes server suffered a little downtime due to a server crash.
&+c   A reboot luckily was enough to get the server online.
&+c - Fixed name bug reported by crimefighter

&+WMarty							11 January
&+B=========================================================================
&+c - Fixed multiple entry bug.
&+c - As introduction to a fresh start we have decided to change names to
&+c   DarkScapes. This is because we want a more magic and sorcerory theme
&+c   to the whole mud. This will hopefully soon be followed by a new spell
&+c   system. 

&+WMarty							9 January
&+B=========================================================================
&+c - Fixed the standard titles to use female immortal names as well.

&+WMarty							8 January
&+B=========================================================================
&+c - Enhanced review messages checker and added prompt checker.
&+c - Refined muddns
&+c - Added help for, clearwarn, exowarn
&+c - Added qp required to level to prompt posibilities.
&+c - Added comments to mobile.c

&+WMarty							6 January
&+B=========================================================================
&+c - Added armor and damage indication to prompt posibilities

&+WMarty							5 January
&+B=========================================================================
&+c - Fixed a review crash bug. The bug was caused by a buffer overflow.
&+c - Fixed a bug in invis command.
&+c - Added new idle out routine.
&+c - Uploaded new action file.

&+WMarty							4 January
&+B=========================================================================
&+c - Changed fakehosts system
&+c - Fixed some problems with fd's that stayed open, causing the mud to
&+c   run short of file descriptors

&+WMarty                                                        2 January
&+B=========================================================================
&+c - FINALLY fixed the help system. It should work now!
&+c - Modified the alias code, now you are allowed to walk around with 
&+c   mobiles and perform actions on people.
&+c - Added new aberchat system code.
&+c - Changed the percentage of score you loose from 20 % to 35 %, fleeing
&+c   now costs 3 % (was 2).
&+c - renamed braindead into linkdead.

&+WMarty                                                        1 January
&+B=========================================================================
&+c - Added hostname to things stored in playerfile
&+c - Modified timeout code so all idle players will be transported to the
&+c   Shady Clearing without equipment. This happens after 45 mins!
&+c - Added new prompt system, with idle times/hp/score etc in the prompt.
&+c - The mud now uses the Female titles when it should.

&+WMarty                                                        5-7 December
&+B=========================================================================
&+c Added QuickWriter. It's a serverside macro system which allows you to 
&+c define shortcuts for frequently used commands like 'get all from corpse'
&+c These commands can be abrieviated to things like 'gac' or 'ga'. It is
&+c fully selfconfigurable, but you need to find the Quickwriter first!.

&+WMarty                                                        5-7 December
&+B=========================================================================
&+c Added an asynchrone hostname lookup system. It will prevent the mud from
&+c causing lag when someone logs in. It used to sometimes halt the mud for
&+c a while untill it found the name, now this is done externally, leaving 
&+c the mud to serve you game players.

