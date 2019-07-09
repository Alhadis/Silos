#version 150

in  vec4 vPosition;
in  vec4 vNormal;

out  vec3 fN;
out  vec3 fE;
out  vec3 fL;

uniform mat4 ModelView;
uniform mat4 Projection;
uniform mat4 NormalMatrix;
uniform vec4 LightPosition;

void main ( void ) {
	fN = normalize( (NormalMatrix*vNormal).xyz );
	//fE = (NormalMatrix*vPosition).xyz;
	fE = vPosition.xyz;
	fL = LightPosition.xyz;
	
	if( LightPosition.w != 0.0 ) {
		fL = LightPosition.xyz - fE;
    }
    
	gl_Position = Projection*ModelView*vPosition;
} //