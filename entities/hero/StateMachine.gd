extends Node

class_name StateMachine

var entity : KinematicBody2D

onready var current_state : State
var old_state : String

signal state_changed

func start(value):
	entity = value
	
	for child in get_children():
		child.entity = entity
		child.connect("switch_state", self, "switch_state")
		child.connect("exit_state", self, "exit_state")
	
	current_state = get_node("Idle")
	
func switch_state(new_state):
	if (current_state.name != new_state):
		emit_signal("state_changed", new_state)
		old_state = current_state.name
		current_state._exit_state()
		current_state = get_node(new_state)
		current_state._enter_state()

func exit_state():
	switch_state(old_state)
#	current_state._exit_state()
#	current_state = get_node(old_state)
#	current_state._enter_state()

func _input(event):
	current_state._handle_input(event)

func _physics_process(delta):
	current_state._update(delta)
