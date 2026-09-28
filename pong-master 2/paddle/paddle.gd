class_name Paddle
extends AnimatableBody2D

@export
var player: Game.Player

@export_range(0, 1000, 10, 'suffix:px/s')
var speed: float



func _physics_process(delta: float) -> void:
	var player_direction = Inputs.get_axis(player)
	var player_horizontal_direction = Inputs.get_horizontal_axis(player)
	var motion = (Vector2.DOWN * player_direction * speed * delta) * Game.speed_multiplier
	var horizontal_motion = (Vector2.LEFT * player_horizontal_direction * speed * delta) * Game.horizontal_speed
	move_and_collide(motion)
	move_and_collide(horizontal_motion)
	
	self.scale = Vector2(Game.paddle_size, Game.paddle_size)
	
