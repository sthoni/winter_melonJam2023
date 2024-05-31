extends Node

# Charm-related events
signal charm_cast(charm: Charm)
signal charm_changed(charm: Charm)

# Character-related events
signal character_hit
signal character_died

# Enemy-related events
signal enemy_died(enemy: Enemy)
signal enemy_spawned

# Ui events
signal new_game_pressed
signal main_menu_pressed
signal exit_game_pressed

# Level events
signal all_enemies_died