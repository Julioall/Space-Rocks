// Mirar para o mouse
image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;


// Avançar (W/↑ ou botão direito)
if (keyboard_check(vk_up) || keyboard_check(ord("W")) || mouse_check_button(mb_right)) {
    motion_add(image_angle + 90, 0.1);
	var b = instance_create_layer(x, y, "Instances", obj_effect);
}

// Freio (S/↓)
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
     motion_add(image_angle + 90, -0.1);
}

// Wrap
move_wrap(true, true, 0);

// Cooldown do tiro
if (fire_cooldown > 0) fire_cooldown -= 0.25;

// Metralhadora (botão esquerdo)
if (mouse_check_button(mb_left) && fire_cooldown <= 0) {
    var b = instance_create_layer(x, y, "Instances", obj_bullet);
    b.speed = 35;
    fire_cooldown = 3;
}

if (i_frames > 0) i_frames--;


