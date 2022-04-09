extends Control

var pre_mouse = preload("res://mouse.png")

func _ready():
	$Correpto.visible=false
	$Incorrepta.visible=false
	$shaggy_label.visible=false
	$shaggy_foto.visible=false
	$creador_label.visible=false
	Input.set_custom_mouse_cursor(pre_mouse)
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("regresar"):
		get_tree().change_scene("res://menu.tscn")
	$ParallaxBackground/ParallaxLayer.motion_offset.y += 1

#reiniciar valores autocarga
func _on_Regresar_menu_pressed():
	get_tree().change_scene("res://menu.tscn")
	AutoCarga.tiempo = 15
	AutoCarga.enemigo_barrera = 0
	AutoCarga.barra_de_vida = 0



#cosa de la contraseña
func _on_escribe_5Letras_text_entered(new_text):
	if $escribe_5Letras.text == "shaggy":
		$Correpto.visible=true
		$escribe_5Letras.visible=false
		$Correpto/AnimationPlayer.play("clave_correcta")
		$escribe_5Letras.editable=false
		$sonidos/correcto.play()
	if not $escribe_5Letras.text == "shaggy":
		$Incorrepta.visible=true
		$Incorrepta/AnimationPlayer.play("clave_mala")
		$sonidos/incorrecto.play()
	else:
		if $escribe_5Letras.text == "shaggy":
			$Incorrepta.visible=false
			$shaggy_label.visible=true
			$perdistes_label.visible=false
			$shaggy_foto.visible=true
			$creador_label.visible=true
