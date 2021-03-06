
uniform mat4 modelMatrix;
//uniform mat4 modelViewMatrix;
//uniform mat4 projectionMatrix;
uniform mat4 mvp;
//uniform mat4 viewMatrix;
uniform vec3 cameraPosition;

attribute vec3 position;
attribute vec3 normal;
attribute vec2 uv;

varying vec2 vUv;
varying vec3 vWorldNorm;
varying vec4 vViewPos;
varying vec4 vWorldPos;
varying vec3 vLightDir;
varying vec3 vViewDir;
varying vec3 vRefDir;

void main() {
    vUv = uv;
    vWorldPos = modelMatrix*vec4(position, 1.0);
    vWorldNorm =  (modelMatrix*vec4(normal,0.0)).xyz;
    vViewDir = normalize(vWorldPos.xyz-cameraPosition);
    vRefDir = reflect(vViewDir,vWorldNorm);
    gl_Position = mvp*vec4(position, 1.0);
}
