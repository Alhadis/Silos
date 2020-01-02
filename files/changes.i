27 July : In the process of the last few days i made the following adjustments:
          - Removed become
          - fixed rose command (hopefully)
          - Redid parts of snoop and alias
          - Added new zones: evolution, noxypickle, rainforest and some who
                             are being developed
          - did minor cleanups of errors and warnings during compile
          - Redid the zone bootstrap and questdone list. This will now show
            which Quests are in the process of being done. Ofcourse this is
            a very rough estimate, but it may help players decide what to
            do next ;)
          - New Lflag: Rapids, requires the player to carry a raft instead
                       of a normal boat.
          - New Oflag: ReflectMagic, i think thats an obvious one.
          - Fiddled with Makefiles
          - Login timeout of 2 minutes
23 June : nofinger now also protects your laston status.
16 June : Disabled become for all levels below wizard master
15 June : Added zone adept, added some more RZA checks.
30 May  : Hopefully fixed the bug in rope code
	  Added colours to tell.
	  Removing The Stone Temple as start place ;)
25 May  : Added inventory colorcode fix is in place, inventory should fill
	  up as much as it can after the mud has rebooted ;)
	  Also made scan show deathrooms when there arent always deathrooms
	  around.
15 May  : Added a automatic mud poller to keep an up to date mudlist. Soon 
	  to get company of an automatic www-page mudlist.
13 May  : changed Away command to add reasons of being away.
          New syntax : away <message>
10 May  : Fixed the bug that allowed players who drank an invis potion, to stay
	  invis for teh remainder of their stay.
3  May  : Havent notified my changes here. Nothing really big except for one
	  thing.. A fix to the regular "fight" bug. Seems to hold and havent
	  had as many crashes since then. Also the sockets have ssem to 
	  behave a little better, yet not perfect.
	  There were also some security holes here and there in the location
	  flag system, which have been dealt with.
	  Furthermore we have 2 new zones in the pipeline for future 
	  addition. Both are currently being tested for bugs etc.

	  Work in progress:
	  - autoeat, current status: Standstill.. waiting for seoman.
	  - new zone, standstill, still in development?
	  - login timeout: In progress.. testing code atm before installing
	  - Away message: postponed untill we have cleand up the who listing
	    a little.

16 April: Fixing Fixing Fixing, who knows maybe it works?
	  Anyways, worked on filtering out the reboot error, and i removed
	  the eatwimpy code just in case.

12 April: Fixed a bug in reboot readback code, that would completely crash
	  the mud. So one bug less ;)
	  Also fixed some armors and slightly modified the EvilSpirit quest

7  April: Fixed a typo, linked the stjames zone, hopefully fixed follow bug.
	  Plugged healall with linkdead.

1  April: Fixed the jump bug and removed one open file error bug ;)
30 March: Added a new spell 'scan' for players of level 8 and higher, read
	  help scan for more information


29 March 1997		Marty
----------------------------------------------------
Round 2 of code modifications: Bug fixing ;)

28 March 1997		Marty
----------------------------------------------------
Added Asmortal mode, Restricted zone access, linkdead, a new spell "scan".

23 March 1997		Marty
----------------------------------------------------
The bughunter has been bussy again. The following bugs were visited, and
squashed.
- Vis player to invis player action
- Charm in Magichood should work now
- Asmortal party create bug
- Wearing items in container bug.
- Fixed a couple of armors which werent set correctly.
- Zone reset for some quest zones.

While i was at it i added a newer version of the party code, still not perfect
but getting there.

10 March 1997           Marty
----------------------------------------------------
Some fixes here and there, some minor things, nothing big.

1 March 1996 		Marty
---------------------------------------------------
Added fix for cut command crash.
Added possible solution to inventory problem

20 Januari 1996		Marty
---------------------------------------------------
Fixed a bug in koosh, searching other ones...

7 Januari 1996		Marty
---------------------------------------------------
Fixed login problems.

