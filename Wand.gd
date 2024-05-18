class_name Wand
extends Marker2D

@onready var wait = 0.0
@onready var is_charm_loading = false
@onready var charm_book: CharmBook = preload("res://charms/player_charm_book.tres")
@onready var projectile_scene = preload("res://charms/projectile.tscn")
@onready var cast_timer: Timer = $CastTimer

var charm_selected: Charm
var charm_casting: Charm

# Hack um durch die Charms zu switchen
var charm_index := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	charm_selected = charm_book.charms[charm_index]
	cast_timer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Mit Q und E durch Charms switchen
func _input(event):
	if event.is_action_pressed("charm_switch_right"):
		if charm_index < charm_book.charms.size() - 1:
			charm_index += 1
		else:
			charm_index = 0
		charm_selected = charm_book.charms[charm_index]
	if event.is_action_pressed("charm_switch_left"):
		if charm_index > 0:
			charm_index -= 1
		else:
			charm_index = charm_book.charms.size() - 1
		charm_selected = charm_book.charms[charm_index]

func request_cast():
	if cast_timer.is_stopped():
		prepare_cast()


func prepare_cast():
	charm_casting = charm_selected
	cast_timer.wait_time = charm_casting.cast_time
	cast_timer.start()
	SfxPlayer.play(charm_casting.sound)


func cast():
	if charm_casting:
		if charm_casting.type == Charm.Type.PROJECTILE:
			var projectile = projectile_scene.instantiate() as Projectile
			owner.owner.add_child(projectile)
			projectile.charm = charm_casting
			projectile.transform = global_transform
			is_charm_loading = false
		else:
			charm_casting.cast()
