extends Panel

var questions = ["... ... ... ... ","Zǎoshang hǎo! Qǐngwèn, nǐ shì shéi?","Hǎo. Wǒ māmā zài nǎlǐ?","Hǎo. Wǒmen xiànzài zài zuò shénme?","Hǎo! Xièxiè"]
var choices = [["Mèimei, zǎoshang hǎo!","Mèimei, xiàwǔ hǎo!","Mèimei, wǎnshàng hǎo!"],["Wǒ shì nǐ de māmā.","Wǒ shì nǐ de lǎoshī.","Wǒ shì nǐ de línshíbǎomǔ."],["Tā zài yīyuàn.","Tā zài gōngzuò","Wǒ bù zhīdào!"],["Wǒmen xiànzài qù huāyuán chī zǎocān.","Wǒ bù zhīdào!","Wǒmen xiànzài qù chúfáng chī zǎocān."],["Bù kèqì!"]]
var answers = [0,2,1,2,1]
var i = 0
onready var meimei = get_parent().get_node("mei_interview")
onready var meimei_message = get_node("Message")
onready var a = get_node("Choices/A")
onready var b = get_node("Choices/B")
onready var c = get_node("Choices/C")

func _ready():
	
	# CLUES HERE
	var cluePic = ImageTexture.new()
	cluePic.load("res://Textures/Sprites/clue_room.png")
	get_parent().get_node("Clues/Note").set_texture(cluePic)
	
	global.behappy(meimei)
	
	_meimei_interact()
	set_process_input(true)

func _on_Timer_timeout():
	meimei_message.set_visible_characters(meimei_message.get_visible_characters()+1)

func _meimei_interact():
	global.behappy(meimei)
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