8  December 1996	Marty
---------------------------------------------------
People that are mailing will show up in the who list.
Fixed some prompting problems in the mailer.
Fixed list_objects, that caused some rare duplicates in some even rarer
 situations.
Beautified the login procedure.

2  December 1996	Marty
---------------------------------------------------
Dark problem is fixed again, so is the strange parse bug that stopped you
 from saying 'in at'.
Fixed a nasty typo, which gave all players nice gadgets as crash (although
 they couldnt use it).

1  December 1996	Marty
---------------------------------------------------
Fixed prompting in mailer.
More automation of the code generator.
Some minor things, like allignment in value command, armor strength indication
 in equipcom, colors here and there.
Added armor/damage storage to update code, needed for excalibur, catherdral.
Colorised equipcom.

28 November 1996	Marty
---------------------------------------------------
Made a fix for the "hung sockets" problem when players entered sentences >
 300.... well sorta. I ain't an expert on sockets, so it can probably be
 improved.
Added mode BRACKET so you do not have to edit all files if you wish to
  alter your MUD appearance.
Added norun command, see help norun for more info.

23 November 1996	Marty
---------------------------------------------------
Added some minor fixes to zones and code.

22 November 1996	Marty
---------------------------------------------------
Fixed crash bug, when player tries to do info while aliased it crashed the
 game.
Moved some code from source files to zone files (putcom & eatcom).

21 November 1996	Marty	
---------------------------------------------------
After many pleadings of Fuzzy i have reintroduced the trace command.

19 November 1996	Marty
---------------------------------------------------
Fixed movement of mobiles, while they were fighting
Fix minor bug in frob (forgot to set trance flag).
Fixed minor bug in frobozz zone.
Fixed messages for cure.
Fixed say <-> blind bug.

18 November 1995	Marty
---------------------------------------------------
Added questpoints.

15 November 1996	Marty
---------------------------------------------------
Upped qflags to 64 bits (just to be sure).
Rewritten change level, since it was kinda bugged.
Casting Spells to a dead player will cost you points.
Added a flag to prevent users from using become too much.

13 November 1996	Marty
---------------------------------------------------
Added an idea by Illusion to reduce the send_msg loop
Fixed small bug in the parser which didn't allow you to abreviate tell by
 the name.
Fixed bug in eehandler.
Fixed bug in givecom.
Fixed security hole in change level.

11 November 1996	Marty
---------------------------------------------------
Fixed narnia quest. Added fake hostnames, perhaps make something for landcodes?
Added warncommand (Sort of friendlier warnzap).

9 November 1996		Marty
---------------------------------------------------
Added asmortal command, Added Kenders exits fix.
Added oflags rope, enhancemagic, blockmagic and wearblmagic.

6 November 1996		Marty
---------------------------------------------------
Fixed follow.
Added goto special event on entry of room. (E_ONENTRY)
Added generate fix.

5 November 1996		Marty
---------------------------------------------------
Added exits ne,nw,se,sw.

4 November 1996         Marty
---------------------------------------------------
Tested code on RS-6000 (AIX), had to do some minor fixing, but works now.
 Biggest problem was all those strcasecmp warnings, seemed to be a simple
 include problem ;)

2 November 1996         Marty
---------------------------------------------------
Added/refined ban/unban code.
Fixed defender.

1 November 1996		Marty
---------------------------------------------------
Moved all tie/untie/dig code into the zone files. Tested all digs,
 and some of the ties/unties.
Fixed problem in parser (in was not seen as preposition)

29 October 1996         Marty
---------------------------------------------------
Last part of compiler is now ready. Now rooms can also have code.
Fixed alias problems with new parser.
Players that try PK to much will now be kicked off.

28 October 1996		Marty
---------------------------------------------------
Added utility routines bstrlen and bstrncpy.
Added some messages to open/close/lock/unlock.

