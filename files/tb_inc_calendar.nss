/* tb_inc_calendar
 *
 * Library for calendar related things like month names, moon phases etc
 *
 */

const int TB_MOON_UNKNOWN  = 0;
const int TB_MOON_NEW      = 1;
const int TB_MOON_WAX_CRES = 2;
const int TB_MOON_WAX_GIB  = 3;
const int TB_MOON_FULL     = 4;
const int TB_MOON_WAN_GIB  = 5;
const int TB_MOON_WAN_CRES = 6;

int tbGetMoonPhase() {
    int nDay = GetCalendarDay();
    int nHour = GetTimeHour();


    if (nDay == 1) {
        if (nHour < 12)
            return TB_MOON_NEW;
        return  TB_MOON_WAX_CRES;
    } else if (nDay < 8) {
        return TB_MOON_WAX_CRES;
    } else if (nDay < 14) {
        return TB_MOON_WAX_GIB;
    } else if (nDay == 14) {
        if (nHour >= 12)
            return  TB_MOON_FULL;
        return TB_MOON_WAX_GIB;
    } else if (nDay == 15) {
        if (nHour < 12)
            return TB_MOON_FULL;
        return TB_MOON_WAN_GIB;
    } else if (nDay < 22) {
        return TB_MOON_WAN_GIB;
    } else if (nDay < 28) {
        return TB_MOON_WAN_CRES;
    } else if (nDay == 28) {
        if (nHour >= 12)
            return  TB_MOON_NEW;
        return TB_MOON_WAN_CRES;
    }
    // Won't happen
    return TB_MOON_UNKNOWN;
}

string tbMoonPhaseToString(int nPhase, int bLower = FALSE) {
    string sRet = "Unknown";

    switch (nPhase) {
    case TB_MOON_NEW: sRet = "New"; break;
    case TB_MOON_WAX_CRES: sRet = "Waxing Crescent"; break;
    case TB_MOON_WAX_GIB: sRet = "Waxing Gibbous"; break;
    case TB_MOON_FULL: sRet = "Full"; break;
    case TB_MOON_WAN_GIB: sRet = "Waning Gibbous"; break;
    case TB_MOON_WAN_CRES: sRet = "Waning Crescent"; break;

    case TB_MOON_UNKNOWN:
    default:

    }

    if (bLower)
        return GetStringLowerCase(sRet);
    return sRet;
}

string tbGetMoonPhaseStr(int bLower = FALSE) {
    return tbMoonPhaseToString(tbGetMoonPhase(), bLower);
}

string tbGetDefaultMonthName(int nMonth){
        string sMonth;
        switch (nMonth) {
                case 1: sMonth = "January"; break;
                case 2: sMonth = "Febuary"; break;
                case 3: sMonth = "March"; break;
                case 4: sMonth = "April"; break;
                case 5: sMonth = "May"; break;
                case 6: sMonth = "June"; break;
                case 7: sMonth = "July"; break;
                case 8: sMonth = "August"; break;
                case 9: sMonth = "September"; break;
                case 10: sMonth = "October"; break;
                case 11: sMonth = "November"; break;
                case 12: sMonth = "December"; break; 
        }
        return sMonth;
}         

string tbGetMonthName(int nMonth = -1) {
    if (nMonth == -1)
        nMonth = GetCalendarMonth();

    string sRet = GetLocalString(GetModule(), "month_" + IntToString(nMonth));
    if (sRet == "")
        return tbGetDefaultMonthName(nMonth); // "Month " + IntToString(nMonth);

    return sRet;
}

// These could be configured on the module too
//
string tbGetDayOfWeekString(int nDay = -1) {
    if (nDay == -1)
        nDay = GetCalendarDay();

    if (nDay == 28)
        return "Lastday";
    if (nDay == 1)
        return "Newday";

    int nIdx = (nDay % 7);
    switch (nIdx) {
    case 0: return "Festday"; // really day 7
    case 1: return "Myrday";
    case 2: return "Towerday";
    case 3: return "Wineday";
    case 4: return "Tradesday";
    case 5: return "Fireday";
    case 6: return "Swordsday";
    }

    // should never get here
    return "Unknown";
}

