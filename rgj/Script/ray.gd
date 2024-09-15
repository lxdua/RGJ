extends RayCast2D
class_name Ray

const RAY = preload("res://Scene/ray.tscn")

@onready var ray_line: Line2D = $RayLine
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func update():
	if not is_colliding():
		return
	var old_reflection_ray = get_node_or_null("ReflectionRay")
	if old_reflection_ray != null:
		old_reflection_ray.free()
	ray_line.points[1] = get_collision_point() - global_position
	collision_shape_2d.shape.b = ray_line.points[1]*1.01

	if get_collider().get_parent() is LightSensor:
		get_collider().get_parent().is_on = true

	if get_collider().get_parent() is Mirror and get_collider().collision_layer == 32:
		var reflection_ray = RAY.instantiate()
		reflection_ray.position = get_collision_point() - global_position
		reflection_ray.name = "ReflectionRay"
		if get_collider().get_parent().rotation == 0.0:
			reflection_ray.rotation = rotation + PI/2.0
		else:
			reflection_ray.rotation = rotation - PI/2.0
		add_child(reflection_ray)
		reflection_ray.update()

func _ready() -> void:
	ray_line.points[1] = target_position

func _physics_process(delta: float) -> void:
	ray_line.points[1] = target_position
	update()
