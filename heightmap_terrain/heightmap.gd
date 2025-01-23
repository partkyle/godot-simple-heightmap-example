@tool
extends MeshInstance3D

@export var max_height := 100.0
@export var heightmap : Texture2D

@onready var collision_shape_3d: CollisionShape3D = $StaticBody3D/CollisionShape3D

func _ready() -> void:
	# need to wait for noise texture to generate, which apparently happens in another thread
	# https://github.com/godotengine/godot/issues/26520
	await heightmap.changed

	# convert the image format to be compatible with the HeightMapShape3D
	heightmap.get_image().convert(Image.FORMAT_RF)

	#mesh.surface_get_material(0).set('shader_parameter/heightmap', heightmap)
	mesh.surface_get_material(0).set('shader_parameter/max_height', max_height)

	var shape = HeightMapShape3D.new()
	shape.update_map_data_from_image(heightmap.get_image(), 0.0, max_height)
	collision_shape_3d.shape = shape
