extends Control



func _on_escribe_clave_text_entered(new_text) -> void:
	if $escribe_clave.text == "123456": 
		$ganador.play("nave_1")
	if not $escribe_clave.text == "123456":
		print("clave incorrecta")
