%vive(Persona, Vivienda, Localidad)
%casa(metros)
vive(juan,vivienda(casa,120,almagro)).
vive(nico,vivienda(departamento,3,2,almagro)). %departamento(ambientes,baños)
vive(alf,vivienda(departamento,3,1,almagro)).
vive(julian,vivienda(loft,2000,almagro)). %loft(anio)
vive(vale,vivienda(departamento,4,1,flores)).
vive(fer,vivienda(casa,110,flores)).
seQuiereMudar(rocio,vivienda(casa,90)).
%% 2. esCopada

esCopada(casa):-
    vive(_,vivienda(casa,Metros,_)),
    Metros > 100.

esCopada(Vivienda):-
    vive(_,vivienda(Vivienda,Ambientes,_,_)),
    Ambientes > 3.

esCopada(Vivienda):-
    vive(_,vivienda(Vivienda,_,Banios,_)),
    Banios > 1.

esCopada(Vivienda):-
    vive(_,vivienda(Vivienda,AnioConstruccion,_)),
    AnioConstruccion > 2015.
%% PUNTO 2 
barrioCopado(Barrio):-
    vive(_,vivienda(_,_,Barrio)),
    forall(vive(_,vivienda(Vivienda,_,Barrio)), esCopada(Vivienda)).

