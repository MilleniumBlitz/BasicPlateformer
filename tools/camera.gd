extends Camera2D

export(NodePath) var node_path
onready var entityToFollow := get_node(node_path)

func _physics_process(_delta):
	global_position = entityToFollow.global_position
