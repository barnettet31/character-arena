extends Node
var locked_device_id = -1 
var has_locked = false
enum InputController {
	Computer, 
	Controller
}
var current_input_device: InputController = InputController.Computer
func _ready():
	_try_lock_controller()
	Input.joy_connection_changed.connect(_on_joy_connection_changed)	

func _on_joy_connection_changed(device_id:int, connected: bool):
	if connected: 
		has_locked = true
		locked_device_id = device_id
		current_input_device = InputController.Controller
	else: 
		current_input_device = InputController.Computer


func _try_lock_controller():
	var connected_joypads = Input.get_connected_joypads()
	if connected_joypads.size()>0:
		locked_device_id = connected_joypads[0]
		has_locked = true
		
