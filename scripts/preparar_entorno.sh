#!/bin/bash
# Script para preparar el entorno de Gemix en Linux
# Este script configura las librerías compartidas y permisos necesarios

# Directorio base del repositorio
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="$BASE_DIR/bin"
MODULES_DIR="$BIN_DIR/modules/linux/release"

echo "=== Preparando entorno para Gemix en Linux ==="
echo "Directorio base: $BASE_DIR"

# Comprobar si se ejecuta como root
if [ "$EUID" -ne 0 ]; then
  echo "Este script necesita permisos de administrador para configurar las librerías."
  echo "Por favor, ejecuta: sudo $0"
  exit 1
fi

# Configurar permisos de ejecución
echo "Configurando permisos de ejecución..."
chmod +x "$BIN_DIR/gemix"
chmod +x "$BASE_DIR/scripts/compilar.sh"
chmod +x "$MODULES_DIR"/*.so

# Crear enlaces simbólicos para las librerías
echo "Creando enlaces simbólicos para librerías compartidas..."
ln -sf "$BIN_DIR/libSDL2-2.0.so.0" /usr/lib/libSDL2-2.0.so.0
ln -sf "$BIN_DIR/libfmod.so.7" /usr/lib/libfmod.so.7
ln -sf "$BIN_DIR/libfmodex-4.44.61.so" /usr/lib/libfmodex-4.44.61.so
ln -sf "$BIN_DIR/libfmodstudio.so.7" /usr/lib/libfmodstudio.so.7

# Actualizar cache de librerías
echo "Actualizando cache de librerías..."
ldconfig

# Verificar que los módulos estén disponibles
echo "Verificando módulos..."
if [ ! -d "$MODULES_DIR" ]; then
  echo "Error: No se encuentra el directorio de módulos: $MODULES_DIR"
  exit 1
fi

# Listar los módulos disponibles
echo "Módulos disponibles:"
ls -la "$MODULES_DIR"

echo "=== Entorno preparado con éxito ==="
echo "Ahora puedes compilar ejemplos con: $BASE_DIR/scripts/compilar.sh ruta/al/archivo.prg"