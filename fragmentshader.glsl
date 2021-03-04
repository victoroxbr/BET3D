uniform sampler2D texture1;
uniform vec3 color;
uniform int setColor;
varying vec2 vUv;
// branching is not optimal, maybe create another shader?
void main() {
    if(setColor==1) {
        gl_FragColor = vec4(color, 1.0);
    } else {
        gl_FragColor = texture2D(texture1, vUv);
    }
}