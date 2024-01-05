extends CanvasLayer

signal game_start

onready var start_message = $StartMenu/StartMessage
onready var tween = $Tween

var game_started = false

func _input(event):
	if event.is_action_pressed("fly") && !game_started:
		emit_signal("game_start")
		tween.interpolate_property(start_message, "modulate:a", 1, 0, 0.5)
		tween.start()
		game_started = true
