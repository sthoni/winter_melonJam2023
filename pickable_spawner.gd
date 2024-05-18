extends Node
class_name PickableSpawner

@onready var platano_resource = preload("res://pickables/pickable.tscn")
@onready var platano_texture = preload("res://assets/pickables/0_platano.png")
@onready var armor1_resource = preload("res://pickables/pickable.tscn")
@onready var armor1_texture = preload("res://assets/pickables/1_armor.png")
@onready var wigglewand_resource = preload("res://pickables/pickable.tscn")
@onready var movefast_resource = preload("res://pickables/pickable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func create_pickable(type: Global.PickableType) -> Pickable:
	var pickable: Pickable
	print(type)
	match type:
		Global.PickableType.PLATANO:
			pickable = platano_resource.instantiate()
			pickable.get_node("Sprite2D").texture = platano_texture			
		Global.PickableType.ARMOR1:
			pickable = armor1_resource.instantiate()
			pickable.get_node("Sprite2D").texture = armor1_texture
		Global.PickableType.WIGGLEWAND:
			pickable = wigglewand_resource.instantiate()
		Global.PickableType.MOVEFAST:
			pickable = movefast_resource.instantiate()
	pickable.position = self.position + Vector2(randi_range(-5, 5), randi_range(-5, 5))
	return pickable
