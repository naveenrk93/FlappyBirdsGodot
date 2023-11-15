extends Control

@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer

var _can_press_space:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_press_space == true and Input.is_action_just_pressed("Fly"):
		GameManager.load_main_scene()

func on_game_over() -> void:
	show()
	timer.start()
	
func switch_labels() -> void:
	game_over_label.hide()
	press_space_label.show()
	_can_press_space = true


func _on_timer_timeout():
	switch_labels()
