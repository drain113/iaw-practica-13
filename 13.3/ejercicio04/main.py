import aws
import vars
import time

def show_menu():
    print('\n-- Security Group --')
    print(' 1. Create security group')
    print(' 2. Delete security group')
    print(' 3. List security groups')
    print('-- EC2 Instance --')
    print(' 4. Create EC2 instance')
    print(' 5. Start EC2 instance')
    print(' 6. Stop EC2 instance')
    print(' 7. Terminate EC2 instance')
    print('-- EC2 Instances --')    
    print(' 8. List all EC2 instances')
    print(' 9. Start all EC2 instances')
    print(' 10. Stop all EC2 instances')
    print(' 11. Terminate all EC2 instances')
    print('-- Elastic IP --')
    print(' 12. Allocate and associate Elastic IP')
    print(' 13. Release Elastic IP')
    print(' 14. Exit')


def security_groups():
    # Grupos de seguridad
    print('\n---   Security Groups   ---')
    print(' 1.- Load balancer security group\n Open TCP ports: SSH, HTTP, HTTPS')
    print('\n 2.- Frontend security group\n Open TCP ports: SSH, HTTP')
    print('\n 3.- Backend security group\n Open TCP ports: SSH, MySQL / Aurora (3306)')
    print('\n 4.- NFS Server security group\n Open TCP ports: SSH, NFS Server (2049)')


def main():  


    # AMI ID
    ami = 'ami-08c40ec9ead489470'

    # Instance type
    instance_type = 't2.small'

    # SSH key name
    key_name = 'vockey'

    option = 0
    while option != 14:
        show_menu()
        option = int(input('\nSelect an option (1-14): '))

        if option == 1:
            security_groups()

            # Modificado el menú para elegir el grupo de seguridad.

            elegir_sg=int(input("Introduzca una opción para crear el SG (1-4) "))
            if elegir_sg==1:
                sg_usuario=vars.balancer_ingress_permissions
            elif elegir_sg==2:
                sg_usuario=vars.frontend_ingress_permissions
            elif elegir_sg==3:
                sg_usuario=vars.backend_ingress_permissions
            elif elegir_sg==4:
                sg_usuario=vars.nfs_ingress_permissions
            else:
                print("La opción elegida no existe. ")
                time.sleep(2)
                continue

            nombre_sg=input("Introzuca un nombre para el SG ")
            descripcion_sg=input("Introduzca una descripción para el SG ")
            aws.create_security_group(nombre_sg, descripcion_sg, sg_usuario)

        elif option == 2:
            sg_name = input('Security group name: ')
            aws.delete_security_group(sg_name)
        elif option == 3:
            aws.list_security_groups()
        elif option == 4:
            # Read the input parameters
            instance_name = input('Instance name: ')
            min_count = int(input('Min count: '))
            sg_name = input('Security group: ')

            # Check if security group exists
            if aws.security_group_exists(sg_name) == False:
                print('The security group does not exist')
                continue
            
            # Create the instance
            aws.create_instance(ami, min_count, instance_type, key_name, instance_name, sg_name)
        elif option == 5:
            instance_name = input('Instance name: ')
            aws.start_instance(instance_name)
        elif option == 6:
            instance_name = input('Instance name: ')
            aws.stop_instance(instance_name)
        elif option == 7:
            instance_name = input('Instance name: ')
            aws.terminate_instance(instance_name)
        elif option == 8:
            aws.list_instances()
        elif option == 9:
            aws.start_instances()
        elif option == 10:
            aws.stop_instances()
        elif option == 11:
            aws.terminate_instances()
        elif option == 12:
            # Get instance ID from instance name
            instance_name = input('Instance name: ')
            instance_id = aws.get_instance_id(instance_name)

            if instance_id == None:
                print('There is no instance with that name')
                continue

            # Allocate and associate Elastic IP
            elastic_ip = aws.allocate_elastic_ip()
            aws.associate_elastic_ip(elastic_ip, instance_id)
        elif option == 13:
            # Get instance ID from instance name
            instance_name = input('Instance name: ')
            instance_id = aws.get_instance_id(instance_name)

            if instance_id == None:
                print('There is no instance with that name')
                continue

            # Get Elastic IP from instance ID
            elastic_ip = aws.get_instance_public_ip(instance_id)

            # Release Elastic IP
            aws.release_elastic_ip(elastic_ip)
        elif option == 14:
            print('Bye!')
        else:
            print('Invalid option')
        time.sleep(3)

if __name__ == "__main__":
    main()
