extends RigidBody2D

export var FLY_FORCE = -200
onready var animator = $AnimationPlayer
var started = false

func _physics_process(delta):
	if Input.is_action_just_pressed("fly"):
		if !started:
			start()
		fly()
		
func start():
	if started: return
	started = true
	gravity_scale = 5.0
	animator.play("owlFly")


func fly():
	linear_velocity.y = FLY_FORCE
