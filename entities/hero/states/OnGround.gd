extends State

class_name OnGround

func _enter_state():
	entity.double_jump = false

func _handle_input(event):
	if (event.is_action_pressed("jump")):
		emit_signal("switch_state", "Jump")

func _update(_delta):
	if (!entity.is_on_floor()):
		emit_signal("switch_state", "Fall")
