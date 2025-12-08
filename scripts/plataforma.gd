extends CharacterBody2D

@export var speed = 450
var resetPos: Vector2

func _ready() -> void:
	resetPos = global_position

func resetPosition():
	global_position = resetPos

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("izquierda", "derecha")
	if direction:
		velocity = Vector2(direction * speed, 0) * delta
	else:
		velocity = Vector2(move_toward(velocity.x, 0, speed), 0) * delta

	position += velocity
