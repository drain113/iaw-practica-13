#!/bin/bash

clear
set -x

# Crear un script para crear la infraestructura de la práctica 9.


# Deshabilitamos la paginación de la salida de los comandos de AWS CLI
# Referencia: https://docs.aws.amazon.com/es_es/cli/latest/userguide/cliv2-migration.html#cliv2-migration-output-pager
export AWS_PAGER=""

#------------------------------------------------------------------------------------------------------
# Variables
AMI_ID=ami-06878d265978313ca
COUNT=1
INSTANCE_TYPE=t2.micro
KEY_NAME=vockey

INSTANCE_NAME_LOAD_BALANCER=loadbalancer
INSTANCE_NAME_FRONTEND_01=frontend-01
INSTANCE_NAME_FRONTEND_02=frontend-02
INSTANCE_NAME_BACKEND=backend
INSTANCE_NAME_NFS=nfs

SECURITY_GROUP_BACKEND=backend-sg
SECURITY_GROUP_FRONTEND=frontend-sg
SECURITY_GROUP_LOAD_BALANCER=loadbalancer-sg
SECURITY_GROUP_NFS=nfs-sg

#------------------------------------------------------------------------------------------------------

# Crear grupos de seguridad

#-----------------------------
# Frontend

aws ec2 create-security-group \
    --group-name $SECURITY_GROUP_FRONTEND \
    --description "Reglas para el Frontend"

# Crear regla de  HTTP
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_FRONTEND \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

# Crear regla de  SSH
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_FRONTEND \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
#-----------------------------

#-----------------------------
# Backend

aws ec2 create-security-group \
    --group-name $SECURITY_GROUP_BACKEND \
    --description "Reglas para el backend"

# Creamos una regla de accesso SSH
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_BACKEND \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0

# Creamos una regla de accesso para MySQL
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_BACKEND \
    --protocol tcp \
    --port 3306 \
    --cidr 0.0.0.0/0
#-----------------------------

#-----------------------------
# Load Balancer

aws ec2 create-security-group \
    --group-name $SECURITY_GROUP_LOAD_BALANCER \
    --description "Reglas para el Frontend"

# Crear regla de  HTTPS
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_LOAD_BALANCER \
    --protocol tcp \
    --port 443 \
    --cidr 0.0.0.0/0

# Crear regla de  HTTP
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_LOAD_BALANCER \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

# Crear regla de  SSH
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_LOAD_BALANCER \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
#-----------------------------

#-----------------------------
# NFS

aws ec2 create-security-group \
    --group-name $SECURITY_GROUP_NFS \
    --description "Reglas para el Frontend"

# Crear regla de NFS
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_NFS \
    --protocol tcp \
    --port 2049 \
    --cidr 0.0.0.0/0

# Crear regla de  SSH
aws ec2 authorize-security-group-ingress \
    --group-name $SECURITY_GROUP_NFS \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
#-----------------------------

#------------------------------------------------------------------------------------------------------

# Crear instancias

# Creamos una intancia EC2 para el balanceador de carga
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_LOAD_BALANCER \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_LOAD_BALANCER}]"

# Creamos una intancia EC2 para el frontend-01
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_FRONTEND \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_FRONTEND_01}]"

# Creamos una intancia EC2 para el frontend-02
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_FRONTEND \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_FRONTEND_02}]"

# Creamos una intancia EC2 para el backend
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_BACKEND \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_BACKEND}]"
#------------------------------------------------------------------------------------------------------





