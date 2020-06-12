
:-use_module(library(pce)).
:- pce_image_directory('./imagenes').

:-use_module(library(pce_style_item)).


resource(fondo_inicio, image, image('logo.jpg')).
resource(compra_20_pantallas_cada_mes, image, image('h1_imagen.jpg')).
resource(compra_2_memorias_ram_por_anio, image, image('h2_imagen.jpg')).
resource(compra_15_placas_arduino_al_mes, image, image('h3_imagen.jpg')).
resource(compra_un_telefono_con_android, image, image('h4_imagen.jpg')).
resource(compra_una_tableta_digitalizadora, image, image('h5_imagen.jpg')).
resource(compra_un_iphone, image, image('h6_imagen.jpg')).
resource(compra_un_juego_de_pinturas, image, image('h7_imagen.jpg')).
resource(compra_2_lienzos_por_semana, image, image('h8_imagen.jpg')).
resource(compra_articulos_con_altas_calificaciones_en_calidad, image, image('r2_imagen.jpg')).
resource(compra_articulos_para_power_users, image, image('r3_imagen.jpg')).
resource(compra_articulos_recientes, image, image('r4_imagen.jpg')).
resource(revisa_frecuentemente_productos_populares, image, image('r5_imagen.jpg')).
resource(compra_articulos_basados_en_el_disenio, image, image('r6_imagen.jpg')).
resource(compra_un_juego_de_pinceles_cada_2_anios, image, image('r7_imagen.jpg')).
resource(compra_mas_de_10_productos_baratos_a_la_semana, image, image('r8_imagen.jpg')).
resource(revisa_productos_de_tecnologia_con_regularidad, image, image('r9_imagen.jpg')).
resource(revisa_articulos_basados_en_descuentos_altos, image, image('r10_imagen.jpg')).
resource(compra_productos_adquiridos_por_amigos, image, image('r11_imagen.jpg')).
resource(compra_articulos_de_marca, image, image('r12_imagen.jpg')).
resource(compra_menos_de_10_pinturas_por_mes, image, image('r13_imagen.jpg')).
resource(compra_mas_de_10_productos_por_semana, image, image('r14_imagen.jpg')).
resource(compra_al_menos_3_libros_de_ingenieria_al_anio, image, image('r15_imagen.jpg')).
resource(compra_articulos_con_buenos_comentarios, image, image('r16_imagen.jpg')).
resource(compra_articulos_basados_en_el_color, image, image('r17_imagen.jpg')).
resource(compra_mas_de_un_tipo_de_producto, image, image('r19_imagen.jpg')).
resource(compra_menos_de_5_libros_de_arte_al_anio, image, image('r18_imagen.jpg')).
resource(compra_en_su_mayoria_productos_de_tecnologia, image, image('r20_imagen.jpg')).
resource(compra_articulos_de_tecnologia_de_calidad, image, image('r21_imagen.jpg')).
resource(compra_articulos_de_arte_de_calidad, image, image('r22_imagen.jpg')).
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



fallas('Vendedor: Existe una alta posibilidad de que el cliente se dedique a comercializar varios productos adquiridos en al tienda online. '):- r19, !.
fallas('Ingeniero: Existe una alta probabilidad de que el cliente sea un estudiante de Ingenieria, o un Ingeniero ejerciendo la profesion. '):- r20, !.
fallas('Ingeniero: Existe una alta probabilidad de que el cliente sea un estudiante de Ingenieria, o un Ingeniero ejerciendo la profesion.'):- r21, !.
fallas('Artista: Existe una alta probabillidad de que el cliente sea un artista y adquiera paulatinamente su material de trabajo.'):- r22, !.


r19:- r14, verificar('compra_mas_de_un_tipo_de_producto').
r20:- r15, verificar('compra_en_su_mayoria_productos_de_tecnologia').
r21:- r16, verificar('compra_articulos_de_tecnologia_de_calidad').
r22:- r17, verificar('compra_articulos_de_arte_de_calidad').
r22:- r18, verificar('compra_articulos_de_arte_de_calidad').

r14:- r8, verificar('compra_mas_de_10_productos_por_semana').
r15:- r9, verificar('compra_al_menos_3_libros_de_ingenieria_al_anio').
r16:- r10, verificar('compra_articulos_con_buenos_comentarios').
r17:- r11, verificar('compra_articulos_basados_en_el_color').
r17:- r12, verificar('compra_articulos_basados_en_el_color').
r18:- r13, verificar('compra_menos_de_5_libros_de_arte_al_anio').

r8:- r1, verificar('compra_mas_de_10_productos_baratos_a_la_semana').
r9:- r2, verificar('revisa_productos_de_tecnologia_con_regularidad').
r10:- r3, verificar('revisa_articulos_basados_en_descuentos_altos').
r11:- r4, verificar('compra_productos_adquiridos_por_amigos').
r12:- r5, verificar('compra_articulos_de_marca').
r13:- r6, verificar('compra_menos_de_10_pinturas_por_mes').
r13:- r7, verificar('compra_menos_de_10_pinturas_por_mes').

r1:- h1, verificar('compra_articulos_con_precios_reducidos').
r2:- h2, verificar('compra_articulos_con_altas_calificaciones_en_calidad').
r3:- h3, verificar('compra_articulos_para_power_users').
r4:- h4, verificar('compra_articulos_recientes').
r5:- h5, verificar('revisa_frecuentemente_productos_populares').
r6:- h6, verificar('compra_articulos_basados_en_el_disenio').
r6:- h7, verificar('compra_articulos_basados_en_el_disenio').
r7:- h8, verificar('compra_un_juego_de_pinceles_cada_2_anios').


h1:- verificar('compra_20_pantallas_cada_mes').
h2:- verificar('compra_2_memorias_ram_por_anio').
h3:- verificar('compra_15_placas_arduino_al_mes').
h4:- verificar('compra_un_telefono_con_android').
h5:- verificar('compra_una_tableta_digitalizadora').
h6:- verificar('compra_un_iphone').
h7:- verificar('compra_un_juego_de_pinturas').
h8:- verificar('compra_2_lienzos_por_semana').
	

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
