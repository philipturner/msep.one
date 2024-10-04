extends RingMenuAction

const RingMenuSpriteIconScn = preload("res://editor/controls/ring_menu/ring_menu_icon/ring_menu_sprite_icon/ring_menu_sprite_icon.tscn")

var _workspace_context: WorkspaceContext = null
var _ring_menu: NanoRingMenu = null


func _init(in_workspace_context: WorkspaceContext, in_menu: NanoRingMenu) -> void:
	_workspace_context = in_workspace_context
	_ring_menu = in_menu
	super._init(
			tr("Groups"),
			_execute_action,
			tr("Manage the project's groups.")
	)


func get_icon() -> RingMenuIcon:
	return RingMenuSpriteIconScn.instantiate().init(preload("res://editor/controls/menu_bar/menu_virtual_objects/icons/icon_groups_x96.svg"))


func _execute_action() -> void:
	if _workspace_context.has_selection():
		MolecularEditorContext.request_workspace_docker_focus(GroupsDocker.UNIQUE_DOCKER_NAME, &"Assign Group to Selection")
	else:
		MolecularEditorContext.request_workspace_docker_focus(GroupsDocker.UNIQUE_DOCKER_NAME, &"Groups")
	_ring_menu.close()