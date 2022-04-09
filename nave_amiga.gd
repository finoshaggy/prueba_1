extends Node2D

func _physics_process(delta):
	position.y += 1

func _on_Area2D_area_entered(area):
	if area.is_in_group("bala_señal"):
		AutoCarga.tiempo -= 10
		queue_free()
