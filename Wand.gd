class_name Wand
extends Marker2D

@onready var Charm = preload("res://charms/charm.tscn")
@onready var charmspeed = 150
@onready var wait = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wait > 10:
		wait = wait - delta
	elif wait > 0:
		shoot()
		wait = 0
	
func request_shoot():
	wait = 5
	
func shoot():
	#charmspeed = (charmspeed + 50) % 300
	var b = Charm.instantiate()
	b.speed = charmspeed
	b.transform = self.transform
	#b.scale = Vector2(1,1)
	owner.add_child(b)
