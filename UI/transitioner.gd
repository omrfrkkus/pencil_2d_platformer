extends Control

class_name  Transitioner

@export var scene_switch_anim : String = "fade_out"
@export var scene_to_load : PackedScene

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer

var is_reload : bool = false
var is_exit : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false


func set_next_animation(fading_out : bool):
	get_tree().paused = true
	if(fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")
		
func set_reload_animation(fading_out : bool):
	get_tree().paused = true
	is_reload = true
	if(fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")
		
func set_exit_animation(fading_out : bool):
	get_tree().paused = true
	is_exit = true
	if(fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")


func _on_animation_player_animation_finished(anim_name):
	get_tree().paused = false
	if(is_reload):
		get_tree().reload_current_scene()
	elif(is_exit):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	elif(scene_to_load != null && anim_name == scene_switch_anim):
		get_tree().change_scene_to_packed(scene_to_load)
