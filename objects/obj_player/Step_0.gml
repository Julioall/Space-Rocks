// Movimento para frente (seta ↑ ou W)
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    motion_add(image_angle+90, 0.2);
}

// Freio (seta ↓ ou S)
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    // Reduz gradualmente a velocidade
    speed = max(0, speed - 0.1);
}

// Rotação para esquerda (seta ← ou A)
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    image_angle -= 4;
}

// Rotação para direita (seta → ou D)
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    image_angle += 4;
}

// Wrap (a nave sai de um lado da tela e aparece do outro)
move_wrap(true, true, 0);

// Reduz cooldown a cada frame
if (fire_cooldown > 0) {
    fire_cooldown -= 0.25;
}

// Metralhadora (botão esquerdo)
if (mouse_check_button(mb_left) && fire_cooldown <= 0) {
    var b = instance_create_layer(x, y, "Instances", obj_bullet);
	b.image_index = Laser_Bullet_1
    b.speed = 12;

    fire_cooldown = 5; // 5 frames de espera (≈0,08s em 60fps)
}