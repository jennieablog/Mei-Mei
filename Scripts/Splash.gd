extends TextureFrame

func _ready():
	get_node("StartButton").connect("pressed",self, "_start_game")
	get_node("QuitButton").connect("pressed",self, "_end_game")
func _start_game():
	get_tree().change_scene("res://Scenes/Intro.tscn")
func _end_game():
	get_tree().quit()