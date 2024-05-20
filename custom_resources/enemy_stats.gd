extends Stats
class_name EnemyStats

enum EnemyColor {GREEN, YELLOW, BLUE, RED}

@export_group("Visuals")
@export var kind: EnemyColor
@export var sprite: Texture
