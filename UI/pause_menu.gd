extends Control

@export var game_manager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toogle_game_paused)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_game_manager_toogle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()


func _on_resume_button_pressed():
	game_manager.game_paused = false
