extends State
@export var idle:State

func enter():
	super()
	animations.play(animation_name)

func process_frame(delta:float) -> State:
	if parent.player == null:
		return idle
	else: 
		return null
