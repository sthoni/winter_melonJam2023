extends Charm

var base_damage := 25

func apply_effects(targets: Array[Node2D]) -> void:
	var damage_effect := DamageEffect.new()
	damage_effect.amount = base_damage
	damage_effect.sound = sound
	damage_effect.execute(targets)
