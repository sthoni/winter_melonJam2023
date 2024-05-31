extends Charm

var base_damage := 15

func apply_effects(targets: Array[Actor]) -> void:
	var damage_effect := DamageEffect.new()
	damage_effect.amount = base_damage
	damage_effect.sound = sound
	damage_effect.execute(targets)
