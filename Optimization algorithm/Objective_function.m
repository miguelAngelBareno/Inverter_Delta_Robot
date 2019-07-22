function F=Objective_function(x)

% chromosomes 

Rb=x(1); % Fixed base radius 
L=x(2);  % Length of links
Rm=x(3); % Movile base radius
Pv=x(4); %Pivot

%  Declaration global variables 

global H;
global R;
global Angle_joint;
global Resolution_cloud;
global Penal;
Angle_joint = evalin('base','Angle_joint'); % Maximun angular value 
H = evalin('base','H'); % Cylinder radius
R = evalin('base','R'); % Cylinder height
Resolution_cloud = evalin('base','Resolution_cloud'); 
Penal = evalin('base','Penal'); 
R_Draw = 1;%condicion para dibujar el robot

%Parameters geometric model of the robot

Robot.Rb=Rb;    %Radius of base [R_b]
Robot.L=L;    %Length of links [L_e]
Robot.Rm=Rm;    %Mobile platform radiol [R_m]
Robot.Pv=Pv;    %Length of rail [L_r]
set(gcf,'Color',[1,1,1]);

% Construction of cylindrical points clouds

i=1; j=1; T=H;
for h=(0):Resolution_cloud:T
    for r=1:(Resolution_cloud-1):R
        npr=round((2*pi*r)/Resolution_cloud);
        inc=(360/npr);
        for ang=0:inc:360
            
% Determine Cartesian coordinates

            x=r*cosd(ang);
            y=r*sind(ang);
            z=h;
            
% Calculation of the inverse kinematics          

            q=Reverse_kinematic(Robot,x,y,z);% Calculation of the articular coordinate
            q1=q(1);    %Position for actuator 1
            q2=q(2);    %Position for actuator 2
            q3=q(3);    %Position for actuator 3  
            
%Check Restrictions 
if (sum(isnan(q))>0) && (max(q) < Angle_joint
    V1=pi*R^2+H;                      % Cylinder volume
    V2=(pi*((Rb+Pv)^2+Rm^2+((Rb+Pv)*Rm))*z)/3;  % Truncated cone volume 
    F= (round(V1)+ round(V2);         % Value to minimize 
end
%Draw Robot 
if (R_Draw == 1)
                    figure(1); clf;
                    a(i)=x;
                    b(i)=y;
                    c(i)=z;
                    Draw_delta_robot(Robot,x,y,z);
                    hold on
                    plot3(a,b,c,'LineWidth',1,'Color','magenta')%% dibujar trayectoria
                    hold on
                    pause(0.01);
                    i=i+1;
end
        end
    end
end

 V1=pi*R^2+H;                      % Cylinder volume
    V2=(pi*((Rb+Pv)^2+Rm^2+((Rb+Pv)*Rm))*z)/3;  % Truncated cone volume 
    F= (round(V1)+ round(V2);         % Value to minimize 
end

            