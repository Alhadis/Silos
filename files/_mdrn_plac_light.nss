/*
    Place a light glow on an placeable
*/

void main()
{
    //Check the state of the placeable
    int nLit = GetLocalInt(OBJECT_SELF, "Lit");
    if (nLit == 1) return;
    //If it's not lit then set the state to Lit
    SetLocalInt(OBJECT_SELF, "Lit", 1);

    //place a light effect
    effect eLight = EffectVisualEffect(nLight);
    RecomputeStaticLighting(GetArea(OBJECT_SELF));
}


