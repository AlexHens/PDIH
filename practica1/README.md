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


