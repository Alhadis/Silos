void main()
{
object oPC = GetItemActivator();
object oMe = GetItemActivated();
object oCopy;
itemproperty pRem;

oCopy = CopyItem(oMe, oPC);
pRem = GetFirstItemProperty(oCopy);

RemoveItemProperty(oCopy, pRem);
}