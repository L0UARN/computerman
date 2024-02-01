class_name Character
extends CharacterBody2D


# The player's movement speed, set by default to 6 tiles per second
@export var speed: float = 6.0 * 32.0
# The player's jump force, set by default to 16 tiles per second
@export var jump_speed: float = -16.0 * 32.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# The collected coins counter
var _coins: int = 0
# And the label which will display the collected coins
@onready var _coins_display = $Label


func add_coins(amount: int) -> void:
	_coins += amount
	_coins_display.text = "Coins: " + str(_coins)


func _physics_process(delta):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	velocity.x = direction * speed
	
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y += jump_speed

	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
	
	
func _ready():
	_coins_display.text = "Coins: " + str(_coins)
