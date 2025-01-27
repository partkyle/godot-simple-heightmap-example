//https://godotshaders.com/shader/the-simplest-outline-shader-via-material/
shader_type spatial;
render_mode blend_mix, cull_front, unshaded;

uniform vec4 color : source_color = vec4(1,0,0,1);
uniform float size : hint_range(1.0, 1.5, 0.01) = 1.05;

void vertex() {
	VERTEX *= size;
}

void fragment() {
	ALBEDO = vec3(sin(TIME) * 0.5 + 0.5, cos(TIME) * 0.5 + 1.0, 0.2);
	ALPHA = color.a;
}