class_name Wand
extends Marker2D

@onready var wait = 0.0
@onready var is_charm_loading = false
@onready var charm_book: CharmBook = preload("res://charms/player_charm_book.tres")
@onready var projectile_scene = preload("res://charms/projectile.tscn")

var charm: Charm

# Hack um durch die Charms zu switchen
var charm_index := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	charm = charm_book.charms[charm_index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wait > 0.5:
		wait = wait - delta
	elif wait > 0:
		cast()
		wait = 0

# Mit Q und E durch Charms switchen
func _input(event):
	if event.is_action_pressed("charm_switch_right"):
		if charm_index < charm_book.charms.size() - 1:
			charm_index += 1
		else:
			charm_index = 0
		charm = charm_book.charms[charm_index]
	if event.is_action_pressed("charm_switch_left"):
		if charm_index > 0:
			charm_index -= 1
		else:
			charm_index = charm_book.charms.size() - 1
		charm = charm_book.charms[charm_index]

func request_cast():
	if is_charm_loading:
		return
	prepare_cast()


func prepare_cast():
	is_charm_loading = true
	wait = charm.cast_time
	$spell.set_stream(charm.sound)
	$spell.playing = true


func cast():
	if charm.type == Charm.Type.PROJECTILE:
		var projectile = projectile_scene.instantiate() as Projectile
		owner.owner.add_child(projectile)
		projectile.charm = charm
		projectile.transform = global_transform
		is_charm_loading = false
	else:
		charm.cast()
