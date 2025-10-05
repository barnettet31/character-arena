class_name Enemy
extends CharacterBody2D
@onready var raycast: RayCast2D = $line_of_sight
@onready var nav: NavigationAgent2D = $pursuit_navigation
@export var speed: int = 6000

func _process(delta: float) -> void:
	if raycast.is_colliding(): 
		var collider = raycast.get_collider()
		if collider.name == 'player':
			var dir = collider.global_position - global_position
			raycast.target_position = dir
			raycast.force_raycast_update()
			nav.target_position = collider.global_position
			var nav_point_direction = to_local(nav.get_next_path_position()).normalized()
			velocity = nav_point_direction * speed * delta
			$animation.play("run")
			move_and_slide()
