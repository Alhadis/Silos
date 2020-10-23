struct myStructure{
	int a;
	int b;
	int c;
};

struct structWithString{
	string s1;
	string s2;
};

void main(){
	struct  structWithString str1;
	str1.s1="someString";
	str1.s2="abc";
	PrintString(str1.s1);
	PrintString(str1.s2);

	struct  myStructure str;
	str.a=6;
	str.b=7;
	str.c=8;
	PrintInteger(str.a);
	PrintInteger(str.b);
	PrintInteger(str.c);

	//structures equality
	struct  myStructure eqStruct1;
	eqStruct1.a=3;
	eqStruct1.b=4;
	eqStruct1.c=5;

	struct  myStructure eqStruct2;
	eqStruct2.a=3;
	eqStruct2.b=4;
	eqStruct2.c=5;

	if(eqStruct1==eqStruct2){
		PrintInteger(1);
	}else{
		PrintInteger(0);
	}
	
	//structures inequality
	eqStruct1.b=5;
	if(eqStruct1!=eqStruct2){
		PrintInteger(58);
	}else{
		PrintInteger(60);
	}
}