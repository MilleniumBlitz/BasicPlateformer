extends State

var jump_force = 300

func _start():
	._start()
	entity.animatedSprite.play("jump")
	entity.direction.y -= jump_force

func _physics_process(delta):
	if (entity.direction.y > 0):
		emit_signal("switch_state", "Fall")
	
