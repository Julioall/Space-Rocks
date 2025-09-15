// Quantidade inicial de estrelas
for (var i = 0; i < 20; i++) {
    instance_create_layer(
        irandom(room_width),  // posição X aleatória
        irandom(room_height), // posição Y aleatória
        "Instances",          // camada
        obj_star              // objeto estrela
    );
}

