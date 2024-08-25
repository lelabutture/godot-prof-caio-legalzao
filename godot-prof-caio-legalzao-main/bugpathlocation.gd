extends Node2D

@export var bug_scene : PackedScene
var score

func _ready():
	new_game()
func game_over():
	$BugTimer.stop()
	$ScoreTimer.stop()
	
func new_game():
	$StarTimer.start()
	$player.start_pos($startposition.position)
	var score = 0
