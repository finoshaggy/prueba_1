extends KinematicBody2D

var movimiento = Vector2()
var velocidad = 500
var gravedad = 500
var salto = -1000


func tomar_imput():
	movimiento.x = 0
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= velocidad
	if Input.is_action_pressed("ui_right"):
		movimiento.x += velocidad
	if Input.is_action_just_pressed("click"):
		preload("res://icon.png")


func _physics_process(delta):
	tomar_imput()
	movimiento = move_and_slide(movimiento, Vector2(0, -1))
