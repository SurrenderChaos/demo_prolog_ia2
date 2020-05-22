
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




r19 :- nivel1,
		verifica('Compra mas de un tipo de producto').
r20 :- nivel2,
		verifica('Compra en su mayoria productos de tecnologia').
r21 :- nivel3,
		verifica('Compra articulos de tecnologia de calidad').
r22 :- nivel4,
		verifica('Compra articulos de arte de calidad').

nivel1:- nodo,
		verificar('Compra mas de 10 productos a la semana'),
		verificar('Compra al menos 3 libros de ingenieria al anio').
nivel2:- nodo,
		verificar('Compra al menos 3 libros de ingenieria al anio'),
		verificar('Compra articulos con buenos comentarios').
nivel3:- nodo,
		verificar('Compra articulos con buenos comentarios'),
		verificar('Compra articulos basados en el color').
nivel4:- nodo,
		verificar('Compra articulos basados en el color'),
		verificar('Compra menos de 5 libros de arte al anio').

nodo:- nodo1,
		verificar('Compra mas de 10 productos baratos a la semana'),
		verificar('Revisa productos de tecnologia con regularidad').
nodo:- nodo2,
		verificar('Revisa productos de tecnologia con regularidad'),
		verificar('Revisa articulos basados en descuentos altos').


nodo1:- verificar('pregunta 1').
nodo2:- verificar('pregunta 2').







posibilidad(vendedor):-r19,!.
posibilidad(vendedor):-r20,!.
posibilidad(ingeniero):-r20,!.
posibilidad(ingeniero):-r21,!.
posibilidad(artista):-r21,!.
posibilidad(artista):-r22,!.
posibilidad(desconocido).





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
	posibilidad(Falla),
	send(@texto,selection(' ')),
	send(@respl,selection(Falla)),
	new(@boton,button('inicia procedimiento ',message(@prolog,botones))),
        send(Menu,display,@boton,point(40,50)),
        send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim :- send(@respl, selection('')).
