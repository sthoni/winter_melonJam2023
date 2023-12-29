extends Area2D

var player: Character	
@export var SPEED: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	look_at(player.global_position)
	var direction = player.global_position - self.position
	self.position += direction.normalized() * SPEED
