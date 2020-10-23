vector updateVector(vector v){
	v.x=v.x+1;
	return v;
}

void main(){
	vector v=Vector(1.0f, 2.0f, 3.0f);
	v.x = 12.0f;
	PrintFloat(v.x);
	PrintFloat(v.y);
	PrintFloat(v.z);
	
	v=updateVector(v);
	PrintFloat(v.x);
	
	//vector add
	vector v1=Vector(1.0f, 2.0f, 3.0f);
	vector v2=Vector(5.0f, 6.0f, 7.0f);
	vector v3=v1+v2;
	
	PrintFloat(v3.x);
	PrintFloat(v3.y);
	PrintFloat(v3.z);
	
	//vector sub
	vector v4=v2-v1;
	
	PrintFloat(v4.x);
	PrintFloat(v4.y);
	PrintFloat(v4.z);
	
	//vector div on float
	vector v5=Vector(70.0, 90.0, 80.0);
	vector result=v5/2.0;
	PrintFloat(result.x);
	PrintFloat(result.y);
	PrintFloat(result.z);
	
	//vector mul on float
	result=v5*2.0;
	PrintFloat(result.x);//140
	PrintFloat(result.y);//180
	PrintFloat(result.z);//160
	
	//float mul on vector
	result=3.0*v1;
	PrintFloat(result.x);//3
	PrintFloat(result.y);//6
	PrintFloat(result.z);//9
}