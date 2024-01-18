@tool
extends VnGraphNode

var start_id_edit : LineEdit

signal run_debug

func _enter_tree():
	node_id_label = find_child("NodeId")
	if (node_id_label == null):
		push_error("missing decendent 'NodeId'")
	else:
		node_id_label.text = name
	start_id_edit = $HBoxContainer2/StartId

func import_data(data : Dictionary):
	name = data.id
	node_id_label.text = data.id
	position_offset = Vector2(data.position_offset[0], data.position_offset[1])
	position = Vector2(data.position[0], data.position[1])
	node_type = VnNodeType.get(data.node_type)
	start_id_edit.text = data.start_param

func export() -> Dictionary:
	return {
		"id": node_id_label.text,
		"position": [position.x, position.y],
		"position_offset": [position_offset.x, position_offset.y],
		"node_type": VnNodeType.keys()[node_type],
		"start_param" : start_id_edit.text,
		"connections" : []
	}


func _on_color_picker_button_color_changed(color):
	set_slot_color_right(1, color)


func _on_run_debug_button_pressed():
	run_debug.emit(name)
