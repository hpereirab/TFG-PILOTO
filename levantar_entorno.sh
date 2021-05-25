#!/bin/bash
echo "Levantando el servicio de guacamole..."
echo ""
docker-compose -f guacamole-compose.yml -f lab-compose.yaml up -d
echo ""
echo "Levantando los puestos de trabajo..."
echo ""
echo "Entorno de trabajo en funcionamiento."
echo ""
