extends Node2D

@export var aim: Vector2 = Vector2(1,0)

var bounces := 3

var rot := 0.0

const MAX_LENGTH := 2000

@onready var line: Line2D = $Line

var max_cast_to = Vector2(1.0, 0.0)

var lasers := []

func _ready():
	lasers.append($Laser)
	for i in range(bounces):
		var raycast = $Laser.duplicate()
		raycast.enabled = false
		add_child(raycast)
		lasers.append(raycast)

	max_cast_to = Vector2(MAX_LENGTH, 0).rotated(rot)
	$Laser.target_position = max_cast_to

func _process(_delta):

	$End.show()
	rot = aim.angle()
	line.global_position = Vector2.ZERO
	line.clear_points()
	line.add_point(global_position)

	max_cast_to = Vector2(MAX_LENGTH, 0).rotated(rot)

	var idx = -1
	for raycast: RayCast2D in lasers:

		idx += 1
		var raycastcollision = raycast.get_collision_point()

		raycast.target_position = max_cast_to
		if raycast.is_colliding():
			line.add_point(raycastcollision)
			if raycast.get_collider().collision_layer != 32:
				return

			max_cast_to = max_cast_to.bounce(raycast.get_collision_normal())
			if idx < lasers.size()-1:
				lasers[idx+1].enabled = true
				lasers[idx+1].global_position = raycastcollision+(1*max_cast_to.normalized())
			if idx == lasers.size()-1:
				$End.global_position = raycastcollision
		else:
			line.add_point(global_position + max_cast_to)
			$End.hide()
			break
