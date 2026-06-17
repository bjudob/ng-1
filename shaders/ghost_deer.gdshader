shader_type canvas_item;

uniform sampler2D noise_texture : repeat_enable;
uniform sampler2D screen_texture : hint_screen_texture;

// Hover controls
uniform float hover_speed : hint_range(0.1, 10.0) = 5.0;      
uniform float hover_amount : hint_range(0.0, 50.0) = 30.0;     

// Balanced controls (Valori implicite actualizate conform cerințelor tale)
uniform float speed : hint_range(0.1, 5.0) = 0.5; 
uniform float intensity : hint_range(0.1, 3.0) = 0.5;
uniform float distortion_strength : hint_range(0.0, 0.1) = 0.01;
uniform vec4 ghost_color : source_color = vec4(0.0, 0.8, 1.0, 1.0);

// 1. VERTEX FUNCTION: Bobs the entire sprite up and down smoothly
void vertex() {
	VERTEX.y += sin(TIME * hover_speed) * hover_amount;
}

// 2. FRAGMENT FUNCTION: Handles the textures, distortion, and blending
void fragment() {
	// Noise calculations
	vec2 moving_uv = UV + vec2(TIME * speed * 0.1, TIME * speed * 0.12);
	float noise_value = texture(noise_texture, moving_uv).r;
	
	// Distort both UV sets using the noise value
	vec2 distortion_offset = (vec2(noise_value) - 0.5) * distortion_strength;
	
	vec2 distorted_uv = UV + distortion_offset;
	vec2 distorted_screen_uv = SCREEN_UV + distortion_offset;
	
	// Sample both textures using the new distorted coordinates
	vec4 original_color = texture(TEXTURE, distorted_uv);
	vec4 background_color = texture(screen_texture, distorted_screen_uv);
	
	// Absolute zero background protection outside the distorted sprite bounds
	if (original_color.a == 0.0) {
		discard;
	}
	
	// Edge smoothing and blending
	float edge_mask = fwidth(original_color.a);
	float soft_alpha = original_color.a * (1.0 - edge_mask * 0.5);
	
	// Glow calculation
	float balanced_noise = pow(noise_value, 2.0) * intensity;
	vec3 glow = ghost_color.rgb * balanced_noise;
	
	// Opacity specifications: 30% original sprite (0.3), 70% distorted background (0.7)
	vec3 blended_color = mix(background_color.rgb, original_color.rgb, 0.3);
	vec3 final_rgb = blended_color + glow;
	
	COLOR = vec4(final_rgb, soft_alpha);
}