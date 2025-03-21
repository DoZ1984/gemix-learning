# Guía Básica de Gemix

Gemix es un lenguaje de programación retrocompatible con Div Games Studio, diseñado para facilitar la creación de juegos y aplicaciones multimedia.

## Estructura básica de un programa Gemix

```
PROGRAM nombre_programa;

GLOBAL
    // Variables globales accesibles en todo el programa
    
LOCAL
    // Inicialización de variables
    
PRIVATE
    // Variables privadas para el proceso actual
    
BEGIN
    // Código principal del programa
    
    WHILE (condición)
        // Bucle principal
        
        FRAME; // Actualizar pantalla
    END
END
```

## Tipos de datos

- `int`: Números enteros
- `float`: Números decimales
- `string`: Cadenas de texto
- `byte`: Enteros de 8 bits (0-255)
- `word`: Enteros de 16 bits (0-65535)
- `struct`: Estructuras de datos personalizadas

## Variables y constantes

```
GLOBAL
    int x, y;         // Variables enteras
    float velocidad;  // Variable decimal
    string nombre;    // Cadena de texto
    
    CONST
        GRAVEDAD = 9.8;  // Constante
    END
```

## Operadores

- Aritméticos: `+`, `-`, `*`, `/`, `%` (módulo)
- Comparación: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Lógicos: `AND`, `OR`, `NOT`, `XOR`
- Asignación: `=`, `+=`, `-=`, `*=`, `/=`

## Estructuras de control

### Condicionales

```
IF (condición)
    // Código a ejecutar si la condición es verdadera
ELSE
    // Código a ejecutar si la condición es falsa
END

SWITCH (variable)
    CASE valor1:
        // Código para valor1
        BREAK;
    CASE valor2:
        // Código para valor2
        BREAK;
    DEFAULT:
        // Código por defecto
END
```

### Bucles

```
WHILE (condición)
    // Código a repetir mientras la condición sea verdadera
    FRAME;
END

REPEAT
    // Código a repetir
    FRAME;
UNTIL (condición);

FOR (i=0; i<10; i++)
    // Código a repetir
    FRAME;
END

LOOP
    // Bucle infinito
    IF (condición) BREAK; END
    FRAME;
END
```

## Procesos y funciones

### Procesos

```
PROCESS nombre_proceso(parámetros)
PRIVATE
    // Variables privadas
BEGIN
    // Código del proceso
    
    WHILE (condición)
        // Bucle principal del proceso
        FRAME;
    END
END
```

### Funciones

```
FUNCTION nombre_función(parámetros)
PRIVATE
    // Variables privadas
BEGIN
    // Código de la función
    
    RETURN valor;
END
```

## Gráficos

```
// Configurar modo gráfico
set_mode(640, 480);

// Dibujar formas
draw_box(x1, y1, x2, y2, color);
draw_circle(x, y, radio, color);
draw_line(x1, y1, x2, y2, color);

// Mostrar texto
write(x, y, color, "Texto");

// Cargar y mostrar imágenes
id_gráfico = load_image("ruta/imagen.png");
put_image(id_gráfico, x, y);
```

## Sonido y música

```
// Cargar y reproducir sonidos
id_sonido = load_sound("ruta/sonido.wav");
play_sound(id_sonido, volumen);

// Cargar y reproducir música
id_música = load_music("ruta/musica.mp3");
play_music(id_música, volumen);
```

## Control de entrada

```
// Comprobar si una tecla está pulsada
IF (key(_ESC)) 
    // La tecla ESC está pulsada
END

// Comprobar botones del ratón
IF (mouse.left)
    // Botón izquierdo del ratón pulsado
END

// Obtener posición del ratón
x_ratón = mouse.x;
y_ratón = mouse.y;
```

## Colisiones

```
// Colisión entre dos rectángulos
IF (x1 < x2+ancho2 && x1+ancho1 > x2 && 
    y1 < y2+alto2 && y1+alto1 > y2)
    // Hay colisión
END

// Colisión entre dos círculos
distancia = sqrt(pow(x2-x1, 2) + pow(y2-y1, 2));
IF (distancia < radio1 + radio2)
    // Hay colisión
END
```

## Consejos y buenas prácticas

1. **Organiza tu código**: Divide tu programa en procesos y funciones para mantener el código organizado.

2. **Optimiza el rendimiento**: Evita operaciones costosas dentro del bucle principal.

3. **Gestiona la memoria**: Libera los recursos que ya no necesites.

4. **Comentarios**: Documenta tu código para facilitar su comprensión.

5. **Control de versiones**: Utiliza sistemas como Git para gestionar los cambios en tu código.

6. **Pruebas**: Prueba tu juego frecuentemente para detectar y corregir errores.