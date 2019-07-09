
varying  vec3 fN;
varying  vec3 fE;
varying  vec3 fL;

uniform mat4 ModelView;
uniform mat4 Projection;
uniform mat4 NormalMatrix;
uniform vec4 LightPosition;

void main ( void ){
	//fN = normalize(gl_NormalMatrix*gl_Normal);
	fN = normalize( (NormalMatrix*vec4( gl_Normal, 0.0 ) ).xyz );
	fE = gl_Vertex.xyz;
	fL = LightPosition.xyz;
	
	if( LightPosition.w != 0.0 ) {
		fL = LightPosition.xyz - fE;
    }
    
	gl_Position = Projection*ModelView*gl_Vertex;
}