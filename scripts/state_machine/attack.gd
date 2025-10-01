extends State
@export  var idle_state: State
@export var run_state : State
@export var move_state: State
@export var state_machine: Node
var _is_attacking = false
var _queued_state: State = null
func enter()->void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0
	if not parent.animations.is_connected('animation_finished', _on_animation_finished):
		parent.animations.connect("animation_finished", _on_animation_finished)
	_is_attacking = true
	_queued_state = null
	handle_animations(parent.direction)
	
func process_input(event:InputEvent) -> State:
	if (Input.is_action_pressed("move_down") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_left") or Input.is_action_pressed('move_right')):
		if _is_attacking:
			_queued_state = move_state
			return null
		return move_state
	elif (Input.is_action_pressed("run_left") or Input.is_action_pressed("run_up") or Input.is_action_pressed("run_left") or Input.is_action_pressed('run_right')):
		if _is_attacking:
			_queued_state = move_state
			return null
		return run_state
	return null	

func _on_animation_finished():
	_is_attacking = false
	if _queued_state != null: 
		state_machine.change_state(_queued_state)
	else:
		state_machine.change_state(idle_state)
	


func handle_animations(direction):
	match direction:
		parent.DIRECTION.UP:
			parent.animations.play('attack_up')
		parent.DIRECTION.DOWN:
			parent.animations.play('attack_down')
		parent.DIRECTION.LEFT:
			parent.animations.flip_h = false
			parent.animations.play('attack_side')
		parent.DIRECTION.RIGHT:
			parent.animations.flip_h = true
			parent.animations.play('attack_side')
