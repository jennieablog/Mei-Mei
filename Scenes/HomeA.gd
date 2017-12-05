extends TextureFrame

var newImageTexture = ImageTexture.new()

func _ready():
	get_node("KitchenButton").connect("pressed",self, "_go_to_kitchen")
	get_node("RoomButton").connect("pressed",self, "_go_to_room")
	get_node("GardenButton").connect("pressed",self, "_go_to_garden")
	newImageTexture.load("res://Textures/Sprites/"+global.clockTime[global.nowTime])
	get_node("Clock").set_texture(newImageTexture)

func _go_to_kitchen():
	get_tree().change_scene("res://Scenes/Kitchen.tscn")
	
func _go_to_room():
	get_tree().change_scene("res://Scenes/Room.tscn")
	
func _go_to_garden():
	get_tree().change_scene("res://Scenes/Garden.tscn")
	
func _end_game():
	get_tree().quit()