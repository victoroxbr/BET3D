uniform float percentage;
varying vec2 vUv;
// don't ask why float ^^
attribute float sky;
attribute vec3 ground3D;
attribute vec3 co_vertice;

vec3 interpol(vec3 ground3D, vec3 position, float percentage);
void main() {
    vUv = uv;
    vec3 newPosition;
    if(sky == 1.0) {
        newPosition = mix(ground3D, position, percentage);
    } else if(sky == 2.0){
        newPosition = interpol(ground3D, position, percentage);
    } else {
        newPosition = position;
    }
    gl_Position = projectionMatrix * modelViewMatrix * vec4(newPosition, 1.0 );    
}      

vec3 interpol(vec3 ground3D, vec3 position, float percentage) {
    vec3 linearPositionFull = mix(ground3D, position, percentage);
    vec3 dir = position - co_vertice;
    vec2 dir2D = vec2(dir.x, dir.y);
    dir2D = abs(dir2D);
    dir2D = normalize(dir2D);
    // not best way to do it since height are not conserved
    vec3 linearPositionPartial = mix(ground3D, position, percentage * 0.5);
    if(dir2D.x > dir2D.y) {
        return vec3(linearPositionFull.x, linearPositionPartial.y, linearPositionFull.z);
    } else {
        return vec3(linearPositionPartial.x, linearPositionFull.y, linearPositionFull.z);
    }
}