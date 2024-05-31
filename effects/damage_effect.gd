class_name DamageEffect
extends Effect

var amount := 0

func execute(targets: Array[Actor]) -> void:
	for target in targets:
		if not target:
			continue
		if target.has_node("HealthComponent"):
			target.health_component.reduce_health(amount)
