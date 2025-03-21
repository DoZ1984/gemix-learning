# Sistema de Partículas en Gemix

Este ejemplo muestra cómo implementar un sistema de partículas básico en Gemix, demostrando varias características avanzadas del lenguaje:

- Uso de constantes
- Definición de estructuras
- Arrays
- Funciones
- Bucles avanzados (FROM-TO)
- Física simple (gravedad)

## Características demostradas

1. **Estructuras de datos personalizadas**: Definición de una estructura `tParticula` para almacenar los datos de cada partícula.
2. **Constantes**: Uso de constantes para definir valores fijos como la gravedad y el número máximo de partículas.
3. **Funciones**: Implementación de funciones para inicializar, actualizar y dibujar partículas.
4. **Matemáticas**: Cálculos para la física de las partículas.
5. **Gráficos**: Dibujo de puntos y círculos para representar las partículas.

## Cómo compilar y ejecutar

```bash
# Desde la raíz del repositorio
./scripts/compilar.sh examples/04_test_avanzado/test_avanzado.prg

# Para ejecutar
./examples/04_test_avanzado/test_avanzado
```

## Controles

- **ESC**: Salir del programa

## Comportamiento esperado

Al ejecutar el programa, verás un sistema de partículas que se generan en el centro de la pantalla, se mueven hacia arriba y luego caen debido a la gravedad. Cuando una partícula termina su tiempo de vida, se reinicia automáticamente.

En la parte superior izquierda se muestra información sobre el número de partículas y el tiempo transcurrido.