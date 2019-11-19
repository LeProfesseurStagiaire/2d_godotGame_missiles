extends Node2D

func _process(delta):
	$Tween.interpolate_property(self,"position",position,get_global_mouse_position(),0.1,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	$Tween.start()
	rotate(get_angle_to(get_global_mouse_position())*delta*7)

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemi"):
		get_tree().get_current_scene().game_stop()
		self.queue_free()