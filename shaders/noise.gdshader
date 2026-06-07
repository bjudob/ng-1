shader_type canvas_item;

// Hint tells Godot 4 to grab the background behind the object
uniform sampler2D screen_texture : hint_screen_texture;
uniform vec2 scroll = vec2(0.01, 0.01);
uniform float intensity = 0.15;

void fragment() {
	// 1. Keep the UV coordinates repeating between 0.0 and 1.0
	vec2 moving_uv = fract(UV + scroll * TIME);
	
	// 2. Get the scrolling texture color
	vec4 texture_color = texture(TEXTURE, moving_uv);
	
	// 3. Get the background screen color
	vec4 background_color = texture(screen_texture, SCREEN_UV);
	
	// 4. Mix them: 90% texture (0.9) and 10% background
	vec3 blended_color = mix(background_color.rgb, texture_color.rgb, intensity);
	
	// 5. Output the result with full opacity
	COLOR = vec4(blended_color, 1.0);
}