25 October 1996         Marty
---------------------------------------------------
Put some code in puff and the thenewworld. Fixed code so you can resurrect
 corpses after they have decayed.

24 October 1996 	Marty
---------------------------------------------------
Fixed bug reported by Rydis (statting thenewworldxxx would crash the MUD)
Fixed rod bug (actually a bug in getcom).

23 October 1996		Marty
---------------------------------------------------
Added Required quests code (working), and added a seperate table to show
 which quests are required.
Added small corpses code. Dead non-cloned mobs now leave corpses behind.

20 October 1996         Marty
---------------------------------------------------
Rewritten Parser .. again. This time it could be here to stay.
Recoded the points distribution code for party groups (Manic's suggestion)

17 October 1996         Marty
---------------------------------------------------
Fixed change wimpy (players could set someone elses wimpy).
Fixed change level to work with frob pflag, instead of god level.
Added some macros to help code special events, simple quick and dirty.

16 October 1996 	Marty
---------------------------------------------------
Fixed crash bug when players from numeric ip hosts tried to log in.
Fixed Start location fault in stats command.
Added escape-from-jail-trick fix (set exit wiz+).
Added steal from players option.
Added NoComm command, so you can shut off noisy users.

15 October 1996         Marty
---------------------------------------------------
Patched a problem that occured with linkdead (cut link) players, and reboot.
 When players cut their link, they seemed to stay in the MUD, according to
 who (not socinfo), and also reboot would see them as alive, storing invalid
 data, and causing the mud to crash after reboot.
Added auto-backup feature (experimental).

11 October 1996		Marty
---------------------------------------------------
Moved all Object and Mobile code I had ported to the special event system into
  the zone files. 
Improved the generate so it puts all objects of a zone in one file (same for
  mobiles). Now it also creates the tables for mobiles and objects.
Created Distribution backup. (Cleared out EW code)

5 October 1996		Marty
---------------------------------------------------
Fixed prompting problems hopefully.. Newbies start in intro zone.
Move into deathtrap for level < 7 not allowed.
Fixed the crpaup in such a way you can't make mobiles kill eachother for 
 you.
Fixed some colors here and there.

21 September 1996	Marty
----------------------------------------------------
Forgot to close the userfile on exit DUH!!!
Added some new options in login procedure, you probably have seen it already.

17 September 1996       Marty
----------------------------------------------------
For EW distribution added lostlove (2 min work)
Added pflagreset command (on request).
Colorised look command for Imms.
Made some quests requires, and some not for wizhood.

16 September 1996       Marty
----------------------------------------------------
Fixed pflag problems.
Added fixes for HPUX Makefile.

14 September 1996	Marty
----------------------------------------------------
Rewritten Makefile & fixed errors in genmain.c
Can't kill players with kill anymore (This used to be possible even with
 no-PK mode on)!!
Added Zone to test Automated Transport (AT) system (see info pdirt).
Colorised sea.
Expanded acct.

12/13 September 1996   Marty
----------------------------------------------------
Capitals in name are now allowed, double names however are not possible.
Removed major crash bug, which occured if you fought while being aliased.
Added parser to wizlist.
Rewritten general help file.
Change level me works...
Added parser to actions command.
 
9/10 September 1996 Marty
----------------------------------------------------
Imms can do a remote give.
Mobiles now wield strongest weapon.
thank is can also be used remote
Fixed flee
Made hate less hatefull.
Fixed Drunk bug.
Vis check on external actions
Added vis check on rose/flowers/wave and made rose/flowers remote actions

8 September 1996 Marty
----------------------------------------------------
Fixed the player events handlers. Added first code for an elf pet.
Made the eating tree a bit more tame.
Made puff a little tamer.

7 September 1996 Marty
----------------------------------------------------
Fixed users command.
Reorganised Directory structure.
  Moved all player code into a seperate directory (inclusive the pet code).
Added a bare log command (prived users only).
Fixed powers/rulers

