extends Area2D
class_name Pickable


@onready var kind: Global.PickableKind = Global.PickableKind.PLATANO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
	
func _on_pickable_picked_up():
	queue_free()


func _on_pick_up_area_body_entered(body):
	match self.kind:
		Global.PickableKind.PLATANO:
			if body is Enemy:
				body.get_node("EnemyMovementVelocityKi").movement_stats.max_speed = 10.0
			if body.name is Character:
				body.get_node("PlayerMovementVelocityInput").movement_stats.max_speed = 50.0
		Global.PickableKind.ARMOR1:
			if body.name == "Enemy":
				body.get_node("HealthComponent").current_health  += 10.0
			if body.name == "Character":
				body.get_node("HealthComponent").current_health  += 50.0
	_on_pickable_picked_up()
