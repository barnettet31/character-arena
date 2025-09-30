extends State
@export var attack_state: State 
@export var move_state :State
@export var run_state : State
var is_first = true
func enter()-> void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0
	if is_first: 
		parent.animations.play('idle_down')
	
	
func process_physics(delta:float) -> State:
	
	return null
func process_input(event:InputEvent) -> State:
	if event.is_action_pressed('attack'):
		return attack_state
	elif (Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed('move_right')):
		return move_state
	elif (Input.is_action_just_pressed("run_left") or Input.is_action_just_pressed("run_up") or Input.is_action_just_pressed("run_left") or Input.is_action_just_pressed('run_right')):
		return run_state
	return null