5 September 1996 Marty
----------------------------------------------------
Added changeable prompts for mortals.
Fixed error in the go command.
Fixed login prompting message.
Score no longer shows negative points to next level.
Fixed nod command.
Added clear distracted flag after frob command.

4 September 1996 Marty
----------------------------------------------------
Rewrote wizlock, bit nicer now.. Colored Become.

3 September 1996 Marty
----------------------------------------------------
Experimenting with using the event handler to work as a pet engine...
 or extended command engine (customised commands for special players)

1 September 1996 Marty
----------------------------------------------------
Sorted the pflags table.

30 August 1996   Marty
----------------------------------------------------
Added party fixes by Rex...

29 August 1996   Marty
-----------------------------------------------------
Modified build_setin and make_here, so it doesnt need the globals
 to be changed.

28 August 1996   Marty
-----------------------------------------------------
Implemented booze flag, people now get drunk and sober up. Being
 drunk will influence your fighting skills.
Gen in V1.04 (lflag bug fixed)
Added mobile wimpy.
Wear now shows what you are trying to wear.

27 August 1996   Marty
-----------------------------------------------------
Jbs code is cleared out of the driver.
Ancient code is cleared out.

17 August 1996   Marty
-----------------------------------------------------
Fixed some small bugs in generate

16 August 1996   Marty
-----------------------------------------------------
Added global data functionality for zones.

12-15 August 1996 Marty
-----------------------------------------------------
Written a new data generator, hopefully it is easier to modify.
 Testrunning it for a while... (old one is in utils/genold)
Fixed a small bug in helpcom

11 August 96     Marty
-----------------------------------------------------
Moved all jbs code from objsys to objects/jbs.c
Made a proggy that can create the stubs for me, yes i'm lazy.

10 August 96     Marty
-----------------------------------------------------
Moved some code from putcom to external files (special events).

28 Juli 96       Marty
-----------------------------------------------------
Installed experimental improved reboot code. More error catching, more
 structurized. (old code is in main.old)

25 Juli 96       Marty
-----------------------------------------------------
Have been struggling with the pflags/masks again, I think this time it works
 okay.
Worked a little with the prompting of the file pager.

24 Juli 96       Marty
-----------------------------------------------------
Found a bug in party system (if name consists of more than one word, it will
 crash in dcprnt()), fixed it.
Adjusted the closing time routine, added an extra warning 1 min before 
 closing, and added loop that will kick off all players except the operator.
 Also stopped mobiles and deactivated events when mud is closed (starts 
 again when the mud opens again). 
Added log-message for opening hours.
Found an enourmously sneaky 'feature' that would give every player the 
 oppurtunity to become a god. Adjusted the code and removed this security
 hole.
Also removed the yn_handler stuff, that wasn't used anywhere.

23 Juli 96       Marty
-----------------------------------------------------
Added some comments here and there. Added the EVENT_HANDLER define, to make
 the special events definitions more standarized and easier to adjust.

17 Juli 96       Marty
-----------------------------------------------------
Worked on a way to imprive the messaging system (the bprintf), Have some
 basics, but needs to be worked out more to allow backward compatibility.
 It basically won't need a globals_setup, and wont use the cur_player
 pointer to find the right stream.
 Maybe easier if i say this: The system is multiuser, but bprintf isnt,
  so it needs changing.

16 Juli 96       Marty
-----------------------------------------------------
Moved communications commands that were in sflag.c to communicate.c.
Cleaned up some functions that should be somewhere else, like in actions.
 commands.c should be quite clean now.
Moved puff's punt code to npc/puff.c, installed the special events handler
 in puntcom (E_ONMISC, param_s.misc = VERB_PUNT)
removed some unused code.

15 Juli 96       Marty
-----------------------------------------------------
Moved all frob commands to admin.c, moved all similair code of wizfrob -
 godfrob into one function.
Worked a little on manual, added appendix B and Chapter 6.

