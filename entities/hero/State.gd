extends Node

class_name State

var entity

signal switch_state(new_state)

func _ready():
	set_process_input(false)

func _enter_state():
	set_process_input(true)
	pass

func _update(_delta):
	pass

func _exit_state():
	set_process_input(false)
	pass
