extends Area2D


func _on_body_entered(body: Node2D) -> void:
	get_tree().get_first_node_in_group("Door").can_go = true
