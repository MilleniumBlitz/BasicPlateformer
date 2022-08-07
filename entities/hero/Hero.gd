extends KinematicBody2D

onready var animatedSprite := $AnimatedSprite
onready var animationPlayer := $AnimationPlayer

onready var stateMachine := $States

onready var normalCollision : CollisionShape2D = $NormalCollision
onready var slideCollision : CollisionShape2D = $SlideCollision

signal velocity_changed

const MAX_SPEED = 150

var gravity = 10

var direction = Vector2.RIGHT.x
var velocity := Vector2() setget set_velocity
var look_at = 1

var jump_force = 300
var double_jump = false
var coyoteTimer = 0
var numCoyoteFrames = 6

var rotation_enabled = true

func set_velocity(value):
	velocity = value
	emit_signal("velocity_changed", value)

func _ready():
	stateMachine.start(self)
	
func _process(_delta):
	direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if (direction != 0):
		look_at = direction
			
	if (rotation_enabled):
		if (look_at == -1):
			$WallRaycast.cast_to.x = -10
			animatedSprite.flip_h = true
		else:
			$WallRaycast.cast_to.x = 10
			animatedSprite.flip_h = false
		
func set_rotation_locked(value):
	rotation_enabled = !value
		
func is_slide_ceilling_touching():
	return ($LeftSlideCeillingRayCast.is_colliding() || $RightSlideCeillingRayCast.is_colliding())

func is_next_to_wall():
	return $WallRaycast.is_colliding()

