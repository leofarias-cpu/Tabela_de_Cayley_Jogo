extends Sprite2D
var ta_segurando: bool = false
var figura_segurada: Figura

func _process(delta) -> void:
	if ta_segurando:
		visible = true
		global_position = get_global_mouse_position()
	else:
		visible = false
