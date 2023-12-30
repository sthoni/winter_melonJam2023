class_name Wand
extends Marker2D

@onready var charmspeed = 150
@onready var wait = 0
@onready var is_charm_loading = false
@onready var charm_type:wand_class
var charm_name:String = "DEFAULT"
# Called when the node enters the scene tree for the first time.


func _ready():
	charm_type = wand_class.new()
	#self.connect("two_kills", change_to_red)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wait > 1:
		wait = wait - delta
	elif wait > 0:
		shoot()
		wait = 0
			
func request_shoot(cn):
	charm_name = cn
	if not is_charm_loading:
		prepare_shoot()
		is_charm_loading = true
	
func prepare_shoot():
	if charm_name == "DEFAULT":
		charm_type.default()
	elif charm_name == "RED":
		charm_type.red()
	wait = charm_type.wait_time+1
	$spell.set_stream(charm_type.selected_spell)
	$spell.playing = true
	
func shoot():		
	charm_type.apply()
	charm_type.charm_inst.transform = global_transform
	owner.owner.add_child(charm_type.charm_inst)
	owner.owner.get_node("Charm/soundeffect").playing = true
	is_charm_loading = false
	
class wand_class:
	var Charm_Scene = preload("res://charms/charm.tscn")
	var wait_time = 1
	var speed = 50
	var selected_sprite = load("res://assets/charms/0_default.png")
	var selected_spell = load("res://assets/charms/default_spell.wav")
	var selected_sound = load("res://assets/charms/default_soundeffect.wav")
	var charm_inst
	
	func _init():
		pass
		
	func default():
		wait_time = 4
		speed = 50
		selected_sprite = load("res://assets/charms/0_default.png")
		selected_spell = load("res://assets/charms/default_spell.wav")
		selected_sound = load("res://assets/charms/default_soundeffect.wav")
		
	func red():
		wait_time = 1.5
		speed = 100
		selected_sprite = load("res://assets/charms/1_red.png")
		selected_spell = load("res://assets/charms/red_spell.wav")
		selected_sound = load("res://assets/charms/red_soundeffect.wav")

	func apply():
		charm_inst = Charm_Scene.instantiate()
		charm_inst.set_texture(selected_sprite)
		charm_inst.set_sound(selected_sound)
		charm_inst.speed = speed
		
