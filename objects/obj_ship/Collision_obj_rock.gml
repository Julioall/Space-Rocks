// normal da colisão: da pedra -> nave
var nx = x - other.x;
var ny = y - other.y;
var len = point_distance(0, 0, nx, ny);
if (len <= 0) { nx = 1; ny = 0; len = 1; }
nx /= len; ny /= len;

// 1) separar (sair da sobreposição)
var sep_steps = ceil(max(4, speed)); // empurra no mínimo 4 px, ou proporcional à velocidade
repeat (sep_steps) {
    if (!place_meeting(x, y, obj_rock)) break;
    x += nx;
    y += ny;
}

// 2) refletir velocidade (rebote físico simples)
var vx = hspeed;
var vy = vspeed;
var dot = vx*nx + vy*ny;      // projeção na normal
vx = vx - 2*dot*nx;           // v' = v - 2*(v·n)*n
vy = vy - 2*dot*ny;

// amortecimento + empurrão extra para longe da rocha
hspeed = vx * bounce + nx * recoil_push;
vspeed = vy * bounce + ny * recoil_push;

// 3) dano com i-frames para não “moer” vida em sobreposição
if (i_frames <= 0) {
    hp -= 5;// ajuste conforme o jogo
    i_frames = 20;    // ~0,33s a 60 FPS
}
