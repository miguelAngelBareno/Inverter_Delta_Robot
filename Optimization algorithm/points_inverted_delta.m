% La siguiente funcion calcula las pociciones tridimencionales de las juntas 
% del robot, partiendo de la posicion del punto p=[0,0,0]

function str = points_inverted_delta(Robot,x,y,z)

  Pivot = 60;
  p0=[0,0,0];
    %base platform1
    for i=1:3
        theta(i) = (2*(i-1)*pi)/3; 
        str.A(i,:) = [p0(1) + Robot.Rb*cos(theta(i)), p0(2) + Robot.Rb*sin(theta(i)), p0(3)];
                              %Posiciones de los puntos de la Base del
                              %robot 
    end
    
    %mobile platform
    for i=1:3
        str.B(i,:) = [x + Robot.Rm*cos(theta(i)), y + Robot.Rm*sin(theta(i)), z];
                              %Posiciones de los puntos de la plataforma
                              %movil del robot 
    end
    
    %shadow
    for i=1: 3
        str.shadow =( norm(str.A(i,:)-str.B(i,:)))-str.B(i,3);
                              % Valor de la longitud de la proyeccion del
                              % brazo del robot sobre la base
    end
    
    for i=1:3
        alpha(i) = atan2(str.A(i,2) - str.B(i,2), str.A(i,1) - str.B(i,1));
                              %Angulo generado entre el brazo del robot y
                              %el eje x
    end
    
    %solving equations
    if z==0
        z=z+(1*exp(-100))
    end
    
    m = (2*str.shadow)/(2*z);    %Despejando el valor de b
    n = (-(str.shadow^2)/(2*z)); %Despejando el valor de b
    
    u = 1 + (m^2);            %valor de (a) para la ecuacion cuadratica
    v = 2*m*n;                %valor de (b) para la ecuacion cuadratica
    w = (n^2)-(Robot.L^2);         %valor de (c) para la ecuacion cuadratica
    
    a = ((-v) - sqrt((v^2) - (4*u*w))) / (2*u)  
                               %Ecuacion cuadratica que calcula el valor
                               %del punto de union entre el eslabon L1 y L2
                               %en su componente z
    a = abs(a);

    b = sqrt(Robot.L^2 - a^2)
    
    d= a-str.shadow
    c=sqrt(Robot.L^2-d^2)
    
    %elbow
    for i=1:3
        str.C(i,:) = [str.B(i,1) + a * cos(alpha(i)), str.B(i,2) + a * sin(alpha(i)), c];
    end
    
    %pivot
    for i=1:3
        str.D(i,:) = [str.A(i,1) + Pivot * cos(alpha(i)), str.A(i,2) + Pivot * sin(alpha(i)), p0(3)];
    end

end