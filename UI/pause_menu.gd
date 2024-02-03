extends Control

@export var game_manager : GameManager
@export var transitioner : Transitioner

func _ready():
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toogle_game_paused)

func _on_game_manager_toogle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()

func _on_resume_button_pressed():
	game_manager.game_paused = false

func _on_restart_button_pressed():
	hide()
	transitioner.set_reload_animation(true)

func _on_close_button_pressed():
	hide()
	transitioner.set_exit_animation(true)

func _on_sound_button_pressed():
	pass
