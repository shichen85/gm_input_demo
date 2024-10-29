CURSOR_LAST_X = round(device_mouse_x_to_gui(0));
CURSOR_LAST_Y = round(device_mouse_y_to_gui(0));
cursor_last_click_x = "0";
cursor_last_click_y = "0";
//display_set_gui_maximise();
keyboard_check_anykey_pressed = function () {
	if os_type != os_uwp{
		return keyboard_check_pressed(vk_anykey);
	}
	else{
		var gamepad_virtual_key_input_detected = false;
		for (var i = 195; i <= 218; i++){
			if keyboard_check_pressed(i){
				gamepad_virtual_key_input_detected = true;
				break;
			}
		}
		if gamepad_virtual_key_input_detected{
			return false;
		}	
		else{
			return keyboard_check_pressed(vk_anykey);
		}
	}
}

keyboard_check_anykey = function () {
	if os_type != os_uwp{
		return keyboard_check(vk_anykey);
	}
	else{
		var gamepad_virtual_key_input_detected = false;
		for (var i = 195; i <= 218; i++){
			if keyboard_check(i){
				gamepad_virtual_key_input_detected = true;
				break;
			}
		}
		if gamepad_virtual_key_input_detected{
			return false;
		}	
		else{
			return keyboard_check(vk_anykey);
		}
	}
}

keyboard_check_anykey_released = function () {
	if os_type != os_uwp{
		return keyboard_check_released(vk_anykey);
	}
	else{
		var gamepad_virtual_key_input_detected = false;
		for (var i = 195; i <= 218; i++){
			if keyboard_check_released(i){
				gamepad_virtual_key_input_detected = true;
				break;
			}
		}
		if gamepad_virtual_key_input_detected{
			return false;
		}	
		else{
			return keyboard_check_released(vk_anykey);
		}
	}
}


