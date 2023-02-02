# Práctica 13.3: Usando Boto3 
<p align="center">
<img src="https://raw.githubusercontent.com/drain113/pictures/main/Fotos/81309boto%20intro.png" width="" height="320" />  
</p>
<br>   <br/>  


# Índice

### [1. Introducción](#introducción)

### [2. Ejercicios](#ejercicios)

### [3. Conclusión](#conclusión)

<br>   <br/>   

# Introducción
Boto3 es un SDK (Software Development Kit) de Python desarrollado por y para Amazon Web Services (AWS). Este SDK permite a los desarrolladores interactuar con los servicios de AWS para crear y gestionar recursos como grupos de seguridad o instancias EC2, a través de aplicaciones escritas en Python.

De esta manera podemos escribir una estructura en Python que nos permite gestionar la infraestructura de AWS. 

<br>   <br/>   


# Ejercicios
La práctica se basa en cuatro ejercicios:
<br>   </br> 

1. **Ejercicio 1**

Escriba un script de Python para crear un grupo de seguridad con el nombre backend-sg. Añada las siguientes reglas al grupo de seguridad:

- Acceso SSH (puerto 22/TCP) desde cualquier dirección IP.
- Acceso al puerto 3306/TCP desde cualquier dirección IP.


<br>   </br>

2. **Ejercicio 2**
  
Escriba un script de Python para crear una instancia EC2 que tengas las siguientes características.

- Identificador de la AMI: ami-08e637cea2f053dfa. Esta AMI se corresponde con la imagen Red Hat Enterprise Linux 9 (HVM).
- Número de instancias: 1
- Tipo de instancia: t2.micro
- Clave privada: vockey
- Grupo de seguridad: backend-sg
- Nombre de la instancia: backend


<br>   </br>

3. **Ejercicio 3**
  

- Crea un script para crear la infraestructura de la práctica 9.
- Crea un script para eliminar la infraestructura de la práctica 9.



<br>   </br>

4. **Ejercicio 4**
  
Modifique los ejemplos 7 y 14 de este repositorio que utilizan boto3.resource, para añadir una nuevas funcionalidades. Por ejemplo, a la hora de crear una nueva instancia EC2 el programa puede mostrar al usuario una lista de AMIs disponibles y una lista de tipos de instancia.  


<br>   </br>
# Conclusión

Gracias a Boto3 podemos gestionar nuestra estructura de máquinas de AWS con Python3 en cualquier sistema operativo y de manera eficiente.

<break>   </break>  
-Guille  
<break>   </break>  
 [![](https://preview.redd.it/enr7hhg3zku81.png?auto=webp&s=fc017e6a82f91cc81ab3dd7d0388ef57bfd72c30)](https://github.com/drain113)
