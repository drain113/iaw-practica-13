#!/bin/bash

# Crear un script para eliminar la infraestructura de la práctica 9.

#------------------------------------------------------------------------------------------------------
# Variables

INSTANCE_NAME_LOAD_BALANCER=loadbalancer
INSTANCE_NAME_FRONTEND_01=frontend-01
INSTANCE_NAME_FRONTEND_02=frontend-02
INSTANCE_NAME_BACKEND=backend
INSTANCE_NAME_NFS=nfs

#------------------------------------------------------------------------------------------------------

# Eliminar Backend
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters "Name=tag:Name,Values=$INSTANCE_NAME_BACKEND" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminar frontend 1
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters "Name=tag:Name,Values=$INSTANCE_NAME_LOAD_BALANCER" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminar frontend 2
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters  "Name=tag:Name,Values=$INSTANCE_NAME_FRONTEND_01" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminar load balancer
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters  "Name=tag:Name,Values=$INSTANCE_NAME_FRONTEND_02" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminamos NFS
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters  "Name=tag:Name,Values=$INSTANCE_NAME_NFS" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)
