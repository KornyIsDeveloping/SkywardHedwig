extends CanvasLayer

signal game_start

@onready var start_message = $StartMenu/StartMessage
@onready var tween = $Tween
@onready var score_label = $GameOverMenu/VBoxContainer/ScoreLabel
@onready var high_score_label = $GameOverMenu/VBoxContainer/HighScoreLabel
@onready var game_over_menu = $GameOverMenu

var game_started = false

func _input(event):
	if event.is_action_pressed("fly") && !game_started:
		emit_signal("game_start")
		tween.interpolate_property(start_message, "modulate:a", 1, 0, 0.5)
		tween.start()
		game_started = true

func init_game_over_menu(score, highscore):
	score_label.text = "SCORE:" + str(score)
	high_score_label.text = "BEST:" + str(highscore)
	game_over_menu.visible = true

func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
