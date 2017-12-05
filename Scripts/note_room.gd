extends TextureFrame

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	hide()

func _on_Clues_mouse_enter():
	show()

func _on_Clues_mouse_exit():
	hide()
