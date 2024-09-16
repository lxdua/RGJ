extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func change_scene(new_scene: PackedScene):
	animation_player.play("fadeout")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(new_scene)
	animation_player.play("fadein")
	await animation_player.animation_finished

func reload_scene():
	animation_player.play("fadeout")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play("fadein")
	await animation_player.animation_finished
