void main(int iNum, int iAdd)
{
object oMe = OBJECT_SELF;
string sNum = IntToString(iNum);
int iCurrent = GetLocalInt(oMe, "number" + sNum);

SetLocalInt(oMe, "number" + sNum, iCurrent + iAdd);
}