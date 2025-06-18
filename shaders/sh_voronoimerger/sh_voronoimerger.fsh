//
// Complicated Voronoi tesselation surface merger :D
//
varying vec2 v_vTexcoord;

uniform sampler2D tex1, tex2, tex3; //We use the input texture for the 0th. GLSL supports sampler arrays, GM does not.
uniform int num_players;
uniform vec2 screenpos[4];

void main(){
	vec4 sampcol[4];
	
	//Sample the pixel unconditionally (needed since GLSL won't allow sampling to be dependent on flow control)
	sampcol[0] = texture2D(gm_BaseTexture,	v_vTexcoord);
	sampcol[1] = texture2D(tex1,			v_vTexcoord);
	sampcol[2] = texture2D(tex2,			v_vTexcoord);
	sampcol[3] = texture2D(tex3,			v_vTexcoord);
	
	//Go find the nearest screen position and use that
	float bestdist = 999999.99, dist;
	int bestid = 0;
	for(int c = 0; c < 4; c++){
		if(c < num_players){ //Only do stuff if this player is active (loop size must be constant in GLSL so thus this if-statement)
			dist = distance(screenpos[c].xy,v_vTexcoord);
			if(dist < bestdist){
				bestdist = dist;
				bestid = c;
			}
		}
	}
	gl_FragColor = sampcol[bestid];
}
