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
func process_physics(delta:float) -> State:
	if parent.move_target == null:
		return null
	var target: Vector2 = parent.move_target
	print(target)
	parent.velocity = target * move_speed
	parent.move_and_slide()
	return null
