class_name BlobberCastInput
extends CastInput

@export var actor: Actor
var character: Character
var timer: Timer
var cast_intention := false

func _ready() -> void:
	timer = Timer.new()
	timer.one_shot = false
	timer.wait_time = 2
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

func get_cast_intention() -> bool:
	return cast_intention

func get_cast_direction() -> Vector2:
	character = get_tree().get_first_node_in_group("player")
	if character:
		cast_intention = false
		var direction := character.global_position - actor.global_position
		return direction
	return Vector2.ZERO

func get_cast_switch() -> int:
	return 0

func _on_timer_timeout() -> void:
	cast_intention = true