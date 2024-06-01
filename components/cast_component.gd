class_name CastComponent
extends Marker2D

@export var actor: Actor
@export var cast_input: CastInput

@onready var wait := 0.0
@onready var is_charm_loading := false
@onready var projectile_scene: PackedScene = preload ("res://charms/projectile.tscn")
@onready var cast_timer: Timer = $CastTimer

var charm_casting: Charm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cast_timer.stop()

func _physics_process(_delta: float) -> void:
	if cast_input.get_cast_intention():
		var cast_direction := cast_input.get_cast_direction()
		rotation = cast_direction.angle() + PI / 2
		request_cast()
	if cast_input.get_cast_switch() != 0:
		actor.stats.charm_book.select_next_charm(cast_input.get_cast_switch())

func request_cast() -> void:
	if cast_timer.is_stopped() and actor.stats.charm_book.charms.size() > 0:
		prepare_cast()

func prepare_cast() -> void:
	charm_casting = actor.stats.charm_book.charm_selected
	cast_timer.wait_time = charm_casting.cast_time
	cast_timer.start()
	SfxPlayer.play(charm_casting.sound)

func cast() -> void:
	if charm_casting:
		if charm_casting.type == Charm.Type.PROJECTILE:
			var projectile: Projectile = projectile_scene.instantiate()
			projectile.caster = actor
			var level := get_tree().get_first_node_in_group("level") as Level
			level.add_child(projectile)
			projectile.charm = charm_casting
			projectile.transform = global_transform
			if rotation > PI:
				actor.sprite.frame = 1
			elif rotation < PI:
				actor.sprite.frame = 0
			is_charm_loading = false
		else:
			charm_casting.cast()
