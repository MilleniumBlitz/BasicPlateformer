extends Node

class_name State

var enabled = false setget setEnabled
var entity

signal switch_state(new_state)

func _ready():
	setEnabled(false)

func _start():
	entity = get_parent().entity

func _exit_state():
	pass

func setEnabled(value):
	set_process_input(value)
	set_physics_process(value)
	enabled = value
	if (enabled):
		_start()
