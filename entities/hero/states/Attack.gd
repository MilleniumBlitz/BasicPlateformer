extends State

func _enter_state():
	._enter_state()
	entity.animatedSprite.play("attack")
	entity.animatedSprite.connect("animation_finished", self, "attack_finished", [], CONNECT_ONESHOT)
	
func attack_finished():
	emit_signal("exit_state")
