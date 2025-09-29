extends State
@export  var idle_state: State

var moves  = ['move_down', 'move_left', 'move_right', 'move_up' ]
func enter()->void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0

	
		
func process_frame(delta: float) -> State:
	if not parent.animations.is_playing():
		return idle_state
	return null
