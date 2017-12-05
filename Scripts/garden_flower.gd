extends Panel

var questions = ["Wǒ xǐhuān kàn huā. Zhè duǒ huā shì shénme yánsè de?","Zhè duǒ huā shì shénme yánsè de?", "Fěnsè shì wǒ zuì xǐhuān de yánsè! Zhè duǒ huā shì shénme yánsè de?", "Wǒ hěn hǎo. Wǒmen xiànzài zuò shénme?","Hǎo! Xièxiè"]
var choices = [["huángsè","hóngsè","fěnsè"],["huángsè","hóngsè","fěnsè"],["huángsè","hóngsè","fěnsè"],["Wǒ bù zhīdào!","Wǒmen shuì.","Wǒmen huì chī wǔfàn."],["Bù kèqì!"]]
var answers = [1,2,0,2,1]
var i = 0
onready var meimei = get_parent().get_node("mei_flower")
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

func _on_Timer_timeout():
	meimei_message.set_visible_characters(meimei_message.get_visible_characters()+1)

func _meimei_interact():
	
	global.behappy(meimei)
	
	if (i == 0):
		get_parent().get_node("Container/A").show()
		get_parent().get_node("Container/B").hide()
		get_parent().get_node("Container/C").hide()
	elif (i == 1):
		get_parent().get_node("Container/B").show()
		get_parent().get_node("Container/A").hide()
		get_parent().get_node("Container/C").hide()
	elif (i == 2):
		get_parent().get_node("Container/C").show()
		get_parent().get_node("Container/A").hide()
		get_parent().get_node("Container/B").hide()
		
	if (i == 4):
		meimei_message.set_bbcode(questions[i])
		meimei_message.set_visible_characters(0)
		b.set_text(choices[i][0])
		get_node("Choices/A").hide()
		get_node("Choices/C").hide()
		get_parent().get_node("Container").hide()
		
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