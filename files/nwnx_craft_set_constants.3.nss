/******************************************************************************
*****                    nwnx_craft_set_constants                         *****
*****                         V nwn2 X1 (motb)                            *****
*****                             12/23/07                                *****
******************************************************************************/
//used on : module laod execute script
//purpose : Store the lists locally

//lists could have been stored as string constants instead of local vars... 
//but i wanted something that module builders could change easily
// and that could be retrived without any script modification
//which is impossible if i were to use constants.
//this way, i can compute the list names (aka local var name) dynamically,
// given some info taken from the 2da,
// thus ensuring you to get full compatibility with custom contents such as new races
// or new materials for specific items (ie leather cloaks.. ) or whatever...
//without having to change a single line of script (except the list itself... of course... )


//some of the models listed here aren't actually used by nwn2 (i don't know why)
//some of them are fully functionnal though unused
//some of them are invisible
//some of them are showing on nwn2 but have been changed to invisible in motb... ( ie Longsword #7 you should disabled by the way .. )

//so you'll have to test (or ask your players, which ones are to be removed from the lists.

//actually i've benn doing the lists quily so their might be some useless list (ie ammunition... armorparts for non playable races, belts... or whatever.. )
//feel free to comment (//) them... 

//lists with only one value are basically useless, but i kept them if you ever wanted to add new models...
//you can also comment them if you want to.


