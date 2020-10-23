//Скрипт смотрящий и дающий инструмет для всех, а также скидывает из базы данные на шкуру
//
#include "pt_axcrf_include"


void main()
{

    object oPC=GetEnteringObject();
    DelayCommand(5.0, SetLocalInt(oPC, "pt_PCLOGIN", TRUE));

    if(GetIsDM(oPC)) return;
    if(!GetIsPC(oPC)) return;

    object oSkin=SKIN_SupportGetSkin(oPC);



    //Дампинг из базы в локальные переменные шкуры
    if(pt_CRAFT_USE_NWNX)
        {
        string sPCcharID=GetPCPlayerName(oPC)+">"+GetName(oPC, TRUE);
        SetLocalString(oPC, "pt_craft_CharID", sPCcharID);


        SQLExecDirect("SELECT sVar, fValue, iType FROM `pt_axcrf_table` WHERE ID = '"+SQLEncodeSpecialChars(sPCcharID)+"' ; ");
        while(SQLFetch() == SQL_SUCCESS)
            {
            string sVarName=SQLDecodeSpecialChars(SQLGetData(1));
            float fCurSkillVal=StringToFloat(SQLGetData(2));

            if(StringToInt(SQLGetData(3))==pt_DBDUMP_TYPE_INT)
                {
                SetLocalInt(oSkin, sVarName, FloatToInt(fCurSkillVal));
                }
                else
                {
                SetLocalFloat(oSkin, sVarName, fCurSkillVal);
                };
            };
        };


        //Добавление инструмента для процессов без инструмента (и хранилища  переменных (2013-2014г))
        object oItem=GetFirstItemInInventory(oPC);
        while(GetIsObjectValid(oItem))
            {
            string sResRef=GetResRef(oItem);
            if(sResRef=="pt_axcrf_it028") return;

            oItem=GetNextItemInInventory(oPC);
            };
        CreateItemOnObject("pt_axcrf_it028", oPC);
}
