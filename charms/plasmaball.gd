extends Charm

var base_damage := 2
var slow_amount := 50

func apply_effects(targets: Array[Actor]) -> void:
	var damage_effect: DamageEffect = DamageEffect.new()
	damage_effect.amount = base_damage
	damage_effect.sound = sound
	damage_effect.execute(targets)
	var slow_effect: SlowEffect = SlowEffect.new()
	slow_effect.amount = slow_amount
	slow_effect.sound = sound
	slow_effect.execute(targets)
