# Mandelbrot Set Animation

This project implements an animated Mandelbrot set visualization using GLSL fragment shaders. The animation creates a mesmerizing, colorful fractal pattern that evolves over time.

## Features

- Real-time rendering of the Mandelbrot set
- Dynamic color animation based on time
- Zoom and pan functionality
- Smooth coloring technique for enhanced visual appeal

## Implementation Details

The main components of the implementation are:

### Complex Number Operations

The `cSquare` function handles complex number multiplication:

```glsl
vec2 cSquare(in vec2 z) 
{
    return vec2(
        z.x * z.x - z.y * z.y,
        2.0 * z.x * z.y
    );
}
```

### Mandelbrot Set Calculation

The core algorithm iterates through the Mandelbrot set equation:

```glsl
Z = cSquare(cSquare(oldZ)) + (c/1.5) + (oldZ * cos(iTime/5.0)*1.5);
```

This modified version incorporates time-based animation for a dynamic effect.

### Coloring

The coloring scheme uses a smooth coloring technique based on the escape time algorithm:

```glsl
float sn = float(i) - log2(log2(dot(Z,Z))) + 8.0;
```

Color weights are animated using sine and cosine functions of time:

```glsl
vec3 weights = vec3(10.0 + sin(iTime) * 8.0, 10.0 + cos(iTime) * 2.0, 2.0);
```

## Usage

To use this shader:

1. Ensure you have a GLSL-compatible environment or framework.
2. Copy the provided GLSL code into your fragment shader.
3. Set up the necessary uniforms (`iResolution`, `iTime`) in your rendering pipeline.
4. Render the shader to see the animated Mandelbrot set.

## Customization

You can adjust various parameters to customize the visualization:

- `scale`: Controls the zoom level
- `maxIterations`: Affects detail and performance
- Color weights: Modify the `weights` vector for different color schemes

## Author

Sarah Akhtar

## Date

December 11th, 2024