8  Juli 96       Marty
-----------------------------------------------------
Renamed ferries system to AT-system, since it now should work for more
 than just ferries.
Reintroduced the percentage read bit in the pager.
Split exit mudlog message to 2 lines, 1 showing the name, one showing
 the stats.
Added some log code that were mentioned in config, but not in code.
Renamed uaf_rand to users_data.
Made a seperate dir for 'external' messages (like wiz.txt)

30 June 96       Marty
-----------------------------------------------------
Introduced the ferries system, not perfect yet, but getting there.

27 June 96       Marty
-----------------------------------------------------
Fixed some small bugs in eehandler. emoteall didnt work, emoteto worked
 always, even if the player wasn't found (Possible crash bug).

23 June 96       Marty
-----------------------------------------------------
Almost cleared get, only one special is remaining....
 
22 June 96       Marty
-----------------------------------------------------
Cleared Dropinpit getcom, working on dropobj and get1objfrom.

20 June 96       Marty
-----------------------------------------------------
Added a new player host lock. Basically allow old players to enter, but
 not any new players. Uses hostlock to display a message, and locked_hosts
 as file where all locked hosts administrated. Unfortunately I had to 
 implement this after some unfortunate experiences on my own MUD. :(

19 June 96       Marty
-----------------------------------------------------
Fixed homecom. CLoned rooms now work as well..

17 June 96       Marty
-----------------------------------------------------
Cleaned out open/close/lock/unlock
Upped the puff talkrate, to make it almost equal to the old puff, I just
 love her too much to mute her ;)

14 June 96       Marty
-----------------------------------------------------
Added NoWeather flag and command etc.

13 June 96       Marty
-----------------------------------------------------
Improved the move code. Almost removed all special cases and made the
Bar flag test a bit more efficient (it used to check ALL mobiles, now only
 those in the same room as you).  
Later that day: Finished cleaning up mobile.c for now..

12 June 96       Marty
-----------------------------------------------------
Removed all links to mobiles in fight.c. Only some small references to objects,
but those will come later.

11 June 96       Marty
-----------------------------------------------------
Cleaned communicate.c, made it easier for people to create mobiles that
 respond to messages. This can be done by the even E_ONCOMM, the input
 message is in param_s.buf, and it expects the output message in there as
 well. If param_s.ret is not changed, it will send the new message back to
 the player who sent the original message. See haven_bard for a small example.
Also changed the sayback messages to the emotes, I Hated the old way.

10 June 96       Marty
-----------------------------------------------------
Pushcom switches are out! Except for tie and untie, just some small code
 exceptions remain before commands.c is clear.
Removed some of the small instances... only one entry in pray is a little
 hard to convert... but i will find how to do it...  i hope..
Except for tie and untie commands.c is clear!

9  June 96       Marty
-----------------------------------------------------
Stripped all puffs from the code and put it into the npc/puff.c file.
 Puff should be a bit more mellow, since it is now called once every 2
 seconds instead of twice.
Cleared dogive from all special events.
Cleared examcom and lookcom, Wow that looks a lot better now ;)
Only shame is that the executable seems to grow, but i think it is worth it

8  June 96       Marty      (4921749@hsu1.fnt.hvu.nl)
-----------------------------------------------------
In an attempt to make the core engine clean again I made the special function
 calls. This are pointers in the datastructure which points to a function 
 with the code that should be handled on a special event. It basically is the
 same as it was, but it allows the kernel to keep clean and perhaps later to
 add a catch field in the zone file. Explenation on that will come later.
 I will move as many cases as possible to this new type since i think it will
 make the kernel clearer in use.

 The special code goes into a file in the npc, objects or rooms dir

4  June 96       Marty      (4921749@hsu1.fnt.hvu.nl)
-----------------------------------------------------
Change the follow code. Removed a small bug in followcom()
Removed saveall call from healall.
 Called version 1.2.3.1
