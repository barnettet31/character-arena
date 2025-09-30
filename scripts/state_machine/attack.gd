extends State
@export  var idle_state: State
@export var run_state : State
@export var move_state: State
var _is_attacking = false
func enter()->void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0
	parent.animations.connect("animation_finished", _on_animation_finished)
	_is_attacking = true

	
func process_input(event:InputEvent) -> State:
	if (Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed('move_right')) and not _is_attacking:
		return move_state
	elif (Input.is_action_just_pressed("run_left") or Input.is_action_just_pressed("run_up") or Input.is_action_just_pressed("run_left") or Input.is_action_just_pressed('run_right')) and not _is_attacking:
		return run_state
	return null	

func _on_animation_finished(anim_name: String):
	_is_attacking = false
	pass
