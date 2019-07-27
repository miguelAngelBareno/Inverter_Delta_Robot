function q=Reverse_kinematic_2(Robot,x,y,z)
str.P=[0,0,0];
%>>>>> Reverse kinematic <<<<<
for i=1:3
    %Distribucion angular
    theta(i) = (2*(i-1)*pi)/3; 
    %Posiciones de los puntos de la Base del robot
    str.A(i,:) = [str.P(1) + Robot.Rb*cos(theta(i)), str.P(2) + Robot.Rb*sin(theta(i)), str.P(3)];
    %Posiciones dtre los puntos de la plataforma movil del robot                          
    str.E(i,:) = [x + Robot.Rm*cos(thetdota(i)), y + Robot.Rm*sin(theta(i)), z];
    
    
    %Vectores punto EA
    str.EA(i,:)=str.A(i,:)-str.E(i,:);
    %Vector unitario EA=1
    str.uEA(i,:)=str.EA/norm(str.EA(i,:);
    %Punto de interes F 
    str.F(i,:) = [(str.A(i,1)+Robot.Pv-Robot.Rm)*str.uEA(i,1), (str.A(i,2) + Robot.Pv-Robot.Rm) * str.uEA(i,2), str.P(3)-Robot.J];
    %Calculo de las componentes angulares del robot 
    q(i)=acos(((x-str.F(i,1))^2+(y-str.F(i,2))^2+(z-str.F(i,3))^2-Robot.L^2-Robot.L^2)/(-2*Robot.L*Robot.L));
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
