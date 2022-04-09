extends Control

func _ready():
	pass


func _physics_process(delta) -> void:
	$ProgressBar.value += 0.5
	if $ProgressBar.value > 98:
		$ProgressBar.visible = false
	if $ProgressBar.value == 100:
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://menu.tscn")
		

