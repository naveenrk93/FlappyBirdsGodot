extends Node2D

@export var pipe_scene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_timer = $Timer
@onready var engine_sound = $EngineSound
@onready var game_over_sound = $GameOverSound

const SPAWN_Y_UPPER_LIMIT:float = 300.0
const SPAWN_Y_LOWER_LIMIT:float = 600.0
const SPAWN_X:float = 550.0
 
func _ready():
	GameManager.on_game_over.connect(on_game_over)
	GameManager.set_score(0)
	spawn_pipe()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipe() -> void:
	var y_pos = randf_range(SPAWN_Y_LOWER_LIMIT, SPAWN_Y_UPPER_LIMIT)
	var new_pipe = pipe_scene.instantiate();
	
	new_pipe.position = Vector2(SPAWN_X, y_pos);
	pipes_holder.add_child(new_pipe);


func stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_timer_timeout():
	spawn_pipe()


func on_game_over():
	engine_sound.stop()
	game_over_sound.play()
	stop_pipes()
