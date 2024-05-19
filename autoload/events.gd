extends Node

# Charm-related events
signal charm_cast(charm: Charm)


# Player-related events
signal player_hit
signal player_died


# Enemy-related events
signal enemy_died(enemy: Enemy)
