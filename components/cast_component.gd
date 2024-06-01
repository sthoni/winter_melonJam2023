class_name Wand
extends Marker2D

@export var actor: Character
@export var cast_input: CastInput

@onready var wait := 0.0
@onready var is_charm_loading := false
@onready var projectile_scene: PackedScene = preload ("res://charms/projectile.tscn")
@onready var cast_timer: Timer = $CastTimer

var charm_casting: Charm

# Hack um durch die Charms zu switchen
var charm_index := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cast_timer.stop()

# Mit Q und E durch Charms switchen
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("charm_switch_right"):
		if charm_index < actor.stats.charm_book.charms.size() - 1:
			charm_index += 1
		else:
			charm_index = 0
		actor.stats.charm_book.charm_selected = actor.stats.charm_book.charms[charm_index]
	if event.is_action_pressed("charm_switch_left"):
		if charm_index > 0:
			charm_index -= 1
		else:
			charm_index = actor.stats.charm_book.charms.size() - 1
		actor.stats.charm_book.charm_selected = actor.stats.charm_book.charms[charm_index]

func _physics_process(_delta: float) -> void:
	if cast_input.get_cast_intention():
		var cast_direction := cast_input.get_cast_direction()
		if cast_direction.x < 0:
			actor.sprite.frame = 1
		elif cast_direction.x > 0:
			actor.sprite.frame = 0
		rotation = cast_direction.angle() + PI / 2
		request_cast()

func request_cast() -> void:
	if cast_timer.is_stopped():
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
			owner.owner.add_child(projectile)
			projectile.charm = charm_casting
			projectile.transform = global_transform
			is_charm_loading = false
		else:
			charm_casting.cast()
