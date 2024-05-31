class_name Enemy
extends Actor

func set_stats(value: Stats) -> void:
	stats = value.create_instance()
	if not sprite:
		await ready
	sprite.texture = stats.sprite
