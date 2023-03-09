
# Declaración de la variable para el nombre del grupo de seguridad de los balanceadores
security_group_name_balancer = 'loadbalancer_sg'

# Declaración de la variable para la descripción del grupo de seguridad de los balanceadores
security_group_description_balancer = 'Grupo de seguridad para los balanceadores de carga'

# Declaración de la variable para el nombre del grupo de seguridad de los frontales
security_group_name_frontend = 'frontend_sg'

# Declaración de la variable para la descripción del grupo de seguridad de los frontales
security_group_description_frontend = 'Grupo de seguridad para los Frontend'

# Declaración de la variable para el nombre del grupo de seguridad de los backend
security_group_name_backend = 'backend_sg'

# Declaración de la variable para la descripción del grupo de seguridad de los backend
security_group_description_backend = 'Grupo de seguridad para los backend'

# Declaración de la variable para el nombre del grupo de seguridad de los NFS Server
security_group_name_nfs = 'nfs_sg'

# Declaración de la variable para la descripción del grupo de seguridad de los NFS Server
security_group_description_nfs = 'Grupo de seguridad para los NFS'

# Reglas de entrada de los grupos de seguridad

# Definición de una lista para las reglas de entrada para el grupo de seguridad de los balanceadores
balancer_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80},
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 443, 'ToPort': 443}]


# Definición de una lista para las reglas de entrada para el grupo de seguridad de los frontales
frontend_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80}]


# Definición de una lista para las reglas de entrada para el grupo de seguridad de los backend
backend_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 3306, 'ToPort': 3306}]


# Definición de una lista para las reglas de entrada para el grupo de seguridad de los NFS Server
nfs_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 2059, 'ToPort': 2059}]