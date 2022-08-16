//float4 colorCycleRate = 5.0f

float4 render(float2 uv) {
    float colorCycleRate = 5.0;
    float colorR = cos(builtin_elapsed_time / colorCycleRate ) + 1;
    float colorG = cos(builtin_elapsed_time / colorCycleRate + (1.0/3.0)) + 1;
    float colorB = cos(builtin_elapsed_time / colorCycleRate + (2.0/3.0)) + 1;
    return float4(colorR, colorG, colorB, 1.0f);
}