// Escolhe um sprite aleatório
// tamanho alvo aleatório entre 0.1 e 0.3
scale_target  = random_range(0.1, 0.3);

// escala inicial = invisível
scale_current = 0;

image_xscale = scale_current;
image_yscale = scale_current;

sprite_index = choose(star_large, star_medium, star_small, star_tiny);

// Ajusta a velocidade de acordo com o sprite
switch (sprite_index) {
    case star_large:
        speed = 0.5;  // estrela grande = mais lenta
        break;

    case star_medium:
        speed = 1.0;  // estrela média = velocidade intermediária
        break;

    case star_small:
        speed = 2.0;  // estrela pequena = mais rápida
        break;
	case star_tiny:
		speed = 2.5;
		break
}

// Direção e rotação aleatórias
direction   = random(360);
image_angle = random(360);
