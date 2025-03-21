#!/bin/bash
# Script específico para compilar en GitHub Actions
# Este script maneja mejor las dependencias y errores

# Verificar si se proporcionó un archivo
if [ $# -eq 0 ]; then
    echo "Uso: ./compilar_github.sh ruta/al/archivo.prg"
    exit 1
fi

# Obtener la ruta del archivo
archivo=$1

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "Error: El archivo $archivo no existe"
    exit 1
fi

# Verificar si la extensión es .prg
if [[ "$archivo" != *.prg ]]; then
    echo "Error: El archivo debe tener extensión .prg"
    exit 1
fi

# Obtener la ruta del directorio bin relativa al script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BIN_DIR="$REPO_DIR/bin"

# Configurar LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$BIN_DIR:/usr/local/lib/gemix:$LD_LIBRARY_PATH

# Verificar si el compilador existe
if [ ! -f "$BIN_DIR/gemix" ]; then
    echo "Error: No se encuentra el compilador gemix en $BIN_DIR"
    exit 1
fi

# Verificar que las librerías estén disponibles
echo "Verificando librerías..."
if [ ! -f "$BIN_DIR/libSDL2-2.0.so.0" ]; then
    echo "Advertencia: No se encuentra libSDL2-2.0.so.0"
fi

# Intentar crear enlaces simbólicos si no existen
if [ ! -f "/usr/lib/libSDL2-2.0.so.0" ]; then
    echo "Creando enlaces simbólicos para librerías..."
    sudo mkdir -p /usr/local/lib/gemix
    sudo cp "$BIN_DIR/libSDL2-2.0.so.0" /usr/local/lib/gemix/ || true
    sudo ln -sf /usr/local/lib/gemix/libSDL2-2.0.so.0 /usr/lib/libSDL2-2.0.so.0 || true
    sudo ldconfig || true
fi

# Compilar el programa con manejo de errores detallado
echo "============================================="
echo "Compilando $archivo..."
echo "============================================="

# Mostrar información de entorno
echo "Entorno de compilación:"
echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
echo "Directorio de trabajo: $(pwd)"

# Ejecutar el compilador con timeout para evitar bloqueos
timeout 30s "$BIN_DIR/gemix" "$archivo"
RESULTADO=$?

# Verificar el resultado
if [ $RESULTADO -eq 0 ]; then
    echo "Compilación exitosa"
    
    # Obtener el nombre del archivo sin extensión
    nombre_base=$(basename "$archivo" .prg)
    directorio=$(dirname "$archivo")
    ejecutable="$directorio/$nombre_base"
    
    # Verificar si se generó el ejecutable
    if [ -f "$ejecutable" ]; then
        echo "Ejecutable generado: $ejecutable"
    else
        echo "Advertencia: No se encontró el ejecutable generado"
    fi
elif [ $RESULTADO -eq 124 ]; then
    echo "Error: Tiempo de compilación excedido (timeout)"
    exit 1
else
    echo "Error durante la compilación (código $RESULTADO)"
    exit 1
fi