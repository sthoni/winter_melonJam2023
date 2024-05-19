extends CharacterBody2D
class_name Pickable

var kind: Global.PickableKind

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
			body.speed = 50
		
	_on_pickable_picked_up()
