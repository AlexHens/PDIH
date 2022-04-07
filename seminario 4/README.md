# Seminario 4. Módulos cargables del kernel(LKM)

**Realizado por:** Alejandro Sánchez Hens y Paula Molina Castillo

## 1. Breve introducción al seminario.

En este seminario nos encargaremos de realizar una serie de cambios en un módulo cargable de nuestro kernel, cuyo código nos será facilitado previamente.

Los módulos cargables del kernel nos permitirán añadir o eliminar código del kernel en tiempo de ejecución, esto nos puede servir para dar soporte a nuevos periféricos o sistemas de archivos.

Dichos módulos se cargan en tiempo de ejecución y no se cargan en el espacio del usuario, sino en el espacio del kernel, ya que forman parte del mismo.

El código que usaremos para añadir un nuevo módulo al kernel es muy sencillo y no realiza ninguna configuración específica ni operaciones complejas. Simplemente nos muestra un mensaje por pantalla para verificarnos que el módulo se ha cargado y cuando terminemos nos mostrará otro mensaje informándonos de que la ejecución ha terminado.

## 2. Pasos para preparar el sistema.

Para desarrollar módulos cargables del kernel nuestro sistema operativo tiene que estar preparado. Para ello seguiremos los siguientes pasos:

~~~
sudo apt-get update
sudo apt-cache search linux-headers-$(uname -r)
sudo apt-get install linux-headores-$(uname -r)
~~~

<div>
<p style = 'text-align:center;'>
<img src="seminario 4/images/update-s4.jpg" alt="JuveYell" width="300px">
</p>
</div>

Con estas órdenes del terminal lo que hacemos es buscar e instalar las cabeceras del kernel que necesitaremos para empezar a trabajar con los LKM's.

Se recomienda realizar todo este procedimiento, además de las pruebas, en una máquina virtual y no en nuestra máquina Linux, ya que es relativamente sencillo bloquear o dañar el núcleo del sistema.

## 3. Explicación del código.

Aquí pasos realizados para realizar el módulo con pantallazos