extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/level_selector.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/settings_menu.tscn")
