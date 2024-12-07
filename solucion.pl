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

esCopada(departamento):-
    vive(_,vivienda(departamento,Ambientes,_,_)),
    Ambientes > 3.

esCopada(departamento):-
    vive(_,vivienda(departamento,_,Banios,_)),
    Banios > 1.

esCopada(loft):-
    vive(_,vivienda(loft,AnioConstruccion,_)),
    AnioConstruccion > 2015.
%% PUNTO 2 
barrioCopado(Barrio):-
    vive(_,vivienda(_,_,Barrio)),
    forall(vive(_,vivienda(Vivienda,_,Barrio)), esCopada(Vivienda)).

%% PUNTO 3 Barrio Caro

esBarata(casa):-
        vive(_,vivienda(casa,Metros,_)),
        Metros < 90.
    
esBarata(departamento):-
    vive(_,vivienda(departamento,Ambientes,_,_)),
    Ambientes < 3, Ambientes > 0.

esBarata(loft):-
    vive(_,vivienda(loft,AnioConstruccion,_)),
    AnioConstruccion < 2005.


barrioCaro(Barrio):-
    vive(_,vivienda(_,_,Barrio)),
    forall(vive(_,vivienda(Vivienda,_,Barrio)), not(esBarata(Vivienda))).
