extends Node2D

onready var enemi = preload("res://enemi.tscn")
var spawn_timer = 3
var game_runing = false

var game_endend = false

signal game_run
signal game_stop

func _input(event):
	if Input.is_action_just_pressed("play"):
		if game_runing == false && game_endend == false:
			game_runing = true
			$start_txt/start_message.hide()
			emit_signal("game_run")
		if game_runing == false && game_endend == true:
			get_tree().reload_current_scene()

func game_stop():
	emit_signal("game_stop")
	$start_txt/start_message.show()
	game_runing = false
	game_endend = true

func _ready():
	$Timer.start(1)

func _on_Timer_timeout():
	if game_runing == true :
		randomize()
		var spawn_position = int(rand_range(0,3))
		var rand_pos = get_viewport_rect().size.x - rand_range(0,get_viewport_rect().size.x)
		var pos = Vector2()
		if spawn_position == 0 :
			pos = Vector2(rand_pos, 0)
		if spawn_position == 1 :
			pos = Vector2(0, rand_pos)
		if spawn_position == 2 :
			pos = Vector2(get_viewport_rect().size.x, rand_pos)
		if spawn_position == 3 :
			pos = Vector2(rand_pos, get_viewport_rect().size.y)
		
		var spawn = enemi.instance()
		add_child(spawn)
		spawn.position = pos
		var s = rand_range(0.3,0.7)
		spawn.scale = Vector2(s,s)
		$radar_enemi.look_target(spawn.position)
		if spawn_timer >= 1:
			spawn_timer -= 0.5
		$Timer.start(rand_range(spawn_timer,spawn_timer + 0.5))