extends CharacterBody2D

const SPEED = 70.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var move_direction : Vector2 = Vector2.LEFT

@export var transitioner : Transitioner
# Sınırlar
@export var left_limit : float
@export var right_limit : float

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = move_direction.x * SPEED

	# Sınırların kontrolü
	if position.x <= left_limit and move_direction == Vector2.LEFT:
		move_direction = Vector2.RIGHT
	elif position.x >= right_limit and move_direction == Vector2.RIGHT:
		move_direction = Vector2.LEFT

	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		print("Düşmanla temas edildi. Yeniden yükleniyor...")
		get_tree().paused = true
		transitioner.set_reload_animation(true)
