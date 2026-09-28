extends Node

@onready
var menu: Menu = $menu

@onready
var hud: Control = $hud

@onready
var stage: Node2D = $stage


func _ready() -> void:
	Game.state_changed.connect(_on_game_state_changed)
	Game.player_won.connect(_on_game_player_won)
	Game.upgrade_time.connect(_on_upgrade_time)
	get_tree().paused = true


func _input(event: InputEvent) -> void:
	if Game.state == Game.GameState.STAGE && Inputs.is_pause_pressed():
		Game.state = Game.GameState.MENU
		menu.menus.transition_to(Menu.SubMenu.PAUSE)


func _on_game_state_changed(game_state: Game.GameState) -> void:
	get_tree().paused = game_state == Game.GameState.MENU
	menu.visible = get_tree().paused
	hud.visible = not get_tree().paused
	stage.visible = not get_tree().paused


func _on_game_player_won(player_id: Game.Player) -> void:
	menu.menus.transition_to(Menu.SubMenu.GAME_OVER, {
		player_id = player_id
	})
	
var upgrades = [
	"speed",
	"size",
	"horizontal speed",
	"power",
	"score",
]

func _on_upgrade_time(player_id: Game.Player) -> void:
	#select 3 random upgrades
	menu.menus.transition_to(Menu.SubMenu.UPGRADE, {
		upgrade_one = upgrades[randi_range(0, upgrades.size()-1)],
		upgrade_two = upgrades[randi_range(0, upgrades.size()-1)],
		upgrade_three = upgrades[randi_range(0, upgrades.size()-1)]
	})
