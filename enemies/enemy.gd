extends CharacterBody2D
class_name Enemy

@onready var health_component: HealthComponent = $HealthComponent
@onready var color: Global.EnemyType
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(_delta):
	pass

	
func _on_health_component_health_depleted():
	Global._on_enemy_health_depleted(self.position)
	queue_free()
