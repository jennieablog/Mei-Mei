extends TextureFrame

var kitchenbg = ["kitchen_empty.png","Kitchen.png","Kitchen.png"]
var newImageTexture = ImageTexture.new()

func _ready():
	
	global.updateScore()

	if global.nowTime == 2:
		global.kitchenState = 1
	elif global.nowTime == 4:
		global.kitchenState = 2
	else:
		global.kitchenState = 0
		
	#print("Setting new bg for nowtime="+str(global.nowTime))
	newImageTexture.load("res://Textures/Backgrounds/"+kitchenbg[global.kitchenState])
	set_texture(newImageTexture)
	
	if global.kitchenState != 1:
		#print("delete dialog for breakfast")
		get_node("Breakfast").free()
		get_node("mei_breakfast").free()
		
	if global.kitchenState != 2:
		#print("delete dialog for lunch")
		get_node("Lunch").free()
		get_node("mei_lunch").free()

	if global.kitchenState == 1 or global.kitchenState == 2:
		get_node("SingleDialog").free()