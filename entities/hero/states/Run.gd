extends OnGround

func _enter_state():
	._enter_state()
	entity.animatedSprite.play("run")

func _handle_input(event):
	._handle_input(event)
	if (event.is_action_pressed("slide")):
		emit_signal("switch_state", "Slide")

func _update(_delta):
	._update(_delta)
	if (entity.direction == 0 || entity.is_next_to_wall()):
		emit_signal("switch_state", "Idle")
	
	entity.velocity.x = lerp(entity.velocity.x, entity.MAX_SPEED * entity.direction, 0.2)
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
	
	
