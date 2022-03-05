extends FileDialog

var capture_rect = Rect2(Vector2.ZERO, OS.window_size) # useful with $"NodePath".get_global_rect()
	
func _on_ScreenCapture_file_selected(path):
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(VisualServer, "frame_post_draw")

	var image = get_viewport().get_texture().get_data()
	image.flip_y() # capture is y-flipped
	image.get_rect(capture_rect).save_png(path)
	
	$Captured.play()
