extends Node
class_name State

@export var animation_name: String
@export var move_speed: float = 100
var animations : AnimatedSprite2D
var parent: CharacterBody2D

func enter()->void:
	pass

func exit():
	pass

func process_input(event:InputEvent) -> State:
	return null
func process_frame(delta:float) -> State:
	return null
func process_physics(delta:float) -> State:
	return null
