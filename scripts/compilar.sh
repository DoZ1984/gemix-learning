#!/bin/bash
# Script para compilar programas Gemix

# Verificar si se proporcionó un archivo
if [ $# -eq 0 ]; then
    echo "Uso: ./compilar.sh ruta/al/archivo.prg"
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
BIN_DIR="$SCRIPT_DIR/../bin"

# Verificar si el compilador existe
if [ ! -f "$BIN_DIR/gemix" ]; then
    echo "Error: No se encuentra el compilador gemix en $BIN_DIR"
    exit 1
fi

# Compilar el programa
echo "Compilando $archivo..."
"$BIN_DIR/gemix" "$archivo"

# Verificar si la compilación fue exitosa
if [ $? -eq 0 ]; then
    echo "Compilación exitosa"
    
    # Obtener el nombre del archivo sin extensión
    nombre_base=$(basename "$archivo" .prg)
    directorio=$(dirname "$archivo")
    ejecutable="$directorio/$nombre_base"
    
    # Verificar si se generó el ejecutable
    if [ -f "$ejecutable" ]; then
        echo "Ejecutable generado: $ejecutable"
        echo "Para ejecutar el programa, usa: $ejecutable"
    else
        echo "Advertencia: No se encontró el ejecutable generado"
    fi
else
    echo "Error durante la compilación"
    exit 1
fi