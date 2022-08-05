extends OnGround

func _start():
	._start()
	entity.animatedSprite.play("run")

func _input(event):
	if (event.is_action_pressed("slide")):
		emit_signal("switch_state", "Slide")

func _physics_process(delta):
	if (entity.direction.x == 0):
		emit_signal("switch_state", "Idle")
