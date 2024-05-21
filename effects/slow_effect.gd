class_name SlowEffect
extends Effect

var amount := 0


func execute(targets: Array[Node2D]) -> void:
	for target in targets:
		if not target:
			continue
		if target.has_node("MovementComponent"):
			target.get_node("MovementComponent").slow_down(amount)
