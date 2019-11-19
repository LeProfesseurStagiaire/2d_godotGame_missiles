extends Node2D

var motion = Vector2(0,0)
var rand_rot = rand_range(2,5)
var speed = rand_range(3,10)

func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	self.rotate(get_angle_to(get_global_mouse_position())*delta * rand_rot )
	var movedir = Vector2(speed,0).rotated(rotation)
	motion = motion.linear_interpolate(movedir,1)
	position += motion * 100 * delta

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemi"):
		self.queue_free()
