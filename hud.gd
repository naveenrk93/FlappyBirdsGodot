extends Control

@onready var score_label = $MarginContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_score_update.connect(on_score_update)

func on_score_update():
	score_label.text = str(GameManager.get_score())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
