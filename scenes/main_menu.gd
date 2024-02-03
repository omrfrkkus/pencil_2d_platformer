extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")
