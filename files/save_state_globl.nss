string someStringVar="MyStringVarFromClosure";

void someDelayedFunction(string value){
	PrintString(value);
	
}

void main(){
	PrintString("before_closure");
	DelayCommand(0.0,PrintString(someStringVar));
	PrintString("after_closure");
	
	string argToDelayedFunction="argToDelayedFunction";
	DelayCommand(0.0,someDelayedFunction(argToDelayedFunction));
}