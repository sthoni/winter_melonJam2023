extends CharacterBody2D
class_name Character

@export var speed: float = 150 # speed in pixels/sec
@export var step_sound: AudioStream

@onready var step_timer: Timer = $StepTimer
@onready var wand := $Wand
@onready var health_component := $HealthComponent
@onready var level := $"../"
@onready var sprite := $Sprite2D

func _ready():
	pass

func cast():
	wand.request_cast()

# TODO: Schießen in eigene Component packen
func get_input():
	var input_direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction.x < 0:
		sprite.frame = 1
	elif input_direction.x > 0:
		sprite.frame = 0
	velocity = input_direction * speed
	if velocity != Vector2.ZERO && step_timer.is_stopped():
		step_timer.wait_time = 60.0/speed
		step_timer.start()
		SfxPlayer.play(step_sound)
	if Input.is_action_pressed("cast_left") or Input.is_action_pressed("cast_right") or Input.is_action_pressed("cast_up") or Input.is_action_pressed("cast_down"):
		var cast_direction := Input.get_vector("cast_left", "cast_right", "cast_up","cast_down")
		if cast_direction.x < 0:
			sprite.frame = 1
		elif cast_direction.x > 0:
			sprite.frame = 0
		wand.rotation = cast_direction.angle() + PI/2
		cast()

func _physics_process(_delta):
	get_input()
	move_and_slide()


func _on_health_component_health_depleted():
	level.pauseMenu(true)


func _on_area_2d_body_entered(body):
	if body.is_in_group("mobs"):
		health_component.reduce_health(200)
