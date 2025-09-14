instance_create_layer(
        irandom(room_width),  // posição X aleatória
        irandom(room_height), // posição Y aleatória
        "Instances",          // camada
        obj_star              // objeto estrela
    );
	
instance_destroy();
