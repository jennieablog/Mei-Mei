extends TextureFrame

var roombg = ["room_empty.png","room_empty.png","room_sleep.png","room_study.png","room_study.png","room_sleep.png"]
var newImageTexture = ImageTexture.new()

func _ready():
	
	global.updateScore()

	if global.nowTime == 0:
		global.roomState = 5
	elif global.nowTime == 1:
		global.roomState = 1
	elif global.nowTime == 2 or global.nowTime == 3 or global.nowTime == 4 or global.nowTime == 6:
		global.roomState = 0
	elif global.nowTime == 5:
		global.roomState = 2
	elif global.nowTime == 7:
		global.roomState = 3
	elif global.nowTime == 8:
		global.roomState = 4
	#print("Setting new bg for nowtime="+str(global.nowTime))
	newImageTexture.load("res://Textures/Backgrounds/"+roombg[global.roomState])
	set_texture(newImageTexture)
	
	if global.roomState != 1:
		#print("delete dialog for interview")
		get_node("Interview").free()
		get_node("mei_interview").free()
		
	if global.roomState != 3:
		#print("delete dialog for math review")
		get_node("Math").free()
		get_node("mei_math").free()
		
	if global.roomState != 4:
		#print("delete dialog for poetry reading")
		get_node("Poetry").free()
		get_node("mei_poetry").free()
		
	if global.roomState == 1 or global.roomState == 3 or global.roomState == 4:
		#print ("delete single dialog")
		get_node("SingleDialog").free()