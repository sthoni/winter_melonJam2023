class_name SlowEffect
extends Effect

var amount := 0

func execute(targets: Array[Actor]) -> void:
	for target in targets:
		if not target:
			continue
		if target.has_node("MovementComponent"):
			target.movement_component.slow_down(amount)
