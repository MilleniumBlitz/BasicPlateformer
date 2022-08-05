extends Node

class_name StateMachine

var entity : KinematicBody2D

onready var current_state : State = $Idle

func _ready():
	for child in get_children():
		child.connect("switch_state", self, "switch_state")
	
func start(value):
	entity = value
	current_state.setEnabled(true)

func switch_state(new_state):
	if (current_state.name != new_state):
		print(new_state)
		current_state.enabled = false
		current_state._exit_state()
		current_state = get_node(new_state)
		current_state.enabled = true
