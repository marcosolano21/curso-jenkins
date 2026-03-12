#!/bin/bash
echo "*****  Iniciando ejecucion de pruebas en Jenkins  *******"

# Verificar si el entorno virtual existe

if [ ! -d "venv" ]; then
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


# Verificar si pip esta instalado correctamente
echo "Instalando dependencias"
pip install --upgrade pip --break-system=packages
pip install -r requirements.txt --break-system-packages


echo "********** Ejecutando pruebas con pytest ***************"
pwd
ls -l

venv/Scripts/python -m pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas, revisar en reports"
