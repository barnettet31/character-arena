extends Character
@onready var raycast: RayCast2D = $raycast 
@onready var timer: Timer = $timer
@onready var ray_cast_initial = $raycast.target_position
var player: Player
var colliding_with_player: bool = false
var move_target: Vector2
func _physics_process(delta: float) -> void:
		colliding_with_player = _check_line_of_sight()
		if colliding_with_player: 
			move_target = raycast.target_position.normalized()
func _on_active_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		player = body
		_update_raycast()
		timer.start()
		## handle state

		
func _check_line_of_sight()->bool:
		if player == null:
			return false
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsRayQueryParameters2D.create(raycast.global_position, player.calculate_middle_point())
		query.collision_mask = 3
		query.collide_with_bodies = true
		query.collide_with_areas = false
		var result = space_state.intersect_ray(query)
		if result.is_empty():
			return false
		return result.collider == player or result.collider.has_method('is_player')
	
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
