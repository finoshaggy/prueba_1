extends ParallaxLayer

var fondo_movimiento = -100

func _physics_process(delta)->void:
	self.motion_offset.y += fondo_movimiento * delta
