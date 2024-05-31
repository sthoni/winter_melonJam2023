class_name CharmBook
extends Resource

signal charm_book_size_changed(charms_amount: int)

@export var charms: Array[Charm] = []

var charm_selected: Charm

func add_charm(charm: Charm) -> void:
	charms.append(charm)
	charm_book_size_changed.emit(charms.size())

func _to_string() -> String:
	var _charm_strings: PackedStringArray = []
	for i: int in charms.size():
		@warning_ignore("return_value_discarded")
		_charm_strings.append("%s: %s" % [i + 1, charms[i].id])
	return "\n".join(_charm_strings)
