extends Area2D


var is_on: bool:
	get:
		return not bodies.is_empty()

var bodies: Array[Node2D]

func _on_body_entered(body: Node2D) -> void:
	bodies.append(body)

func _on_body_exited(body: Node2D) -> void:
	bodies.erase(body)
