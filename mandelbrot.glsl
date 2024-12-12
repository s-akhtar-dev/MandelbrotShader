// Programmer: Sarah Akhtar
// Date: December 11th, 2024
// Mandelbrot Animation


// Squares a given complex number
vec2 cSquare( in vec2 z ) 
{
    return vec2(
            z.x * z.x - z.y * z.y,
            2.0 * z.x * z.y
        );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 c = fragCoord/iResolution.x;
    
    // Scale [lower is more zoomed in]
    float scale = 4.0;
    
    c *= scale;
    
    // Move set into view
    c += vec2(-2.1,-1.15);
    
    // Maximum number of iterations
    int maxIterations = 256;

	// Starting point
	vec2 Z = vec2(0,0);
    
    for(int i = 0; i < maxIterations; i++)
    {
        vec2 oldZ = Z;
        Z = cSquare(cSquare(oldZ)) + (c/1.5) + (oldZ * cos(iTime/5.0)*1.5);
        
        if(dot(Z, Z) > 20.0) {
            float sn = float(i) - log2(log2(dot(Z,Z))) + 8.0;
        
            // Normalize i for brightness
            float brightness = (float(i) - log2(log2(dot(Z,Z))) + 4.0) / float(maxIterations);
            
            // multipliers for ( R   G   B ) values
            vec3 weights = vec3(10.0 + sin(iTime) * 8.0,10.0 + cos(iTime) * 2.0,2.0);
            fragColor = vec4(vec3(float(sn)/float(maxIterations)) * weights, 1.0);
            
            break;
        } else {
            fragColor = vec4(0.0, 0.0, 0.0, 1.0);
        }
    }
}
