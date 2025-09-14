/// obj_rock - Create
// Sprites (round e square), grandes/pequenos e detalhados
spr_meteor         = [meteor_large, meteor_small, meteor_squareLarge, meteor_squareSmall];
spr_meteor_detail  = [meteor_detailedLarge, meteor_detailedSmall, meteor_squareDetailedLarge, meteor_squareDetailedSmall];

// Aleatoriedade de forma (0 = round, 1 = square); começar grande
var form = irandom(1);
if (form == 0) {
    sprite_index = meteor_large;         // round grande
} else {
    sprite_index = meteor_squareLarge;   // square grande
}

// Estado de hits
hit_state = 0;

// Movimento inicial aleatório
speed       = 1;
direction   = random(360);
image_angle = random(360);
