class_name MovementComponent
extends Node

@export var actor: Actor
@export var min_slide_angle: float = 0.0
@export var step_sound: AudioStream

@onready var step_timer: Timer = $StepTimer
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

var step_playing: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actor.wall_min_slide_angle = min_slide_angle
	actor.motion_mode = actor.MOTION_MODE_GROUNDED
	audio_player.stream = step_sound

func _physics_process(_delta: float) -> void:
	@warning_ignore("return_value_discarded")
	actor.move_and_slide()
	if actor.velocity.x < 0:
		actor.sprite.frame = 1
	elif actor.velocity.x > 0:
		actor.sprite.frame = 0
	if !step_playing&&step_timer.is_stopped():
		audio_player.play()
		step_playing = true
		step_timer.wait_time = 30.0 / actor.velocity.length()
		step_timer.start()

func slow_down(amount: int) -> void:
	actor.stats.movement_stats.slow_down(amount)

func _on_audio_stream_player_finished() -> void:
	step_playing = false
