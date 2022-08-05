extends State

func _start():
	._start()
	get_parent().entity.animatedSprite.play("fall")

func _physics_process(delta):
	if (get_parent().entity.is_on_floor()):
		emit_signal("switch_state", "Idle")
