#version 460

// Vertex attributes
layout (location = 0) in vec3 VertexPosition;
layout (location = 1) in vec3 VertexNormal; 
//layout (location = 2) in vec2 VertexTexCoord;

// Outputs these values to fragment shader
out vec3 Position;
out vec3 Normal;
//out vec2 TexCoord;

// Transform matrix uniforms
uniform mat4 ModelMatrix;
uniform mat4 ModelViewMatrix;
uniform mat3 NormalMatrix;
uniform mat4 ProjectionMatrix;
uniform mat4 MVP;
uniform mat4 ViewMatrix;


void main()
{
    // Pass texture coordinates without modifying
    //TexCoord = VertexTexCoord;
    // Transform normal vector and normalise it
    Normal = normalize(NormalMatrix * VertexNormal);
    // Transform position vector to get position 
    Position = (ModelViewMatrix * vec4(VertexPosition, 1.0)).xyz;
    
    // Calculate final position with ProjectionMatrix, ViewMatrix and ModelMatrix
    //gl_Position = ProjectionMatrix * ViewMatrix * ModelMatrix * vec4(VertexPosition, 1.0);
    gl_Position = MVP * vec4(VertexPosition, 1.0);
}
