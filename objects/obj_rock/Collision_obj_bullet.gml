/// obj_rock - Collision with obj_bullet

// remove projétil e efeito
instance_destroy(other);
effect_create_above(ef_firework, x, y, 1, c_white);

// leve “chacoalho” de direção
direction = random(360);

// ===== helpers rápidos por família =====
var is_round_large     = (sprite_index == meteor_large || sprite_index == meteor_detailedLarge);
var is_square_large    = (sprite_index == meteor_squareLarge || sprite_index == meteor_squareDetailedLarge);
var is_round_small     = (sprite_index == meteor_small || sprite_index == meteor_detailedSmall);
var is_square_small    = (sprite_index == meteor_squareSmall || sprite_index == meteor_squareDetailedSmall);

// ===== progressão por estado =====
if (hit_state == 0) {
    // 1º hit: grande → grande detalhado (mesma família)
    if (is_round_large)  sprite_index = meteor_detailedLarge;
    if (is_square_large) sprite_index = meteor_squareDetailedLarge;
    hit_state = 1;
}
else if (hit_state == 1) {
    // 2º hit: grande detalhado → dois pequenos (mesma família)

    // decide sprite pequeno da mesma família
    var spr_small = (is_round_large) ? meteor_small : meteor_squareSmall;

    // 1) este meteoro vira pequeno
    sprite_index = spr_small;

    // 2) cria o segundo pequeno
    var other_small = instance_create_layer(x, y, "Instances", obj_rock);
    other_small.sprite_index = spr_small;

    // estado: ambos já estão no estágio "pequeno"
    hit_state = 2;
    other_small.hit_state = 2;

    // separa um pouquinho para não ficarem sobrepostos
    var ang = irandom(359);
    var off = 10;
    other_small.x += lengthdir_x(off, ang);
    other_small.y += lengthdir_y(off, ang);

    // dá direções/velocidades diferentes para espalhar
    direction   = random(360);
    other_small.direction = random(360);

    // velocidades típicas de “small”
    speed = 1.6 + random(0.6);
    other_small.speed = 1.6 + random(0.6);

    // rotação visual
    image_angle = random(360);
    other_small.image_angle = random(360);
}

else if (hit_state == 2) {
    // 3º hit: pequeno → pequeno detalhado (mesma família)
    if (is_round_small)  sprite_index = meteor_detailedSmall;
    if (is_square_small) sprite_index = meteor_squareDetailedSmall;
    hit_state = 3;
}
else {
    // 4º hit: pequeno detalhado → explode (fim)
    // (spawns serão controlados pelo obj_game ou aqui, se quiser)

    // Se quiser respawn local (máx. 12 na room):
    if (instance_number(obj_rock) < 12) {
        // Decide família com base no sprite atual (round vs square)
        var is_round_family =
            (sprite_index == meteor_small) || (sprite_index == meteor_detailedSmall) ||
            (sprite_index == meteor_large) || (sprite_index == meteor_detailedLarge);

        var spr_big = is_round_family ? meteor_large : meteor_squareLarge;

        // Cria um novo meteoro grande na borda da sala
        var side = irandom(3); // 0=esq, 1=dir, 2=topo, 3=base
        var nx, ny;
        switch (side) {
            case 0: nx = -100;            ny = irandom(room_height); break;
            case 1: nx = room_width + 100;ny = irandom(room_height); break;
            case 2: nx = irandom(room_width); ny = -100;            break;
            default:nx = irandom(room_width); ny = room_height + 100; break;
        }

        var m = instance_create_layer(nx, ny, "Instances", obj_rock);
        m.sprite_index = spr_big;
        m.hit_state    = 0;             // volta ao ciclo "grande"
        m.speed        = 1 + random(0.5);
        m.direction    = point_direction(nx, ny, room_width * 0.5, room_height * 0.5); // entra na sala
        m.image_angle  = random(360);
    }

    // Destroi o meteoro atual (o que levou o 4º hit)
    instance_destroy();
}

