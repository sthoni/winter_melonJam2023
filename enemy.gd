extends Area2D

@onready var movement_controller: EnemyMovementController = $EnemyMovementController
@onready var health_component: HealthComponent = $HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	self.position = movement_controller.calculate_movement(self.position)


func _on_health_component_health_depleted():
	queue_free()
