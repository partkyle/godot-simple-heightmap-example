shader_type spatial;

uniform sampler2D noise;
uniform sampler2D gradient_texture;
uniform vec3 input_color: source_color;
uniform float max_height = 1.0;

varying float n;

void vertex() {
	n = texture(noise, UV).r;

	VERTEX.y = n * max_height;
}

void fragment() {
	ALBEDO = texture(gradient_texture, vec2(n, 0)).rgb;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
