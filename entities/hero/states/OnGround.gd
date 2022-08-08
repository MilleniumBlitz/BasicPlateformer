extends State

class_name OnGround

func _enter_state():
	._enter_state()
	entity.double_jump = false
	entity.coyoteTimer = 0
	entity.stickyWallTimer = 0

#func _handle_input(event):
#	if (event.is_action_pressed("jump") && (entity.coyoteTimer < entity.numCoyoteFrames)):
#		emit_signal("switch_state", "Jump")

func _update(_delta):
	if (!entity.is_on_floor()):
		emit_signal("switch_state", "Fall")
