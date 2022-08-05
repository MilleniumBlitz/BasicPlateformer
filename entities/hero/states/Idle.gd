extends OnGround

func _start():
	._start()
	entity.animatedSprite.play("idle")
	
func _physics_process(delta):
	if (get_parent().entity.is_on_floor()):
		if (get_parent().entity.direction.x != 0):
			emit_signal("switch_state", "Run")
