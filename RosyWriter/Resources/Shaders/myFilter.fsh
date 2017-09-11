
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
    
    vec2 vST = coordinate;
    ivec2 ires = ivec2(1920,1080);
    float ResS = float( ires.s );
    float ResT = float( ires.t );
    //vec3 irgb = texture2D(videoframe,vST).rgb;
    vec2 padding = vec2(1./ResS,0.);
    vec3 current = texture2D(videoframe,vST).rgb;
    vec3 next = texture2D(videoframe,vST + padding).rgb;
    vec3 diffs = current-next;
    float bigger = diffs.r;
    if (abs(diffs.g)>abs(bigger)) {
        bigger = diffs.g;
    }
    if (abs(diffs.b)>abs(bigger)) {
        bigger = diffs.b;
    }
    float fLoat = clamp(bigger + .5 ,0.,1.);
    vec3 rgb = vec3(fLoat,fLoat,fLoat);
    gl_FragColor = vec4(rgb,1.);
    
    
    
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
    
    
    
    //七.倒置
    
//    vec2 vST = coordinate;
//    vST = vec2(1.-coordinate.x,1.-coordinate.y);
//    vec3 rgb = texture2D(videoframe,vST).rgb;
//    gl_FragColor = vec4(rgb,1.);

    
    
    //八.对比度调整
    
//    vec4 color = texture2D(videoframe,coordinate);
//    vec3 target = vec3(0.);
//    gl_FragColor = vec4(mix(target,color.rgb,uT),1.);
    
    
}















