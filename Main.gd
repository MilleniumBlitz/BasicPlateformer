extends Node2D

func _ready():
	connect_HUD_signals()

func _input(event):
	if (event.is_action_pressed("jump")):
		var scene = load("res://Dot.tscn")
		var instance := scene.instance() as Node2D
		instance.global_position = $Hero.global_position
		add_child(instance)
	
func connect_HUD_signals():
	$Hero.connect("velocity_changed", $HUD, "set_velocity")
	$Hero/States.connect("state_changed", $HUD, "set_state")
