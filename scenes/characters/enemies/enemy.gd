extends Character
@onready var raycast: RayCast2D = $raycast 
@onready var timer: Timer = $timer
var player: Player
@onready var ray_cast_initial = $raycast.target_position
func _physics_process(delta: float) -> void:
	if raycast.is_colliding():
		var object = raycast.get_collider()
		if object.has_method('_is_player'):
			#player is in vision, pursue
			pass
		else: 
			#player not in vision do idle
			pass
func _on_active_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		player = body
		_update_raycast()
		timer.start()
		## handle state

		

func _update_raycast():
	if player == null: 
		raycast.target_position = ray_cast_initial
	else: 
		var target = player.calculate_middle_point() - raycast.global_position 
		raycast.set_target_position(target)
func _on_timer_timeout() -> void:
	_update_raycast()


func _on_field_of_vision_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = null
		timer.stop()
		_update_raycast()
