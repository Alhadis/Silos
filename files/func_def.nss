int globalA=100;
int getFromGlobal(){
	return globalA;
}

void setGlobal(int value){
	globalA=value;
}

int sum(int a, int b){
	return a+b;
}

void main(){
	PrintInteger(sum(5,6)); //11
	PrintInteger(getFromGlobal());//100
	
	setGlobal(25);
	globalA++;
	PrintInteger(getFromGlobal());//26
}