extends OnAir

func _enter_state():
	._enter_state()
	get_parent().entity.animatedSprite.play("fall")
	
func _update(_delta):
	if (get_parent().entity.is_on_floor()):
		if (entity.direction != 0):
			emit_signal("switch_state", "Run")
		else:
			emit_signal("switch_state", "Idle")

	entity.velocity.x = lerp(entity.velocity.x, entity.MAX_SPEED * entity.direction, 0.5)
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
