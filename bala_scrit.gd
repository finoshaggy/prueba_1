extends KinematicBody2D


var bala_velocidad = 5

#bala velocidad
func _physics_process(delta):
	position.y -= bala_velocidad
	$'bala_colicion'.scale = Vector2(2,2)

#bala colicion
func _on_Area2D_area_entered(area):
	if area.is_in_group("naveEnemiga_señal"):
		queue_free()
	if area.is_in_group("restar_puntos_señal"):
		queue_free()
	if area.is_in_group("meteorito_señal"):
		queue_free()
