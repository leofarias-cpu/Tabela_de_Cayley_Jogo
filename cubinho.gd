extends Sprite2D



func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate", Color.GREEN, 1)
		tween.tween_property(self, "scale", Vector2(1,1), 1)
