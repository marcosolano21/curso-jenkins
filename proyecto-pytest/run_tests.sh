#!/bin/bash
echo "*****  Iniciando ejecucion de pruebas en Jenkins  *******"

# Verificar si el entorno virtual existe

if[ ! -d "venv" ]; then
    echo" Creando entorno virtual...."
    python3 -m venv venv

fi

# Activar el entorno virtual correctamente

if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then  # Para Windows
    source venv/Scripts/activate
else
    echo "Error al activar entorno virtual"
    exit 
fi



echo "Activando el entorno virtual"

source venv/bin/activate

echo "Instalando dependencias"
pip install --upgrade pip
pip install -r requirements.txt

echo "********** Ejecutando pruebas con pytest ***************"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas, revisar en reports"
