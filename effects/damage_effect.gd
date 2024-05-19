class_name DamageEffect
extends Effect

var amount := 0


func execute(targets: Array[Node2D]) -> void:
	for target in targets:
		if not target:
			continue
		if target.has_node("HealthComponent"):
			target.get_node("HealthComponent").reduce_health(amount)
