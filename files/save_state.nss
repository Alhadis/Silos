void functionWithVariables(){
	string stringVar="message_from_closureWithVariables";
	DelayCommand(0.0,PrintString(stringVar));
}
void main(){
	PrintString("before_closure");
	DelayCommand(0.0,PrintString("hello_from_closure_without_variables"));
	PrintString("after_closure");
	functionWithVariables();
	
}