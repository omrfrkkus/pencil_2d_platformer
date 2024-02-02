extends Node

class_name GameManager

@onready var points_label = %"Points Label"

signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)

var points = 0

func add_point():
	points +=1
	print(points)
	points_label.text = "Points : " + str(points)

func _input(event: InputEvent):
	if(event.is_action_pressed("cancel")):
		game_paused = !game_paused
