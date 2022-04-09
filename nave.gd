extends KinematicBody2D

var movimiento = Vector2(0,0)
var velocidad = 500
var pre_bala = preload("res://bala.tscn")
var pre_game_over_screen = preload("res://game_over_screen.tscn")

func _ready():
	$particulas_izquierda.emitting = true
	$particulas_derecha.emitting = true
	
	
func tomar_imput():
	movimiento.x = 0
	if Input.is_action_pressed("ui_left"):
		$particulas_izquierda.emitting=false
		movimiento.x -= velocidad 
		set_rotation_degrees(-30)
	if Input.is_action_pressed("ui_right"):
		$particulas_derecha.emitting = false
		movimiento.x += velocidad
		set_rotation_degrees(30)
	if Input.is_action_pressed("click"):
		shoot()
		
	if movimiento.x == 0:
		set_rotation_degrees(0)
		$particulas_izquierda.emitting = true
		$particulas_derecha.emitting = true
		
var recarga_bala = true

func shoot():
	if recarga_bala == true:
		var bala = pre_bala.instance()
		get_parent().call_deferred("add_child", bala)
		bala.position.x = self.position.x 
		bala.position.y = self.position.y -30
		recarga_bala = false
		yield(get_tree().create_timer(0.7),"timeout")
		recarga_bala = true


func  _physics_process(delta):
	tomar_imput()
	movimiento = move_and_slide(movimiento,Vector2(0,0))
	
	
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("naveEnemiga_señal"):
		$verde_vida.play("rojo_vida")
		AutoCarga.vida_barra()
		AutoCarga.barra_de_vida += 1
		if AutoCarga.barra_de_vida == 2:
			$Barra_de_vida/BarraDeVida1.frame = 1
		if AutoCarga.barra_de_vida == 3:
			$Barra_de_vida/BarraDeVida1.frame = 2
		if AutoCarga.barra_de_vida == 4:
			$Barra_de_vida/BarraDeVida1.frame = 3
			$verde_vida.play("seva_todo_ala_mrd")
		if AutoCarga.barra_de_vida > 4:
			yield(get_tree().create_timer(0),"timeout")
			queue_free()
			var screen = pre_game_over_screen.instance()
			get_parent().call_deferred("add_child", screen)
		return AutoCarga.barra_de_vida > 4



	if area.is_in_group("botiquien_señal"):
		AutoCarga.vida_barra()
		AutoCarga.barra_de_vida -= 1
		$verde_vida.play("verde_vida")
		$Sprite.play("curar")
		
	if area.is_in_group("meteorito_señal"):
		yield(get_tree().create_timer(0),"timeout")
		queue_free()
		var screen = pre_game_over_screen.instance()
		get_parent().call_deferred("add_child", screen)


func _on_Sprite_animation_finished() -> void:
	$Sprite.play("idle")
