extends CharacterBody2D

@onready var animations = $player_animation
@onready var state_machine = $state_machine
var direction: String = 'down'
func _ready() -> void:
	state_machine.init(self, animations)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)


func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	animations.is_playing()

func _process(delta: float) -> void:
	if state_machine:
		state_machine.process_frame(delta)
