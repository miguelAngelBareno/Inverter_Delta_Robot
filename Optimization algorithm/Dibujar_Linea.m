%La siguiente funcion dibuja una linea a partir de dos puntos expresados en
%coordenadas cartesianas
%
%Ejemplo
%
%p0 = [0, 0, 0];   % punto inicial
%p1 = [1, 1, 1];   % punto final
%color =[1, 0, 0]; % rojo[1, 0, 0], verde [0, 1, 0], azul[0, 0, 1]  
%grosor= 2;        % Grosor de la linea 
%
%dibujar_linea(p0, p1, color, grosor);
%
%Miguel Angel Bareño Bernal 16/06/2019

function Dibujar_Linea( p0, p1, color, grosor)
x = [p0(1), p1(1)];
y = [p0(2), p1(2)];
z = [p0(3), p1(3)];
plot3(x,y,z, 'color', color, 'Linewidth',2);