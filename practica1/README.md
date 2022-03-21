# Práctica 1. Entrada/Salida utilizando interrupciones con lenguaje C.

## 1. Función gotoxy()

La función gotoxy() nos debe permitir básicamente colocar el cursor en una posición determinada de la pantalla. Para realizar dicha función hemos utilizado la interrupción número 10 y el número de función número 2. El número de la función nos servirá para rellenar el registro AH, mientras que los registros DH y DL serán rellenados con los valores x e y de la posición del cursor, dichos valores serán pasados como parámetros de la función.


