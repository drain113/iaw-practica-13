#!/bin/bash

    # Crea un grupo de seguridad para las máquinas del Backend con el nombre backend-sg.
    # Añada las siguientes reglas al grupo de seguridad:
    #    - Acceso SSH (puerto 22/TCP) desde cualquier dirección IP.
    #    - Acceso al puerto 3306/TCP desde cualquier dirección IP.

#------------------------------------------------------------------------------------------------------
# Limpiar pantalla y ver salida de comandos
clear
set -x

# Deshabilitar la paginación de la salida de los comandos de AWS CLI
# Referencia: https://docs.aws.amazon.com/es_es/cli/latest/userguide/cliv2-migration.html#cliv2-migration-output-pager
export AWS_PAGER=""

# Crear el grupo de seguridad: backend-sg
aws ec2 create-security-group \
    --group-name sg-backend \
    --description "Reglas para el backend"

# Crear regla de  SSH
aws ec2 authorize-security-group-ingress \
    --group-name sg-backend \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0

# Crear regla de accesso  MySQL
aws ec2 authorize-security-group-ingress \
    --group-name sg-backend \
    --protocol tcp \
    --port 3306 \
    --cidr 0.0.0.0/0
