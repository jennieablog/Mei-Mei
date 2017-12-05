extends RichTextLabel

var dialog = ["Today is a Friday and you are looking for something to do for the weekend...","All of your classes for the day are already done, and so you are now walking towards home along the streets of UP...", "Then, you saw this piece of paper pinned on the wall...", "You gave it some thought...", "Hmmm...", "You do seem to be very fond of children, especially toddlers...", "You seem to be very nice...", "You have lots of patience...", "...that was why you took and passed Chinese 10, right?", "If you're confident of your basic Chinese skills...","Then, this looks like the perfect job for you!", "You decided to call the number as soon as you got home...","And of course, you got the job!",""]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _on_Timer1_timeout():
	set_visible_characters(get_visible_characters()+1)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
				if page == 3:
					var newImageTexture = ImageTexture.new()
					newImageTexture.load("res://Textures/Backgrounds/intro.png")
					get_parent().get_parent().set_texture(newImageTexture)
				elif page == dialog.size()-1:
					get_tree().change_scene("res://Scenes/Mother.tscn")
		else:
			set_visible_characters(get_total_character_count())