int globalA=200;
int globalB=300;
void main(){
	//test NOTI
	PrintInteger(!8); //0
	PrintInteger(!0); //1
	PrintInteger(!(-65)); //0
	
	//test boolean or
	PrintInteger(4|2); //6
	
	//test boolean and
	PrintInteger(30&15); //14
	
	//test boolean xor
	PrintInteger(25^10); //19
	
	//increment variable
	int a=65;a++;
	PrintInteger(a);//66
	
	//decrement variable
	a=100;	a--;
	PrintInteger(a);//99
	
	//increment global
	globalA++;
	PrintInteger(globalA);//201
	
	//decrement global
	globalB--;
	PrintInteger(globalB);//299
	
	//set global variable
	globalB=1000;
	PrintInteger(globalB);//1000
}