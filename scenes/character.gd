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


# Function meant to be called by coins when they are collected
func add_coins(amount: int) -> void:
	_coins += amount


# Called at a fixed rate (60 times a second), do every physics calculations here
func _physics_process(delta):
	# Get a float between -1 and 1 representing the movement direction of the player
	# This value is determined by reading the input strength of the "MoveLeft" and "MoveRight" inputs
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	# Set the horizontal velocity to match the direction
	velocity.x = direction * speed
	
	# Detect if the player wants to jump
	if Input.is_action_pressed("Jump") and is_on_floor():
		# Increase the vertical velocity to make the character jump
		velocity.y += jump_speed

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Move the player once the velocity calculations are done
	move_and_slide()
