extends Node2D

const SPEED: float = 70.0

@onready var score_sound = $ScoreSound

const GROUP_PLANE: String = "plane"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SPEED * delta;
	pass



func _on_screen_exited():
	queue_free()


func _on_pipe_body_entered(body):
	if body.is_in_group(GROUP_PLANE):
		body.die();


func _on_laser_body_entered(body):
	if body.is_in_group(GROUP_PLANE):
		score_sound.play()
		GameManager.increment_score();
