extends RigidBody2D

signal died

class_name Player

@export var FLY_FORCE = -200
const MAX_ROTATION_DEGREES = -30.0
@onready var animator = $AnimationPlayer
@onready var hit = $Hit
@onready var wing = $Wing

var started = false
var alive = true

func _physics_process(delta):
	if Input.is_action_just_pressed("fly") && alive:
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
	wing.play()
	
func die():
	if !alive: return
	alive = false
	animator.stop()
	hit.play()
	emit_signal("died")
