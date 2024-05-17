extends Node
class_name EnemyMovementController

@export var SPEED: float = 50.0
@onready var current_speed = SPEED
var player: Character

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func calculate_movement(self_position) -> Vector2:
	var direction = player.global_position - self_position
	var new_velocity = direction.normalized() * current_speed
	return new_velocity
