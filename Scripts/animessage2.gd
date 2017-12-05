extends RichTextLabel

var dialog = ["KERRAAANG!!! IT'S BABYSITTING DAY!","Zǎoshang hǎo! Nǐ hǎo ma?","Thank you very much for coming in today to take care of my nǚ'ér, Mèimei!","The babysitter who used to take care of Mèi has been really sick for the past few days so she can't come.","She is a very nice person; I do hope she gets well soon.","Today I have to attend to something very important at work, so I had to leave Mèimei with you.","I left notes on the rooms so you'll know what to do.","They're all written in Hànzì. Mèimei can't understand English yet so please speak to her in Hànyǔ.", "She's still asleep now. She should wake up by 8 am.","Qǐng, take the time roam around while waiting for her to wake up.","She's a smart and adorable little girl. Please be nice to her.","Well, I shall be off now! I'll be back at 6 pm.","Qǐng, don't make Mèi cry.","Xièxiè nǐ!",""]
var page = 0

func _ready():
	if global.end == true:
		page = dialog.size()-1
		set_bbcode(dialog[page])
	else:
		set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _on_Timer2_timeout():
	set_visible_characters(get_visible_characters()+1)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				
				page += 1
				
				if page == 1:
					var newImageTexture = ImageTexture.new()
					newImageTexture.load("res://Textures/Backgrounds/mother.png")
					get_parent().get_parent().set_texture(newImageTexture)
					
				set_bbcode(dialog[page])
				set_visible_characters(0)
				if global.end == true:
					get_tree().change_scene("res://Scenes/Splash.tscn")
				elif page == dialog.size()-1:
					get_tree().change_scene("res://Scenes/HomeA.tscn")
		else:
			set_visible_characters(get_total_character_count())