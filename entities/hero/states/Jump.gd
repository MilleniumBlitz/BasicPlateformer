extends OnAir



func _enter_state():
	._enter_state()
	entity.animatedSprite.play("jump")
	entity.velocity.y -= entity.jump_force

func _update(_delta):

	entity.velocity.x = lerp(entity.velocity.x, entity.MAX_SPEED * entity.direction, 0.15)
	entity.velocity.y += entity.gravity
	entity.velocity = entity.move_and_slide(entity.velocity, Vector2.UP)
	
	if (entity.velocity.y > 0):
		emit_signal("switch_state", "Fall")
