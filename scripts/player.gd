extends CharacterBody2D


func _physics_process(delta: float) -> void:
	handle_movement(delta)
	handle_animation()
	
func handle_movement(d: float):
	if input_controller.current_input_device == input_controller.InputController.Controller:
		_handle_controller_input()
	else:
		_handle_computer_input()
		
func handle_animation():
	pass

func _handle_controller_input():
	print("handling controller inputs")
func _handle_computer_input():
	print("handling computer inputs")
