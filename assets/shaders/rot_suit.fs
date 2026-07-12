#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
#define MY_HIGHP_OR_MEDIUMP highp
#else
#define MY_HIGHP_OR_MEDIUMP mediump
#endif
// this is shit that balatro NEEDS... even when i dont use it
extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv) {
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0., 0., 0.) : tex.xyz, shadow ? tex.a * 0.3 : tex.a);
    }

    float adjusted_dissolve = (dissolve * dissolve * (3. - 2. * dissolve)) * 1.02 - 0.01;
    // not pause at extreme values

    float t = time * 10.0 + 2003.;
    vec2 floored_uv = (floor((uv * texture_details.ba))) / max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);

    vec2 field_part1 = uv_scaled_centered + 50. * vec2(sin(-t / 143.6340), cos(-t / 99.4324));
    vec2 field_part2 = uv_scaled_centered + 50. * vec2(cos(t / 53.1532), cos(t / 61.4532));
    vec2 field_part3 = uv_scaled_centered + 50. * vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field =
    (1. + (cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) + cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92)))
    / 2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5 * cos((adjusted_dissolve) / 82.612 + (field + -.5) * 3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y) * (5. + 5. * dissolve) : 0.) * (dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y) * (5. + 5. * dissolve) : 0.) * (dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x) * (5. + 5. * dissolve) : 0.) * (dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y) * (5. + 5. * dissolve) : 0.) * (dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8 * (0.5 - abs(adjusted_dissolve - 0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5 * (0.5 - abs(adjusted_dissolve - 0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0., 0., 0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a * 0.3 : tex.a) : .0);
}

// hue threshholds for the mask colors because the way i did it before completely broke on anti aliasing
extern MY_HIGHP_OR_MEDIUMP number dark_hue;
extern MY_HIGHP_OR_MEDIUMP number med_hue;
extern MY_HIGHP_OR_MEDIUMP number light_hue;
extern MY_HIGHP_OR_MEDIUMP number hue_thresh;
extern MY_HIGHP_OR_MEDIUMP number min_saturation;

extern MY_HIGHP_OR_MEDIUMP vec4 dark_colour;
extern MY_HIGHP_OR_MEDIUMP vec4 light_colour;

// standard RGB -> HSV
vec3 rgb2hsv(vec3 c) {
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

float hue_diff(float a, float b) {
    float d = abs(a - b);
    return min(d, 1.0 - d); // hue wraps around 0/1
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 uv = (((texture_coords) * (image_details)) - texture_details.xy * texture_details.ba) / texture_details.ba;
    vec4 tex = Texel(texture, texture_coords);

    vec3 hsv = rgb2hsv(tex.rgb);

    if (tex.a > 0.01 && hsv.y > min_saturation) {
        float intensity = -1.0; // -1 = no band matched
        if (hue_diff(hsv.x, dark_hue) < hue_thresh) intensity = 0.0;
        else if (hue_diff(hsv.x, med_hue) < hue_thresh) intensity = 0.5;
        else if (hue_diff(hsv.x, light_hue) < hue_thresh) intensity = 1.0;

        if (intensity >= 0.0) {
            vec3 remapped = mix(dark_colour.rgb, light_colour.rgb, intensity);
            tex = vec4(remapped, tex.a);
        }
    }

    return dissolve_mask(tex, texture_coords, uv);
}

extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position) {
    if (hovering <= 0.) {
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5 * love_ScreenSize.xy) / length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy) / screen_scale;
    float scale = 0.2 * (-0.03 - 0.3 * max(0., 0.3 - mid_dist)) * hovering * (length(mouse_offset) * length(mouse_offset)) / (2. - mid_dist);

    return transform_projection * vertex_position + vec4(0, 0, 0, scale);
}
#endif