extends StaticBody2D

@export var fanzhuan: bool

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func update(is_on: bool):
	if is_on:
		collision_shape_2d.set_deferred("disabled", true)
	else:
		collision_shape_2d.set_deferred("disabled", false)
	if fanzhuan:
		collision_shape_2d.set_deferred("disabled", not collision_shape_2d.disabled)
