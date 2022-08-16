#define PI 3.1415926538

uniform float2 uv_scale;

float4 render(float2 uv) {
    // sample the source texture and return its color to be displayed

    float aspectRatioScale = uv_scale.y / uv_scale.x;

    float checkerFrequency = 4;
    float checkerScrollSpeed = 0.005;
    float checkerStartingOffset = 0.25;
    float checkerOffset = 0.25 * 2 * PI;
    checkerOffset *= builtin_frame * checkerScrollSpeed;
    float checkerThreshold = 0.49999;

    float3 horizontal = float3(uv.x * aspectRatioScale, uv.x * aspectRatioScale, uv.x * aspectRatioScale);
    float3 vertical = float3(uv.y, uv.y, uv.y);
    float3 cosineHorizontal = cos(horizontal * 2 * PI * checkerFrequency + checkerOffset);
    float3 cosineVertical = cos(vertical * 2 * PI * checkerFrequency + checkerOffset);
    float3 combinedSinusoids = cosineHorizontal + cosineVertical;
    float3 combinedInverseSinusoids = -(cosineHorizontal * cosineVertical);

    float3 steppedCombinedSinusoids = step(combinedSinusoids, 0);
    float4 color = float4(steppedCombinedSinusoids,1);
    //return color;

    return float4(horizontal ,1.0f);
}