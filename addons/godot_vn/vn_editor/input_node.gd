@tool
extends VnGraphNode

var var_name_edit : LineEdit
var usr_input_edit : TextEdit

func _enter_tree():
	node_id_label = find_child("NodeId")
	if (node_id_label == null):
		push_error("missing decendent 'NodeId'")
	else:
		node_id_label.text = name
	var_name_edit = $HBoxContainer2/VarNameEdit
	usr_input_edit = $UserInputEdit

func import_data(data : Dictionary):
	name = data.id
	node_id_label.text = data.id
	position_offset = Vector2(data.position_offset[0], data.position_offset[1])
	position = Vector2(data.position[0], data.position[1])
	node_type = VnNodeType.get(data.node_type)
	var_name_edit.text = data.var_name
	usr_input_edit.text = data.user_input_q

func export() -> Dictionary:
	return {
		"id": node_id_label.text,
		"position": [position.x, position.y],
		"position_offset": [position_offset.x, position_offset.y],
		"node_type": VnNodeType.keys()[node_type],
		"var_name" : var_name_edit.text,
		"user_input_q": usr_input_edit.text,
		"connections" : []
	}
