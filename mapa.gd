extends Node2D


#variables pre cargar
var pre_enemiga = preload("res://nave_enemiga.tscn")
var pre_botiquin = preload("res://botiquin.tscn")
var pre_restar = preload("res://restar_puntos.tscn")
var pre_meteorito = preload("res://meteorito.tscn")
var mouse_invisible = preload("res://invisible.png")
var pre_game_over_screen = preload("res://game_over_screen.tscn")

#cuando inicie
func _ready():
	$Color_fondo/Color_rojo.visible=false
	Input.set_custom_mouse_cursor(mouse_invisible)
	$enemigo_barrera/ColorRect.color = Color.green
	
	

func _physics_process(delta) -> void:
	$ParallaxBackground/ParallaxLayer.motion_offset.y += 1
	if AutoCarga.tiempo > 30:
		$timer_enemigos.wait_time = 1.5
	if AutoCarga.tiempo > 80:
		$timer_enemigos.wait_time = 1
		$restar_timer.wait_time = 5
	if AutoCarga.tiempo > 150:
		$timer_enemigos.wait_time = 0.7
		$restar_timer.wait_time = 15
	if AutoCarga.tiempo > 200:
		$timer_enemigos.wait_time = 0.3
		$restar_timer.wait_time = 10
	return


		

#spawn de enemigos
func _on_Timer_timeout():
	randomize()
	var random_enemiga = round(rand_range(1,1))
	if random_enemiga == 1:
		var enemiga_navecita = pre_enemiga.instance()
		self.call_deferred("add_child", enemiga_navecita)
		enemiga_navecita.position.x = round(rand_range(0,390))
		enemiga_navecita.add_to_group("enemigo")

#tiempo_timer
func _on_tiempo_timer_timeout():
	if AutoCarga.tiempo > 0:
		AutoCarga.update_time()
		AutoCarga.tiempo -= 1
	if AutoCarga.tiempo < 0:
		get_tree().change_scene("res://game_over.tscn")
	if AutoCarga.tiempo < 10:
		$CanvasLayer/tiempo.add_color_override("font_color",Color.red)
	if AutoCarga.tiempo > 50:
		$CanvasLayer/tiempo.add_color_override("font_color",Color.green)
	if AutoCarga.tiempo > 10:
		$CanvasLayer/tiempo.add_color_override("font_color",Color.white)
		
		
		
	if AutoCarga.tiempo < 1:
		$tiempo_timer.stop()
		$nave.queue_free()
		$enemigo_barrera.queue_free()
		yield(get_tree().create_timer(1.6),"timeout")
		var screen = pre_game_over_screen.instance()
		get_parent().call_deferred("add_child", screen)
		




#barrera_puntos
func _on_enemigo_barrera_area_entered(area):
	if area.is_in_group("naveEnemiga_señal"):
		AutoCarga.puntos()
		AutoCarga.enemigo_barrera += 1
		if AutoCarga.enemigo_barrera == 1:
			$enemigo_barrera/ColorRect.rect_position.x = 102.433
			$enemigo_barrera/ColorRect.rect_size.x = 200
			$enemigo_barrera/CollisionShape2D.scale.x = 1.5
			$enemigo_barrera/ColorRect.color = Color.yellow
		if AutoCarga.enemigo_barrera == 2:
			$enemigo_barrera/ColorRect.rect_size.x = 316
			$enemigo_barrera/ColorRect.rect_position.x = 42.458
			$enemigo_barrera/CollisionShape2D.scale.x = 2.5
			$enemigo_barrera/ColorRect.color = Color.red
		if AutoCarga.enemigo_barrera == 3:
			$tiempo_timer.stop()
			$nave.queue_free()
			$enemigo_barrera.queue_free()
			yield(get_tree().create_timer(1.6),"timeout")
			var screen = pre_game_over_screen.instance()
			get_parent().call_deferred("add_child", screen)
		if AutoCarga.enemigo_barrera < 5:
			$Color_fondo/Color_rojo.visible=true
			$Color_fondo/Color_rojo/colorRojo_animacion.play("color_rojo")
		



	if area.is_in_group("NaveAmiga_señal"):
		AutoCarga.update_time()
		AutoCarga.tiempo += 2
		AutoCarga.puntos()
		AutoCarga.enemigo_barrera -= 1
		if AutoCarga.enemigo_barrera < 3:
			$Color_fondo/color_verde.visible=true
			$Color_fondo/color_verde/ColorVerde_animacion.play("color_verde")
		if AutoCarga.enemigo_barrera < 0:
			AutoCarga.enemigo_barrera = 0

#botiquin
func _on_botiquien_timer_timeout():
	randomize()
	var random_botiquin = round(rand_range(1,1))
	if random_botiquin == 1:
		var botiquin_amiga = pre_botiquin.instance()
		self.call_deferred("add_child", botiquin_amiga)
		botiquin_amiga.position.x = round(rand_range(0,390))
		botiquin_amiga.add_to_group("enemigo")

#restar_puntos
func _on_restar_timer_timeout():
	randomize()
	var random_restar = round(rand_range(1,1))
	if random_restar == 1:
		var restar_puntos = pre_restar.instance()
		self.call_deferred("add_child", restar_puntos)
		restar_puntos.position.x = round(rand_range(0,390))
		restar_puntos.add_to_group("enemigo")


func _on_timer_meteorito_timeout():
	randomize()
	var meteorito_enemiga = round(rand_range(1,1))
	if meteorito_enemiga == 1:
		var meteoritos = pre_meteorito.instance()
		self.call_deferred("add_child", meteoritos)
		meteoritos.position.x = round(rand_range(0,390))
		meteoritos.add_to_group("enemigo")



