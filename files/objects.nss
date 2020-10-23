void main(){
	object myobject=OBJECT_SELF;
	if(myobject==OBJECT_SELF){//should be true
		PrintInteger(1);
	}else{
		PrintInteger(0);
	}
	if(myobject!=OBJECT_INVALID){//should be true
		PrintInteger(0);
	}else{
		PrintInteger(1);
	}
}