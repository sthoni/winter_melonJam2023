extends CharacterBody2D
class_name Enemy

@onready var movement_controller: EnemyMovementController = $EnemyMovementController
@onready var health_component: HealthComponent = $HealthComponent
@onready var color: Global.EnemyType

# Called when the node enters the scene tree for the first time.
func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	velocity = movement_controller.calculate_movement(self.position)
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() and collision.get_collider().name == "Character":
			var character: Character = collision.get_collider()
			self.position -= velocity.normalized()*3
			character.health_component.reduce_health(4)
	move_and_slide()

	
func _on_health_component_health_depleted():
	Global._on_enemy_health_depleted()
	queue_free()
