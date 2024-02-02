extends Area2D

@export var target_level : PackedScene
@export var transitioner : Transitioner

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		transitioner.set_next_animation(true)
		#get_tree().change_scene_to_packed(target_level)
