extends Node2D

var time = 0
var can_count = false

func _ready():
	$hight_score.text = str("best :" + str(global.best_score))
	$Label.text = str(0)
	get_tree().get_current_scene().connect("game_run",self,"start")
	get_tree().get_current_scene().connect("game_stop",self,"stop")
	
func _on_time_timeout():
	if can_count == true:
		time += 1
		$Label.text = str(time)
		$time.start(1)

func start():
	$time.start(1)
	can_count = true
	$AnimationPlayer.play("timer")

func stop():
	can_count = false
	if time > global.best_score:
		global.best_score = time
		$hight_score.text = str("best :" + str(global.best_score))