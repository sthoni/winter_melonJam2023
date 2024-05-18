extends CharacterBody2D
class_name Pickable

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
