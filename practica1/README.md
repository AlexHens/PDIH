# Práctica 1. Entrada/Salida utilizando interrupciones con lenguaje C.

**Realizada por:** Alejandro Sánchez Hens y Paula Molina 

## 1. Función gotoxy()

La función gotoxy() nos debe permitir básicamente colocar el cursor en una posición determinada de la pantalla. Para realizar dicha función hemos utilizado la interrupción número 10 y el número de función número 2. El número de la función nos servirá para rellenar el registro AH, mientras que los registros DH y DL serán rellenados con los valores x e y de la posición del cursor, dichos valores serán pasados como parámetros de la función.

![codigo gotoxy()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/gotoxy.png)

Para comprobar el correcto funcionamiento hemos colocado el cursor en la posición (15,7) y hemos impreso la palabra "Hola" por pantalla.

![test gotoxy()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/gotoxy_test.png)

## 2. Función setcursortype()

Esta función básicamente nos modifica el tipo de cursor que se muestra por pantalla y para ello hemos usado la interrupción número 10 junto con la función número 1. Para probar los distintos cursores hemos comprobado mediante un condicional el tipo de cursor que se nos pasará como argumento de la función y en función del tipo de cursor daremos unos valores a los registros de entrada u otros.

![codigo setcursortype()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/setcursortype.png)

Para comprobar su funcionamiento simplemente hemos llamado a la función pasándole los distintos tipos de cursores como argumentos.

![test setcursortype()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/setcursortype_test.png)

## 3. Función setvideomode()

Esta función nos permite modificar el modo de vídeo de la interfaz pasándole como argumento a la función el modo de vídeo que se desea poner. Para ello hemos hecho uso de la interrupción número 10 junto con la función 0, además hemos asignado el modo de vídeo que se pasa como argumento al registro AL.

![funcion setvideomode()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/setvideomode.png)

Para comprobar el correcto funcionamiento de esta función le hemos indicado que nos cambie al modo de vídeo 1, que correspondería al de letras grandes.

![test setvideomode()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/setvideomode_test.png)

## 4. Función getvideomode()

Esta función nos muestra el tipo de modo de vídeo que tenemos activo actualmente. Para ello haremos uso de la interrupción 10 y el número de función F, únicamente introduciremos estos parámetros de entrada. Una vez llamada a la interrupción obtendremos de los parámetros de salida el modo de vídeo actualmente activo, en concreto lo obtendremos del registro AL.

![funcion getvideomode()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/getvideomode.png)

Para comprobar el correcto funcionamiento llamaremos a la función y mostraremos el tipo de vídeo por pantalla.

![test setvideomode()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/setvideomode_test.png)

## 5. Funciones textcolor() y backgroundcolor()

Estas funciones nos permitirán cambiar el color del texto y de fondo, respectivamente. Para ello, en este caso, no hemos hecho uso de ninguna interrupción, simplemente hemos declarado dos variables globales que controlarán el color de texto y de fondo. Dichas variables tienen asignados unos valores iniciales, negro para el fondo y gris claro para el texto. Nuestras funciones toman como parámetros los nuevos valores de texto y fondo, y simplemente les asigna estos nuevos valores a estas variables globales.

![funcion textcolor() y backgroundcolor()](https://github.com/AlexHens/PDIH/blob/main/practica1/images/textcolor_backgroundcolor.png)

