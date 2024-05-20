extends CharacterBody2D
class_name Enemy

@export var stats: EnemyStats  : set = set_enemy_stats

@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func set_enemy_stats(value: EnemyStats) -> void:
	stats = value.create_instance()
	if not sprite:
		await ready
	sprite.texture = stats.sprite
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)

	update_enemy()

# Das wird nötig, wenn man noch ein UI-Element beim Player hat.
func update_enemy() -> void:
	if not stats is EnemyStats: 
		return
	if not is_inside_tree(): 
		await ready
	update_stats()

# Das wird nötig, wenn man noch ein UI-Element beim Player hat.
func update_stats() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(_delta):
	pass

