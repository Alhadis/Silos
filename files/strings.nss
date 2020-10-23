void main()
{
	string a="ab";
	string b="cd";
	string c=a;
	PrintString(a+b);
	
	PrintInteger("123"=="123");//1
	PrintInteger("123"!="123");//0
	
	PrintInteger("456"=="123");//0
	PrintInteger("456"!="123");//1
	
	//comparing by handles
	PrintInteger(a==b);//0
	PrintInteger(a==c);//1
	PrintInteger(a!=c);//0
}