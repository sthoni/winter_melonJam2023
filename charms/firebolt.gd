extends Charm

var base_damage := 5

func apply_effects(targets: Array[Node]) -> void:
	var damage_effect := DamageEffect.new()
	damage_effect.amount = base_damage
	damage_effect.sound = sound
	damage_effect.execute(targets)
