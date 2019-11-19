extends Node2D

var color_trans = 0

func _ready():
	modulate = Color(1, 1, 1, 0)

func _process(delta):
	if color_trans > 0 :
		modulate = Color(1, 1, 1, color_trans)
		color_trans -= 2 * delta
	else:
		set_process(false)

func look_target(tar):
	look_at(tar)
	color_trans = 1
	set_process(true)