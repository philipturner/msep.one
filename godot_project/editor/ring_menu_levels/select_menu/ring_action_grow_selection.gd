class_name RingActionGrowSelection extends RingMenuAction

const RingMenuSpriteIconScn = preload("res://editor/controls/ring_menu/ring_menu_icon/ring_menu_sprite_icon/ring_menu_sprite_icon.tscn")

var _workspace_context: WorkspaceContext = null
var _ring_menu: NanoRingMenu = null

func _init(in_workspace_context: WorkspaceContext, in_menu: NanoRingMenu) -> void:
	_workspace_context = in_workspace_context
	_ring_menu = in_menu
	assert(_workspace_context)
	super._init(
		tr("Grow Selection"),
		_execute_action,
		tr("Grow the atom selection by one layer")
	)
	with_validation(can_grow_selection)


func get_icon() -> RingMenuIcon:
	return RingMenuSpriteIconScn.instantiate().init(preload("res://editor/icons/icon_grow_selection_x96.svg"))


func can_grow_selection() -> bool:
	if _workspace_context == null:
		return false
	return _workspace_context.can_grow_selection()


func _execute_action() -> void:
	_ring_menu.close()
	if can_grow_selection():
		_workspace_context.grow_selection()