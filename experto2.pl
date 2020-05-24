
:-use_module(library(pce)).
:-use_module(library(pce_style_item)).

% metodo principal para iniciar la interfaz grafica, declaracion de
% botones, labels, y la pocicion en pantalla.
inicio:-
	new(Menu, dialog('Proyecto de IA 2 ', size(1000,800))),
	new(L,label(nombre,'SISTEMA PARA DETECTAR CARACTERISTICAS DE COMPRADORES')),
	new(A,label(nombre,'hecho por Luis Benavides y David Almachi')),
	new(@texto,label(nombre,'Cuestionario:')),
	new(@respl,label(nombre,'')),
	new(Salir,button('SALIR',and(message(Menu, destroy),message(Menu,free)))),
	new(@boton,button('realizar test',message(@prolog,botones))),


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



fallas('C1'):- r8, !; r9, !.


%r19:- r14, verificar('r19'), r15, verificar('r19').
%r20:- r15, verificar('r20'), r16, verificar('r20').

%r14:- r8, verificar('r14'), r9, verificar('r14').
%r15:- r9, verificar('r15'), r10, verificar('r15').
%r16:- r10, verificar('r16'), r11, verificar('r16').

r8:- r1, verificar('r8'); r2, (verificar('r8'); r9).
r9:- r2, verificar('r9'); r3, verificar('r9').
%r10:- r3, verificar('r10'); r4, verificar('r10').
%r11:- r4, verificar('r11'); r5, verificar('r11').

r1:- h1, verificar('r1'); h2, verificar('r1').
r2:- h2, verificar('r2'); h3, verificar('r2').
r3:- h3, verificar('r3'); h4, verificar('r3').
%r4:- h4, verificar('r4'); h5, verificar('r4').
%r5:- h5, verificar('r5'); h6, verificar('r5').


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
