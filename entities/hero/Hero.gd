extends KinematicBody2D

onready var animatedSprite := $AnimatedSprite
onready var animationPlayer := $AnimationPlayer

onready var stateMachine := $States

onready var normalCollision : CollisionShape2D = $NormalCollision
onready var slideCollision : CollisionShape2D = $SlideCollision

var gravity = 10

var direction := Vector2()
var look_at = 1
var speed = 100

func _ready():
	stateMachine.start(self)
	
func _process(delta):
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if (direction.x != 0):
		look_at = direction.x
			
	if (look_at == -1):
		animatedSprite.flip_h = true
	else:
		animatedSprite.flip_h = false

func _physics_process(delta):
	direction.x *= speed
	direction.y += gravity
	direction = move_and_slide(direction, Vector2.UP)
