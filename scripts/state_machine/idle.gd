extends State
@export var attack_state: State 

func enter()-> void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0

func process_input(event:InputEvent) -> State:
	if Input.is_action_just_pressed('attack'):
		return attack_state
	return null
func process_frame(delta:float) -> State:
	return null
