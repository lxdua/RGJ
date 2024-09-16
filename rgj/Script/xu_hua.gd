extends StaticBody2D

@export var fanzhuan: bool

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	update(false)

func update(is_on: bool):
	var true_is_on = is_on
	if fanzhuan:
		true_is_on = not true_is_on

	if true_is_on:
		collision_shape_2d.set_deferred("disabled", true)
	else:
		collision_shape_2d.set_deferred("disabled", false)

	if true_is_on:
		sprite.play("on")
	else:
		sprite.play("off")
