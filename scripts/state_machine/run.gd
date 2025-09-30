extends State
@export var move_state: State
@export var idle_state: State
@export var attack_state: State


func process_input(event:InputEvent) -> State:
	if Input.is_action_pressed("run_left") or Input.is_action_pressed("run_right") or Input.is_action_pressed("run_up") or Input.is_action_pressed('run_down'):
		return move_state
	elif Input.is_action_pressed('attack'):
		return attack_state
	return null	
func process_physics(delta:float) -> State:
	var direction = Input.get_vector('run_left', 'run_right', 'run_up', 'run_down')
	if direction.x == 0 and direction.y == 0: 
		return idle_state
	parent.velocity = direction * move_speed + (direction * move_speed * 0.75)
	parent.move_and_slide()
	play_animation(direction)
	return null
func play_animation(direction: Vector2):
	
	if direction.y == -1: 
		parent.animations.play('run_up')
	if direction.y == 1: 
		parent.animations.play('run_down')
	if direction.x == 1:
		parent.animations.flip_h = false
		parent.animations.play('run_side')
	if direction.x == -1:
		parent.animations.flip_h = true
		parent.animations.play('run_side')
