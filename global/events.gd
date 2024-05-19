extends Node

# Charm-related events
signal charm_cast(charm: Charm)


# Character-related events
signal character_hit
signal character_died


# Enemy-related events
signal enemy_died(enemy: Enemy)
