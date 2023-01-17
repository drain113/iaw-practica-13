#!/bin/bash

# Crea una instancia EC2 para la máquina del Backend con las siguientes características.

#     Identificador de la AMI: ami-08e637cea2f053dfa. Esta AMI se corresponde con la imagen Red Hat Enterprise Linux 9 (HVM).
#     Número de instancias: 1
#     Tipo de instancia: t2.micro
#     Clave privada: vockey
#     Grupo de seguridad: backend-sg
#     Nombre de la instancia: backend

#------------------------------------------------------------------------------------------------------
# Variables

SECURITY_GROUP_BACKEND=backend-sg
INSTANCE_NAME_BACKEND=backend

AMI_ID=ami-08e637cea2f053dfa
COUNT=1
INSTANCE_TYPE=t2.micro
KEY_NAME=vockey

#------------------------------------------------------------------------------------------------------
# Limpiar pantalla y ver salida de comandos
clear
set -x

# Deshabilitar la paginación de la salida de los comandos de AWS CLI
# Referencia: https://docs.aws.amazon.com/es_es/cli/latest/userguide/cliv2-migration.html#cliv2-migration-output-pager
export AWS_PAGER=""

# Creamos una intancia EC2 para el backend
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_BACKEND \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_BACKEND}]"
