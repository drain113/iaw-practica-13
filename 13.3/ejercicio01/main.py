import aws

# Security group ingress permissions
ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},        
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 3306, 'ToPort': 3306}]

# Pedimos por teclado el nombre y descripción del grupo
group_name = input('Introduce el nombre del grupo de seguridad: ')
group_description = input('Introduce una descripción del grupo de seguridad: ')

# Creamos el grupo de seguridad
aws.create_security_group(group_name, group_description, ingress_permissions)

# Listar grupos de seguridad
aws.list_security_groups()