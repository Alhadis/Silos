#include "inc_letocommands"
#include "inc_utility"

void PRCLetoExit(object oPC)
{
    object oSkin = GetPCSkin(oPC);
    itemproperty ipTest = GetFirstItemProperty(oSkin);

    if(GetPRCSwitch(PRC_PNP_SPELL_SCHOOLS)
        && GetLevelByClass(CLASS_TYPE_WIZARD, oPC))
    {
        if(GetHasFeat(2274)
            || GetHasFeat(2276)
            || GetHasFeat(2277)
            || GetHasFeat(2278)
            || GetHasFeat(2279)
            || GetHasFeat(2280)
            || GetHasFeat(2281))
        {
            //set school to PnP school
            string sScript;
            sScript = "<for:field /ClassList><if:~/Class=10><gff:set ~/School '9'></if></for>";
            SetLocalString(oPC, "LetoScript", GetLocalString(oPC, "LetoScript")+sScript);
        }
        else if(GetHasFeat(2273))
        {
            //set school to generalist
            string sScript;
            sScript = "<for:field /ClassList><if:~/Class=10><gff:set ~/School '0'></if></for>";
            SetLocalString(oPC, "LetoScript", GetLocalString(oPC, "LetoScript")+sScript);
        }
    }


    if(GetLocalInt(oSkin,"nPCShifted"))
        return;
    while(GetIsItemPropertyValid(ipTest))
    {
        int ipType = GetItemPropertyType(ipTest);
        if(ipType == ITEM_PROPERTY_ABILITY_BONUS)
        {
            int ipSubType = GetItemPropertySubType(ipTest);
            int ipValue = GetItemPropertyCostTableValue(ipTest);
            string sPath = GetName(oPC);//GetLocalString(oPC, "Leto_Path");
            int nOldIpValue = GetPersistantLocalInt(oPC, "LetoAbility_"+IntToString(ipSubType));
            SetCampaignInt("LetoPRC", "LetoAbility_"+IntToString(ipSubType)+sPath, ipValue);
            SetLocalString(oPC, "LetoScript", GetLocalString(oPC, "LetoScript")+AdjustAbility(ipSubType, ipValue-nOldIpValue));
            //PrintString(sPath);
            //PrintString("LetoAbility_"+IntToString(ipSubType)+sPath);
            //PrintString(IntToString(ipValue));
            //PrintString(IntToString(nOldIpValue));
        }
        ipTest = GetNextItemProperty(oSkin);
    }


}

void PRCLetoEnter(object oPC)
{
    int i;
    string sPath = GetName(oPC);//GetLocalString(oPC, "Leto_Path");
    /*if(sPath == "")
    {
        sPath = GetBicPath(oPC);
        SetLocalString(oPC, "Leto_Path", sPath);
    }*/
    //PrintString(sPath);
    for(i=0;i<6;i++)
    {
        //PrintString("LetoAbility_"+IntToString(i)+sPath);
        int nDBValue = GetCampaignInt("LetoPRC", "LetoAbility_"+IntToString(i)+sPath);
        //PrintString(IntToString(nDBValue));
        if(nDBValue)
        {
            int nPersistValue = GetPersistantLocalInt(oPC, "LetoAbility_"+IntToString(i));
            //PrintString(IntToString(nPersistValue));
            SetPersistantLocalInt(oPC, "LetoAbility_"+IntToString(i), nPersistValue + nDBValue);
            DeleteCampaignVariable("LetoPRC", "LetoAbility_"+IntToString(i)+sPath);
        }
    }
}

void PRCLetoLevelup(object oPC)
{
    int bChange;
    int nClass = -1;
    //so we know what the last level taken was
    int nLevel = GetHitDice(oPC);
    if(GetPRCSwitch(PRC_NO_HP_REROLL))
    {
        //first 3 levels are always maxed
        if(nLevel > 3)
        {
            //add the command to get the last class to the stack
            StackedLetoScript(LetoGet("LvlStatList/["+IntToString(nLevel)+"]/LvlStatClass"));
            //run that command on the PC
            //need this long command to put nDestroyOriginal to false
            //this means that the PC wont be booted, since we are only reading his .bic at the moment
            RunStackedLetoScriptOnObject(oPC, "OBJECT", "SCRIPT", "", FALSE);
            //the return from leto is stored as nClass
            nClass = StringToInt(GetLocalString(GetModule(), "LetoResult"));

            //now the 2da lookup to get the maximum hp
            //uses the same cache system as the ConvoCC
            int nMax = StringToInt(Get2DACache("classes", "HitDie", nClass));
            if(nClass == CLASS_TYPE_DRAGONDISCIPLE)
            {
                int nClassLevel = GetLevelByClass(CLASS_TYPE_DRAGONDISCIPLE, oPC) ;
                switch(nClassLevel)
                {
                    case 1: nMax = 6; break;
                    case 2: nMax = 6; break;
                    case 3: nMax = 6; break;
                    case 4: nMax = 8; break;
                    case 5: nMax = 8; break;
                    default:
                        if(nClassLevel>5)
                            nMax = 10;
                        else
                            DoDebug("Error in inc_leto_prc @ 121");
                }
            }
            int nHP = Random(nMax)+1;
            //this is the letoscript we need to run to fix the HP
            StackedLetoScript(LetoSet("LvlStatList/["+IntToString(nLevel)+"]/LvlStatHitDie", IntToString(nHP),  "byte"));
            bChange = TRUE;
        }
    }
    if(GetPRCSwitch(PRC_NO_FREE_WIZ_SPELLS))
    {
        if(nClass == -1)
        {
            //add the command to get the last class to the stack
            StackedLetoScript(LetoGet("LvlStatList/["+IntToString(nLevel)+"]/LvlStatClass"));
            //run that command on the PC
            //need this long command to put nDestroyOriginal to false
            //this means that the PC wont be booted, since we are only reading his .bic at the moment
            RunStackedLetoScriptOnObject(oPC, "OBJECT", "SCRIPT", "", FALSE);
            //the return from leto is stored as nClass
            nClass = StringToInt(GetLocalString(GetModule(), "LetoResult"));
        }
        if(nClass == CLASS_TYPE_WIZARD)
        {
            //string sScript
        }
    }
    if(bChange)
        RunStackedLetoScriptOnObject(oPC, "OBJECT", "SCRIPT", "", TRUE);
}
