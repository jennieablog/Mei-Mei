extends Panel

var questions = ["Xiǎo gǒu zài nǎlǐ?","Nà zhǐ xiǎo gǒu zài nǎlǐ?", "Nà zhǐ xiǎo gǒu zài nǎlǐ?", "Hǎo! Wǒmen xiànzài zuò shénme?","Hǎo!"]
var choices = [["Xiǎo gǒu zài yǐzi shàng.","Xiǎo gǒu zài yǐzi xiàfāng.","Xiǎo gǒu zài yǐzi qiánmiàn"],["Xiǎo gǒu zài yǐzi shàng.","Xiǎo gǒu zài yǐzi xiàfāng.","Xiǎo gǒu zài yǐzi qiánmiàn"],["Xiǎo gǒu zài yǐzi shàng.","Xiǎo gǒu zài yǐzi xiàfāng.","Xiǎo gǒu zài yǐzi qiánmiàn"],["Wǒmen xiànzài jiāng zuò nǐ de gōngkè.","Wǒmen shuì.","Wǒmen xiànzài zǒu zài huāyuán."],["Bù kèqì!"]]
var answers = [0,2,1,0,1]
var i = 0
onready var meimei = get_parent().get_node("mei_play")
onready var meimei_message = get_node("Message")
onready var a = get_node("Choices/A")
onready var b = get_node("Choices/B")
onready var c = get_node("Choices/C")

func _ready():
	
	# CLUES HERE
	var cluePic = ImageTexture.new()
	cluePic.load("res://Textures/Sprites/clue_garden.png")
	get_parent().get_node("Clues/Note").set_texture(cluePic)
	
	global.behappy(meimei)
	
	_meimei_interact()
	set_process_input(true)

func _meimei_interact():
	
	global.behappy(meimei)
	
	if (i == 0):
		get_parent().get_node("Dogs/A").show()
		get_parent().get_node("Dogs/B").hide()
		get_parent().get_node("Dogs/C").hide()
	elif (i == 1):
		get_parent().get_node("Dogs/B").show()
		get_parent().get_node("Dogs/A").hide()
		get_parent().get_node("Dogs/C").hide()
	elif (i == 2):
		get_parent().get_node("Dogs/C").show()
		get_parent().get_node("Dogs/A").hide()
		get_parent().get_node("Dogs/B").hide()

	if (i == 4):
		meimei_message.set_bbcode(questions[i])
		meimei_message.set_visible_characters(0)
		b.set_text(choices[i][0])
		get_node("Choices/A").hide()
		get_node("Choices/C").hide()
	elif (i == 5):
		global.nowTime += 1
		get_tree().change_scene("res://Scenes/HomeA.tscn")
	else:
		meimei_message.set_bbcode(questions[i])
		meimei_message.set_visible_characters(0)
		a.set_text(choices[i][0])
		b.set_text(choices[i][1])
		c.set_text(choices[i][2])

func _on_A_pressed():
	if (answers[i] == 0):
		global.happiness += 1
		i += 1
		_meimei_interact()
	else:
		global.besad(meimei)

func _on_B_pressed():
	if (answers[i] == 1):
		if (i != 4):
			global.happiness += 1
		i += 1
		_meimei_interact()
	else:
		global.besad(meimei)
		
func _on_C_pressed():
	if (answers[i] == 2):
		global.happiness += 1
		i += 1
		_meimei_interact()
	else:
		global.besad(meimei)

func _on_Timer1_timeout():
	meimei_message.set_visible_characters(meimei_message.get_visible_characters()+1)
