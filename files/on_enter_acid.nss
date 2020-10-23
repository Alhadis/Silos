void main()
{
   object oCreature = GetEnteringObject();
   if (GetIsPC(oCreature) || GetIsPC(GetMaster(oCreature)))
   {
      FloatingTextStringOnCreature("This pool is made of acid!", oCreature);
   }
}
