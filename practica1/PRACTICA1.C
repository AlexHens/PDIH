#include <stdio.h>
#include<dos.h>

unsigned char COLOR_FONDO = 0;
unsigned char COLOR_TEXTO = 7;

void mi_pausa(){
   union REGS inregs, outregs;
	 inregs.h.ah = 8;
	 int86(0x21, &inregs, &outregs);
}

/*
* Función para colocar el cursor en una posición determinada.
* Parametros de entrada --> posición x e y del cursor.
*/
void gotoxy(int x, int y){

    union REGS inregs, outregs;

    inregs.h.ah = 0x02;
    inregs.h.dh = x;
    inregs.h.dl = y;
    inregs.h.bh = 0x00;

    int86(0x10, &inregs, &outregs);
}

/*
* Función para fijar el aspecto del cursor.
* Parámetros de entrada --> tipo del cursor que se desea.
*/

void setcursortype(int tipo_cursor){
	union REGS inregs, outregs;
	inregs.h.ah = 0x01;
	switch(tipo_cursor){
		case 0: //invisible
			inregs.h.ch = 010;
			inregs.h.cl = 000;
			break;
		case 1: //normal
			inregs.h.ch = 010;
			inregs.h.cl = 010;
			break;
		case 2: //grueso
			inregs.h.ch = 000;
			inregs.h.cl = 010;
			break;
	}
	int86(0x10, &inregs, &outregs);
}

/*
* Función para establecer el modo de vídeo deseado
* Parámetros de entrada --> el modo de vídeo que deseas
*/

void setvideomode(unsigned char modo){
	union REGS inregs, outregs; 
	inregs.h.ah = 0x00; 
	inregs.h.al = modo; 
	int86(0x10,&inregs,&outregs); 
	return;
}

/*
* Función para averiguar el modo de vídeo actual.
* Salida --> Modo de vídeo actual.
*/

int getvideomode(){

    int modo;

    union REGS inregs, outregs;
    inregs.h.ah = 0x0F;
    int86(0x10,&inregs,&outregs);
    modo = outregs.h.al;

    return modo;
}

/*
* Función para cambiar el color del texto.
* Entrada --> nuevo color de los carácteres.
*/

void textcolor(unsigned char color_texto){
	COLOR_TEXTO = color_texto;
}

/*
* Función para cambiar el color de fondo.
* Entrada --> nuevo color de fondo.
*/

void backgroundcolor(unsigned char color_fondo){
	COLOR_FONDO = color_fondo;
}

/*
* Función para limpiar la pantalla.
*/

void clrsc(){
	union REGS regs;
	regs.h.ah = 15; int86( 0x10, &regs, &regs );
	regs.h.ah = 0; int86( 0x10, &regs, &regs );
}

/*
* Función para escribir un caracter en pantalla en el color deseado actual.
* Entrada --> Carácter a escribir.
*/

void cputchar(char caracter){
	union REGS inregs, outregs;
	inregs.h.ah = 0x09;
	inregs.h.al = caracter;
	inregs.h.bl = (COLOR_FONDO << 4) | COLOR_TEXTO;
	inregs.h.bh = 0x00;
	inregs.x.cx = 1;
	int86(0x10,&inregs,&outregs);
	return;
}
/*
* Función para obtener un carácter por teclado.
*/


int getche(){
	 union REGS inregs, outregs;
	 int caracter;

	 inregs.h.ah = 1;
	 int86(0x21, &inregs, &outregs);

	 caracter = outregs.h.al;
	 return caracter;
}

int main(){

    int modo;
	int tmp;

	clrsc();
	printf("\nPantalla limpia, pulsa un boton...");
	mi_pausa();

    printf("\nFuncion para colocar el cursor en una posicion determinada...");
    gotoxy(15, 7);
	printf("\nHola");
    mi_pausa();

    printf("\nCursor invisible: ");
   	setcursortype(0);
   	mi_pausa();
   	printf("\nCursor grueso: ");
   	setcursortype(2);
   	mi_pausa();
   	printf("\nCursor normal: ");
   	setcursortype(1);
   	mi_pausa();

    setvideomode(1);
    printf("\nPulsa una tecla...");
    mi_pausa();
    modo = getvideomode();
    printf("\nEl modo de video actual es %i", modo);
    mi_pausa();

	printf("\nFuncion para borrar la pantalla...");
	clrsc();
	printf("\nSe ha borrado la pantalla...");
	mi_pausa();

	printf("\nFuncion para escribir un caracter por pantalla....");
	COLOR_FONDO = 5;
	COLOR_TEXTO = 2;
	cputchar('A');
	mi_pausa();

	printf("\nPulsa una tecla...  ");
	tmp = getche();
	printf("\nHas pulsado: ");
	COLOR_FONDO = 5;
	COLOR_TEXTO = 2;
    cputchar( (char)tmp );

	printf("\nPulsa una tecla y acaba...");
	mi_pausa();
    
    return 0;
}