extends CharacterBody2D
class_name Mirror

const ACCELERATION = 3000.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
	move_and_slide()