Messed around with s_socket.c.
Debugged The powerscom and rulerscom. 
Touched the blizzard.zone, haven.zone. Connected testzone demon to
 shady clearing.
Added some more comments to the config.h file. It should be more than
 clear now. 
Changed syslogging a little.
Removed rhome.zone from distribution.
Signing off for today

3  June 96       Marty
-----------------------------------------------------
Retouched Village.zone should confuse some macros out there ;)
Split xlimbo into seperate zones.
 Gonna revamp all commenly used zones so beware!

2  June 96       Marty
-----------------------------------------------------
Changed Dump to show date of entry with the -d option.
Changed a little title bug (had one title to much in wizlevels).
Replaced the Dyrt syslog to the iDirt syslog routine, which was a 
 bit smarter implemented.
Now do a strncasecmp to see if an object is an armor or some other type
 of equipment, instead of a number check.

26 May 96        Marty
-----------------------------------------------------
Added nofinger test to showplayer (stat command).

24 May 96        Marty
-----------------------------------------------------
Reinstalled Linux, because it is quite clear now my current version isn't 
 compiling correctly. I have had bug reports of things that worked okay
 for me, but no where else. In the release of this date or later most of
 the bugs found will have been fixed. Such as:
 - Crash bug when a player kills a mobile (magic and non-magic)
 - %s crash bug in immortal communication lines
 - Stat bug for players who set their home to a self created zone
 - Debugged Party code
 
I deeply appologize for the enourmous bugs in the previous release, but I
had no idea there were any bugs. Hopefully this one would do better.

21 May 96        Marty
-----------------------------------------------------
Added a fban command (file ban, couldnt use ban because if would clash with
 bang, which i would needed to work around). Now Players with the required
 flag will be able to ban a player or host from within the mud.
Added a SummonPlr flag, to be able to remove the summon priviledge for
 players.
Added NoPuff command and code.
Heard there was a bug in move and kill, but can't find nothing wrong here.
Cleaned up the verbs file, removed condition.c/condition.h

19 May 96        Marty
-----------------------------------------------------
Added cemote (chat emote line). Kinda emoteall, except you can see its a 
 fake.
Changed log entries for reboot and connections.
Fixed a bug in immortal channels that wouldn't crash the mud, but would
 screw up the player's name and do bizarre things (yes, %-sign bug)
Removed compile warning from s_socket (bind).

17 May 96        Marty
-----------------------------------------------------
Upped Oflags to 96, had to change the list_objects to suit the new size.
 There are some other functions which could use a little changing as well.
 Files that needed changes for the new size are:
 generate.c bootstrap.c clone.c objsys.c rooms.c update.c mudtypes.h 
 mudmacros.h and a couple more...
Changed some of the level code. The wizlevels were a bit too hardcoded for
 me. I made them a little more flexible so you can add new immortal levels
 without running into as much problems as i did. It's still tricky tough.
As I found out on EW the bug fix for the ojects doesn't work at all. No
 response from other mud coders on a fix that works. 
I Will return pets later when I have some more time. Also this should allow
 guilds and such things.

13 May 96        Marty
-----------------------------------------------------
Changed Combat messages a little.
Added Warned Flag (complete now).

08/05/96        Marty
-----------------------------------------------------
Added a small check and assignment to the int_set code, which will
 hopefully prevent the bug with containers I found on EW.
Work in progress on Warned Flag. Can be used to keep an eye out on
 players who misbehave.

05/05/96        Marty
-----------------------------------------------------
Eek, the lflags werent working correctly (always light), but i fixed it.

04/05/96        Marty
-----------------------------------------------------
Party messaging system is in. Added commands to helpfiles.
Had a crash today causing my whole system to go down, somehow it couldn't
 get a certain objects and got stuck in what seemed a recursive loop.
 Will have to check the files to see what went wrong...
Luckily the files weren't corrupted so i still have my work here
The crash was caused by a what looked like normal object. Removing it solved
 the problem, still don't know why the object was wrong... :(

