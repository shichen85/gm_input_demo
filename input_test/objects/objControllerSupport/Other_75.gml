/// @description Pick up the pad settings here
var type = ds_map_find_value(async_load, "event_type");

if (type == "gamepad discovered") {
	var pad_index = ds_map_find_value(async_load, "pad_index");

	// Lets see if we already have one - as Joy-Con Duals can come in as *two* connect events
	var instCount = instance_number(objController);
	var controller = undefined;
	for (var i = 0; i < instCount; ++i) {
		var iController = instance_find(objController, i);
		if (iController.mPadId == pad_index) {
			controller = iController;
			break;
		}
	}

	var deviceType = gamepad_get_description(pad_index);

	show_debug_message("New Gamepad [" + string(pad_index) + "] - " + deviceType);
	
	if (undefined != controller) { // we already have a controller, check if it's a Joy-Con Dual and we've just connected half
		if ("Joy-Con" == deviceType && switch_controller_joycon_dual == controller.mType) {
			controller.mJoyCons[@ 0] = switch_controller_joycon_left_connected(pad_index);
			controller.mJoyCons[@ 1] = switch_controller_joycon_right_connected(pad_index);
			exit;
		}
	}
	
	var controller = instance_create_layer(x, y, layer, objController);
	controller.mPadId = pad_index;
	switch (deviceType) {
		case "Handheld": controller.mType = switch_controller_handheld; break;
		case "Joy-Con (L)": controller.mType = switch_controller_joycon_left; break;
		case "Joy-Con (R)":	controller.mType = switch_controller_joycon_right; break;
		case "Pro Controller": controller.mType = switch_controller_pro_controller; break;
		case "Joy-Con": {
			controller.mType = switch_controller_joycon_dual;
			controller.mJoyCons[@ 0] = switch_controller_joycon_left_connected(pad_index);
			controller.mJoyCons[@ 1] = switch_controller_joycon_right_connected(pad_index);
		};
		break;
	}
}

if (type == "gamepad lost") {
	var pad_index = ds_map_find_value(async_load, "pad_index");

	// Lets see if we already have one - as Joy-Con Duals can come in as *two* connect events
	var instCount = instance_number(objController);
	var controller = undefined;
	for (var i = 0; i < instCount; ++i) {
		var iController = instance_find(objController, i);
		if (iController.mPadId == pad_index) {
			controller = iController;
			break;
		}
	}

	var deviceType = gamepad_get_description(pad_index);
	
	if (undefined != controller) {
		if ("Joy-Con" == deviceType && switch_controller_joycon_dual == controller.mType) {
			controller.mJoyCons[@ 0] = switch_controller_joycon_left_connected(pad_index);
			controller.mJoyCons[@ 1] = switch_controller_joycon_right_connected(pad_index);
			if (true == controller.mJoyCons[0] || true == controller.mJoyCons[1]) // only half disconnected
				exit;
		}
		show_debug_message("Destroying controller: " + deviceType + " in slot " + string(pad_index));
		controller.mState = eState.Cleanup;
	}
}