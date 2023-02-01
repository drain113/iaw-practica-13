import aws

# Inicializamos una lista con los nombres de las instancias
ec2_list = ['lb', 'frontend-01', 'frontend-02', 'backend', 'nfs']

# Inicializamos una lista con los nombres de los grupos de seguridad
sg_list = ['sg_lb', 'sg_frontend', 'sg_backend', 'sg_nfs']

for ec2_name in ec2_list:
    print(f"Eliminado instancia: {ec2_name}...")

    aws.terminate_instance(ec2_name)


for sg_name in sg_list:
    print(f"Eliminado grupo de seguridad: {sg_name}...")

    aws.delete_security_group(sg_name)