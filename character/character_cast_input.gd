class_name CharacterCastInput
extends CastInput

func get_cast_intention() -> bool:
	if Input.is_action_pressed("cast_left") or Input.is_action_pressed("cast_right") or Input.is_action_pressed("cast_up") or Input.is_action_pressed("cast_down"):
		return true
	else:
		return false

func get_cast_direction() -> Vector2:
	if Input.is_action_pressed("cast_left") or Input.is_action_pressed("cast_right") or Input.is_action_pressed("cast_up") or Input.is_action_pressed("cast_down"):
		cast_direction = Input.get_vector("cast_left", "cast_right", "cast_up", "cast_down")
	return cast_direction

func get_cast_switch() -> int:
	if Input.is_action_just_pressed("charm_switch_right"):
		return 1
	elif Input.is_action_just_pressed("charm_switch_left"):
		return - 1
	else:
		return 0