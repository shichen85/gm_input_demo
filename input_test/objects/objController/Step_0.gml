/// @description Insert description here
// You can write your code in this editor

switch (mState) {
	case eState.Init: {
		mColour = make_colour_hsv(32 * mPadId, 255, 255);
		mState = eState.Running;
	};
	break;
	
	case eState.Running: {
	};
	break;
	
	case eState.Cleanup: {
		instance_destroy();
	};
	break;
}

if gamepad_button_check_pressed(mPadId, gp_face1){
	echo("gp_face1 pressed");
}