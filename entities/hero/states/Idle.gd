extends OnGround

func _enter_state():
	._enter_state()
	entity.animatedSprite.play("idle")
	
func _input(event):
	._input(event)
	if (event.is_action_pressed("ui_down")):
		emit_signal("switch_state", "Crouch")
	
func _update(_delta):
	if (!entity.is_on_floor()):
		emit_signal("switch_state", "Fall")
	else:
		if (entity.direction != 0 && !entity.is_next_to_wall()):
			emit_signal("switch_state", "Run")
	
	entity.velocity.x = lerp(entity.velocity.x, 0, 0.1)
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
