uniform float percentage;
varying vec2 vUv;
// don't ask why float, voodoo shit
attribute float sky;
attribute vec3 ground3D;

void main() {
    vUv = uv;
    vec3 newPosition;
    if(sky == 1.0) {
        newPosition = mix(ground3D, position, percentage);
    } else {
        newPosition = position;
    }
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPosition, 1.0 );    
}