03/05/96        Marty
-----------------------------------------------------
Added a group function to the mud code, called party. All it needs is a 
 messaging system (psay or something), works like a train ;)

01/05/96        Marty
-----------------------------------------------------
Added a nofinger command, which will block lower level players from 
 seeing someones email. (Also added it to config command)
Fixed a some typos in the spells (I switched hp_loss & damage)
Added a rulerscom, which will show GOD+ players, made powerscom for
 Awiz - High Demi
Added the code for MFL_NOGRAB, MFL_DLEVEL, which wasnt in there... 
 This is starting to get annoying... its the 2nd time I come across 
 not-implemented flags, I Think that i will check ALL flags for 
 validity... Now i know why i didnt follow Dyrt in all her moves

30/04/96        Marty
-----------------------------------------------------
Added a primitive Idle check function. This will currently quit every
 player that is idle longer than xx mins (see bottom timing.c). Will
 move this to config.h when I think the idle is at the best it can be.
Upped the amount of objects a player can carry to plev(player) + 10
Added the flexible pager length to the syslog command
Moved a part of diagnose to mobile.c. Examine now shows the player
 strength status..

29/04/96        Marty
-----------------------------------------------------
As you might have noticed, I changed the files here and there to suit
 my taste more. I don't think help is an admin command so i made a 
 special file (infosys.c) for all the help and info systems in the mud.
 The file system.c now contains the commands: global and acct etc etc
I also gave all the files a define to make the compile a bit cleaner.
 Look at questnames.h or global.h, for an example how i used it.
Added a hp_loss field to spells type specify how much hit points you loose
 when you cast a spell.
Moved the file_pager to bprintf.c
My goal is to remove redundant code to such a size, it will sit nicely
 between the old dyrt code and the idirt code.

22/04/96        Marty
-----------------------------------------------------
Cleaned up some more old database code. COmpletely removed the exec.c
 and exec.h file. Removed all the references to those files and the
 one function i hadn't remove yet.
 Removed the condact.h file. The database should be completely history
 by now..
Fixed a small error in the signal handler routine.
Added ShortExits code. (brief exits format)

20/04/96        Marty
-----------------------------------------------------
Added the memory leak fix of dragorn. (communication)

14/04/96        Marty
-----------------------------------------------------
Added sflag for Klock
Updated the config command
Recoded the bit of the reboot system that shows the messages.
Added wimpy level to score
Hate code works okay now (been that way for a while, just forgot
 to add it to the changes log)

13/04/96        Marty
-----------------------------------------------------
Upped Sflags to 96

11/04/96        Marty
-----------------------------------------------------
Added klock
Expanded the handler function of the debugger
Changed the general help function
Added qinfo and the info files that goes with it.. Also updated the
 old info files
Moved logs by Rex/Dragorn etc to old_changes.i

10/04/96        Marty
-----------------------------------------------------
Fixed the entry bug which screwed up your the first time you enter
 and had autoexit on (wouldnt get to see the exit), still is there
 when transing though :(
Fixed the debugger again.. Now it works again *sigh*

07/04/96        Marty
-----------------------------------------------------
FIxed the calendarcom, when a user wanted to make stormy weather
 they couldn't, now they can
Added some checks in move_mobiles and consid_move, hopefully they
 will shorten CPU in the future.
Created quest.c to hold all general quest functions. Made a function
 called set_quest to be used when a quest is finished.
Also came across some old Ghost code that wouldnt work anymore
 anyways so i removed it.
Added the code for Fantasy zone although it was meant for a mud
 with mana, but who knows what the future will bring ;)
At the same time I cleaned up wound_player which was still messed
 up from the ghost special cases.

04/04/96        Marty
-----------------------------------------------------
Well decided today was a good day to up the lflags to 96, if all
goes well, I'll update the rest as well, that should give you 
flag-eating maniacs some time to create some creative flags.
Okay fixed lflags (now 96!), next are oflags, although that will
mean i have to adjust the layout of the objects file...

