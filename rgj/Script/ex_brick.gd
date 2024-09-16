extends StaticBody2D

@onready var time_label: Label = $TimeLabel
@onready var timer: Timer = $Timer

var is_on: bool = false:
	set(v):
		if is_on == v:
			return
		is_on = v
		for i in control:
			i.update(is_on)
		if is_on:
			timer.start()

@export var control: Array[Node2D]

func _physics_process(delta: float) -> void:
	time_label.text = str(int(timer.time_left))

func _on_timer_timeout() -> void:
	is_on = false
