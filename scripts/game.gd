extends Node2D

var score = 0
@export var lives = 3
@export var Ball : PackedScene
var gameOver = false
var gameOverTimer = 3

func _ready() -> void:
	$Control/CanvasLayer/lives.text = "Lives: " + str(lives)
	spawnBall()

func _process(delta: float) -> void:
		if gameOver:
			gameOverTimer -= delta
			if gameOverTimer <= 0:
				$Control/GameOver/resetear.show()
				if Input.is_anything_pressed():
					get_tree().reload_current_scene()

	
func spawnBall():
	var currentBall = Ball.instantiate()
	currentBall.global_position = get_tree().get_nodes_in_group("ballSpawnPoint")[0].global_position
	add_child(currentBall)

func addScore():
	score += 1
	$Control/CanvasLayer/score.text = "Score: " + str(score)
	
func removeLive():
	lives -= 1
	$Control/CanvasLayer/lives.text = "Lives: " + str(lives)
	$plataforma.resetPosition()
	if lives <= 0:
		print("game Over")
		$Control/GameOver.show()
		$Control/GameOver/Score.text = "Score: " + str(score)
		gameOver = true
		$Control/GameOver/AnimationPlayer.play("pulse")
		return
	spawnBall()
