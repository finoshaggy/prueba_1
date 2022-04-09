extends Control

var archivo = File.new()
var pre_meteorito = preload("res://meteorito.tscn")

func _on_Button_pressed() -> void:
	get_tree().change_scene("res://mapa.tscn")
	
func _physics_process(delta):
	$ParallaxBackground/ParallaxLayer.motion_offset.y += 1
	


func _ready() -> void :
	$Controles.visible=false
	$Controles/esconder.disabled=true
	$NoMeCierres.visible=false
	$Controles/Controles/shaggy_clave_1.visible=false
	$carga_manu_animacion_nose.stop()
	


func _on_Button2_pressed():
	$Salir.disabled=true
	$Controles.visible=true
	$mostrar_controles.disabled=true
	$iniciar.disabled=true
	$Controles/esconder.disabled=false
	$Controles/controles_animacion.play("animacion_controles")
	$Controles/controles_animacion2.play("mostrar_controles_fondo")
	
	

func _on_esconder_pressed():
	$Controles/controles_animacion2.play("quitar_fondo")
	$Salir.disabled=false
	$Controles.visible=false
	$mostrar_controles.disabled=false
	$iniciar.disabled=false
	$Controles/esconder.disabled=true


func _on_Salir_pressed():
	get_tree().quit()


func _on_Salir_mouse_entered():
	$NoMeCierres.visible=true


func _on_Salir_mouse_exited():
	$NoMeCierres.visible=false



func _on_motrar_pressed():
	$"control_contraseña_aniamcion".play("entrar_contraseña")


func _on_control_contrasea_aniamcion_animation_finished(anim_name):
	$motrar.visible=false
	


func _on_control_contrasea_aniamcion_animation_finished_2(anim_name):
	$motrar.visible != $motrar.visible

func _on_motrar2_pressed():
	$"control_contraseña_aniamcion2".play("salir_contraseña")


func _on_control_contrasea_aniamcion2_animation_finished(anim_name):
	$motrar.visible=true






func _on_Control_mouse_entered():
	$Controles/Controles/shaggy_clave_1.visible=true


func _on_Control_mouse_exited():
	$Controles/Controles/shaggy_clave_1.visible=false


func _on_control_menu_jaja_mouse_entered():
	$control_menu_jaja/nombre_menu_aniamtor.play("nombre_menu_jaja")


func _on_control_menu_jaja_mouse_exited():
	$control_menu_jaja/nombre_menu_aniamtor.play("RESET")


func _on_timer_meteorito_menu_timeout():
	randomize()
	var meteorito_enemiga = round(rand_range(1,1))
	if meteorito_enemiga == 1:
		var meteoritos = pre_meteorito.instance()
		self.call_deferred("add_child", meteoritos)
		meteoritos.position.x = round(rand_range(0,390))
		meteoritos.add_to_group("enemigo")


func _on_nombre_menu_aniamtor_animation_finished(menu_intro):
	$carga_manu_animacion_nose.play("carga_apenas")
