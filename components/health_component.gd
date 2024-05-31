class_name HealthComponent
extends Node

@export var actor: Actor

@onready var is_invincible := false
@onready var invincible_timer: Timer = $InvincibleTimer

func reduce_health(amount: int) -> void:
	if !is_invincible:
		actor.stats.health_stats.take_damage(amount)
		if actor.stats.health_stats.health < 1:
			actor.stats.health_stats.set_health(0)
			if actor is Enemy:
				Events.enemy_died.emit(actor)
			elif actor is Character:
				Events.character_died.emit()
			actor.queue_free()
		if actor is Character:
			is_invincible = true
			invincible_timer.start()

func add_health(amount: int) -> void:
	if actor.stats.health_stats.health + amount < actor.stats.health_stats.max_health:
		actor.stats.health_stats.heal(amount)
	else:
		actor.stats.health_stats.health = actor.stats.health_stats.max_health

func _on_invincible_timer_timeout() -> void:
	is_invincible = false
