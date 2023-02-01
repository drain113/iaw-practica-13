import aws

# Reglas de seguridad Balanceador de carga
lb_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80},        
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 443, 'ToPort': 443}]

# Reglas de seguridad Frontend
frontend_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},      
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80}]

# Reglas de seguridad Backend
backend_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},        
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 3306, 'ToPort': 3306}]

# Reglas de seguridad NFS
nfs_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},      
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 2049, 'ToPort': 2049}]

# Id de la AMI
ami_id = "ami-06878d265978313ca"

# Tipo de instancia
instance_type = 't2.small'

# Clave SSH
ssh_key = 'vockey'

# Creamos los grupos de seguridad
aws.create_security_group('sg_lb', 'Grupo del balanceador de carga', lb_ingress_permissions)
aws.create_security_group('sg_frontend', 'Grupo del Frontend', frontend_ingress_permissions)
aws.create_security_group('sg_backend', 'Grupo del Backend', backend_ingress_permissions)
aws.create_security_group('sg_nfs', 'Grupo del NFS', nfs_ingress_permissions)

# Creamos las instancias EC2
aws.create_instance(ami_id, 1, instance_type, ssh_key, 'lb', 'sg_lb')
aws.create_instance(ami_id, 1, instance_type, ssh_key, 'frontend_01', 'sg_frontend')
aws.create_instance(ami_id, 1, instance_type, ssh_key, 'frontend_02', 'sg_frontend')
aws.create_instance(ami_id, 1, instance_type, ssh_key, 'backend', 'sg_backend')
aws.create_instance(ami_id, 1, instance_type, ssh_key, 'nfs', 'sg_nfs')

# Creamos IP elástica
elastic_ip = aws.allocate_elastic_ip()

# Asociamos la IP al Balanceador de carga
# Para ello, obtenemos el ID de la instancia a partir de su nombre
lb_id = aws.get_instance_id('lb')
# Asociamos la IP elástica al ID
aws.associate_elastic_ip(elastic_ip, lb_id)

