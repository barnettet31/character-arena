extends State
func _ready() -> void:
	print("Enemy idle ready")
func _enter():
	print("enemy idle entered")
	animations.play(animation_name)
