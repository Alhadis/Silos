int StartingConditional()
{
    int iPiecesEaten = GetLocalInt(OBJECT_SELF, "PIECES_EATEN");
    if(iPiecesEaten < 6){
        return FALSE; 
    }

    int iEatenDay = GetLocalInt(OBJECT_SELF, "DAY_EATEN");
    int iEatenMonth = GetLocalInt(OBJECT_SELF, "MONTH_EATEN");
    int iEatenYear = GetLocalInt(OBJECT_SELF, "YEAR_EATEN");

    int iCalendarDay = GetCalendarDay();
    int iCalendarMonth = GetCalendarMonth();
    int iCalendarYear = GetCalendarYear();

    if(iCalendarYear > iEatenYear){
        SetLocalInt(OBJECT_SELF, "PIECES_EATEN", 0);
        return FALSE;
    }else if(iCalendarMonth > iEatenMonth + 1){
        SetLocalInt(OBJECT_SELF, "PIECES_EATEN", 0);
        return FALSE;
    }else if((iCalendarMonth - iEatenMonth) * 28 + (iCalendarDay - iEatenDay) >= 14){
        SetLocalInt(OBJECT_SELF, "PIECES_EATEN", 0);
        return FALSE;
    }
    return TRUE;
}