extends Control

func _ready() -> void:
	$animacion_game.play("game_over_screen")



func _on_animacion_game_animation_finished(game_over_screen) -> void:
	yield(get_tree().create_timer(1.4),"timeout")
	get_tree().change_scene("res://game_over.tscn")
	queue_free()
	
	
