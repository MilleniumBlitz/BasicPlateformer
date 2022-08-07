extends CanvasLayer

func set_velocity(value):
	$Panel/Velocity.text = str(value)

func set_state(value):
	print(value)
	$Panel/State.text = value
