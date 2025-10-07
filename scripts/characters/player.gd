extends Character



func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
