class_name Character
extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $animation
@onready var state_machine = $state_machine
enum  DIRECTION {
	UP,
	DOWN,
	LEFT,
	RIGHT
}
var direction: DIRECTION = DIRECTION.DOWN
func _ready() -> void:
	state_machine.init(self, animations)

func _handle_change_event(event) -> void:
	pass


func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
func _process(delta: float) -> void:
	if state_machine:
		state_machine.process_frame(delta)
