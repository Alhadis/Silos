////////////////////////////////////////////////////////////
/////////////Open Coffin - Spawn Vampire ///////////////////
////////////////////(Only Once  per PC)/////////////////////
////////////////////////////////////////////////////////////
//////////////By: Tom Ploskina Jr.//////////////////////////
////////////////////////////////////////////////////////////
/*      This script spawns a vampire by its ////////////////
/       blueprint upon opening a coffin.  It ///////////////
/       then sets a local variable to make /////////////////
/       sure that only 1 vampire will spawn ////////////////
/       when the coffin is opened.//////////////////////////
///////////////////////////////////////////////////////// */
void main()
{
//If PC has not opened coffin keep going...
if(!(GetLocalInt(GetLastOpenedBy(), "nCoffinStatus") == 1))
{
    //Okay, the PC is about to open coffin, let's give them a 1
    SetLocalInt(GetLastOpenedBy(), "nCoffinStatus", 1);
    //Spawn the creature with the blueprint of ct_vamp at stated location
    location CoffinIsHere = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_un_vampire_sor7", CoffinIsHere);
    }
    else
    {
        //Let's do something if they've already opened the coffin
        SpeakString("The coffin appears to have a layer of dirt in the bottom");
        }
}