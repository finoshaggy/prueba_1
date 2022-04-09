extends ParallaxBackground

var fondo = 1

func _physics_process(delta):
	scroll_base_offset.y += fondo * delta
