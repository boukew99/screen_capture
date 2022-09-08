extends HBoxContainer

func _on_Preview_pressed():
	$Preview/ScreenCapture.capture()
	$Preview/ScreenCapture.capture( $Fixed.get_global_rect() )
	
	
func _on_FileDialog_pressed():
	$FileDialog/ScreenCapture.popup_centered()


func _on_Fixed_pressed():
	# captures the specific rectangle of the Control the script is on
	$Fixed.capture()
