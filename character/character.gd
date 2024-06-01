class_name Character
extends Actor

func set_stats(value: Stats) -> void:
	stats = value

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("enemies"):
		health_component.reduce_health(5)