# Sprites y Animación en Gemix

Este ejemplo demuestra cómo implementar sprites animados en Gemix, una técnica fundamental para crear juegos con gráficos dinámicos.

## Conceptos demostrados

1. **Carga de recursos gráficos**
   - Uso de `load_fpg()` para cargar paquetes de gráficos
   - Gestión de recursos con `unload_fpg()` al finalizar

2. **Animación de sprites**
   - Sistema de frames para animar personajes
   - Control del retardo entre frames para ajustar la velocidad de animación
   - Cambio de dirección del sprite (izquierda/derecha)

3. **Control del tiempo**
   - Implementación de un sistema para controlar los FPS (frames por segundo)
   - Uso de `timer_ticks()` para sincronización

4. **Organización del código**
   - División en procesos específicos para cada tarea:
     - `procesar_entrada()`: Maneja la entrada del usuario
     - `actualizar_posicion()`: Actualiza la posición del personaje
     - `actualizar_animacion()`: Controla la animación del sprite
     - `dibujar_escena()`: Renderiza todos los elementos en pantalla

5. **Detección de límites**
   - Implementación de límites para mantener al personaje dentro de la pantalla

## Estructura del archivo FPG

Este ejemplo asume que tienes archivos FPG (Fichero de Prototipos Gráficos) con la siguiente estructura:

### personaje.fpg
- Gráfico 1-4: Frames de animación mirando a la derecha
- Gráfico 5-8: Frames de animación mirando a la izquierda

### fondo.fpg
- Gráfico 0: Imagen de fondo del juego

## Cómo crear tus propios sprites

Para crear tus propios sprites para este ejemplo, puedes:

1. Usar el editor de Div Games Studio/Gemix para crear tus gráficos
2. Exportarlos como archivos FPG
3. Colocarlos en una carpeta llamada "graficos" en el mismo directorio que el ejecutable

## Extensiones posibles

Este ejemplo básico puede extenderse para incluir:

1. **Animaciones adicionales**
   - Saltar, agacharse, atacar, etc.

2. **Sistema de colisiones**
   - Detección de colisiones con elementos del escenario
   - Interacción con otros personajes o enemigos

3. **Efectos visuales**
   - Partículas, sombras, efectos de luz

4. **Scroll de pantalla**
   - Seguimiento de cámara al personaje
   - Niveles más grandes que la pantalla visible

5. **Sonidos y música**
   - Efectos de sonido para los movimientos
   - Música de fondo