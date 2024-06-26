class_name PickableSpawner
extends Area2D

@onready var platano_resource := preload ("res://pickables/pickable.tscn")
@onready var platano_texture := preload ("res://assets/pickables/0_platano.png")
@onready var armor1_resource := preload ("res://pickables/pickable.tscn")
@onready var armor1_texture := preload ("res://assets/pickables/1_armor.png")
@onready var wigglewand_resource := preload ("res://pickables/pickable.tscn")
@onready var movefast_resource := preload ("res://pickables/pickable.tscn")

func create_pickable(kind: Global.PickableKind) -> Pickable:
	var pickable: Pickable
	match kind:
		Global.PickableKind.PLATANO:
			pickable = platano_resource.instantiate()
			pickable.kind = Global.PickableKind.PLATANO
			pickable.get_node("Sprite2D").texture = platano_texture
		Global.PickableKind.ARMOR1:
			pickable = armor1_resource.instantiate()
			pickable.kind = Global.PickableKind.ARMOR1
			pickable.get_node("Sprite2D").texture = armor1_texture
		Global.PickableKind.WIGGLEWAND:
			pickable = wigglewand_resource.instantiate()
		Global.PickableKind.MOVEFAST:
			pickable = movefast_resource.instantiate()
	pickable.position = self.position + Vector2(randi_range( - 5, 5), randi_range( - 5, 5))
	return pickable
