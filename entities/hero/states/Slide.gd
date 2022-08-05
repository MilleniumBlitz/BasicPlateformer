extends OnGround

func _start():
	._start()
	entity.animationPlayer.play("slide")

func _physics_process(delta):
	if (entity.direction.x == 0):
		emit_signal("switch_state", "Idle")

func _exit_state():
	entity.animationPlayer.stop()
	entity.normalCollision.disabled = false
	entity.slideCollision.disabled = true
