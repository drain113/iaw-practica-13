import aws

# Reglas para el grupo de seguridad
ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80}]

# Definimos el nombre para el grupo de seguridad
group_name = "backend-sg"

# Definimos una descripción para el grupo de seguridad
description = "Grupo de seguridad: backend-sg"

# Creamos el grupo de seguridad
aws.create_security_group(group_name, description, ingress_permissions)

# Definimos la AMI para el S.O del EC2
ami_id = "ami-08e637cea2f053dfa"

# Definimos el número de instancias que crearemos
number_of_instances = 1

# Definimos el tipo de instancia que vamos a crear
instance_type = t2.micro

# Definimos un nombre para la instancia
instance_name = "backend"

# Finalmente creamos la instancia
aws.create_instance(ami_id, number_of_instances, instance_type, 'vockey', instance_name, group_name)