shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D curve;
uniform float strength: hint_range(-1, 1) = .5;

void fragment() {
	vec2 vectorToCenter = vec2(0.5, 0.5) - UV;
	float distanceToCenter = length(vectorToCenter);
	
	float curveValue = texture(curve, vec2(distanceToCenter)).r;
	vec2 diff = normalize(vectorToCenter) * strength * curveValue;
	
	COLOR = texture(screen_texture, SCREEN_UV - diff);
}