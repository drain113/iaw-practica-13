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

# Crear instancia EC2
amis_list = ['ami-06878d265978313ca', 'ami-08e637cea2f053dfa']

print('-- AMIs --')
print ('1. Ubuntu Server')
print ('2. RedHat Enterprise Server')
opcion = int(input('Selecciona una AMI '))
while opcion < 1 or opcion > 2:
    print ('Error, el valor no es válido')
    opcion = int(input('Seleccione una AMI (1-2): '))

# Guardamos el identificador de la AMI seleccionada por el usuario
ami_id = amis_list[opcion - 1]

# Instancias a crear por el usuario
number_of_instances = int(input('¿Cuantas instancias quieres crear (1-9)?: '))
while number_of_instances < 1 or number_of_instances > 9:
    print ('Error, el valor no es válido')
    number_of_instances = int(input('¿Cuantas instancias quieres crear (1-9)?: '))

# Leer tipo de instancia
instance_type_list = ['t2.micro', 't2.small', 't2.medium']

print ('-- Tipo de instancia  -- ')
print ('1. t2.micro')
print ('1. t2.small')
print ('1. t2.medium')

opcion = int(input('Selecciona un tipo de instancia (1-3): '))
while opcion < 1 or opcion > 3:
    print('Error, el valor no es válido ')
    opcion = int(input('Selecciona un tipo de instancia (1-3): '))

# Guardamos el tipo de instancia 
instance_type = instance_type_list[opcion - 1]

# Leemos el nombre de la instancia
instance_name = input('Nombre de la instancia: ')

aws.create_instance(ami_id, number_of_instances, instance_type, 'vockey', instance_name, group_name)
