
//0b_drinker_hb

//quick and cheap way to get guys to play animations indefinitely: Drinking occasionally.

// DBR 5/30/06


void main()
{
	int nRandom=Random(5);
	if (nRandom==0)
		PlayCustomAnimation(OBJECT_SELF,"drinkbeerfidget", 1);
	else if (nRandom==1)
		PlayCustomAnimation(OBJECT_SELF,"drinkbeer", 1);
	else
		PlayCustomAnimation(OBJECT_SELF,"drinkbeeridle", 1);
}