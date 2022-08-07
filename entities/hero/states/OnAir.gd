extends State

class_name OnAir

func _handle_input(event):
	return
	if (event.is_action_pressed("jump") && !entity.double_jump):
		entity.double_jump = true
		entity.velocity.y = -entity.jump_force

func _update(_delta):
	entity.coyoteTimer += 1
