enum VEC_INPUT_DEVICE {
	GP_LEFT_STICK,
	GP_RIGHT_STICK,
	KEYS,
	MOUSE,
	FUNCTIONS,
}

enum DEVICE {
	GAMEPAD_ONE = 0,
	GAMEPAD_TWO = 1,
	GAMEPAD_THREE = 2,
	GAMEPAD_FOUR = 3,
	KEYBOARD = -1,
}

enum BTN_TYPE {
	KEYBOARD,
	MOUSE,
	GAMEPAD,
}

function MouseButton(_mb) constructor {
	type = BTN_TYPE.MOUSE;
	button = _mb;
}

function snes_gp_default(_gp_id) {
	gp_id = _gp_id;
	var _up = function() {
		return !gamepad_button_check(gp_id, 12)
			&& !gamepad_button_check(gp_id, 13);
	}

	var _down = function() {
		return gamepad_button_check(gp_id, 13);
	}

	var _left = function() {
		return !gamepad_button_check(gp_id, 14)
			&& !gamepad_button_check(gp_id, 15);
	}
	var _right = function() {
		return gamepad_button_check(gp_id, 15);
	}

	return new PlayerKeyBinding(
		_gp_id,
		new VectorInput(
			VEC_INPUT_DEVICE.FUNCTIONS, 
			_up, 
			_down, 
			_left, 
			_right
		),
		new VectorInput(VEC_INPUT_DEVICE.KEYS, 3, 0, 2, 1),
		gp_shoulderr,
		gp_shoulderl
	);
}

function keyboard_default() {
	return new PlayerKeyBinding(
		DEVICE.KEYBOARD,
		new VectorInput(
			VEC_INPUT_DEVICE.KEYS, 
			ord("W"), 
			ord("S"), 
			ord("A"), 
			ord("D")
		),
		new VectorInput(VEC_INPUT_DEVICE.MOUSE),
		new MouseButton(mb_left),
		ord("E")
	);
}

function keyboard_ply2_default() {
	return new PlayerKeyBinding(
		DEVICE.KEYBOARD,
		new VectorInput(
			VEC_INPUT_DEVICE.KEYS, 
			ord("T"), 
			ord("G"), 
			ord("F"), 
			ord("H")
		),
		new VectorInput(VEC_INPUT_DEVICE.MOUSE),
		new MouseButton(mb_left),
		ord("E")
	);
}

/// @struct VectorInput
/// @param {VEC_INPUT_DEVICE} _vec_input_device - Joystick input type (GP_LEFT_STICK, GP_RIGHT_STICK, KEYS)
/// @param {string} [_up] - Key for up movement (optional)
/// @param {string} [_down] - Key for down movement (optional)
/// @param {string} [_left] - Key for left movement (optional)
/// @param {string} [_right] - Key for right movement (optional)
function VectorInput(_vec_input_device, _up = undefined, _down = undefined, _left = undefined, _right = undefined) constructor {
	vec_input_device = _vec_input_device;
	up = _up;
	down = _down;
	left = _left;
	right = _right;
}

/// @function PlayerKeyBinding
/// @param {string} _device - "keyboard" or "gamepad"
/// @param {struct.VectorInput} _move_vec_input
/// @param {struct.VectorInput} _aim_vec_input
/// @param _shoot_btn
function PlayerKeyBinding(
    _device,
    _move_vec_input,
    _aim_vec_input,
    _shoot_btn,
	_interact_btn
) constructor {
    device = _device;
    move_vec_input = _move_vec_input;
    shoot_btn = _shoot_btn;
	interact_btn = _interact_btn;
    aim_vec_input = _aim_vec_input;

    pressed = function(_key) {
		if (_key == undefined) {
			return false;
		}
		if (variable_struct_exists(_key, "type") && _key.type == BTN_TYPE.MOUSE) {
			return mouse_check_button_pressed(_key.button);
		}
        if (self.device == DEVICE.KEYBOARD) {
            return keyboard_check_pressed(_key);
        } else {
            return gamepad_button_check_pressed(self.device, _key);
        }
    }
		
	released = function(_key) {
		if (_key == undefined) {
			return false;
		}
        if (self.device == DEVICE.KEYBOARD) {
            return keyboard_check_released(_key);
        } else {
            return gamepad_button_check_released(self.device, _key);
        }
    }
		
	is_down = function(_key, _vec_input_device) {
		if (_key == undefined) {
			return false;
		}
		if (_vec_input_device == VEC_INPUT_DEVICE.FUNCTIONS) {
			return _key();
		}
        if (self.device == DEVICE.KEYBOARD) {
            return keyboard_check(_key);
        } else {
            return gamepad_button_check(self.device, _key);
        }
    }
		
	shoot = function() {
		return self.pressed(self.shoot_btn);
	}
	
	interact = function() {
		return self.pressed(self.interact_btn);
	}
	
	function get_unit_vec(_vec_input) {
		var v = new Vec2(0,0);
		show_debug_message("device:"+string(_vec_input.vec_input_device));
		if (_vec_input.vec_input_device == VEC_INPUT_DEVICE.GP_LEFT_STICK) {
			v.x = gamepad_axis_value(device, gp_axislh);
			v.y = gamepad_axis_value(device, gp_axislv);
		} else if (_vec_input.vec_input_device == VEC_INPUT_DEVICE.GP_RIGHT_STICK) {
			v.x = gamepad_axis_value(device, gp_axisrh);
			v.y = gamepad_axis_value(device, gp_axisrv);
		} else {
			var _right = is_down(_vec_input.right,_vec_input.vec_input_device);
			var _left = is_down(_vec_input.left, _vec_input.vec_input_device);
			var _up = is_down(_vec_input.up,_vec_input.vec_input_device);
			var _down = is_down(_vec_input.down,_vec_input.vec_input_device);
			show_debug_message("isDown("+string(_vec_input.down)+"):" + string(_down));
			if (_right == 0 && _left == 0 && _up == 0 && _down == 0) {
				return v;
			}
			show_debug_message("right:" + string(_right)+ "_left" + string(_left )+ "_up" +string(_up )+ "_down" + string(_down));
			var xx = _right - _left;
			var yy = _down - _up;
			
			var _dir = point_direction(0,0,xx,yy);
			v.x = lengthdir_x(1, _dir); 
			v.y = lengthdir_y(1, _dir);
		}

		return v;
	}
	
	move_vec = function() {
		return get_unit_vec(move_vec_input);
	}
	
	aim_vec = function() {
		if (aim_vec_input.vec_input_device == VEC_INPUT_DEVICE.MOUSE) {
			return new Vec2(mouse_x, mouse_y);
		}
		return get_unit_vec(aim_vec_input);
	}
	
}
