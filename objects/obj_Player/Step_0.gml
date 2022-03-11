var h_move = gamepad_axis_value(pad_num, gp_axislh);
var v_move = gamepad_axis_value(pad_num, gp_axislv);

if ((h_move != 0) || (v_move != 0))
    {
    x += h_move * 4;
    y += v_move * 4;
    }

var h_point = gamepad_axis_value(pad_num, gp_axisrh);
var v_point = gamepad_axis_value(pad_num, gp_axisrv);

if ((h_point != 0) || (v_point != 0))
    {
    var pdir = point_direction(0, 0, h_point, v_point);
    var dif = angle_difference(pdir, image_angle);
    image_angle += median(-20, dif, 20);
    }

var r_trig = gamepad_button_value(pad_num, gp_shoulderrb);
var rate = 1 - r_trig;
if can_shoot && rate < 1
    {
    with (instance_create_layer(x, y, "Instances", obj_Bullet))
        {
        speed = 10;
        direction = other.image_angle;
        image_angle = direction;
        }
    can_shoot = false;
    alarm[0] = max(5, (room_speed * rate));
    }

if gamepad_button_check_pressed(pad_num, gp_face1)
    {
    with (instance_create_layer(x, y, "Instances", obj_Grenade))
        {
        direction = other.image_angle;
        image_angle = direction;
        }
    }