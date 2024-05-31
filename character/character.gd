class_name Character
extends Actor

@onready var wand: Wand = $Wand

func set_stats(value: Stats) -> void:
	stats = value

func cast() -> void:
	wand.request_cast()

# TODO: Schießen in eigene Component packen
func get_input() -> void:
	if Input.is_action_pressed("cast_left") or Input.is_action_pressed("cast_right") or Input.is_action_pressed("cast_up") or Input.is_action_pressed("cast_down"):
		var cast_direction := Input.get_vector("cast_left", "cast_right", "cast_up", "cast_down")
		if cast_direction.x < 0:
			sprite.frame = 1
		elif cast_direction.x > 0:
			sprite.frame = 0
		wand.rotation = cast_direction.angle() + PI / 2
		cast()

func _physics_process(_delta: float) -> void:
	get_input()

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("enemies"):
		health_component.reduce_health(5)