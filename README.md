# Aprendiendo Gemix

Este repositorio está diseñado para aprender a programar en Gemix, un lenguaje retrocompatible con Div Games Studio que permite crear juegos y aplicaciones multimedia.

## Estado actual del proyecto

Por el momento, puedes utilizar este repositorio con el compilador de Windows si lo tienes disponible.

## ¿Qué es Gemix?

Gemix es un lenguaje de programación y entorno de desarrollo que mantiene compatibilidad con Div Games Studio, permitiendo crear juegos 2D con facilidad. Sus características principales incluyen:

- Sintaxis sencilla y fácil de aprender
- Orientado a la creación de videojuegos
- Soporte para gráficos, sonido y entrada de usuario
- Compatibilidad con código de Div Games Studio
- Disponible para Windows y Linux

## Estructura del repositorio

- `/bin`: Contiene los binarios y módulos necesarios para ejecutar Gemix
- `/modules`: Módulos adicionales para Linux y Windows
- `/examples`: Contiene ejemplos de código Gemix para aprender
- `/docs`: Documentación sobre el lenguaje y tutoriales
- `/scripts`: Scripts útiles para compilar y ejecutar programas Gemix
- `/.github/workflows`: Configuración de GitHub Actions para compilar automáticamente los ejemplos
- `/.devcontainer`: Configuración para GitHub Codespaces

## Desarrollo con GitHub Codespaces (pendiente)

Este repositorio está configurado para trabajar con GitHub Codespaces, lo que te permitirá desarrollar y probar código Gemix directamente desde el navegador sin necesidad de instalar nada localmente.

**Nota**: Esta funcionalidad estará disponible cuando se añada el ejecutable de Gemix para Linux al directorio `/bin`.

## Requisitos previos (para desarrollo local)

Para utilizar este repositorio localmente necesitas:

1. Tener instalado Git para clonar el repositorio
2. Para ejecutar los ejemplos en tu ordenador:
   - En Linux: Necesitas el compilador Gemix para Linux (pendiente de añadir)
   - En Windows: Utiliza los módulos de Windows correspondientes

## Cómo usar este repositorio localmente

1. Clona el repositorio:
   ```
   git clone https://github.com/DoZ1984/gemix-learning.git
   ```

2. Explora los ejemplos en la carpeta `/examples`

3. Consulta la documentación en `/docs` para aprender más sobre Gemix

4. Para ejecutar un ejemplo:
   - En Windows: Utiliza el compilador de Gemix para Windows con los ejemplos

## Ejemplos disponibles

### 1. Hola Mundo
Un programa básico que muestra texto en pantalla.
- Ubicación: `/examples/01_hola_mundo/`

### 2. Juego Simple
Un juego sencillo con movimiento y colisiones.
- Ubicación: `/examples/02_juego_simple/`

### 3. Sprites y Animación
Ejemplo que muestra cómo implementar sprites animados.
- Ubicación: `/examples/03_sprites_animacion/`

## GitHub Actions (pendiente)

Este repositorio está configurado para utilizar GitHub Actions para compilar automáticamente los ejemplos cuando se suben cambios. Esto permitirá verificar que el código funciona correctamente sin necesidad de ejecutarlo localmente.

**Nota**: Esta funcionalidad estará disponible cuando se añada el ejecutable de Gemix para Linux al directorio `/bin`.

## Contribuciones

¡Las contribuciones son bienvenidas! Puedes:

1. Añadir nuevos ejemplos
2. Mejorar la documentación
3. Corregir errores en los ejemplos existentes
4. Añadir tutoriales adicionales

Para contribuir, crea un fork del repositorio, realiza tus cambios y envía un Pull Request.

## Recursos adicionales

- [Documentación de Div Games Studio](http://div-arena.co.uk/)
- [Foro de la comunidad Gemix](https://www.gemixstudio.com/forum/)
- [Guía básica de Gemix](/docs/guia_gemix.md)
