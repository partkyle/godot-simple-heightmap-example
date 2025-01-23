shader_type spatial;

uniform sampler2D heightmap;
uniform sampler2D normalmap;
uniform sampler2D gradient_texture;
uniform vec3 input_color: source_color;
uniform float max_height = 1.0;

varying float n;


void vertex() {
	n = texture(heightmap, UV).r;
	VERTEX.y += n * max_height;
}

void fragment() {
    vec2 e = vec2(1.0, 0.0);
	vec3 normal = normalize(vec3(texture(heightmap, VERTEX.xz - e).r - texture(heightmap, VERTEX.xz + e).r, 2.0 * e.x, texture(heightmap, VERTEX.xz - e.yx).r - texture(heightmap, VERTEX.xz + e.yx).r));
	NORMAL = normal;

	ALBEDO = texture(gradient_texture, vec2(n, 0)).rgb;
}
