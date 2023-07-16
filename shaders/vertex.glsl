varying vec2 vCoordinates;
attribute vec3 aCoordinates;

void main(){
    vec4 mvPosition = modelViewMatrix * vec4(position, 1.);
    gl_PointSize = 5000. * (1. / - mvPosition.z);
    gl_Position = projectionMatrix * mvPosition;
    vCoordinates = aCoordinates.xy; // Assuming 'aCoordinates' is set elsewhere
}