//•·-·•·-·• TARJETA NAVIDEÑA •·-·•·-·•

PImage fondo;                                   // declaración de las variables de las imágenes
PImage cursor;
PImage cursor2;
PImage nota;
PImage tecla;

import gifAnimation.*;                          // importación de la biblioteca de animación
Gif papanoel;                                   // declaración de la variable gif

int x;                                          // declaración de las variables de movimiento
int vx;

nieve n[];                                      // declaración de array

import processing.sound.*;                      // importación de la biblioteca de sonido
SoundFile cancion;                              // reproductor que permite reproducir y manipular archivos de sonido.


void setup () {

  size (2000, 922);                             // tamaño del lienzo
  fondo = loadImage("fondo.png");               // carga imagen del fondo
  cursor = loadImage("cursor1.gif");            // carga imagen del primer cursor (estrella)
  cursor2 = loadImage("cursor2.png");           // carga la imagen del cursor alternativo (hombre de jengibre)
  cursor2.resize(32, 32);                       // cambio del tamaño de la imagen
  nota = loadImage("nota.png");                 // carga imagen de la nota musical (funcionará como un "botón" para reproducir la música)
  nota.resize(90,90);                           // cambio del tamaño de la imagen                                                                        
  tecla = loadImage("tecla.png");               // carga imagen de la tecla 
  tecla.resize(90,90);                          // cambio del tamaño de la imagen  
  papanoel = new Gif(this, "papanoel.gif");     // importación del archivo .gif 
  papanoel.play();                              // reproduce el archivo .gif

  x=0;
  vx=2;
    
  n= new nieve[300];                            // creación de un bucle del array, el cual contiene 300 objetos.
  for (int i=0; i<300; i++){
  n[i]=new nieve();                             // llamamos a la función nieve
  }
  
  cancion = new SoundFile (this, "data/cancion.wav");   // reproductor que permite reproducir y manipular archivos de sonido.
  
}


void draw() {

  image(fondo, 0, 0);                                                  // posiciones de las imagenes
  image(papanoel, x, 5);
  
  
//•·-·•·-·•TECLA•·-·•·-·•
    
    image(tecla,1850,820);
      if (key=='a') {                                                  // si presionamos la tecla 'a', aparecerá el mensaje de la tarjeta
      PFont fuente;
      fuente = loadFont("RockwellNova-CondLightItalic-48.vlw");        // importación de la fuente
      textFont(fuente);
      textSize(100);                                                   // tamaño del texto superior
      fill(200, 7, 40);                                                // color del texto
      noStroke ();                                                     // eliminación del borde
      text("¡Feliz Navidad!", 750, 140);                              
      textSize(50);                                                    // tamaño del texto inferior
      text("Con cariño, Papa Noel.", 800, 880);
      }
  
  
  
//•·-·•·-·•RATÓN•·-·•·-·•
    
    image(nota,1800,820);
    if (mousePressed && dist(mouseX, mouseY, 1800, 820) < 50) {        // al hacer clic en la posición de la nota musical, se reproducirá nuestro archivo de sonido
      if(!cancion.isPlaying()){
        cancion.play();
      }
     }
  
    if (mouseY <= 400) {                                              // cambia el cursor según se desplaza el ratón en el eje Y
      cursor(cursor, 0, 0);                                         
    } else {                                                          // de (x,0) hasta (x,400) es una estrellita (Starman de Mario Kart). A partir de y=400 es un hombre de jengibre.
      cursor(cursor2);
    }
  
  
  

//•·-·•·-·•NIEVE•·-·•·-·•
    fill(0, 50);
    rect(0, 0, width, height);
    for (int i=0; i<300; i++){                                        // creación de un bucle del array, el cual contiene 300 objetos. 
    n[i].copo();                                                      // llamamos a la función copo, la cual contiene las propiedades físicas de la nieve
     
     if (n[i].y>height)                                               // al alcanzar el suelo (la altura del lienzo), se van a generar nuevos copos de nieve.                                        
       n[i]=new nieve();                                              
    }
    
    
    
   
  
//•·-·•·-·•MOVIMIENTO DE PAPÁ NOEL•·-·•·-·•
  
    x=x+vx;                                                          // movimiento y velocidad de Papá Noel
  
    if (x>=width || x<=0) {                                          // efecto de vaivén
      vx=vx*-1;
    }
    
    
  }
  
  
  
//•·-·•·-·•NIEVE•·-·•·-·•

class nieve {                                   // declaración de la clase 'nieve' con las siguientes propiedades
  float x, y, vel;                              // la caída de la nieve tendrá una x,y y una velocidad
  color c;                                      // declaramos el color
  nieve() {                                     // función nieve
    x=random(width);                            // lugar donde va caer la nieve: en todo el eje X
    y=random(-300, 0);                          // la nieve se comienza a caer desde fuera de la ventana (-300) ->  así es más natural; no se corta.
    vel=random(5, 15);                          // velocidad de la nieve
    c=color(255);                               // color de la nieve (blanca)
  }
  
  void vel() {
    y+=vel;                                     // velocidad
  }

  void copo() {
    fill(c);                                     // color de la nieve            
    noStroke();                                  // eliminación del borde
    rect(x, y, 2, 5);                            // dimensiones de la nieve (2 px de ancho x 5 px de alto)
    vel();                                       // llamamos a la función velocidad para dotar a la nieve de esa propiedad
  }

  
}
