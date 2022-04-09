extends Node

var enemigo_barrera = 0
var tiempo = 15
var barra_de_vida = 1

func _physics_process(delta):
	if Input.is_action_pressed("escape"):
		get_tree().quit()
		


#sistema de contador
func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo)


#sistema de puntos
func puntos():
	get_tree().get_nodes_in_group("barrera")[0].text = String(enemigo_barrera)


func vida_barra():
	get_tree().get_nodes_in_group("barra_vida_señal")[0].text = String(barra_de_vida)




