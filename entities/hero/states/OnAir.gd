extends State

class_name OnAir

func _handle_input(event):
	if event.is_action_pressed("jump") && entity.is_next_to_wall() && entity.stickyWallTimer < entity.stickyWallFrames:
			entity.velocity.y = -entity.jump_force
			print("oui")
	return
	if (event.is_action_pressed("jump") && !entity.double_jump):
		entity.double_jump = true
		entity.velocity.y = -entity.jump_force

func _update(_delta):
	entity.coyoteTimer += 1
	if (entity.is_next_to_wall() && !entity.is_on_floor()):
		entity.stickyWallTimer += 1		
