extends Node2D

func _ready():
	connect_HUD_signals()
	
func connect_HUD_signals():
	$Hero.connect("velocity_changed", $HUD, "set_velocity")
	$Hero/States.connect("state_changed", $HUD, "set_state")
