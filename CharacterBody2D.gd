extends CharacterBody2D
class_name Character

@export var speed = 400 # speed in pixels/sec
@export var rotation_speed = 1.5
@onready var charmname = "DEFAULT"
var target = Vector2.ZERO
var rotation_direction = 0
var enchanted = false
var enchant = false
const STANDARD_ROT_SPEED = 0.1

@onready var wand := $Wand
@onready var health_component := $HealthComponent
@onready var level := $"../"

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func magicspell():
	if enchanted:
		return -1
	return 1

func rot_speed():
	var rots = STANDARD_ROT_SPEED * magicspell()
	return rots

func shoot():
	if Global.number_killed_enemies > 0:
		charmname = "RED"
	wand.request_shoot(charmname)
	
func get_input():
	#rotation_direction = Input.get_axis("left", "right")
	#velocity = transform.x * Input.get_axis("down", "up") * speed
	#target = get_global_mouse_position()
	target = Input.get_axis("ui_turn_left", "ui_turn_right")
	enchanted = Input.is_action_pressed("ui_enchant")
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed    
	if Input.is_action_just_pressed("ui_shoot"):
		shoot()

func _physics_process(delta):
	get_input()
	rotation += target * rot_speed()
	move_and_slide()
	
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()


func _on_health_component_health_depleted():
	level.pauseMenu(true)
	#get_tree().change_scene_to_packed(Level)
	#get_tree().paused = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("mobs"):
		health_component.reduce_health(200)
