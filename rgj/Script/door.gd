extends Area2D

@export var next_level: PackedScene

var can_go := false
var player_num := 0

func _on_body_entered(body: Node2D) -> void:
	player_num+=1
	if can_go and player_num==2:
		get_tree().change_scene_to_packed(next_level)

func _on_body_exited(body: Node2D) -> void:
	player_num-=1
