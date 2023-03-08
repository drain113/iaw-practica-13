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
                    --filters "Name=$INSTANCE_NAME_BACKEND,Values=running" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminar frontend 1
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters "Name=$INSTANCE_NAME_FRONTEND_01,Values=running" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminar frontend 2
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters "Name=$INSTANCE_NAME_FRONTEND_02,Values=running" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminar load balancer
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters "Name=$INSTANCE_NAME_LOAD_BALANCER,Values=running" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)

# Eliminamos NFS
aws ec2 terminate-instances \
    --instance-ids $(aws ec2 describe-instances \
                    --filters "Name=$INSTANCE_NAME_NFS,Values=running" \
                    --query "Reservations[*].Instances[*].InstanceId" \
                    --output text)
