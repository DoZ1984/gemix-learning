// Ejemplo de manejo de sprites y animación en Gemix
// Demuestra cómo cargar y animar sprites en un juego

PROGRAM sprites_animacion;

GLOBAL
    // IDs de los sprites
    int sprite_personaje;
    int sprite_fondo;
    
    // Posición del personaje
    int x = 100;
    int y = 200;
    
    // Velocidad del personaje
    int vel_x = 0;
    int vel_y = 0;
    int velocidad = 3;
    
    // Estado de animación
    int frame_actual = 0;
    int total_frames = 4;
    int retardo_anim = 8;
    int contador_anim = 0;
    
    // Dirección del personaje (0: derecha, 1: izquierda)
    int direccion = 0;
    
    // Dimensiones de la pantalla
    int ancho = 640;
    int alto = 480;
    
    // Control de tiempo
    int fps = 60;
    int timer;
    
LOCAL
    // Inicializar gráficos
    set_mode(ancho, alto);
    set_title("Sprites y Animación en Gemix");
    
    // Cargar sprites (rutas de ejemplo)
    sprite_personaje = load_fpg("graficos/personaje.fpg");
    sprite_fondo = load_fpg("graficos/fondo.fpg");
    
    // Inicializar timer
    timer = 0;
    
BEGIN
    // Bucle principal
    WHILE (NOT key(_ESC))
        // Control del tiempo
        timer++;
        
        // Entrada del usuario
        procesar_entrada();
        
        // Actualizar posición
        actualizar_posicion();
        
        // Actualizar animación
        actualizar_animacion();
        
        // Dibujar escena
        dibujar_escena();
        
        // Controlar FPS
        WHILE (timer_ticks() < timer * 1000 / fps)
            // Esperar
        END
        
        FRAME;
    END
    
    // Liberar recursos
    unload_fpg(sprite_personaje);
    unload_fpg(sprite_fondo);
END

PROCESS procesar_entrada()
BEGIN
    // Reiniciar velocidad
    vel_x = 0;
    vel_y = 0;
    
    // Detectar teclas de dirección
    IF (key(_RIGHT))
        vel_x = velocidad;
        direccion = 0;  // Derecha
    END
    
    IF (key(_LEFT))
        vel_x = -velocidad;
        direccion = 1;  // Izquierda
    END
    
    IF (key(_DOWN))
        vel_y = velocidad;
    END
    
    IF (key(_UP))
        vel_y = -velocidad;
    END
END

PROCESS actualizar_posicion()
BEGIN
    // Actualizar posición del personaje
    x += vel_x;
    y += vel_y;
    
    // Mantener dentro de los límites de la pantalla
    IF (x < 0) x = 0; END
    IF (x > ancho - 32) x = ancho - 32; END
    IF (y < 0) y = 0; END
    IF (y > alto - 32) y = alto - 32; END
END

PROCESS actualizar_animacion()
BEGIN
    // Si el personaje está en movimiento, animar
    IF (vel_x != 0 OR vel_y != 0)
        contador_anim++;
        
        IF (contador_anim >= retardo_anim)
            contador_anim = 0;
            frame_actual = (frame_actual + 1) % total_frames;
        END
    ELSE
        // Si está quieto, usar frame de reposo
        frame_actual = 0;
    END
END

PROCESS dibujar_escena()
BEGIN
    // Limpiar pantalla
    clear_screen(0);
    
    // Dibujar fondo
    put_screen(sprite_fondo, 0);
    
    // Dibujar personaje
    // Los gráficos 1-4 son animación derecha, 5-8 son animación izquierda
    int grafico_base = direccion * total_frames + 1;
    put_sprite(sprite_personaje, grafico_base + frame_actual, x, y);
    
    // Mostrar información
    write(10, 10, 0, "Usa las flechas para mover al personaje");
    write(10, 25, 0, "Presiona ESC para salir");
    
    // Mostrar FPS
    write(ancho - 50, 10, 0, "FPS: " + fps);
END