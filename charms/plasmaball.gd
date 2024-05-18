extends Charm

var base_damage := 3

func apply_effects(targets: Array[Node2D]) -> void:
	var damage_effect := DamageEffect.new()
	damage_effect.amount = base_damage
	damage_effect.sound = sound
	damage_effect.execute(targets)
