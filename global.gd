extends Node

var happiness = 3

var roomState = 0
var kitchenState = 0
var gardenState = 0
var nowTime = 0
var end = false;

var clockTime = ["7.png","8.png","9.png","10.png","12.png","2.png","3.png","4.png","5.png","6.png"]
# 7 - sleeping
# 8 - wake up (interview)
# 9 - breakfast
# 10 - garden
# 12 - lunch
# 2 - garden
# 3 - nap
# 4 - math
# 5 - poetry
# 6 - mama hui jia

func updateScore():
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count()-1)
	var score = current_scene.get_node("HappinessLevel/Score")
	score.set_bbcode(str(global.happiness))

func cry(meisprite):
	global.updateScore()
	var crying = ImageTexture.new()
	crying.load("res://Textures/Sprites/meimei_crying.png")
	meisprite.set_texture(crying)

func besad(meisprite):
	global.happiness -= 1
	global.updateScore()
	var confused = ImageTexture.new()
	if (global.happiness <= 0):
		global.cry(meisprite)
	else:
		confused.load("res://Textures/Sprites/meimei_confused.png")
		meisprite.set_texture(confused)

func behappy(meisprite):
	global.updateScore()
	var happy = ImageTexture.new()
	happy.load("res://Textures/Sprites/meimei_happy.png")
	meisprite.set_texture(happy)