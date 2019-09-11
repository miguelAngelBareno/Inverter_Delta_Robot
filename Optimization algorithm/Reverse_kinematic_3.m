% Calcula los valores articulares del robot DI-AM Ingresando los parametros
% de posicion cartesiana y los parametros del robot, 
% Ejemplo 
% 
% Robot.Rb=288;    %Radius of base [R_b]
% Robot.L=190;      %Length of links [L_e]
% Robot.Rm=45;    %Mobile platform radiol [R_m]
% Robot.Pv=10;    %Length of rail [L_r]
% Robot.J=10;    %Junta del brazo con la plataformla movil 
% 
% x=0;  y=0;  z=0;
% 
% q=Reverse_kinematic_2(Robot,x,y,z)

function [q]=Reverse_kinematic_2(Robot,x,y,z)
g=1;
str.P=[0,0,0];
%>>>>> Reverse kinematic <<<<<
for i=1:3
    %Distribucion angular
    theta(i) = (2*(i-1)*pi)/3; 
    %Posiciones de los puntos de la Base del robot
    str.A(i,:) = [str.P(1) + Robot.Rb*cos(theta(i)), str.P(2) + Robot.Rb*sin(theta(i)), str.P(3)];
end 
%Angulo generado entre el brazo del robot y el eje x
alpha = atan2(str.A(1,2) - str.P(1,2), str.A(1,1) - str.P(1,1))
for i=1:3
    if i==1
        %Posiciones dtre los puntos de la plataforma movil del reobot                          
        str.E(i,:) = [(x + Robot.Rm)*cos(theta(i)), (y + Robot.Rm)*sin(theta(i)), z];
        %Vector B
        str.B(i,:) = [str.A(i,1)+Robot.Pv*cos(theta(i)),str.A(i,2)+Robot.Pv*sin(theta(i)),str.P(3)]
        
    else                          
        str.E(i,:) = [(x + Robot.Rm)*cos(theta(i)+alpha), (y + Robot.Rm)*sin(theta(i)+alpha), z];
        %Vector B
         str.B(i,:) = [str.A(i,1)+Robot.Pv*cos(theta(i)+alpha),str.A(i,2)+Robot.Pv*sin(theta(i)+alpha),str.P(3)]
    end
     
   %revisar nueva implementacion con plataforma movil de ejes separados
   %la cual se deforma con los movimientos
   
    s=str.B(i,1)-str.A(i,1);
    m=s/z;
    n=(z^2+s^2)/-2*z;
    
   
    %Calculo de las componentes angulares del robot
    q(i)=acos(((x-str.F(i,1))^2+(y-str.F(i,2))^2+(z-str.F(i,3))^2-Robot.L^2-Robot.L^2)/(-2*Robot.L*Robot.L));
    
    %Conversion de radianes a grados 
    if g==1
    q(i)=q(i)*180/pi;
    end
    str.F
end




% Corroboracion angulos existentes 
comp1 = isreal(q(1));
comp2 = isreal(q(2));
comp3 = isreal(q(3));

if (comp1==1)&&(comp2==1)&&(comp3==1)
    q=[q(1) q(2) q(3)];
else 
    q=[NaN,NaN,NaN];
end
