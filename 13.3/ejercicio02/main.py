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

# AMIs
amis_list = ['ami-06878d265978313ca', 'ami-08e637cea2f053dfa']

# Menú Seleccionar AMIs
print('*-*-*-* AMIs Disponibles *-*-*-*')
print('1. Ubuntu Server')
print('2. Red Hat Enterprise Server')

opcion = int(input("Introduce una AMI (1-2): "))

# ------------- Blucle While -------------
while opcion < 1 or opcion > 2:
    print("Introduce una AMI entre (1-2)")
    opcion = int(input("Introduce una AMI (1-2): "))

ami_id = amis_list[opcion - 1] # (Le restamos -1 para que las opciones cuadren con los valores del array.)
number_of_instances = int(input("Numero de instancias que deseas crear (1-9): "))

while number_of_instances <1 or number_of_instances > 9:
    print("El minimo de instancias es 1 y el maximo 9")
    number_of_instances = int(input("Numero de instancias que deseas crear (1-9): "))

instance_type_list = ['t2.micro', 't2.small', 't2.medium']

# ---------------------------------------

# Menú Seleccionar Instancias
print('*-*-*-* Instancias Disponibles *-*-*-*')
print('1. t2.micro')
print('2. t2.small')
print('3. t2.medium')

opcion = int(input("Introduce la instancia (1-3): "))

# ------------- Blucle While -------------
while opcion <1 or opcion >3:
    print("La instancia introducida no es valida")
    opcion = int(input("Introduce la instancia (1-3): "))

instance_type = instance_type_list[ opcion - 1]

instance_name = input("Nombre de tu instancia: ")

# ---------------------------------------

# Creación SG
aws.create_instance(ami_id, number_of_instances, instance_type, 'vockey', instance_name, group_name)