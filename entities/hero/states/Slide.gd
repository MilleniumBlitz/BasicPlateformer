extends OnGround

const MIN_SLIDE_SPEED = 70

var direction

func _enter_state():
	._enter_state()
	entity.animationPlayer.play("slide")
	entity.set_rotation_locked(true)
	direction = entity.direction

func _update(_delta):
	
	if (!entity.is_on_floor()):
		emit_signal("switch_state", "Fall")
	
	if ((entity.direction == 0 || entity.direction != direction) && !entity.is_slide_ceilling_touching()):
		emit_signal("switch_state", "Idle")

	if (abs(entity.velocity.x) <= abs(MIN_SLIDE_SPEED)):
		emit_signal("switch_state", "Run")

	# If the player is under ceilling, keep the same speed
	if (!entity.is_slide_ceilling_touching()):
		entity.velocity.x = lerp(entity.velocity.x, 0, 0.01)
		
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
	
func _exit_state():
	._exit_state()
	entity.set_rotation_locked(false)
	entity.animationPlayer.stop()
	entity.normalCollision.disabled = false
	entity.slideCollision.disabled = true
