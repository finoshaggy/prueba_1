extends Node2D

func _physics_process(delta):
	position.y += 1


func _on_Area2D_area_entered(area):
	if area.is_in_group("jugador_señal"):
		AutoCarga.vida_barra()
		AutoCarga.barra_de_vida -= 1
		if AutoCarga.barra_de_vida < 0:
			AutoCarga.barra_de_vida = 0
			
	if area.is_in_group("jugador_señal"):
		queue_free()
