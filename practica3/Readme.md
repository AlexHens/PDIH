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

Por último, a continuación mostramos un vídeo del correcto <a href="https://drive.google.com/file/d/1F9Hczb2fbOKzzxFIs60QOrALsla-qnca/view?usp=sharing" title="Funcionamiento Parpadeo 3 LEDs">funcionamiento</a> de dicho circuito.

## 2. Parpadeo de 3 LEDs con pulsador

El segundo programa que vamos a implementar realiza una funcionalidad similar al anterior. Su comportamiento varía en que en este caso se apagarán y encenderán alternativamente dos LEDs de distintos colores (amarillo y verde), mientras que habrá un LED rojo que siempre estará apagado, hasta que se pulse un determinado pulsador. Cuando el pulsador sea activado el LED rojo se encenderá y los otros dos LEDs se apagarán.

Para ello, hemos realizado primeramente el montaje del circuito en una placa de arduino.

<p align="center">
    <img src="https://github.com/AlexHens/PDIH/blob/main/practica3/images/parpadeo_pulsador_montaje.jpg" width= "400" >
</p>

Como podemos ver en la imágen anterior, el circuito montado es muy similar al anterior, solo que en este caso hemos añadido un pulsador conectado a la placa arduino, junto con su respectiva resistencia.

A continuación, vamos a ver el código fuente que hemos usado para programar el comportamiento de dicho circuito.

<pre><code>
int interruptor = 0;

void setup()
{
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(7, INPUT);
}

void loop()
{
  interruptor=digitalRead(7);

  if (interruptor==HIGH) {
   digitalWrite(13, HIGH);
   digitalWrite(12, LOW);
   digitalWrite(11, LOW);
   delay(1500);
  }
  
  else if(interruptor==LOW){ 
  
   digitalWrite(13, LOW);
   digitalWrite(12, HIGH);
   digitalWrite(11, LOW);
  
   delay(1000);
  
   digitalWrite(13, LOW);
   digitalWrite(12, LOW);
   digitalWrite(11, HIGH);
  
   delay(1000);
  }
    
}
</code></pre>

Como podemos observar en el código anterior, comenzamos declarando en la función **setup()** los puertos en los que estarán conectados nuestros LEDs y nuestro pulsador. Seguidamente implementamos la función **loop()**, en la cual comenzamos leyendo el estado de nuestro pulsador. Si el pulsador está activo, se enciende el LED rojo (puerto 13) y se apagan los otros dos LEDS, y si el pulsador está desactivado, se apagará el LED rojo y se encenderán y apagarán alternativamente los otros dos LEDS (puertos 12 y 11).

Por último, a continuación mostramos un vídeo del correcto <a href="https://drive.google.com/file/d/1HEQI0gkzipFrmul8L6AAVjCe5Pc6dGAR/view?usp=sharing">funcionamiento</a> de dicho circuito.