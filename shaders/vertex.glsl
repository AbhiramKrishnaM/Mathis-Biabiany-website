varying vec2 vCoordinates;
attribute vec3 aCoordinates;
attribute float aSpeed;
attribute float aOffset;

uniform float move;
uniform float time; 



void main(){
    vec3 pos = position; 
    pos.z = position.z + move*aSpeed + aOffset;

    vec4 mvPosition = modelViewMatrix * vec4(position, 1.);
    gl_PointSize = 1000. * (1. / - mvPosition.z);
    gl_Position = projectionMatrix * mvPosition;
    vCoordinates = aCoordinates.xy; // Assuming 'aCoordinates' is set elsewhere
}