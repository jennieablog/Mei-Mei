extends RichTextLabel

var dialog = ["You have nothing to do here...","Mei is still asleep...","Mei is taking a nap..."]

func _ready():
	#print("ready rs")
	#print(str(global.roomState))
	#print(str(global.nowTime))
	if global.nowTime == 0:
		set_bbcode(dialog[1])
	elif global.nowTime == 5:
		set_bbcode(dialog[2])
	else:
		set_bbcode(dialog[0])
	set_visible_characters(0)
	set_process_input(true)
	
func _on_Timer1_timeout():
	set_visible_characters(get_visible_characters()+1)

func _on_Button_pressed():
	if global.nowTime == 0 or global.nowTime == 5:
		global.nowTime += 1
	get_tree().change_scene("res://Scenes/HomeA.tscn")
