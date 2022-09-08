extends Control

# for bounding_rect Control.get_global_rect() is useful :)
func capture(bounding_rect = get_global_rect() ): 
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(VisualServer, "frame_post_draw")

	var capture = get_viewport().get_texture().get_data()
	capture.flip_y() 
	var time = Time.get_datetime_string_from_system(false, true)
	capture.get_rect(bounding_rect).save_png("Screenshot from "+ time + ".png")

