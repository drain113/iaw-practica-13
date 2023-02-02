# Práctica 13.2: Usando AWS CloudFormation 
<p align="center">
<img src="https://raw.githubusercontent.com/drain113/pictures/main/Fotos/aws-cloudformation.png" width="" height="320" />  
</p>
<br>   <br/>  


# Índice

### [1. Introducción](#introducción)

### [2. Ejercicios](#ejercicios)

### [3. Conclusión](#conclusión)

<br>   <br/>   

# Introducción
AWS CloudFormation es un servicio que lo ayuda a modelar y configurar sus recursos de AWS, por lo que podrá dedicar menos tiempo a la administración de dichos recursos y más tiempo a centrarse en las aplicaciones que se ejecutan en AWS. Puede crear una plantilla que describa todos los recursos de AWS que desea (como instancias Amazon EC2 o instancias de base de datos de Amazon RDS) y CloudFormation se encargará del aprovisionamiento y la configuración de dichos recursos. No es necesario crear y configurar individualmente los recursos AWS ni averiguar qué depende de qué; CloudFormation se encarga de todo eso. Las siguientes situaciones demuestran cómo puede ayudarle CloudFormation.

Algunas de las ventajas que nos ofrece este servicio son:

- Permite automatizar la creación de recursos, reduciendo así posibles errores en el proceso de creación de forma manual.
- Permite reutilizar plantillas para otros proyectos y configuraciones.
- Garantizamos que todos los entornos que creamos con las plantillas son idénticos.
- Permite tener una documentación de los recursos que creamos.
- Podemos utilizar un control de versiones para controlar los cambios que se realizan en las plantillas.

Algunos de los inconvenientes que podemos encontrar son:

- Es un servicio exclusivo de AWS, por lo que no podemos utilizarlo para crear recursos en otros proveedores de servicios en la nube.
- No están disponibles todos los servicios de AWS.
- Aunque AWS nos proporciona la herramienta AWS CloudFormation Designer para crear las plantillas, a veces puede ser un poco complicado describir la infraestructura que necesitamos.


<br>   <br/>   


# Ejercicios
La práctica se basa en dos ejercicios:
<br>   </br> 

1. **Ejercicio 1**

Escriba una plantilla de AWS CloudFormation que cree la infraestructura necesaria para desplegar la aplicación web propuesta en la práctica 7.

<br>   </br>

2. **Ejercicio 2**
  
Escriba una plantilla de AWS CloudFormation que cree la infraestructura necesaria para desplegar la aplicación web propuesta en la práctica 9.  




Ambos ejercicios se realizan mediante un archivo .yaml que sigue una estructura concreta. 
<br>   </br>
# Conclusión

Gracias a AWS CloudFormation podemos crear una estructura en código para manejar nuestras máquinas EC2 de manera eficiente.

<break>   </break>  
-Guille  
<break>   </break>  
 [![](https://preview.redd.it/enr7hhg3zku81.png?auto=webp&s=fc017e6a82f91cc81ab3dd7d0388ef57bfd72c30)](https://github.com/drain113)
