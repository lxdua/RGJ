extends Player
class_name Player1


func move(delta: float):
	if Input.is_action_just_pressed("P1_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("P1_move_left", "P1_move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
