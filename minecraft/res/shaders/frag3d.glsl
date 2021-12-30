#version 330 core

out vec4 FragColor;

in vec2 texCoord;
in vec3 normal;
in vec3 fragPos;

uniform vec3 lightPos;
uniform vec3 lightColor;
uniform vec3 viewPos;
uniform sampler2D texture1;

void main()
{
    //ambient
    float ambientStrength = 0.5;
    vec3 ambient = ambientStrength * lightColor;

    //diffuse
    vec3 pixelColor = vec3(texture(texture1, texCoord));
    vec3 lightDir = normalize(lightPos - fragPos);
    float diff = max(dot(normal, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;

    //specular
    /*float specularStrength = 0.2;
    vec3 viewDir = normalize(viewPos - fragPos);
    vec3 reflectDir = reflect(-lightDir, normal);

    int shineness = 32;
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), shineness);
    vec3 specular = specularStrength * spec * lightColor;*/

    vec3 result = (ambient + diffuse /*+ specular*/) * pixelColor;
    FragColor = vec4(result, 1.0);
    /*FragColor = vec4(pixelColor, 1.0);*/
    //FragColor = vec4(normal, 1.0);
    //FragColor = vec4(1.0);

}
