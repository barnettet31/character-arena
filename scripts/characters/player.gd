class_name Player
extends Character

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func calculate_middle_point():
		var foot_position: Vector2 = self.global_position
		var head_position: Vector2 = animations.sprite_frames.get_frame_texture('idle_down', 0 ).get_size()
		var middle_point: Vector2 = Vector2(foot_position.x, foot_position.y - (head_position.y / 4))
		return middle_point

func _is_player():
	pass