void main()
{
	object oModule = GetModule();	
	object oSpawnWP = GetWaypointByTag("XC_HIDDEN_WP");	
	object oHiddenContainer = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_colbox",GetLocation(oSpawnWP));
	SetLocalObject(oModule,"XC_HIDDEN_CONTAINER",oHiddenContainer);
	
	
///////////////////////////////////////////////////////////////////////////////
//////////////////////////////  ModelParts  ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//modelpart are related to weapons and shields
//some weapon have up to 3 modelparts (ie longsword)
//you could had the "0" value in each list for it's also a valid value, but it stands for an invisible part.

//theses lists use the ItemClass column of the baseitem.2da 
//in order to respect the official naming conventions of the weapons 3d models

//if you ever use custom weapons(might happend, you'd just have to had the lists according to the name you specified in the 2da.

//if you've got new appearences for existing weapons (in hakpacks for instance)
// you can add them in the existing lists, according to the name of their 3d model.

//lists with only one value are basically useless, but i kept them if you ever wanted to add new models...


//x1:
	SetLocalString(oModule,"XC_W_ARROW_A", "#1#");
	SetLocalString(oModule,"XC_W_BAXE_A", "#1#2#3#4#");
	SetLocalString(oModule,"XC_W_BAXE_B", "#1#2#3#4#");
	SetLocalString(oModule,"XC_W_BAXE_C", "#1#2#3#4#");
	SetLocalString(oModule,"XC_W_BOLT_A", "#1#");
	SetLocalString(oModule,"XC_W_BSWORD_A", "#1#2#3#4#5#70#");
	SetLocalString(oModule,"XC_W_BSWORD_B", "#1#2#3#4#5#70#");
	SetLocalString(oModule,"XC_W_BSWORD_C", "#1#2#3#4#5#70#");
	SetLocalString(oModule,"XC_W_BULLET_A", "#1#");
	SetLocalString(oModule,"XC_W_CLUB_A", "#1#2#3#4#5#31#71#73#74#");
	SetLocalString(oModule,"XC_W_CRSBH_A", "#1#");
	SetLocalString(oModule,"XC_W_CRSBL_A", "#1#2#");
	SetLocalString(oModule,"XC_W_DAG_A", "#1#2#3#4#5#6#70#71#74#98#99#");
	SetLocalString(oModule,"XC_W_DART_A", "#1#2#");
	SetLocalString(oModule,"XC_W_DMACE_A", "#1#2#");
	SetLocalString(oModule,"XC_W_DMACE_B", "#1#2#");
	SetLocalString(oModule,"XC_W_DMACE_C", "#1#2#");
	SetLocalString(oModule,"XC_W_DWARAX_A", "#1#2#");
	SetLocalString(oModule,"XC_W_FALCHN_A", "#1#2#");
	SetLocalString(oModule,"XC_W_FALCHN_B", "#1#2#");
	SetLocalString(oModule,"XC_W_FALCHN_C", "#1#2#");
	SetLocalString(oModule,"XC_W_FLAIL_A", "#1#");
	SetLocalString(oModule,"XC_W_FLAIL_B", "#1#");
	SetLocalString(oModule,"XC_W_FLAIL_C", "#1#");
	SetLocalString(oModule,"XC_W_FLAILH_A", "#1#2#");
	SetLocalString(oModule,"XC_W_FLAILH_B", "#1#2#");
	SetLocalString(oModule,"XC_W_FLAILH_C", "#1#2#");
	SetLocalString(oModule,"XC_W_GAXE_A", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_GAXE_B", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_GAXE_C", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_GCLUB_A", "#1#2#3#");
	SetLocalString(oModule,"XC_W_GSWORD_A", "#1#2#3#4#5#6#7#8#9#10#");
	SetLocalString(oModule,"XC_W_GSWORD_B", "#1#2#3#4#5#6#7#8#9#10#");
	SetLocalString(oModule,"XC_W_GSWORD_C", "#1#2#3#4#5#6#7#8#9#10#");
	SetLocalString(oModule,"XC_W_HALBD_A", "#1#2#");
	SetLocalString(oModule,"XC_W_HALBD_B", "#1#2#");
	SetLocalString(oModule,"XC_W_HALBD_C", "#1#2#");
	SetLocalString(oModule,"XC_W_HAXE_A", "#1#");
	SetLocalString(oModule,"XC_W_KAMA_A", "#1#2#70#71#72#73#75#76#78#79#81#");
	SetLocalString(oModule,"XC_W_KAMA_B", "#1#2#70#71#72#73#75#76#78#79#81#");
	SetLocalString(oModule,"XC_W_KAMA_C", "#1#2#70#71#72#73#75#76#78#79#81#");
	SetLocalString(oModule,"XC_W_KAT_A", "#1#");
	SetLocalString(oModule,"XC_W_KAT_B", "#1#");
	SetLocalString(oModule,"XC_W_KAT_C", "#1#");
	SetLocalString(oModule,"XC_W_KUKRI_A", "#1#");
	SetLocalString(oModule,"XC_W_LBOW_A", "#1#2#3#4#5#6#");
	SetLocalString(oModule,"XC_W_LHAM_A", "#1#2#");
	SetLocalString(oModule,"XC_W_LHAM_B", "#1#2#");
	SetLocalString(oModule,"XC_W_LHAM_C", "#1#2#");
	SetLocalString(oModule,"XC_W_LSWORD_A", "#1#2#3#4#5#6#7#8#70#");
	SetLocalString(oModule,"XC_W_LSWORD_B", "#1#2#3#4#5#6#7#8#70#");
	SetLocalString(oModule,"XC_W_LSWORD_C", "#1#2#3#4#5#6#7#8#70#");
	SetLocalString(oModule,"XC_W_MACE_A", "#1#2#71#72#76#89#99#114#118#");
	SetLocalString(oModule,"XC_W_MACE_B", "#1#2#71#72#76#89#99#114#118#");
	SetLocalString(oModule,"XC_W_MACE_C", "#1#2#71#72#76#89#99#114#118#");
	SetLocalString(oModule,"XC_W_MSTAFF_A", "#1#");
	SetLocalString(oModule,"XC_W_MSTAR_A", "#1#2#");
	SetLocalString(oModule,"XC_W_MSTAR_B", "#1#2#");
	SetLocalString(oModule,"XC_W_MSTAR_C", "#1#2#");
	SetLocalString(oModule,"XC_W_QSTAFF_A", "#1#");
	SetLocalString(oModule,"XC_W_RAPR_A", "#1#2#3#40#41#42#");
	SetLocalString(oModule,"XC_W_RAPR_B", "#1#2#3#40#41#42#");
	SetLocalString(oModule,"XC_W_RAPR_C", "#1#2#3#40#41#42#");
	SetLocalString(oModule,"XC_W_SBOW_A", "#1#2#");
	SetLocalString(oModule,"XC_W_SCIMT_A", "#1#2#3#");
	SetLocalString(oModule,"XC_W_SCIMT_B", "#1#2#3#");
	SetLocalString(oModule,"XC_W_SCIMT_C", "#1#2#3#");
	SetLocalString(oModule,"XC_W_SCYTH_A", "#1#2#3#4#");
	SetLocalString(oModule,"XC_W_SCYTH_B", "#1#2#3#4#");
	SetLocalString(oModule,"XC_W_SCYTH_C", "#1#2#3#4#");
	SetLocalString(oModule,"XC_W_SHE_LARGE_A", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_SHE_SMALL_A", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_SHE_TOWR_A", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_SHURKN_A", "#1#");
	SetLocalString(oModule,"XC_W_SICKLE_A", "#1#");
	SetLocalString(oModule,"XC_W_SLING_A", "#1#");
	SetLocalString(oModule,"XC_W_SPEAR_A", "#1#2#97#98");
	SetLocalString(oModule,"XC_W_SPEAR_B", "#1#2#97#98");
	SetLocalString(oModule,"XC_W_SPEAR_C", "#1#2#97#98");
	SetLocalString(oModule,"XC_W_SSWORD_A", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_SSWORD_B", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_SSWORD_C", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_W_STAFF_A", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_W_TAXE_A", "#1#");
	SetLocalString(oModule,"XC_W_TORCH_A", "#1#");
	SetLocalString(oModule,"XC_W_TORCH_B", "#1#");
	SetLocalString(oModule,"XC_W_TORCH_C", "#1#");
	SetLocalString(oModule,"XC_W_WHAMR_A", "#1#2#3#4#5#6#50#");
	SetLocalString(oModule,"XC_W_WHAMR_B", "#1#2#3#4#5#6#50#");
	SetLocalString(oModule,"XC_W_WHAMR_C", "#1#2#3#4#5#6#50#");


///////////////////////////////////////////////////////////////////////////////
//////////////////////////////  ArmorParts  ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////	
//ArmorParts are related to Armor components such as bracers, shoulders, knees... 
//the "0" value means you don't have this armorpart displayed (so you'd better keep them in the lists.. )

//as you can see there's plenty of lists.. one for each race and sex and armorpart...
//if,like me, you don't want to deal with so much lists, and you got the same lists for every armorpart,
//you can use the swithes  XP_CRAFT_USE_RACED_ARMOR_PART = FALSE and XP_CRAFT_USE_SEXED_ARMOR_PART = FALSE
// in the nwnx_craft_system script.
//By setting theses switches to false, you tell the system to use only the list for Humans and/or Males for every race/sex

//if you really got more 3d models for one race/sex and you want them to be used by the craft system
// you can set any of the switches to TRUE, and remove the comments around the list lines.

//if you're desperate, you can also set the longest lists of 3d models in the Human males lists
// and still disable the switches. (other races/sex just won't have anything displayed when pressing next/previous on theses invalid values) 

/*

since the lits are usually done according to the 3d models file names 
and the ArmorPart name in the item properties aren't the same (don't know why either)
I used the find/replace in order to replace the filenames in the lists by the "road map" names
which are much more usefull since it avoid to do a switch case... 

mdb_modelname -> real_roadmap

LSHOULDER->ACLtShoulder
RSHOULDER->ACRtShoulder
LBRACER->ACLtBracer
RBRACER->ACRtBracer
LELBOW->ACLtElbow
RELBOW->ACRtElbow
LUPARM->ACLtArm
RUPARM->ACRtArm
LHIP->ACLtHip
RHIP->ACRtHip
LUPLEG->ACLtLeg
RUPLEG->ACRtLeg
LLOWLEG->ACLtShin
RLOWLEG->ACRtShin
LKNEE->ACLtKnee
RKNEE->ACRtKnee
*/


//x1 : 

/*SetLocalString(oModule,"XC_A_DDF_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_DDF_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_DDF_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_DDF_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_DDF_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_DDF_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_DDF_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_DDF_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#25#26#27#28#29#");
SetLocalString(oModule,"XC_A_DDF_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_DDF_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_DDF_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_DDF_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_DDF_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#23#24#25#");
SetLocalString(oModule,"XC_A_DDF_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_DDF_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_DDF_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#25#26#27#28#29#");
SetLocalString(oModule,"XC_A_DDM_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_DDM_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_DDM_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_DDM_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_DDM_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_DDM_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_DDM_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_DDM_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#25#26#27#28#29#");
SetLocalString(oModule,"XC_A_DDM_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_DDM_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_DDM_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_DDM_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_DDM_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_DDM_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_DDM_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_DDM_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#25#26#27#28#29#");
SetLocalString(oModule,"XC_A_EEF_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_EEF_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_EEF_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_EEF_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_EEF_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_EEF_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_EEF_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_EEF_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_EEF_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_EEF_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_EEF_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_EEF_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_EEF_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_EEF_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_EEF_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_EEF_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_EEM_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_EEM_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_EEM_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_EEM_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_EEM_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_EEM_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_EEM_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_EEM_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_EEM_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_EEM_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_EEM_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_EEM_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_EEM_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_EEM_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#");
SetLocalString(oModule,"XC_A_EEM_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#");
SetLocalString(oModule,"XC_A_EEM_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#");
SetLocalString(oModule,"XC_A_GGF_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_GGF_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_GGF_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_GGF_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_GGF_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_GGF_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_GGF_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_GGF_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_GGF_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_GGF_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_GGF_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_GGF_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_GGF_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_GGF_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_GGF_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_GGF_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_GGM_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_GGM_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_GGM_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_GGM_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_GGM_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_GGM_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_GGM_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_GGM_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_GGM_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_GGM_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_GGM_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_GGM_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_GGM_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_GGM_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_GGM_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_GGM_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_GYF_ACLtBracer", "#0#28#28#29#29#30#30#31#31#");
SetLocalString(oModule,"XC_A_GYF_ACLtShin", "#0#20#20#21#21#22#22#23#23#");
SetLocalString(oModule,"XC_A_GYF_ACLtShoulder", "#0#29#29#30#30#31#31#32#32#");
SetLocalString(oModule,"XC_A_GYF_ACLtArm", "#0#24#24#25#25#");
SetLocalString(oModule,"XC_A_GYF_ACLtLeg", "#0#21#21#22#22#23#23#24#24#25#25#");
SetLocalString(oModule,"XC_A_GYF_ACRtBracer", "#0#28#28#29#29#30#30#31#31#");
SetLocalString(oModule,"XC_A_GYF_ACRtShin", "#0#20#20#21#21#22#22#23#23#");
SetLocalString(oModule,"XC_A_GYF_ACRtShoulder", "#0#29#29#30#30#31#31#32#32#");
SetLocalString(oModule,"XC_A_GYF_ACRtArm", "#0#24#24#25#25#");
SetLocalString(oModule,"XC_A_GYF_ACRtLeg", "#0#21#21#22#22#23#23#24#24#25#25#");
SetLocalString(oModule,"XC_A_GYM_ACLtBracer", "#0#28#29#30#31#");
SetLocalString(oModule,"XC_A_GYM_ACLtShin", "#0#20#21#22#23#");
SetLocalString(oModule,"XC_A_GYM_ACLtShoulder", "#0#29#30#31#32#");
SetLocalString(oModule,"XC_A_GYM_ACLtArm", "#0#24#25#");
SetLocalString(oModule,"XC_A_GYM_ACLtLeg", "#0#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_GYM_ACRtBracer", "#0#28#29#30#31#");
SetLocalString(oModule,"XC_A_GYM_ACRtShin", "#0#20#21#22#23#");
SetLocalString(oModule,"XC_A_GYM_ACRtShoulder", "#0#29#30#31#32#");
SetLocalString(oModule,"XC_A_GYM_ACRtArm", "#0#24#25#");
SetLocalString(oModule,"XC_A_GYM_ACRtLeg", "#0#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_HHF_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_HHF_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_HHF_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_HHF_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_HHF_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_HHF_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_HHF_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_HHF_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_HHF_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_HHF_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_HHF_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_HHF_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_HHF_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_HHF_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_HHF_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_HHF_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
*/
SetLocalString(oModule,"XC_A_HHM_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_HHM_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_HHM_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_HHM_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_HHM_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_HHM_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_HHM_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_HHM_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
SetLocalString(oModule,"XC_A_HHM_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_HHM_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_HHM_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_HHM_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_HHM_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_HHM_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#");
SetLocalString(oModule,"XC_A_HHM_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_HHM_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#26#27#28#29#");
/*SetLocalString(oModule,"XC_A_OOF_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_OOF_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_OOF_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_OOF_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_OOF_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_OOF_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#39#");
SetLocalString(oModule,"XC_A_OOF_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#26#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_OOF_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#25#26#27#28#29#");
SetLocalString(oModule,"XC_A_OOF_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_OOF_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_OOF_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_OOF_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_OOF_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#22#23#24#25#");
SetLocalString(oModule,"XC_A_OOF_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#39#");
SetLocalString(oModule,"XC_A_OOF_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#26#27#28#29#30#31#");
SetLocalString(oModule,"XC_A_OOF_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#25#26#27#28#29#");
SetLocalString(oModule,"XC_A_OOM_ACLtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_OOM_ACLtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_OOM_ACLtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_OOM_ACLtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_OOM_ACLtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#");
SetLocalString(oModule,"XC_A_OOM_ACLtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#39#");
SetLocalString(oModule,"XC_A_OOM_ACLtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#26#27#");
SetLocalString(oModule,"XC_A_OOM_ACLtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#25#26#");
SetLocalString(oModule,"XC_A_OOM_ACRtBracer", "#0#1#3#4#5#6#7#8#9#10#11#12#13#14#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#");
SetLocalString(oModule,"XC_A_OOM_ACRtElbow", "#0#1#2#3#4#5#6#7#8#9#10#11#12#");
SetLocalString(oModule,"XC_A_OOM_ACRtHip", "#0#1#2#3#");
SetLocalString(oModule,"XC_A_OOM_ACRtKnee", "#0#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#");
SetLocalString(oModule,"XC_A_OOM_ACRtShin", "#0#1#3#4#5#6#9#11#14#15#17#19#20#21#");
SetLocalString(oModule,"XC_A_OOM_ACRtShoulder", "#0#1#2#3#4#5#6#7#9#13#14#15#16#17#18#19#20#21#22#23#24#25#26#27#28#29#30#31#32#33#34#35#36#37#38#39#");
SetLocalString(oModule,"XC_A_OOM_ACRtArm", "#0#1#2#4#5#8#10#12#14#16#18#21#22#23#24#25#26#27#");
SetLocalString(oModule,"XC_A_OOM_ACRtLeg", "#0#1#2#4#6#7#9#10#12#13#14#17#22#23#24#25#26#");*/


///////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Variations  ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////	
//Variations are related to Armor/clothes and other equipments (boots, helms, gloves, cloaks..) appearances
//Variations are enslaved to ArmorVisualTypes (Cloth, Banded, Padded Cloth, Leather, Chain, Plate... )

//theses lists are made according to the 3d models Filenames
//therefore they are base 1. (meaning first model is numbered #1)
//the toolset uses the real values for varaition (the ones that are actually stored wihtin the item blueprint)
//theses real values are in base 0 (meaning the first value is #0)

//if you made your lists according to the filenames (like i did) you must se the switch XP_CRAFT_VARIATION_LISTS_BASE = 1
//if you made your lists according to the toolset values (thing that i wouldn't do if i were you ;) ) you can set this switch to 0.
 
//theses Lists are made according to the offical naming conventions in nwn2.
//sicne the craft system uses the 2da values NWN2_Model_Body and nwn2_Model_Helm,
//you can add new lists for new playable races without having to modify the system scripts... 

//as you can see there's plenty of lists.. one for each race and sex and item...
//if,UNlike me, you don't want to deal with so much lists, and you got the same lists for every race/sex,
//you can use the swithes  XP_CRAFT_USE_RACED_VARIATION = FALSE and XP_CRAFT_USE_SEXED_VARIATION = FALSE
// in the nwnx_craft_system script. Adn set comment in fornt of the lists you don't need
//By setting theses switches to false, you tell the system to use only the list for Humans and/or Males (HH for humans and M for males) for every race/sex

//if you really got more 3d models for one race/sex and you want them to be used by the craft system
//you can set any of the switches to TRUE (since most of the hakpack on the vault are for human females,
// i'd recommand using the whole set of lists.. )

//if you're desperate, you can also set the longest lists of 3d models in the Human males lists
// and still disable the switches. (other races/sex have the base model displayed when pressing next/previous on theses invalid values) 

//i've let the lists for belts, though they're not actually use by the system, for belts item actually don't have a real apprearance
//(don't ask me why)
//The only belts that can be displayed are built-on-clothes belts,
// but the plugin can't (for the moment) add theses. 
//(it could in fact change it if there was already one..but that's an other story.. )
	
//I also got rid of the #99 value for human male cloth vairations (CL_boots, CL_body and CL_gloves)
// which stands for invisible 3d models (used for instance to get invisible creatures... )


//x1 : 
	
	
	
	
	
	SetLocalString(oModule,"XC_P_HHF_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#17#18#19#20#21#30#31#32#51#52#73#82#85#87#89#97#98#102#103#106#111#114#116#130#");
	SetLocalString(oModule,"XC_P_HHM_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#13#14#15#16#17#18#20#21#22#23#25#30#31#32#51#52#73#82#85#89#102#103#111#114#116#"); 
	SetLocalString(oModule,"XC_P_EEF_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#82#85#87#89#97#98#102#103#106#111#114#116#130#");  
	SetLocalString(oModule,"XC_P_EEM_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#73#82#85#89#102#103#111#114#116#");  
	SetLocalString(oModule,"XC_P_DDF_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#");
	SetLocalString(oModule,"XC_P_DDM_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#102#103#111#114#116#"); 
	SetLocalString(oModule,"XC_P_GGF_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#");
	SetLocalString(oModule,"XC_P_GGM_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#102#103#111#114#116#"); 
	SetLocalString(oModule,"XC_P_OOF_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#"); 
	SetLocalString(oModule,"XC_P_OOM_CL_BODY", "#1#2#3#4#5#6#7#8#9#10#11#12#14#15#16#30#102#103#111#114#116#"); 

	SetLocalString(oModule,"XC_P_HHF_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_HHM_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_EEF_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_EEM_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_DDF_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_DDM_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_GGF_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_GGM_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_OOF_NK_BODY", "#1#");
	SetLocalString(oModule,"XC_P_OOM_NK_BODY", "#1#");

	SetLocalString(oModule,"XC_P_HHF_CP_BODY", "#1#99#"); 
	SetLocalString(oModule,"XC_P_HHM_CP_BODY", "#1#");
	SetLocalString(oModule,"XC_P_EEF_CP_BODY", "#1#99#"); 
	SetLocalString(oModule,"XC_P_EEM_CP_BODY", "#1#");
	SetLocalString(oModule,"XC_P_DDF_CP_BODY", "#1#");
	SetLocalString(oModule,"XC_P_DDM_CP_BODY", "#1#");
	SetLocalString(oModule,"XC_P_GGF_CP_BODY", "#1#");
	SetLocalString(oModule,"XC_P_GGM_CP_BODY", "#1#");
	SetLocalString(oModule,"XC_P_OOF_CP_BODY", "#1#");
	SetLocalString(oModule,"XC_P_OOM_CP_BODY", "#1#");
	
	// full plate
	SetLocalString(oModule,"XC_P_HHF_PF_BODY", "#1#2#3#99#82#73#"); 
	SetLocalString(oModule,"XC_P_HHM_PF_BODY", "#1#2#3#73#"); 
	SetLocalString(oModule,"XC_P_EEF_PF_BODY", "#1#2#3#99#82#"); 
	SetLocalString(oModule,"XC_P_EEM_PF_BODY", "#1#2#3#");
	SetLocalString(oModule,"XC_P_DDF_PF_BODY", "#1#2#3#");
	SetLocalString(oModule,"XC_P_DDM_PF_BODY", "#1#2#3#");	
	SetLocalString(oModule,"XC_P_GGF_PF_BODY", "#1#2#3#");
	SetLocalString(oModule,"XC_P_GGM_PF_BODY", "#1#2#3#");	
	SetLocalString(oModule,"XC_P_OOF_PF_BODY", "#1#2#3#");
	SetLocalString(oModule,"XC_P_OOM_PF_BODY", "#1#2#3#");


	SetLocalString(oModule,"XC_P_HHF_LE_BODY", "#1#2#3#6#98#81#76#50#"); 
	SetLocalString(oModule,"XC_P_HHM_LE_BODY", "#1#2#3#5#6#76#81#"); 
	SetLocalString(oModule,"XC_P_EEF_LE_BODY", "#1#2#3#4#6#98#81#"); 
	SetLocalString(oModule,"XC_P_EEM_LE_BODY", "#1#2#3#6#81#"); 
	SetLocalString(oModule,"XC_P_DDF_LE_BODY", "#1#2#3#4#6#81#"); 
	SetLocalString(oModule,"XC_P_DDM_LE_BODY", "#1#2#3#6#81#"); 
	SetLocalString(oModule,"XC_P_GGF_LE_BODY", "#1#2#3#4#6#81#"); 
	SetLocalString(oModule,"XC_P_GGM_LE_BODY", "#1#2#3#6#81#"); 
	SetLocalString(oModule,"XC_P_OOF_LE_BODY", "#1#2#3#4#6#81#"); 
	SetLocalString(oModule,"XC_P_OOM_LE_BODY", "#1#2#3#6#81#"); 

	SetLocalString(oModule,"XC_P_HHF_CH_BODY", "#1#2#3#4#5#6#72#82#"); 
	SetLocalString(oModule,"XC_P_HHM_CH_BODY", "#1#2#3#4#5#6#72#"); 
	SetLocalString(oModule,"XC_P_EEF_CH_BODY", "#1#2#3#4#5#6#82#"); 
	SetLocalString(oModule,"XC_P_EEM_CH_BODY", "#1#2#3#4#5#6#");
	SetLocalString(oModule,"XC_P_DDF_CH_BODY", "#1#2#3#4#5#6#");
	SetLocalString(oModule,"XC_P_DDM_CH_BODY", "#1#2#3#4#5#6#");	
	SetLocalString(oModule,"XC_P_GGF_CH_BODY", "#1#2#3#4#5#6#");
	SetLocalString(oModule,"XC_P_GGM_CH_BODY", "#1#2#3#4#5#6#");
	SetLocalString(oModule,"XC_P_OOF_CH_BODY", "#1#2#3#4#5#6#");
	SetLocalString(oModule,"XC_P_OOM_CH_BODY", "#1#2#3#4#5#6#");

	SetLocalString(oModule,"XC_P_HHF_HD_BODY", "#1#2#3#4#99#41#"); 
	SetLocalString(oModule,"XC_P_HHM_HD_BODY", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_EEF_HD_BODY", "#1#2#3#4#99#"); 
	SetLocalString(oModule,"XC_P_EEM_HD_BODY", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_DDF_HD_BODY", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_DDM_HD_BODY", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGF_HD_BODY", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGM_HD_BODY", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOF_HD_BODY", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOM_HD_BODY", "#1#2#3#4#");

	SetLocalString(oModule,"XC_P_HHF_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_EEF_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_EEM_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_DDF_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_GGF_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_GGM_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_SC_BODY", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_SC_BODY", "#1#2#");
	
	// Human Helm
	SetLocalString(oModule,"XC_P_HHF_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_HHF_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_HHF_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_HHF_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_HHF_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_HHF_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_HHF_PH_HELM", "#1#2#3#5#6#7#8#9#10#11#");
	SetLocalString(oModule,"XC_P_HHF_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_HHM_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_HHM_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_HHM_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_HHM_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_HHM_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_HHM_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_HHM_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_HHM_SC_HELM", "#1#");
	
	// Elf Helm
	SetLocalString(oModule,"XC_P_EEF_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_EEF_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_EEF_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_EEF_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_EEF_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_EEF_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_EEF_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_EEF_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_EEM_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_EEM_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_EEM_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_EEM_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_EEM_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_EEM_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_EEM_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_EEM_SC_HELM", "#1#");

	SetLocalString(oModule,"XC_P_EEF_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_EEM_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_HHF_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_HHM_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_AAF_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_AAM_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_DDF_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_DDM_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_GGF_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_GGM_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_OOF_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
	SetLocalString(oModule,"XC_P_OOM_ACME_HELM", "#1#2#3#4#5#6#7#8#9#10#11#12#");
		
	SetLocalString(oModule,"XC_P_AAF_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_AAF_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_AAF_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_AAF_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_AAF_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_AAF_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_AAF_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_AAF_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_AAM_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_AAM_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_AAM_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_AAM_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_AAM_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_AAM_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_AAM_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_AAM_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_DDF_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_DDF_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_DDF_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_DDF_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_DDF_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_DDF_PF_HELM", "#1#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_P_DDF_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_DDF_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_DDM_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_DDM_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_DDM_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_DDM_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_DDM_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_DDM_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_DDM_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_DDM_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_GGF_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_GGF_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_GGF_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_GGF_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGF_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_GGF_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_GGF_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_GGF_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_GGM_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_GGM_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_GGM_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_GGM_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGM_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_GGM_PF_HELM", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_GGM_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_GGM_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_OOF_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_OOF_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_OOF_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_OOF_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOF_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_OOF_PF_HELM", "#1#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_P_OOF_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_OOF_SC_HELM", "#1#");
	SetLocalString(oModule,"XC_P_OOM_BA_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_OOM_CH_HELM", "#1#4#");
	SetLocalString(oModule,"XC_P_OOM_CL_HELM", "#1#2#3#4#5#6#7#8#9#11#13#14#15#17#18#19#20#21#22#23#24#25#26#27#28#29#");
	SetLocalString(oModule,"XC_P_OOM_HD_HELM", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOM_LE_HELM", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_OOM_PF_HELM", "#1#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_P_OOM_PH_HELM", "#1#2#3#5#6#7#8#10#11#");
	SetLocalString(oModule,"XC_P_OOM_SC_HELM", "#1#");


	SetLocalString(oModule,"XC_P_DDF_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_DDF_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_DDF_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_DDF_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_DDF_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_DDF_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_DDF_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_DDF_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_DDF_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_DDM_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_DDM_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_DDM_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_DDM_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_DDM_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_DDM_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_DDM_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_EEF_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_EEF_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_EEF_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_EEF_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_EEF_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_EEF_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_EEF_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_EEF_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_EEF_SC_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_EEM_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_EEM_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_EEM_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_EEM_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_EEM_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_EEM_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_EEM_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_EEM_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_EEM_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_GGF_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_GGF_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_GGF_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_GGF_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_GGF_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_GGF_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_GGF_PF_BOOTS", "#1#3#");
	SetLocalString(oModule,"XC_P_GGF_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_GGF_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_GGM_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_GGM_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_GGM_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_GGM_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_GGM_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_GGM_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_GGM_PF_BOOTS", "#1#3#");
	SetLocalString(oModule,"XC_P_GGM_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_GGM_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_HHF_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_HHF_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_HHF_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_HHF_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_HHF_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_HHF_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_HHF_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_HHF_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_HHF_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_HHM_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_HHM_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_HHM_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_HHM_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_HHM_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_HHM_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_HHM_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_OOF_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_OOF_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_OOF_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_OOF_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_OOF_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_OOF_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_OOF_SC_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_BA_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_OOM_CH_BOOTS", "#1#2#3#");
	SetLocalString(oModule,"XC_P_OOM_CL_BOOTS", "#1#2#3#4#5#");
	SetLocalString(oModule,"XC_P_OOM_HD_BOOTS", "#2#");
	SetLocalString(oModule,"XC_P_OOM_LE_BOOTS", "#1#2#3#4#5#6#7#");
	SetLocalString(oModule,"XC_P_OOM_LS_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_OOM_PF_BOOTS", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_PH_BOOTS", "#1#");
	SetLocalString(oModule,"XC_P_OOM_SC_BOOTS", "#1#2#");

	SetLocalString(oModule,"XC_P_DDF_CH_GLOVES", "#1#2#3#");
	SetLocalString(oModule,"XC_P_DDF_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDF_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_DDF_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDF_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_DDF_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_DDF_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDF_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_CH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_DDM_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_DDM_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_DDM_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_DDM_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEF_CH_GLOVES", "#1#2#3#");
	SetLocalString(oModule,"XC_P_EEF_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEF_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_EEF_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEF_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_EEF_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_EEF_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEF_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEM_CH_GLOVES", "#1#2#3#");
	SetLocalString(oModule,"XC_P_EEM_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEM_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_EEM_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEM_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_EEM_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_EEM_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_EEM_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGF_CH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGF_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGF_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_GGF_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGF_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_GGF_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGF_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGF_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGM_CH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGM_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGM_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_GGM_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGM_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_GGM_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGM_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_GGM_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHF_CH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHF_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHF_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_HHF_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHF_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_HHF_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_HHF_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHF_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_CH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_HHM_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_HHM_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_HHM_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_HHM_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_CH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_OOF_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_OOF_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOF_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOF_SC_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_CH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_CL_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_LE_GLOVES", "#1#2#3#4#5#6#7#8#");
	SetLocalString(oModule,"XC_P_OOM_LS_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_NK_GLOVES", "#1#");
	SetLocalString(oModule,"XC_P_OOM_PF_GLOVES", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOM_PH_GLOVES", "#1#2#");
	SetLocalString(oModule,"XC_P_OOM_SC_GLOVES", "#1#2#");



	SetLocalString(oModule,"XC_P_DDF_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_DDM_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_EEF_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_EEM_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_GGF_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_GGM_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_HHF_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_HHM_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#11#12#17#18#");
	SetLocalString(oModule,"XC_P_OOF_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");
	SetLocalString(oModule,"XC_P_OOM_CL_CLOAK", "#1#2#3#4#5#6#7#9#10#12#17#18#");



	SetLocalString(oModule,"XC_P_DDF_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_DDM_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_EEF_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_EEM_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGF_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_GGM_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_HHF_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_HHM_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOF_LE_BELT", "#1#2#3#4#");
	SetLocalString(oModule,"XC_P_OOM_LE_BELT", "#1#2#3#4#");


	
///////////////////////////////////////////////////////////////////////////////
/////////////////////////// Armor Visual Types ////////////////////////////////
///////////////////////////////////////////////////////////////////////////////	
//ArmorVisualTypes are related to the material category of 3d models. 
//ie scale, cloth, banded, leather, studded leather, chain, plate... 
//it doesn't mess with the actual item's AC, it's only VISUAL... armor type.. 

//theses Lists are made according to the offical naming conventions in nwn2.
//sicne the craft system uses the 2da values NWN2_Model_Body and nwn2_Model_Helm,
//you can add new lists for new playable races without having to modify the system scripts... 

//however, jsut like the variation lists, theses lists uses the same switches, if you ever wish to use less lists... 

//as you can see not every item exist in all the visual "material"
//but if some of your haks add new ArmorType to some of your items, you can add them here
//(ie : new cloaks models in leather or whatever...) 
//according to the name of the 3d model file and the list below (extracted from the armorvisualdata.2da)
 
/*
0 Cloth	CL
1 ClothPadded CP
2 Leather LE
3 LeatherStudded LS
4 Chain CH
5 Scale	SC
6 Banded BA
7 Half-Plate PH
8 Full-Plate PF
9 Hide HD
10 Naked NK	
*/

//x1 : 
//0-11

//SetLocalString(oModule,"XC_AVT_P_EEF_HELM", "#0#2#4#5#6#7#8#9#");

	SetLocalString(oModule,"XC_AVT_P_AAF_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_AAM_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_DDF_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_DDF_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_DDF_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_DDF_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_DDF_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_DDF_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_DDM_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_DDM_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_DDM_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_DDM_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_DDM_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_DDM_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_EEF_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_EEF_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_EEF_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_EEF_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_EEF_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_EEF_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_EEM_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_EEM_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_EEM_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_EEM_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_EEM_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_EEM_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_GGF_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_GGF_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_GGF_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_GGF_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_GGF_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_GGF_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_GGM_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_GGM_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_GGM_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_GGM_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_GGM_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_GGM_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_HHF_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_HHF_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_HHF_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_HHF_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_HHF_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_HHF_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_HHM_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_HHM_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_HHM_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_HHM_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_HHM_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_HHM_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_OOF_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_OOF_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_OOF_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_OOF_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_OOF_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_OOF_HELM", "#0#2#4#5#6#7#8#9#17#");
	SetLocalString(oModule,"XC_AVT_P_OOM_BELT", "#2#");
	SetLocalString(oModule,"XC_AVT_P_OOM_BODY", "#0#1#2#4#5#8#9#10#");
	SetLocalString(oModule,"XC_AVT_P_OOM_BOOTS", "#0#2#3#4#5#6#7#8#9#");
	SetLocalString(oModule,"XC_AVT_P_OOM_CLOAK", "#0#");
	SetLocalString(oModule,"XC_AVT_P_OOM_GLOVES", "#0#2#3#4#5#7#8#10#");
	SetLocalString(oModule,"XC_AVT_P_OOM_HELM", "#0#2#4#5#6#7#8#9#17#");
	
	SetLocalInt(oModule,"XC_CRAFTCONFIGURED", TRUE );

	
}