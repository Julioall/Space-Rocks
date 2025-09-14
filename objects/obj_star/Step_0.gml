move_wrap(true, true, 100);

// Direção e rotação aleatórias
image_angle = -90;

// aumenta gradualmente até atingir o tamanho alvo
if (scale_current < scale_target) {
    scale_current += 0.001; // velocidade de crescimento
    if (scale_current > scale_target) {
        scale_current = scale_target; // trava no alvo
    }
    
    image_xscale = scale_current;
    image_yscale = scale_current;
}