# Práctica 13.1: Usando AWS CLI 
<p align="center">
<img src="https://raw.githubusercontent.com/drain113/pictures/main/Fotos/1%20utV4kZA0lGODHtdOI0-5Bw.png" width="" height="320" />  
</p>
<br>   <br/>  


# Índice

### [1. Introducción](#introducción)

### [2. Ejercicios](#ejercicios)

### [3. Conclusión](#conclusión)

<br>   <br/>   

# Introducción
La práctica 13.1 se basa en hacer uso de AWS CLI.  

AWS CLI (Command Line Interface) es una herramienta que se ejecuta desde la línea de comandos que permite gestionar todos los servicios de Amazon Web Services.

AWS CLI proporciona acceso directo a la API pública de los servicios de AWS, de forma que todas las funcionalidades que se pueden realizar desde la consola de admnistración web, también se pueden realizar con esta herramienta desde la línea de comandos.

Esta herramienta nos permite crear scripts de shell para automatizar la creación y la administración de los servicios de AWS.
<br>   <br/>   


# Ejercicios
La práctica se basa en cinco ejercicios:
<br>   </br> 

1. **Ejercicio 1**  
Crea un grupo de seguridad para las máquinas del Backend con el nombre backend-sg.
Añada las siguientes reglas al grupo de seguridad:  

    - Acceso SSH (puerto 22/TCP) desde cualquier dirección IP.
    - Acceso al puerto 3306/TCP desde cualquier dirección IP.  
<br>   </br>

2. **Ejercicio 2**  
Crea una instancia EC2 para la máquina del Backend con las siguientes características.

    - Identificador de la AMI: ami-08e637cea2f053dfa. Esta AMI se corresponde con la imagen Red Hat Enterprise Linux 9 (HVM).
    - Número de instancias: 1
    - Tipo de instancia: t2.micro
    - Clave privada: vockey
    - Grupo de seguridad: backend-sg
    - Nombre de la instancia: backend  
  
<br>   </br>

3. **Ejercicio 3**
    - Crear un script para crear la infraestructura de la práctica 9.
    - Crear un script para eliminar la infraestructura de la práctica 9.  

<br>   </br>

4. **Ejercicio 4**
Modifique los scripts del repositorio de ejemplo:

https://github.com/josejuansanchez/practica-aws-cli

Para que utilicen la siguiente AMI.

- Nombre de la AMI: Ubuntu Server 22.04 LTS (HVM)
- Identificador de la AMI: ami-06878d265978313ca

También tendrá que modificar los scripts para que se ejecute el siguiente comando en las instancias durante el inicio.
```
$ sudo apt update && sudo apt upgrade -y
```
<br>   </br>

5. **Ejercicio 5**  

Escriba un script de bash que muestre el nombre de todas instancias EC2 que tiene en ejecución junto a su dirección IP pública. 

 

# Conclusión

Gracias a AWS CLI podemos gestionar nuestros elementos de AWS de una manera sencilla desde la terminal y de manera remota a la  interfaz gráfica de Amazon.

<break>   </break>  
-Guille  
<break>   </break>  
 [![](https://preview.redd.it/enr7hhg3zku81.png?auto=webp&s=fc017e6a82f91cc81ab3dd7d0388ef57bfd72c30)](https://github.com/drain113)
