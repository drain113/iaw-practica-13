#!/bin/bash

# Crear un script para crear la infraestructura de la práctica 9.

#------------------------------------------------------------------------------------------------------
# Variables
Ubuntu_AMI_ID=ami-06878d265978313ca
COUNT=1
INSTANCE_TYPE=t2.micro
KEY_NAME=vockey

INSTANCE_NAME_LOAD_BALANCER=loadbalancer
INSTANCE_NAME_FRONTEND_01=frontend-01
INSTANCE_NAME_FRONTEND_02=frontend-02
INSTANCE_NAME_BACKEND=backend
INSTANCE_NAME_NFS=nfs

SECURITY_GROUP_BACKEND=sg-backend
SECURITY_GROUP_FRONTEND=sg-frontend
SECURITY_GROUP_LOAD_BALANCER=sg-loadbalancer
SECURITY_GROUP_LOAD_NFS=sg-nfs

#------------------------------------------------------------------------------------------------------

# Crear grupos de seguridad

#-----------------------------
# Frontend

aws ec2 create-security-group \
    --group-name sg-frontend \
    --description "Reglas para el Frontend"

# Crear regla de  HTTP
aws ec2 authorize-security-group-ingress \
    --group-name sg-frontend \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

# Crear regla de  SSH
aws ec2 authorize-security-group-ingress \
    --group-name sg-frontend \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
#-----------------------------

#-----------------------------
# Backend

aws ec2 create-security-group \
    --group-name sg-backend \
    --description "Reglas para el Backend"

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
#-----------------------------

#-----------------------------
# Load Balancer

aws ec2 create-security-group \
    --group-name sg-loadbalancer \
    --description "Reglas para el Frontend"

# Crear regla de  HTTPS
aws ec2 authorize-security-group-ingress \
    --group-name sg-loadbalancer \
    --protocol tcp \
    --port 443 \
    --cidr 0.0.0.0/0

# Crear regla de  HTTP
aws ec2 authorize-security-group-ingress \
    --group-name sg-loadbalancer \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

# Crear regla de  SSH
aws ec2 authorize-security-group-ingress \
    --group-name sg-loadbalancer \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
#-----------------------------

#-----------------------------
# NFS

aws ec2 create-security-group \
    --group-name sg-nfs \
    --description "Reglas para el Frontend"

# Crear regla de NFS
aws ec2 authorize-security-group-ingress \
    --group-name sg-nfs \
    --protocol tcp \
    --port 2049 \
    --cidr 0.0.0.0/0

# Crear regla de  SSH
aws ec2 authorize-security-group-ingress \
    --group-name sg-nfs \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
#-----------------------------

#------------------------------------------------------------------------------------------------------

# Crear instancias

# Backend
aws ec2 run-instances \
    --image-id $Ubuntu_AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_BACKEND \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_BACKEND}]"

# Frontend 1
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_FRONTEND \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_FRONTEND_01}]"

# Frontend 2
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_FRONTEND \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_FRONTEND_02}]"

# Loadbalancer
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_LOAD_BALANCER \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_LOAD_BALANCER}]"

# NFS
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count $COUNT \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-groups $SECURITY_GROUP_LOAD_NFS \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME_NFS}]"

#------------------------------------------------------------------------------------------------------





