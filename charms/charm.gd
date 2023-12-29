extends Area2D

var speed:int

# Class Constructor
func _init(value=150):
	self.speed = value
	
func _physics_process(delta):
	position += - transform.y * self.speed * delta

func _on_area_entered(area):
	if area.is_in_group("mobs"):
		area.health_component.reduce_health(2)
		queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.health_component.reduce_health(2)
	queue_free()
