class_name Pickable
extends Area2D

@onready var kind: Global.PickableKind = Global.PickableKind.PLATANO
	
func _on_pickable_picked_up():
	queue_free()

func _on_pick_up_area_body_entered(body):
	match self.kind:
		Global.PickableKind.PLATANO:
			if body is Enemy:
				body.stats.movement_stats.slow_down(50)
			if body is Character:
				body.stats.movement_stats.slow_down(50)
		Global.PickableKind.ARMOR1:
			if body is Enemy:
				body.stats.health_stats.heal(10)
			if body is Character:
				body.stats.health_stats.heal(50)
	_on_pickable_picked_up()
