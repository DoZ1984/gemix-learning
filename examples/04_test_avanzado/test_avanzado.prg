// test_avanzado.prg
// Ejemplo que muestra varias características avanzadas de Gemix

PROGRAM test_avanzado;

GLOBAL
    // Constantes
    CONST
        MAX_ELEMENTOS = 10;
        GRAVEDAD = 0.5;
    END
    
    // Estructuras
    STRUCT tParticula
        int x, y;           // Posición
        int vx, vy;         // Velocidad
        int color;          // Color
        int tiempo_vida;    // Tiempo de vida
    END
    
    // Variables globales
    tParticula particulas[MAX_ELEMENTOS];
    int num_particulas = 0;
    int tiempo = 0;
    
PRIVATE
    // Función para inicializar una partícula
    FUNCTION inicializar_particula(int indice)
    BEGIN
        particulas[indice].x = 400;
        particulas[indice].y = 300;
        particulas[indice].vx = rand(-10, 10);
        particulas[indice].vy = rand(-15, -5);
        particulas[indice].color = rand(1, 15);
        particulas[indice].tiempo_vida = rand(50, 150);
    END
    
    // Función para actualizar una partícula
    FUNCTION actualizar_particula(int indice)
    BEGIN
        // Actualizar posición
        particulas[indice].x += particulas[indice].vx;
        particulas[indice].y += particulas[indice].vy;
        
        // Aplicar gravedad
        particulas[indice].vy += GRAVEDAD;
        
        // Decrementar tiempo de vida
        particulas[indice].tiempo_vida--;
        
        // Comprobar si la partícula ha muerto
        IF (particulas[indice].tiempo_vida <= 0)
            inicializar_particula(indice);
        END
    END
    
    // Función para dibujar una partícula
    FUNCTION dibujar_particula(int indice)
    BEGIN
        // Dibujar un punto en la posición de la partícula
        put_pixel(particulas[indice].x, 
                  particulas[indice].y, 
                  particulas[indice].color);
                  
        // Dibujar un pequeño círculo alrededor
        circle(particulas[indice].x, 
               particulas[indice].y, 
               2);
    END
    
    // Función para crear una nueva partícula
    FUNCTION crear_particula()
    BEGIN
        IF (num_particulas < MAX_ELEMENTOS)
            inicializar_particula(num_particulas);
            num_particulas++;
        END
    END

BEGIN
    // Configuración de la pantalla
    set_mode(800, 600);
    set_title("Sistema de Partículas en Gemix");
    
    // Inicializar partículas
    WHILE (num_particulas < MAX_ELEMENTOS)
        crear_particula();
    END
    
    // Bucle principal
    WHILE (NOT key(_ESC))
        // Limpiar pantalla
        clear_screen();
        
        // Actualizar y dibujar partículas
        FROM i = 0 TO num_particulas - 1
            actualizar_particula(i);
            dibujar_particula(i);
        END
        
        // Mostrar información
        write(10, 10, 4, "Sistema de Partículas");
        write(10, 30, 4, "Partículas: " + num_particulas);
        write(10, 50, 4, "Tiempo: " + tiempo);
        write(10, 570, 4, "Pulsa ESC para salir");
        
        // Incrementar tiempo
        tiempo++;
        
        FRAME;
    END
END