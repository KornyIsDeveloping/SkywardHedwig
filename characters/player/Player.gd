extends RigidBody2D

export var FLY_FORCE = -200
const MAX_ROTATION_DEGREES = -30.0
onready var animator = $AnimationPlayer
var started = false

func _physics_process(delta):
	if Input.is_action_just_pressed("fly"):
		if !started:
			start()
		fly()
		
	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES
		
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			angular_velocity = 3
		else:
			angular_velocity = 0
		
func start():
	if started: return
	started = true
	gravity_scale = 5.0
	animator.play("owlFly")


func fly():
	linear_velocity.y = FLY_FORCE
	angular_velocity = -8.0
