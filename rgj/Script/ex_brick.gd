extends StaticBody2D


var is_on: bool = false:
	set(v):
		if is_on == v:
			return
		is_on = v
		for i in control:
			print(i)
			i.update(is_on)

@export var control: Array[Node2D]
