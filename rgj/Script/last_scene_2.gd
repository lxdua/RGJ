extends Control

@onready var story_container: VBoxContainer = $StoryContainer

@export var new_scene: PackedScene

var STORY: Array[String] = [
	"门后的世界，究竟是什么",
	"新的旅行，在等着我们",
	"屏幕前的你，走吧，和我们一起",
]

var started = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		if not STORY.is_empty():
			var content = STORY.pop_front()
			if content == "clear":
				for i in story_container.get_children():
					i.queue_free()
				content = STORY.pop_front()
			var new_label: Label = Label.new()
			new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			new_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			new_label.text = content
			story_container.add_child(new_label)
			var tween = new_label.create_tween()
			tween.tween_property(new_label, "visible_ratio", 1.0, 0.6).from(0.0)
		else:
			Global.change_scene(new_scene)
