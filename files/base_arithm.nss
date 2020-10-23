void main()
{
	int a;
	int b=2;
	int c=3;
//integer-integer
	a=b+c;
	PrintInteger(a);//5
	
	a=a-2;
	PrintInteger(a);//3
	
	a=a*4;
	PrintInteger(a);//12
	
	a=a/2;
	PrintInteger(a);//6
	
	PrintInteger(9%2);//1
	
//integer and float
	PrintFloat(9+1.1);//10.1
	PrintFloat(9-1.0);//8.0
	PrintFloat(8/2.0);//4.0
	PrintFloat(8*2.0);//16.0
	
//float and integer
	PrintFloat(1.1+8);//9.1
	PrintFloat(8.5-6);//2.5
	PrintFloat(16.0/2);//8.0
	PrintFloat(8.0*3);//24.0
	
//float and float
	PrintFloat(2.5+2.6);//5.1
	PrintFloat(10.5-0.5);//10.0
	PrintFloat(25.0/2.5);//10
	PrintFloat(8.2*3.2);//26.24
	
//comparison
	PrintInteger(1==5);//0
	PrintInteger(2==2);//1
	PrintInteger(2.5==2.5);//1
	
	PrintInteger(1!=5);//1
	PrintInteger(2!=2);//0
	PrintInteger(2.5!=2.5);//0
	
	//logical int
	PrintInteger(1>=5);//0
	PrintInteger(5>=1);//1
	PrintInteger(5>=5);//1
	
	PrintInteger(1>5 ); //0
	PrintInteger(5>1 ); //1
	PrintInteger(5>5);//0
	
	PrintInteger(1<5); //1
	PrintInteger(5<1); //0
	PrintInteger(5<5); //0
	
	PrintInteger(1<=5);//1
	PrintInteger(5<=1);//0
	PrintInteger(5<=5);//1
	
	//logical float
	PrintInteger(1.0>=5.0);//0
	PrintInteger(5.0>=0.1);//1
	PrintInteger(5.0>=5.0);//1
	
	PrintInteger(1.0>5.0); //0
	PrintInteger(5.0>1.0); //1
	PrintInteger(5.0>5.0);//0
	
	PrintInteger(1.0<5.0); //1
	PrintInteger(5.0<1.0); //0
	PrintInteger(5.0<5.0); //0
	
	PrintInteger(1.0<=5.0);//1
	PrintInteger(5.0<=1.0);//0
	PrintInteger(5.0<=5.0);//1
	
//shifts
	PrintInteger(2<<3   );//16
	PrintInteger(128>>2 );//32
	PrintInteger(128>>>2);//32
	PrintInteger(128>>-2);//-32
	PrintInteger(-128>>2 );//32

//negs
	PrintInteger(-29); //-29
	PrintFloat(-69.0); //-69

//one's complement
	PrintInteger(~98); //-99

//logical
	PrintInteger(1 && 0  ); //0
	PrintInteger(1 && 1  ); //1
	PrintInteger(20 && 10); //1
	PrintInteger(0 && 0);   //0
	
	PrintString("LABEL: check logical OR");
	PrintInteger(1 ||0 ); //1
	PrintInteger(1 ||1 ); //1
	PrintInteger(20||10); //1
	PrintInteger(0 ||0 ); //0
	PrintInteger(5 ||30);  //1
	
	
	
}