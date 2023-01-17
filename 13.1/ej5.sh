#!/bin/bash
# Escriba un script de bash que muestre el nombre de todas instancias EC2 que tiene en ejecución junto a su dirección IP pública.

#------------------------------------------------------------------------------------------------------

# Limpiar pantalla y ver salida de comandos
clear
set -x

# Mostrar el nombre de instancias EC2
aws ec2 describe-instances --filters "Name=tag:Name,Values=frontend-01" --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value|[0],PrivateIpAddress]" --output table