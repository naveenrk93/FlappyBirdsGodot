extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite = $AnimatedSprite2D

const GRAVITY:float = 2000.0
const POWER:float = -500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("Fly") :
		fly()
	
	move_and_slide()
	
	if is_on_floor():
		die()
	

func fly() -> void:
	velocity.y = POWER
	animation_player.play("fly")

func die() -> void:
	animated_sprite.stop()
	set_physics_process(false)
	
