class_name HealthComponent

extends Node

signal health_depleted

@export var actor: CharacterBody2D

@onready var is_invincible := false
@onready var invincible_timer := $InvincibleTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func reduce_health(amount):
	if !is_invincible:
		actor.stats.health_stats.take_damage(amount)
		if actor.stats.health_stats.health < 1:
			actor.stats.health_stats.set_health(0)
			emit_signal("health_depleted")
			if actor is Enemy:
				Global._on_enemy_health_depleted(actor.position)
			elif actor is Character:
				Events.character_died.emit()
			actor.queue_free()
		if actor is Character:
			is_invincible = true
			invincible_timer.start()


func add_health(amount):
	if actor.stats.health_stats.health + amount < actor.stats.health_stats.max_health:
		actor.stats.health_stats.heal(amount)
	else:
		actor.stats.health_stats.health = actor.stats.health_stats.max_health


func _on_invincible_timer_timeout():
	is_invincible = false

