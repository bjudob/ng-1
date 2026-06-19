shader_type canvas_item;

// Allows you to pick your exact shade of grey in the Inspector
uniform vec4 target_color : source_color = vec4(0.2, 0.2, 0.2, 1.0); 

void fragment() {
    // Fetches the combined color of all children at this pixel
    vec4 group_color = texture(TEXTURE, UV);
    
    // Check if the combined pixel is black and visible
    if (group_color.r < 0.1 && group_color.g < 0.1 && group_color.b < 0.1 && group_color.a > 0.0) {
        // Turn it grey while keeping the original transparency layer
        COLOR = vec4(target_color.rgb, group_color.a);
    } else {
        COLOR = group_color;
    }
}