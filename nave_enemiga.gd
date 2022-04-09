extends Node2D

func _physics_process(delta):
	position.y += 1.5
	if AutoCarga.tiempo > 50:
		position.y += 1.5
	if AutoCarga.tiempo > 120:
		position.y += 1.7


func _on_Area2D_area_entered(area):
	if area.is_in_group("bala_señal"):
		AutoCarga.update_time()
		AutoCarga.tiempo += 5
		queue_free()
	if area.is_in_group("jugador_señal"):
		queue_free()
	





