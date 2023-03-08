import aws

ec2_list = ["EC2-LoadBalancer", "EC2-FrontEnd-01", "EC2-FrontEnd-02", "EC2-BackEnd", "EC2-NFS"]

sg_list = ["sg_loa", "sg_fro", "sg_bac", "sg_nfs"]

# Bucle for para eliminar instancias
for ec2_name in ec2_list:
    print(f"Eliminado instancia: {ec2_name}...")

    aws.terminate_instance(ec2_name)

# Bucle for para eliminar SGs
for sg_name in sg_list:
    print(f"Eliminado grupo de seguridad: {sg_name}...")

    aws.delete_security_group(sg_name)