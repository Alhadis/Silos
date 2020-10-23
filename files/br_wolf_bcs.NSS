//Written by Netriak at Bioware forums; script is allowing to check if Bishop's wolf is summoned.

int StartingConditional()
{
    return GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION));
}