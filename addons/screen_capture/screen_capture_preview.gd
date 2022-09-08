extends ConfirmationDialog

signal captured()
onready var preview = $Preview

# for bounding_rect Control.get_global_rect() is useful :)
func capture(bounding_rect = Rect2(Vector2.ZERO, OS.window_size) ): 
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(VisualServer, "frame_post_draw")

	var capture = get_viewport().get_texture().get_data()
	capture.flip_y()
	
	var texture = ImageTexture.new()
	texture.create_from_image(capture.get_rect(bounding_rect) )
	preview.texture = texture
	
	popup_centered()
	$Captured.play()
	
	emit_signal("captured")
	

func _on_ScreenCapture_confirmed():
	$FileDialog.popup_centered()


func _on_FileDialog_file_selected(path):
	var capture = preview.texture.get_data()
	capture.save_png(path)
