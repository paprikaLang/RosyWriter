
precision mediump float;

varying mediump vec2 coordinate;
uniform sampler2D videoframe;

const vec3 luminanceWeighting = vec3(0.2125,0.7154,0.0721);
float uT = 0.5;
//用户设置的色饱和度
uniform lowp float saturation;

 void main()
{
    
    
      //一.灰度图1.取平均值2.dot函数3.最大值加0.5
    
//	  vec4 color = texture2D(videoframe, coordinate);
//    float grey = dot(color.rgb,luminanceWeighting);
//    float grey1 = max(color.r,max(color.g,color.b));
//    //gl_FragColor = vec4(grey1,grey1,grey1,1);

    
      //二.浮雕
    
//    vec2 vST = coordinate;
//    ivec2 ires = ivec2(1920,1080);
//    float ResS = float( ires.s );
//    float ResT = float( ires.t );
//    //vec3 irgb = texture2D(videoframe,vST).rgb;
//    vec2 padding = vec2(1./ResS,0.);
//    vec3 current = texture2D(videoframe,vST).rgb;
//    vec3 next = texture2D(videoframe,vST + padding).rgb;
//    vec3 diffs = current-next;
//    float bigger = diffs.r;
//    if (abs(diffs.g)>abs(bigger)) {
//        bigger = diffs.g;
//    }
//    if (abs(diffs.b)>abs(bigger)) {
//        bigger = diffs.b;
//    }
//    float fLoat = clamp(bigger + .5 ,0.,1.);
//    vec3 rgb = vec3(fLoat,fLoat,fLoat);
//    gl_FragColor = vec4(rgb,1.);
    
    
    
    //三.黑白
    
//    vec4 color = texture2D(videoframe, coordinate);
//    float average = (color.r + color.g + color.b)/3.;
//    if (average > .5) {
//        gl_FragColor = vec4(0.,0.,0.,1.);
//    }else{
//        gl_FragColor = vec4(1.,1.,1.,1.);
//        
//    }
    
    
    
    //四.底片
    
//    vec4 color = texture2D(videoframe, coordinate);
//    gl_FragColor = vec4(1.-color.r,1.-color.g,1.-color.b,color.a);
    
    
    
    
    //五.柔和灰色
    
//      lowp vec4 color = texture2D(videoframe, coordinate);
//      lowp float luminance = dot(color.rgb,luminanceWeighting);
//      lowp vec3 greyScaleColor = vec3(luminance);
//    //mix 函数把刚计算的灰度值和初始的纹理颜色以及我们得到的饱和度的信息相结合
//    gl_FragColor = vec4(mix(greyScaleColor,color.rgb,saturation),color.w);
    
    
      //六.索贝尔 (Sobel) 边界探测
        vec2 vST = coordinate;
        ivec2 ires = ivec2(1920,1080);
        float ResS = float( ires.s );
        float ResT = float( ires.t );
        //vec3 irgb = texture2D(videoframe,vST).rgb;
        vec2 paddingW = vec2(1./ResS,0.);
        vec2 paddingH = vec2(0.,1./ResT);
        float currentIntensity = texture2D(videoframe,vST).r;
        float rightIntensity = texture2D(videoframe,vST + paddingW).r;
        float leftIntensity  = texture2D(videoframe,vST - paddingW).r;
        float bottomIntensity = texture2D(videoframe, vST-paddingH).r;
        float topIntensity = texture2D(videoframe, vST+paddingH).r;
    
    float bottomLeftIntensity = texture2D(videoframe, vST+paddingH-paddingW).r;
    float topRightIntensity = texture2D(videoframe, vST-paddingH+paddingW).r;
    float topLeftIntensity = texture2D(videoframe, vST-paddingH-paddingW).r;
    float bottomRightIntensity = texture2D(videoframe, vST+paddingH+paddingW).r;
    
    float h = -bottomLeftIntensity - 2.0 * leftIntensity - topLeftIntensity + bottomRightIntensity + 2.0 * rightIntensity + topRightIntensity;
    float v = -topLeftIntensity - 2.0 * topIntensity - topRightIntensity + bottomLeftIntensity + 2.0 * bottomIntensity + bottomRightIntensity;
    float mag = length(vec2(h, v));
    
    gl_FragColor = vec4(vec3(mag), 1.0);
    
   
    //七.倒置
    
//    vec2 vST = coordinate;
//    vST = vec2(1.-coordinate.x,1.-coordinate.y);
//    vec3 rgb = texture2D(videoframe,vST).rgb;
//    gl_FragColor = vec4(rgb,1.);

    
    
    //八.对比度调整
    
//    vec4 color = texture2D(videoframe,coordinate);
//    vec3 target = vec3(0.);
//    gl_FragColor = vec4(mix(target,color.rgb,uT),1.);
    
    
    //九.坎尼 (Canny) 边界探测
//    vec2 vST = coordinate;
//    ivec2 ires = ivec2(1920,1080);
//    float ResS = float( ires.s );
//    float ResT = float( ires.t );
//    //vec3 irgb = texture2D(videoframe,vST).rgb;
//    vec2 paddingW = vec2(1./ResS,0.);
//    vec2 paddingH = vec2(0.,1./ResT);
//    float currentIntensity = texture2D(videoframe,vST).r;
//    float rightIntensity = texture2D(videoframe,vST + paddingW).r;
//    float leftIntensity  = texture2D(videoframe,vST - paddingW).r;
//    float bottomIntensity = texture2D(videoframe, vST-paddingH).r;
//    float topIntensity = texture2D(videoframe, vST+paddingH).r;
//    
//    float bottomLeftIntensity = texture2D(videoframe, vST+paddingH-paddingW).r;
//    float topRightIntensity = texture2D(videoframe, vST-paddingH+paddingW).r;
//    float topLeftIntensity = texture2D(videoframe, vST-paddingH-paddingW).r;
//    float bottomRightIntensity = texture2D(videoframe, vST+paddingH+paddingW).r;
//    
//    vec2 gradientDirection;
//    gradientDirection.x = -bottomLeftIntensity - 2.0 * leftIntensity - topLeftIntensity + bottomRightIntensity + 2.0 * rightIntensity + topRightIntensity;
//    gradientDirection.y = -topLeftIntensity - 2.0 * topIntensity - topRightIntensity + bottomLeftIntensity + 2.0 * bottomIntensity + bottomRightIntensity;
//    
//    float gradientMagnitude = length(gradientDirection);
//    vec2 normalizedDirection = normalize(gradientDirection);
//    normalizedDirection = sign(normalizedDirection) * floor(abs(normalizedDirection) + 0.617316); // Offset by 1-sin(pi/8) to set to 0 if near axis, 1 if away
//    normalizedDirection = (normalizedDirection + 1.0) * 0.5; // Place -1.0 - 1.0 within 0 - 1.0
//    
//    gl_FragColor = vec4(gradientMagnitude, normalizedDirection.x, normalizedDirection.y, 1.0);
//    
    
    
    //十.
//    vec2 vST = coordinate;
//    ivec2 ires = ivec2(1920.,1080.);
//    float ResS = float( ires.s );
//    float ResT = float( ires.t );
//    //vec3 irgb = texture2D(videoframe,vST).rgb;
//    vec2 paddingW = vec2(1./ResS,0.);
//    vec2 paddingH = vec2(0.,1./ResT);
//
//    vec3 currentGradientAndDirection = texture2D(videoframe, vST).rgb;
//    vec2 gradientDirection = ((currentGradientAndDirection.gb * 2.0) - 1.0) * vec2(1./ResS, 1./ResT);
//    
//    float firstSampledGradientMagnitude = texture2D(videoframe, vST + gradientDirection).r;
//    float secondSampledGradientMagnitude = texture2D(videoframe, vST - gradientDirection).r;
//    
//    float multiplier = step(firstSampledGradientMagnitude, currentGradientAndDirection.r);
//    multiplier = multiplier * step(secondSampledGradientMagnitude, currentGradientAndDirection.r);
//    
//    float thresholdCompliance = smoothstep(0.1, 0.5, currentGradientAndDirection.r);
//    multiplier = multiplier * thresholdCompliance;
//    
//    gl_FragColor = vec4(multiplier, multiplier, multiplier, 1.0);
}















