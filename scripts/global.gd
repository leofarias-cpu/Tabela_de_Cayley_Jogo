extends Sprite2D
var ta_segurando: bool = false
var figura_segurada: Figura
var tem_area_selecionada = false

func _process(delta) -> void:
	if ta_segurando:
		visible = true
		global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("left_click") and not tem_area_selecionada:
			limpa()
	else:
		visible = false

func limpa() -> void:
	figura_segurada = null
	ta_segurando = false
