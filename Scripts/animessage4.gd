extends RichTextLabel

var dialog = ["You have nothing to do here..."]

func _ready():
	set_bbcode(dialog[0])
	set_visible_characters(0)
	set_process_input(true)

func _on_Timer1_timeout():
	set_visible_characters(get_visible_characters()+1)

func _on_Button_pressed():
	if global.nowTime == 2 or global.nowTime == 4:
		global.nowTime += 1
	get_tree().change_scene("res://Scenes/HomeA.tscn")