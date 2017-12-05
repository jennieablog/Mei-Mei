extends TextureFrame

func _ready():
	hide()

func _on_Clues_mouse_enter():
	show()

func _on_Clues_mouse_exit():
	hide()