void main()
{
object oPla=OBJECT_SELF;





//Спаун - выполняется 1 раз
if(GetLocalInt(oPla, "pt_craft_plaHasSpawn")) return;
SetLocalInt(oPla, "pt_craft_plaHasSpawn", TRUE);

int iNumUse = GetLocalInt(oPla, "pt_CRAFT_PROCESS_NUMUSE");
float fRespawnTime = GetLocalFloat(oPla, "pt_CRAFT_PROCESS_RESPTIME");

if (iNumUse>0)
    {
    int iParth=iNumUse/8;

    iParth= (iParth<10)? d6(): d6()* iParth - d2()*iParth;

    SetLocalInt(oPla, "pt_CRAFT_PROCESS_NUMUSE", iNumUse+iParth);
    };


if (fRespawnTime>0.0)
    {
    float fParth=fRespawnTime/16.0;

    fParth= (fParth<100.0)? IntToFloat(d6())*3.0: IntToFloat(d4())* fParth - IntToFloat(d2())*fParth;

    SetLocalFloat(oPla, "pt_CRAFT_PROCESS_RESPTIME", fRespawnTime+fParth);
    };
}
