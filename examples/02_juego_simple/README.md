# Juego Simple en Gemix

Este ejemplo muestra cómo crear un juego básico con movimiento y colisiones en Gemix.

## Conceptos demostrados

1. **Variables globales y locales**
   - Uso de la sección `GLOBAL` para declarar variables accesibles en todo el programa
   - Inicialización de variables en la sección `LOCAL`

2. **Control de entrada del usuario**
   - Detección de teclas con la función `key()`
   - Movimiento del personaje basado en entrada del usuario

3. **Dibujo en pantalla**
   - Limpieza de la pantalla con `clear_screen()`
   - Dibujo de formas geométricas con `draw_box()` y `draw_circle()`
   - Mostrar texto con la función `write()`

4. **Procesos y funciones**
   - Definición de un proceso con `PROCESS nuevo_objetivo()`
   - Definición de una función con `FUNCTION colision()`
   - Llamada a procesos y funciones

5. **Detección de colisiones**
   - Implementación básica de detección de colisiones entre objetos

6. **Bucle principal del juego**
   - Uso de `WHILE` para crear el bucle principal
   - Uso de `FRAME` para sincronizar la actualización de la pantalla

## Cómo jugar

- Utiliza las teclas de dirección para mover el cuadrado (jugador)
- Intenta tocar los círculos (objetivos) para ganar puntos
- Presiona ESC para salir del juego

## Personalización

Puedes modificar este ejemplo para:
- Cambiar la velocidad del jugador (variable `vel`)
- Modificar el tamaño de la pantalla (variables `ancho` y `alto`)
- Añadir obstáculos o enemigos
- Implementar un sistema de vidas
- Añadir efectos de sonido o música