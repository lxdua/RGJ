extends Area2D


var is_on: bool = false:
	set(v):
		if is_on == v:
			return
		is_on = v
		for i in control:
			i.update(is_on)


@export var control: Array[Node2D]

var bodies: Array[Node2D]

func _on_body_entered(body: Node2D) -> void:
	bodies.append(body)
	if bodies.is_empty():
		is_on = false
	else:
		is_on = true

func _on_body_exited(body: Node2D) -> void:
	bodies.erase(body)
	if bodies.is_empty():
		is_on = false
	else:
		is_on = true
