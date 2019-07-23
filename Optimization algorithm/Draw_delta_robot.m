function Draw_delta_robot(Robot,x,y,z)
q=Reverse_kinematic(Robot,x,y,z);
color_1=[0 0 1];   % Color de los eslabones de la base Fija
    color_2=[0 1 0];   % Color de los eslabones de la base movil
    color_3=[0 0.5 0.6];   % Color de los eslabones del robot
    
    linea_1=  5;       % Grosor de linea base fija
    linea_2=0.8;       % Grosor de linea base movil
    linea_3=0.8;       % Grosor de linea eslabones del robot
    
    points=points_inverted_delta(Robot,x,y,z);
    
    %points
    A = points.A;
    B = points.B;
    C = points.C;
    D = points.D;
    
    hold on;
    grid on;
    
    %draw base
    Dibujar_Linea(A(1,:),A(2,:),color_1,linea_1);
    Dibujar_Linea(A(2,:),A(3,:),color_1,linea_1);
    Dibujar_Linea(A(3,:),A(1,:),color_1,linea_1);
    
    text( A(1,1),A(1,2),A(1,3),strcat('A') );
    text( A(2,1),A(2,2),A(2,3),strcat('B') );
    text( A(3,1),A(3,2),A(3,3),strcat('C') );
    
    plot3(A(1,1),A(1,2),A(1,3),'or')
    plot3(A(2,1),A(2,2),A(2,3),'or')
    plot3(A(3,1),A(3,2),A(3,3),'or')
    
    %draw movable platform
    Dibujar_Linea(B(1,:),B(2,:),color_2,linea_2);
    Dibujar_Linea(B(2,:),B(3,:),color_2,linea_2);
    Dibujar_Linea(B(3,:),B(1,:),color_2,linea_2);
    
    text( B(1,1),B(1,2),B(1,3),strcat('a') );
    text( B(2,1),B(2,2),B(2,3),strcat('b') );
    text( B(3,1),B(3,2),B(3,3),strcat('c') );
    
    plot3(B(1,1),B(1,2),B(1,3),'or')
    plot3(B(2,1),B(2,2),B(2,3),'or')
    plot3(B(3,1),B(3,2),B(3,3),'or')
    
    %draw pivot
    Dibujar_Linea(A(1,:),D(1,:),color_3,linea_3);
    Dibujar_Linea(A(2,:),D(2,:),color_3,linea_3);
    Dibujar_Linea(A(3,:),D(3,:),color_3,linea_3);
    
    plot3(D(1,1),D(1,2),D(1,3),'or')
    plot3(D(2,1),D(2,2),D(2,3),'or')
    plot3(D(3,1),D(3,2),D(3,3),'or')
    
    %draw arms
    Dibujar_Linea(D(1,:),C(1,:),color_3,linea_3); Dibujar_Linea(B(1,:),C(1,:),color_3,linea_3);
    Dibujar_Linea(D(2,:),C(2,:),color_3,linea_3); Dibujar_Linea(B(2,:),C(2,:),color_3,linea_3);
    Dibujar_Linea(D(3,:),C(3,:),color_3,linea_3); Dibujar_Linea(B(3,:),C(3,:),color_3,linea_3);
    
    plot3(C(1,1),C(1,2),C(1,3),'or')
    plot3(C(2,1),C(2,2),C(2,3),'or')
    plot3(C(3,1),C(3,2),C(3,3),'or')
    
   view(14,38);  axis([-400 400 -400 400 0 300])

