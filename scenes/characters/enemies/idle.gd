extends State
@export var run:State 
func _ready() -> void:
	pass
func enter():
	super()
	animations.play(animation_name)

func process_frame(delta:float) -> State:
	if parent.player == null or not parent.colliding_with_player:
		return null
	else: 
		return run
