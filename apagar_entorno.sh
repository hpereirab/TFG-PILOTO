#!/bin/bash
echo ""
echo "apagando el servicio de guacamole y los puestos de trabajo..."
echo ""
docker-compose -f lab-compose.yaml -f guacamole-compose.yml down
echo ""
echo "Entorno de trabajo apagado."
