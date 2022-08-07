extends OnGround

func _enter_state():
	._enter_state()
	entity.animatedSprite.play("crouch")
	
func _input(event):
	._input(event)
	if (event.is_action_released("ui_down")):
		emit_signal("switch_state", "Idle")
	
func _update(_delta):
	if (!get_parent().entity.is_on_floor()):
		emit_signal("switch_state", "Fall")
	
	if (get_parent().entity.is_on_floor()):
		if (get_parent().entity.direction != 0):
			emit_signal("switch_state", "Idle")
	
	entity.velocity.x = lerp(entity.velocity.x, 0, 0.5)
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
	
	
