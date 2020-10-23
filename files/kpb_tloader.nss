////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_tloader  - This script makes the  //
//  module load the time and date for the //
//  module, which was saved to the        //
//  database.                             //
//  Included from Zyzko's script.         //
//  This should be incorporated into your //
//  current OnModuleLoad event.           //
////////////////////////////////////////////

void main()
{
    object oMod=GetModule();
    int nHour, nDay, nMonth, nYear;
    if(GetCampaignInt("kpb_calendar","TIMEYEAR",oMod))
    {
        nHour=GetCampaignInt("kpb_calendar","TIMEHOUR",oMod);
        nDay=GetCampaignInt("kpb_calendar","TIMEDAY",oMod);
        nMonth=GetCampaignInt("kpb_calendar","TIMEMONTH",oMod);
        nYear=GetCampaignInt("kpb_calendar","TIMEYEAR",oMod);
        SetLocalInt(oMod,"HourStart", nHour);
        SetLocalInt(oMod,"DayStart", nDay);
        SetLocalInt(oMod,"MonthStart", nMonth);
        SetLocalInt(oMod,"YearStart", nYear);
        SetTime(nHour, 0, 0, 0);
        SetCalendar(nYear, nMonth, nDay);
    }
    else
    {
        SetLocalInt(oMod,"HourStart", GetTimeHour());
        SetLocalInt(oMod,"DayStart", GetCalendarDay());
        SetLocalInt(oMod,"MonthStart", GetCalendarMonth());
        SetLocalInt(oMod,"YearStart", GetCalendarYear());
    }
}
