varying vec2 vCoordinates;
varying vec3 vPos;
attribute vec3 aCoordinates;
attribute float aSpeed;
attribute float aOffset;
attribute float aDirection;
attribute float aPress;


uniform float move;
uniform float time; 

uniform vec2 mouse; 



void main(){
    vec3 pos = position; 
// not stable     
    pos.x += sin(move*aSpeed)*3.;
    pos.y += sin(move*aSpeed)*3.;
    pos.z = mod(position.z + move*200.*aSpeed + aOffset, 2000.) - 1000.;

vec3 stable = position;

float distance = distance(stable.xy, mouse);

stable.x += 50.*sin(0.1*time*aPress)*aDirection;
stable.y += 50.*sin(0.1*time*aPress)*aDirection;
stable.z += 200.*cos(0.1*time*aPress)*aDirection;



// stable
    vec4 mvPosition = modelViewMatrix * vec4(stable, 1.);
    gl_PointSize = 3000. * (1. / - mvPosition.z);
    gl_Position = projectionMatrix * mvPosition;
    vCoordinates = aCoordinates.xy; 

    vPos = pos;

}