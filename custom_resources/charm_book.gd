class_name CharmBook
extends Resource

signal charm_book_size_changed(charms_amount: int)
signal charm_selected_changed

@export var charms: Array[Charm] = []

var charm_selected: Charm: set = select_charm

func add_charm(charm: Charm) -> void:
	charms.append(charm)
	charm_book_size_changed.emit(charms.size())

func _to_string() -> String:
	var _charm_strings: PackedStringArray = []
	for i: int in charms.size():
		_charm_strings.append("%s: %s" % [i + 1, charms[i].id])
	return "\n".join(_charm_strings)

func select_charm(charm: Charm) -> void:
	charm_selected = charm
	charm_selected_changed.emit()

func create_instance() -> CharmBook:
	var instance: CharmBook = self.duplicate()
	if instance.charms.size() > 0:
		instance.charm_selected = instance.charms[0]
	return instance
