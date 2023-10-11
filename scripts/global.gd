extends Sprite2D
@export var niveis_completos: Array[bool]
@export var level_select: PackedScene
var nivel_atual: int
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


func volta_pro_level_select() -> void:
	get_tree().change_scene_to_packed(level_select)


##Escuta por um backspace, e se encontrar volta pro level select, usado pra sair de niveis incompletos
func _input(event) -> void:
	if event.is_action_pressed("backspace"):
		volta_pro_level_select()
