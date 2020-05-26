
:-use_module(library(pce)).
:- pce_image_directory('./imagenes').

:-use_module(library(pce_style_item)).


resource(fondo_inicio, image, image('logo.jpg')).
resource(h1, image, image('h1_imagen.jpg')).
resource(h2, image, image('h2_imagen.jpg')).
resource(h3, image, image('h3_imagen.jpg')).
resource(h4, image, image('h4_imagen.jpg')).
resource(h5, image, image('h5_imagen.jpg')).
resource(h6, image, image('h6_imagen.jpg')).
resource(h7, image, image('h7_imagen.jpg')).
resource(h8, image, image('h8_imagen.jpg')).
resource(r1, image, image('r1_imagen.jpg')).
resource(r2, image, image('r2_imagen.jpg')).
resource(r3, image, image('r3_imagen.jpg')).
resource(r4, image, image('r4_imagen.jpg')).
resource(r5, image, image('r5_imagen.jpg')).
resource(r6, image, image('r6_imagen.jpg')).
resource(r7, image, image('r7_imagen.jpg')).
resource(r8, image, image('r8_imagen.jpg')).
resource(r9, image, image('r9_imagen.jpg')).
resource(r10, image, image('r10_imagen.jpg')).
resource(r11, image, image('r11_imagen.jpg')).
resource(r12, image, image('r12_imagen.jpg')).
resource(r13, image, image('r13_imagen.jpg')).
resource(r14, image, image('r14_imagen.jpg')).
resource(r15, image, image('r15_imagen.jpg')).
resource(r16, image, image('r16_imagen.jpg')).
resource(r17, image, image('r17_imagen.jpg')).
resource(r19, image, image('r19_imagen.jpg')).
resource(r18, image, image('r18_imagen.jpg')).
resource(r20, image, image('r20_imagen.jpg')).
resource(r21, image, image('r21_imagen.jpg')).
resource(r22, image, image('r22_imagen.jpg')).
% metodo principal para iniciar la interfaz grafica, declaracion de
% botones, labels, y la pocicion en pantalla.
nueva_imagen(Ventana, Imagen, Posicion) :-
											new(Figura, figure),
											new(Bitmap, bitmap(resource(Imagen),@on)),
											send(Bitmap, name, 1),
											send(Figura, display, Bitmap),
											send(Figura, status, 1),
											send(Ventana, display, Figura, Posicion).

inicio:-
	new(Menu, dialog('Proyecto de IA 2 ', size(1000,800))),
	new(L,label(nombre,'SISTEMA PARA DETECTAR CARACTERISTICAS DE COMPRADORES')),
	new(A,label(nombre,'hecho por Luis Benavides y David Almachi')),
	new(@texto,label(nombre,'Cuestionario:')),
	new(@respl,label(nombre,'')),
	new(Salir,button('SALIR',and(message(Menu, destroy),message(Menu,free)))),
	new(@boton,button('realizar test',message(@prolog,botones))),
	nueva_imagen(Menu, fondo_inicio, point(100, 100 )),


	send(Menu,append(L)),new(@btncarrera,button('Prediccion?')),
	send(Menu,display,L,point(125,20)),
	send(Menu,display,A,point(80,360)),
	send(Menu,display,@boton,point(100,150)),
	send(Menu,display,@texto,point(20,100)),
	send(Menu,display,Salir,point(20,400)),
	send(Menu,display,@respl,point(20,130)),
	send(Menu,open_centered).


/*

r19 :- nivel1,
		verificar('Compra mas de un tipo de producto').
r20 :- nivel2,
		verificar('Compra en su mayoria productos de tecnologia').
r21 :- nivel3,
		verificar('Compra articulos de tecnologia de calidad').
r22 :- nivel4,
		verificar('Compra articulos de arte de calidad').

nivel1:- nodo,
		verificar('Compra mas de 10 productos a la semana');
		verificar('Compra al menos 3 libros de ingenieria al anio').
nivel2:- nodo,
		verificar('Compra al menos 3 libros de ingenieria al anio');
		verificar('Compra articulos con buenos comentarios').
nivel3:- nodo,
		verificar('Compra articulos con buenos comentarios');
		verificar('Compra articulos basados en el color').
nivel4:- nodo,
		verificar('Compra articulos basados en el color');
		verificar('Compra menos de 5 libros de arte al anio').

nodo:- nodo1,
		verificar('Compra mas de 10 productos baratos a la semana');
		verificar('Revisa productos de tecnologia con regularidad').
nodo:- nodo2,
		verificar('Revisa productos de tecnologia con regularidad');
		verificar('Revisa articulos basados en descuentos altos').


nodo1:- verificar('pregunta 1').
nodo2:- verificar('pregunta 2').


fallas('vendedor'):-r19,!.
fallas('vendedor'):-r20,!.
fallas('ingeniero'):-r20,!.
fallas('ingeniero'):-r21,!.
fallas('artista'):-r21,!.
fallas('artista'):-r22,!.
fallas('desconocido').
*/

