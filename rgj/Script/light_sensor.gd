extends Area2D
class_name LightSensor

var is_on: bool = false:
	set(v):
		if is_on == v:
			return
		is_on = v
		for i in control:
			i.update(is_on)

@export var control: Array[Node2D]

var ray = []

func _on_area_entered(area: Area2D) -> void:
	ray.append(area)
	if ray.is_empty():
		is_on = false
	else:
		is_on = true

func _on_area_exited(area: Area2D) -> void:
	ray.erase(area)
	if ray.is_empty():
		is_on = false
	else:
		is_on = true
