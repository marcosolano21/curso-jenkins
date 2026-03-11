#!/bin/bash

echo "Activando el entorno virtual"
source venv/Scripts/activate

echo "Instalando dependencias"
pip install -r requirements.txt

echo "********** Ejecutando pruebas con pytest ***************"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas, revisar en reports"