string tbGetDayOfMonthString(int nDay = -1) {
        if (nDay == -1)
                nDay = GetCalendarDay(); 

        string sDay = tbGetDayOfWeekString(nDay);
        if (nDay == 1 || nDay == 28)
                return sDay;  

        int nIdx = (nDay / 7);
        if (nIdx == 0) {
                return "first " + sDay;
        } else if (nIdx == 1) {
                return "second " + sDay;
        } else if (nIdx == 2) {
                return "third " + sDay;
        } else if (nIdx == 3) {
                return "last " + sDay;
        }

        return sDay;
}
string calGetDateString() {
    int nYear = GetCalendarYear();
    int nMonth = GetCalendarMonth();
    int nDay = GetCalendarDay();
    string sYear = IntToString(nYear);
    string sMonth = tbGetMonthName(nMonth);
    string sDay = IntToString(nDay);
    string sDayOfMonth = tbGetDayOfWeekString(nDay); 

    string sDateString = "(" +sDayOfMonth + "," + sMonth + " " + sDay + ", " + sYear + ") ";
    return sDateString;
}

// This the day normally a market day.
// If it is also a major festival day it may not still be a market day.
// This routine does not check festivals.
//
int tbGetIsMarketDay(int nDay = -1) {
    if (nDay == -1)
        nDay = GetCalendarDay();

    // Currently defined as first and third tradesday of each month.
    // This tends to be a small more local market
    if (nDay == 4 || nDay == 18)
        return TRUE;

    // A larger market happens on the last Swordsday of the month.
    // This is when people from farther out come.
    if (nDay == 27)
        return TRUE;

    return FALSE;
}

string tbCalendarGetSeason(int nMonth = -1, int bLower = TRUE) {
    if (nMonth < 1 || nMonth > 12)
        nMonth = -1;

    if (nMonth == -1)
        nMonth = GetCalendarMonth();

    string sRet;
    if (nMonth == 1|| nMonth == 2 || nMonth ==12)
        sRet  = "Winter";
    else if (nMonth >2 && nMonth < 6)
        sRet = "Spring";
    else if (nMonth > 5 && nMonth < 9)
        sRet = "Summer";
    else
        sRet = "Fall";

    if (bLower)
        sRet = GetStringLowerCase(sRet);

    return sRet;
}



// This returns the name of a special day if today is one or "" if not
// TODO This probably wants to be specific to the country/region?
string tbCalendarGetFestival(int nDay  = -1, int nMonth = -1) {
    if (nDay == -1)
        nDay = GetCalendarDay();
    if (nMonth == -1)
        nMonth = GetCalendarMonth();

    if (nMonth == 12 && nDay == 1) {
        return "The Feast of Enia";
    }
    if (nMonth == 12 && nDay == 28) {
        return "The Festival of Last Night";
    }
    if (nMonth == 1 && nDay == 1) {
        return "The Day of Rebirth";
    }
    if (nMonth == 1 && nDay == 14) {
        return "Midwinter Fest also called The Festival of Lights";
    }
    if (nMonth == 3 && nDay == 1) {
        return "The First Festival of Istia";
    }
    if (nMonth == 9 && nDay == 1) {
        return "The Second Festival of Istia";
    }
    if (nMonth == 6 && nDay == 1) {
        return "The Celebration of Atan";
    }
    if (nMonth == 10 && nDay == 14) {
        return "Harvest Festival";
    }

    return "";
}


void tbCalendarPrintDay(object oPC, int bMoon = TRUE) {
    int nDay = GetCalendarDay();
    int nMonth = GetCalendarMonth();
    int nYear  = GetCalendarYear();

    SendMessageToPC(oPC, "It is now " + tbGetDayOfWeekString() + " in the month of " + tbGetMonthName() + " in the year " + IntToString(nYear) + " r.r.");
    string sFest = tbCalendarGetFestival();
    if (sFest != "")
        SendMessageToPC(oPC, "Today is " + sFest + ".");
    if (tbGetIsMarketDay(nDay))
        SendMessageToPC(oPC, "Today is a market day.");
    if (bMoon)
        SendMessageToPC(oPC, "The moon Nila is " + tbMoonPhaseToString(tbGetMoonPhase()) +  ".");

}



void tbInitCalendar() {

    object oMod = GetModule();

    if (GetLocalString(oMod, "month_1") != "")
        return;

    SetLocalString(oMod, "month_1", "Hammer");
    SetLocalString(oMod, "month_2", "Alturiak");
    SetLocalString(oMod, "month_3", "Ches");
    SetLocalString(oMod, "month_4", "Tarsakh");
    SetLocalString(oMod, "month_5", "Mirtul");
    SetLocalString(oMod, "month_6", "Kythorn");
    SetLocalString(oMod, "month_7", "Flamerule");
    SetLocalString(oMod, "month_8", "Eleasis");
    SetLocalString(oMod, "month_9", "Eleint");
    SetLocalString(oMod, "month_10", "Marpenoth");
    SetLocalString(oMod, "month_11", "Uktar");
    SetLocalString(oMod, "month_12", "Nightal");

}


