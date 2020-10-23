void main()
{
	
	
	//48. Test else
	if(1==2){
		PrintInteger(65);
	}else{
		PrintInteger(48);
	}
	
	//98. Test success if
	if(1!=2){
		PrintInteger(98);
	}else{
		PrintInteger(45);
	}
	
	if(1==2){
		PrintInteger(56);//should not be printed
	}
	PrintInteger(57);//should be printed in any case
}