04/02/96        Marty
-----------------------------------------------------
Well after a long and tiring weekend I once again looked at the code
again and found several functions which arent needed anymore 
(old functions used by the DATABASE, which was removed by Rex)
I removed them, but have kept a copy of the old ones.
Also cleaned up some previously made code
Reorganised the helpfiles, so you wont get the message 
"that person isn't playing now." as much as in the old version
Also recoded the wizchannels a bit.

03/29/96        Marty
-----------------------------------------------------
Quickly repared the wimpy code

03/27/96        Marty
-----------------------------------------------------
Added the update code, enhancement on the old reboot code
Added the config command
Removed the ugly ghost code which, wasnt popular anyways

03/26/96        Marty
-----------------------------------------------------
Added numreboot/numreset/numcrash to mud code
Expanded the uptime command to show the crashes and the time since
 last healall
Added a field to the player file to keep a record of how many 
 times a player/mobile died. Should be nice. Also added a field
 to keep howmany times a player runs into a deathroom, but that
 is not implemented yet.
Uncommented some wimpy, but it still doesnt work..

03/20/96        Marty
-----------------------------------------------------
Well a lot has happened since then. First of all I removed the whole
pet system and guild system
I implemented the iDirt signal handling system, which handles crashes
like it should!
Also i completely ripped out the two pass parser, which was a major 
pain in my butt. I have wanted to do this a long time, and now i have
completed it. Its now a one pass hash table (read your books if you
dont know what it is). 
Also added the exit handler of the iDirt distribution. Works okay,
 came with its own signal command to reboot a mud with hung sockets,
 although you wont need it since you have got the killsoc command.
 You can however simulate other signals with it to test how well the
 signal catcher works.
 You can also add a new text for sigusr2, if you have some special
 reboot to happen

02/17/86        Marty
-----------------------------------------------------
Completed nymph code. 
Added small zone for demon pet.
Attached Townhall & Demon to village (replaced fishyard)
Added code for demon zone and some more code for townhall

02/16/96        Marty
-----------------------------------------------------
Reorganised the way the pet commands are handled. They now use a
single parser. Added the nymph code.

02/15/96        Marty
-----------------------------------------------------
sleep added. Trance added (need to make a quest to make it available
 to players). 
added jailcode from Rex and Freakster (cool work but sloppy 
 instructions here and therei, sorry ;) )
Examined example linkdead code from Vitastjern en Ithor, will try to
 implement it as well.
Also looked at hate code, think i will introduce it in some minor version
 (ie when fleeing a mobile will remember who attacked him/her)
MayPunt flag added somewhere this week.... Made it impossible to
 change it by players themselves.

02/13/96        Marty
-----------------------------------------------------
Added a couple of actions introduced in EW V1 (Dirt)

02/10/96        Marty
-----------------------------------------------------
Added Lostlove and Universe.
Played around with flexible idle times but removed them
Played around with newbie patrol, but deactivated it.

02/08/96        Marty
-----------------------------------------------------
Killed players crashed the mud <panic>
 Somehow the syslog caused the mud to crash. Have removed
 the slain message. Tough luck.
Added visibility check for follow
Added demon free and greet command. Begins to look cool :)
Colored the logfile messages a little. We have color so why
 not use them?

02/08/96        Marty
-----------------------------------------------------
Added first gadget demon! wizard can use demonpet to get one
 can't lose it yet however ;)

02/07/96        Marty
-----------------------------------------------------
Changed the total look of the MUD to suit my taste.
Added some underwater code. 
Changed INFO & Help files.
Added timeout code to mud.
Added a new flag NoTFight. This is to prevent mobiles from talking
 during fight. This is to stop a bird from talking in fight (seems
 obvious to me)
Added several spare fields in the player files to make new gadgets
 possible in the future.
Added the townhall zone.
Added Chat line code.
etc etc.

