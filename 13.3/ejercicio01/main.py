import aws

# Reglas SG
ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 3306, 'ToPort': 3306}]

# Nombre y descripción del SG
group_name = input("Introduce el nombre del grupo de seguridad: ")
description = input("Introduce una descripcion para el grupo de seguridad: ")

# Creación SG
aws.create_security_group(group_name, description, ingress_permissions)