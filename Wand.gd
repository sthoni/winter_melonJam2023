class_name Wand
extends Marker2D

@onready var charmspeed = 150
@onready var wait = 0.0
@onready var is_charm_loading = false
var charm_name:String = "DEFAULT"
@onready var charm: Charm = preload("res://charms/plasmaball.tres")
@onready var projectile_scene = preload("res://charms/projectile.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wait > 0.5:
		wait = wait - delta
	elif wait > 0:
		cast()
		wait = 0


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
