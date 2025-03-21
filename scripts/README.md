# Scripts de utilidad para Gemix

Esta carpeta contiene scripts útiles para facilitar el desarrollo con Gemix.

## Scripts disponibles

### compilar.sh

Script para compilar programas Gemix desde la línea de comandos.

#### Uso

```bash
./scripts/compilar.sh ruta/al/archivo.prg
```

#### Ejemplo

```bash
./scripts/compilar.sh examples/01_hola_mundo/hola_mundo.prg
```

#### Funcionalidad

1. Verifica que el archivo exista y tenga extensión .prg
2. Comprueba que el compilador de Gemix esté disponible
3. Compila el programa
4. Muestra información sobre el ejecutable generado

#### Requisitos

- Tener los binarios de Gemix en la carpeta `/bin`
- Permisos de ejecución para el script:
  ```bash
  chmod +x scripts/compilar.sh
  ```

## Cómo añadir nuevos scripts

Si deseas contribuir con nuevos scripts:

1. Crea un nuevo archivo en esta carpeta con extensión .sh para Bash o .bat para Windows
2. Asegúrate de que el script tenga comentarios explicativos
3. Actualiza este README.md para documentar su uso
4. Envía un Pull Request con tus cambios