# Práctica 3. Experimentación con Arduino

**Realizada por:** Alejandro Sánchez Hens y Paula Molina Castillo

## 1. Parpadeo de 3 LEDs

El primer programa que vamos a implementar es un sencillo programa para controlar el encendido y apagado, de forma alternativa, de tres LEDs de distintos colores (rojo, amarillo y verde).

Para ello, hemos realizado primeramente el montaje del circuito en una placa de arduino.

<p align="center">
    <img src="https://github.com/AlexHens/PDIH/blob/main/practica3/images/parpadeo_3_leds_montaje.jpg" width= "400" >
</p>

Como podemos ver en la imágen anterior hemos conectado a la placa de montaje cada uno de los tres LEDs de colores distintos, cada uno de ellos con sus resistencias correspondientes y sus cables de conexión de los mismos con tierra y con su puerto correspondiente.

A continuación, vamos a ver el código fuente que hemos usado para programar el comportamiento de dicho circuito.

<pre><code>
void setup() {
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);

}

void loop() {
  digitalWrite(13, HIGH);
  digitalWrite(12, LOW);
  digitalWrite(11, LOW);
  
  delay(1500); 
  
  digitalWrite(13, LOW);
  digitalWrite(12, HIGH);
  digitalWrite(11, LOW);
  
  delay(1500);
  
  digitalWrite(13, LOW);
  digitalWrite(12, LOW);
  digitalWrite(11, HIGH);
  
  delay(1500);

}
</code></pre>

En el código anterior podemos ver como en la primera función **setup()** hemos declarado el puerto de cada uno de los puertos que hemos conectado a la placa de montaje. Mientras que en la función **loop()**, la cual es la que en realidad contiene el funcionamiento de nuestro circuito, hemos declarado una serie de pautas de encendidos y apagados de los LEDs junto con una serie de esperas para que así podamos ver como se van encendiendo y apagando cada uno de nuestros LEDs en el orden que hemos especificado.

Por último, a continuación mostramos un vídeo del correcto funcionamiento de dicho circuito.

<div>
<p style = 'text-align:center;'>
<iframe width="600" height = "420"
src="https://drive.google.com/file/d/1F9Hczb2fbOKzzxFIs60QOrALsla-qnca/view?usp=sharing">
</iframe>
</div>
</p>