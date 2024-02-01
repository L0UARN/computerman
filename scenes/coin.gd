class_name Coin
extends Area2D


@export var value: int = 1


# Function called when the coin is created
func _ready():
	# We tell the coin to call the function _on_body_entered when an object collides with it
	body_entered.connect(_on_body_entered)


# Function meant to be call when there's a collision between a body and the coin
func _on_body_entered(body: Node2D) -> void:
	# We start by checking if the body is a character
	if body is Character:
		# If it is, we add coins to the character
		body.add_coins(value)
		# And then we delete the coin
		queue_free()
