extends FileDialog

# defers capturing till a path is selected
var crop_rect = Rect2(Vector2.ZERO, OS.window_size) 

func _on_ScreenCapture_file_selected(path):
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(VisualServer, "frame_post_draw")

	var image = get_viewport().get_texture().get_data()
	image.flip_y() 
	image.get_rect(crop_rect).save_png(path)
	
	$Captured.play()