/*
fallas('Vendedor'):- nivel1111 ; nivel2222 .
fallas('Ingeniero'):- nivel2222 ; nivel3333 .
fallas('Artista'):- nivel3333, !.
fallas('Artista'):- nivel8888, !.

nivel1111:- nivel111, verificar('Compra mas de un tipo de producto') ; nivel222, verificar('Compra mas de un tipo de producto').
nivel2222:- nivel222, verificar('Compra en su mayoria productos de tecnologia'); nivel333, verificar('Compra en su mayoria productos de tecnologia').
nivel3333:- nivel333, verificar('Compra articulos de tecnologia de calidad').
nivel8888:- nivel888, verificar('Compra articulos de arte de calidad').

nivel111:- nivel11, verificar('Compra mas de 10 productos a la semana'); nivel22, verificar('Compra mas de 10 productos a la semana').
nivel222:- nivel22, verificar('Compra al menos 3 libros de ingenieria al anio'); nivel33, verificar('Compra al menos 3 libros de ingenieria al anio').
nivel333:- nivel33, verificar('Compra articulos con buenos comentarios').
nivel888:- nivel88, verificar('Compra menos de 5 libros de arte al anio').

nivel11:- nivel1, verificar('Compra mas de 10 productos baratos a la semana') ; nivel2, verificar('Compra mas de 10 productos baratos a la semana').
nivel22:- nivel2, verificar('Revisa productos de tecnologia con regularidad'); nivel3, verificar('Revisa productos de tecnologia con regularidad').
nivel33:- nivel3, verificar('Revisa articulos basados en descuentos altos').
nivel88:- nivel8, verificar('Compra menos de 10 pinturas por mes').


nivel1:- hoja1, verificar('Compra articulos con precios reducidos') ; hoja2, verificar('Compra articulos con precios reducidos').
nivel2:- hoja2, verificar('Compra articulos con altas calificaciones en calidad'); hoja3, verificar('Compra articulos con altas calificaciones en calidad').
nivel3:- hoja3, verificar('Compra articulos para power users').
nivel8:- hoja8; hoja7, verificar('Compra menos de 3 lienzos por semana').

hoja1:- verificar('Compra 20 pantallas cada mes').
hoja2:- verificar('Compra 2 memorias RAM por anio').
hoja3:- verificar('Compra 15 placas Arduino al mes').
hoja4:- verificar('Compra un telefono con Android').
hoja5:- verificar('Compra una tableta digitalizadora').
hoja6:- verificar('Compra un Iphone').
hoja7:- verificar('Compra un juego de pinturas').
hoja8:- verificar('Compra 2 lienzos por semana').
*/



fallas('Vendedor'):- r19, !.
fallas('Ingeniero'):- r20, !.
fallas('Ingeniero'):- r21, !.
fallas('Artista'):- r22, !.


r19:- r14, verificar('r19').
r20:- r15, verificar('r20').
r21:- r16, verificar('r21').
r22:- r17, verificar('r22').
r22:- r18, verificar('r22').

r14:- r8, verificar('r14').
r15:- r9, verificar('r15').
r16:- r10, verificar('r16').
r17:- r11, verificar('r17').
r17:- r12, verificar('r17').
r18:- r13, verificar('r18').

r8:- r1, verificar('r8').
r9:- r2, verificar('r9').
r10:- r3, verificar('r10').
r11:- r4, verificar('r11').
r12:- r5, verificar('r12').
r13:- r6, verificar('r13').
r13:- r7, verificar('r13').

r1:- h1, verificar('r1').
r2:- h2, verificar('r2').
r3:- h3, verificar('r3').
r4:- h4, verificar('r4').
r5:- h5, verificar('r5').
r6:- h6, verificar('r6').
r6:- h7, verificar('r6').
r7:- h8, verificar('r7').


h1:- verificar('h1').
h2:- verificar('h2').
h3:- verificar('h3').
h4:- verificar('h4').
h5:- verificar('h5').
h6:- verificar('h6').
h7:- verificar('h7').
h8:- verificar('h8').
	

:-dynamic si/1,no/1.
preguntar(Problema):- new(Di,dialog('Prediccion de comprador')),
	 nueva_imagen(Di,  Problema, point(100, 100 )),
     new(L2,label(texto,'Responder las preguntas:')),
     new(La,label(prob,Problema)),
     new(B1,button(si,and(message(Di,return,si)))),
     new(B2,button(no,and(message(Di,return,no)))),

         send(Di,append(L2)),
	 send(Di,append(La)),
	 send(Di,append(B1)),
	 send(Di,append(B2)),

	 send(Di,default_button,si),
	 send(Di,open_centered),get(Di,confirm,Answer),
	 write(Answer),send(Di,destroy),
	 ((Answer==si)->assert(si(Problema));
	 assert(no(Problema)),fail).


verificar(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.


botones :- lim,
	send(@boton,free),
	send(@btncarrera,free),
	fallas(Falla),
	send(@texto,selection(' ')),
	send(@respl,selection(Falla)),
	new(@boton,button('inicia procedimiento ',message(@prolog,botones))),
        send(Menu,display,@boton,point(40,50)),
        send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim :- send(@respl, selection('')).
