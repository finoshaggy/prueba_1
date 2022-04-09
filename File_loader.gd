extends Node2D

func saver(datatosave):
	var  file = File.new()
	file.open("user://datafile.text",File.WRITE)
	file.store_string(datatosave)
	file.close()
	
	
func loader():
	var file = File.new()
	file.open("user://datafile.text",File.READ)
	var textinthefile = file.get_as_text()
	file.close()
	
	return textinthefile

func _on_cargar_button_down():
	$Label.text = loader()
	AutoCarga


func _on_guardar_button_down():
	var ourtext = str($LineEdit.text)
	AutoCarga
	saver(ourtext)
