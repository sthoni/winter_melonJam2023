class_name Pickable
extends Area2D

@onready var kind: Global.PickableKind = Global.PickableKind.PLATANO
@onready var sprite: Sprite2D = $Sprite2D
	
func _on_pickable_picked_up() -> void:
	queue_free()

func _on_pick_up_area_body_entered(body: Actor) -> void:
	match self.kind:
		Global.PickableKind.PLATANO:
			if body is Enemy:
				body.stats.movement_stats.slow_down(10)
			if body is Character:
				body.stats.movement_stats.slow_down(10)
		Global.PickableKind.ARMOR1:
			if body is Enemy:
				body.stats.health_stats.heal(1)
			if body is Character:
				body.stats.health_stats.heal(5)
	_on_pickable_picked_up()
