extends State

class_name OnGround

func _input(event):
	if (event.is_action_pressed("jump")):
		emit_signal("switch_state", "Jump")
