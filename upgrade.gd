extends State

func begin(_kwargs := {}) -> void:
	#%upgrade_one.grab_focus()
	%upgrade_one.text = _kwargs.upgrade_one
	%upgrade_two.text = _kwargs.upgrade_two
	%upgrade_three.text = _kwargs.upgrade_three
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%upgrade_one.pressed.connect(_on_upgrade_one_pressed)
	%upgrade_two.pressed.connect(_on_upgrade_one_pressed)
	%upgrade_three.pressed.connect(_on_upgrade_one_pressed)
	
func _on_upgrade_one_pressed():
	apply_upgrade(%upgrade_one.text)
	
func _on_upgrade_two_pressed():
	apply_upgrade(%upgrade_two.text)
	
func _on_upgrade_three_pressed():
	apply_upgrade(%upgrade_three.text)
		
func apply_upgrade(upgrade):
	print(upgrade)
	if upgrade == "speed":
		Game.speed_multiplier += .1
	if upgrade == "size":
		Game.paddle_size += .1
	if upgrade == "power":
		Game.power += .1
	if upgrade == "horizontal speed":
		Game.horizontal_speed += 1
	if upgrade == "score":
		Game.score_multiplier += 1
	if upgrade == "extra life":
		Game.lives += 1
	Game.state = Game.GameState.STAGE
