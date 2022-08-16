
float4 render(float2 uv) {
    // sample the source texture and return its color to be displayed
    return float4(uv,1.0f, 1.0f);//image.Sample(builtin_texture_sampler, uv);
}