import aws

# Reglas SG
loadbalancer_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80}, 
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 443, 'ToPort': 443}]

frontend_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80}]

backend_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 3306}]

nfs_ingress_permissions = [
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 22, 'ToPort': 22},    
    {'CidrIp': '0.0.0.0/0', 'IpProtocol': 'tcp', 'FromPort': 2049, 'ToPort': 2049}]


ami_id = "ami-06878d265978313ca"
instance_type = "t2.medium"
ssh_key = "vockey"


# Creación SG
aws.create_security_group("sg_loa", "Grupo de seguridad: ", loadbalancer_ingress_permissions)
aws.create_security_group("sg_fro", "Grupo de seguridad: ", frontend_ingress_permissions)
aws.create_security_group("sg_bac", "Grupo de seguridad: ", backend_ingress_permissions)
aws.create_security_group("sg_nfs", "Grupo de seguridad: ", nfs_ingress_permissions)

# Creación instancias
aws.create_instance(ami_id, 1, instance_type, ssh_key, "EC2-LoadBalancer", "sg_loa")
aws.create_instance(ami_id, 1, instance_type, ssh_key, "EC2-FrontEnd-01", "sg_fro")
aws.create_instance(ami_id, 1, instance_type, ssh_key, "EC2-FrontEnd-02", "sg_fro")
aws.create_instance(ami_id, 1, instance_type, ssh_key, "EC2-BackEnd", "sg_bac")
aws.create_instance(ami_id, 1, instance_type, ssh_key, "EC2-NFS", "sg_nfs")

# Creación IP elástica
elastic_ip = aws.allocate_elastic_ip()


# Asociamos la IP Elastica al LoadBalancer
id_load_balancer = aws.get_instance_id("EC2-LoadBalancer")
aws.associate_elastic_ip(elastic_ip, id_load_balancer)