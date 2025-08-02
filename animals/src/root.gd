@tool
extends State

func _on_update(delta):
	if debug_mode:
		$"../DebugLayer/DebugState".text = str(active_states.keys())
