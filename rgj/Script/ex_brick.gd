extends StaticBody2D

@onready var time_label: Label = $TimeLabel

var is_on: bool = false:
	set(v):
		if is_on == v:
			return
		is_on = v
		for i in control:
			i.update(is_on)

@export var control: Array[Node2D]
