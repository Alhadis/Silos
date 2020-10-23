int lsn=1;
//lsstype=3

void SetItemLocals()
{
SetLocalString(OBJECT_SELF, "lsn1", "bladiumdeathmace");
SetLocalInt(OBJECT_SELF, "lsc_bladiumdeathmace", 5);
SetLocalString(OBJECT_SELF, "lsi1_bladiumdeathmace", "adamantiumingot");
SetLocalString(OBJECT_SELF, "lsi2_bladiumdeathmace", "blackdiamond");
SetLocalString(OBJECT_SELF, "lsi3_bladiumdeathmace", "DracolichTeeth");
SetLocalString(OBJECT_SELF, "lsi4_bladiumdeathmace", "DracolichTeeth");
SetLocalString(OBJECT_SELF, "lsi5_bladiumdeathmace", "  gold  50000");
SetLocalInt(OBJECT_SELF, "lss_bladiumdeathmace", -10);
SetLocalInt(OBJECT_SELF, "lsv_bladiumdeathmace", VFX_FNF_STRIKE_HOLY);
// In the above, as you can see, the blueprints for items are easily customizable.
// Simply replace bladium*** or whatever the BLUEPRINT is, with your item.
// The materials required are shown in the quotations to the right of the blueprint,
// But you must remember when changing them, to input the TAG, unlike the item to be crafted,
// in which you input the BLUEPRINT. So, in short, if you wanted to change this script to be
// compatible for your own item, say, an Adamantine Greatsword, whose blueprint was,
// AGSWORD, and you wanted the required materials to be a Silver Shard, a Black Bar, and
// 100 gp, the script would look like:

//void SetItemLocals()
//{                                      Below this, AGSWORD is BLUEPRINT of the item to be crafted!
//SetLocalString(OBJECT_SELF, "lsn1", "AGSWORD");
//SetLocalInt(OBJECT_SELF, "lsc_AGSWORD", 3);
//SetLocalString(OBJECT_SELF, "lsi1_AGSWORD", "SilverShard"); <-- These are the TAGS of the required material, remember that!
//SetLocalString(OBJECT_SELF, "lsi2_AGSWORD", "BlackBar");    <--
//SetLocalString(OBJECT_SELF, "lsi3_AGSWORD", "  gold  100");
//SetLocalInt(OBJECT_SELF, "lss_AGSWORD", -10);
//SetLocalInt(OBJECT_SELF, "lsv_AGSWORD", VFX_FNF_STRIKE_HOLY); <-- You can also change the visual that the player recieves when successfully crafted an item.
//                                                                  Just go to Constants, on the upper-right bar, scroll down to the 'vfx' section, and replace mine with the one of your choice!
}

void CreateGold(object oTarget, int nAmount)
{
CreateItemOnObject("nw_it_gold001", oTarget, nAmount);
}

void main()
{
object oOwner=GetPCSpeaker();

SetItemLocals();

if (lsn==0) return;

object oItem;
int bOkay, nGold, nCount, nNum, nLoop, nLoops, nHasGold, nVis;
string sCur, sReq;

for (nLoop=1; nLoop<=lsn; nLoop++)
   {
   sCur=GetLocalString(OBJECT_SELF, "lsn"+IntToString(nLoop));

   nNum=GetLocalInt(OBJECT_SELF, "lsc_"+sCur);

   for (nLoops=1; nLoops<=nNum; nLoops++)
      {

      sReq=GetLocalString(OBJECT_SELF, "lsi"+IntToString(nLoops)+"_"+sCur);
      if (GetStringLeft(sReq, 8)=="  gold  ")
         {
         nGold=StringToInt(GetStringRight(sReq, GetStringLength(sReq)-8));
         if (GetGold(oOwner)>=nGold) nCount++;

         }
      else if (GetItemPossessedBy(oOwner, sReq)!=OBJECT_INVALID)
         {
         SetLocalObject(OBJECT_SELF, "ls__"+IntToString(nLoops), GetItemPossessedBy(oOwner, sReq));

         nCount++;
         }
      }

   if (GetLocalInt(OBJECT_SELF, "lss_"+sCur)==-10) bOkay=TRUE;
   else if (GetLastSpell()==GetLocalInt(OBJECT_SELF, "lss_"+sCur)) bOkay=TRUE;
   else bOkay=FALSE;

   if (bOkay && (nCount==nNum)) bOkay=TRUE;
   else bOkay=FALSE;
   if (bOkay==TRUE)
      {

      if (nGold>0)
      TakeGoldFromCreature(nGold, oOwner, TRUE);
      for (nLoops=1; nLoops<=nNum; nLoops++)
         {
         oItem=GetLocalObject(OBJECT_SELF, "ls__"+IntToString(nLoops));
         DestroyObject(oItem);
         }
      CreateItemOnObject(sCur, oOwner);
      int nVis=GetLocalInt(OBJECT_SELF, "lsv_"+sCur);
      if (nVis!=-10) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVis), oOwner);
      }

   oItem=OBJECT_INVALID;
   bOkay=FALSE;
   nGold=0;
   nCount=0;
   sCur="";
   sReq="";
   nNum=0;
   }
}

