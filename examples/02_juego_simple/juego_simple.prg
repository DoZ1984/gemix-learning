// Juego simple en Gemix
// Este ejemplo muestra cómo crear un juego básico con movimiento y colisiones

PROGRAM juego_simple;

GLOBAL
    int x, y;         // Posición del jugador
    int vel = 5;      // Velocidad del jugador
    int puntos = 0;   // Puntuación
    
    // Posición del objetivo
    int obj_x, obj_y;
    
    // Dimensiones de la pantalla
    int ancho = 640;
    int alto = 480;
    
LOCAL
    // Inicializar posición del jugador
    x = ancho / 2;
    y = alto / 2;
    
    // Inicializar posición del objetivo
    nuevo_objetivo();
    
BEGIN
    // Configuración de la pantalla
    set_mode(ancho, alto);
    set_title("Juego Simple en Gemix");
    
    // Bucle principal del juego
    WHILE (NOT key(_ESC))
        // Borrar pantalla
        clear_screen(0);
        
        // Mover jugador
        IF (key(_RIGHT) && x < ancho - 20) x += vel; END
        IF (key(_LEFT) && x > 0) x -= vel; END
        IF (key(_DOWN) && y < alto - 20) y += vel; END
        IF (key(_UP) && y > 0) y -= vel; END
        
        // Dibujar jugador (un cuadrado)
        draw_box(x, y, x + 20, y + 20, 4);
        
        // Dibujar objetivo (un círculo)
        draw_circle(obj_x, obj_y, 10, 2);
        
        // Comprobar colisión
        IF (colision()) 
            puntos++;
            nuevo_objetivo();
        END
        
        // Mostrar puntuación
        write(10, 10, 0, "Puntos: " + puntos);
        
        // Actualizar pantalla
        FRAME;
    END
END

PROCESS nuevo_objetivo()
BEGIN
    // Generar posición aleatoria para el objetivo
    obj_x = rand(20, ancho - 20);
    obj_y = rand(20, alto - 20);
END

FUNCTION colision()
BEGIN
    // Comprobar si el jugador ha alcanzado el objetivo
    IF (x + 20 > obj_x - 10 && x < obj_x + 10 && 
        y + 20 > obj_y - 10 && y < obj_y + 10)
        RETURN true;
    END
    RETURN false;
END