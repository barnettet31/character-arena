extends State
@export var run_state: State
@export var idle_state: State
@export var attack_state: State

func process_input(event:InputEvent) -> State:
	if Input.is_action_pressed("run_left") or Input.is_action_pressed("run_right") or Input.is_action_pressed("run_up") or Input.is_action_pressed('run_down'):
		return run_state
	elif Input.is_action_pressed('attack'):
		return attack_state
	return null
func process_physics(delta:float) -> State:
	var direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	if direction.x == 0 and direction.y == 0: 
		return idle_state
	parent.velocity = direction * move_speed
	parent.move_and_slide()
	play_animation(direction)
	return null
func play_animation(direction: Vector2):
	if direction.y == -1: 
		parent.animations.play('walk_up')
	if direction.y == 1: 
		parent.animations.play('walk_down')
	if direction.x == 1:
		parent.animations.flip_h = false
		parent.animations.play('walk_side')
	if direction.x == -1:
		parent.animations.flip_h = true
		parent.animations.play('walk_side')
	
