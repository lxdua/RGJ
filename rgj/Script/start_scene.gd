extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var story_container: VBoxContainer = $StoryContainer

@export var new_scene: PackedScene

var STORY: Array[String] = [
	"自我醒来 已经在这片星系 流浪了不知多久…",
	"星星们在星云中眨眼，星球围绕着又一个星球，而我，只有孤身一人",
	"我不知道我是谁 我又因何而生 更不知道我又该去哪里。",
	"我就这样在宇宙中漫无目的地漂流着",
	"直到 我遇见了你",
	"clear",
	"在星系中探索 我们终于发现",
	"每颗星星 都有自己独特的魔法",
	"只有采集到属于我们的那颗星星",
	"找到开启“门”的钥匙",
	"我们才能",
	"去往“门”之后的，真正属于自己的地方",
	"clear",
	"于是 我们的旅行开始了",
]

var started = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		if not started:
			animation_player.play("start")
			await animation_player.animation_finished
			started = true
		elif not STORY.is_empty():
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
