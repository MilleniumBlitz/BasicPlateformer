extends State

class_name OnAir

func _handle_input(event):
	if (event.is_action_pressed("jump") && !entity.double_jump):
		entity.double_jump = true
		entity.velocity.y = -entity.jump_force
