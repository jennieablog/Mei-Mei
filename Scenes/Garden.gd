extends TextureFrame

var gardenbg = ["Garden.png","Garden.png","Garden.png"]
var newImageTexture = ImageTexture.new()

func _ready():
	
	global.updateScore()

	if global.nowTime == 3:
		global.gardenState = 1
	elif global.nowTime == 6:
		global.gardenState = 2
	else:
		global.gardenState = 0
		
	#print("Setting new bg for nowtime="+str(global.nowTime))
	newImageTexture.load("res://Textures/Backgrounds/"+gardenbg[global.gardenState])
	set_texture(newImageTexture)
	
	if global.gardenState != 1:
		#print("delete dialog for flower")
		get_node("Flower").free()
		get_node("mei_flower").free()
		
	if global.gardenState != 2:
		#print("delete dialog for play")
		get_node("Play").free()
		get_node("mei_play").free()

	if global.gardenState == 1 or global.gardenState == 2:
		get_node("SingleDialog").free()