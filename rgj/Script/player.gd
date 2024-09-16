extends CharacterBody2D
class_name Player

const ACCELERATION = 3000.0
const SPEED = 170.0
const JUMP_VELOCITY = -360.0

var score := 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move(delta)
	push_box()
	move_and_slide()

func move(delta: float):
	pass

func push_box():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var obj: Object = collision.get_collider()
		if not obj is CollisionObject2D:
			return
		if obj.collision_layer == 8 or obj.collision_layer == 16 or obj.collision_layer == 256:
			obj.velocity = -collision.get_normal() * SPEED/2.0

var ex_box_arr: Array[Node2D]

func _on_player_area_body_entered(body: Node2D) -> void:
	ex_box_arr.push_front(body)

func _on_player_area_body_exited(body: Node2D) -> void:
	ex_box_arr.erase(body)
