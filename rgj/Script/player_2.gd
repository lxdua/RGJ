extends Player
class_name Player2

@onready var sprite: AnimatedSprite2D = $Sprite

func move(delta: float):
	if Input.is_action_just_pressed("P2_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("P2_move_down") and is_on_floor():
		global_position.y += 2
	var direction := Input.get_axis("P2_move_left", "P2_move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
		sprite.play("walk")
		sprite.scale.x = -direction
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
		sprite.play("idle")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("P2_attack"):
		click()

func click():
	if ex_box_arr.is_empty():
		return
	ex_box_arr[0].is_on = false
