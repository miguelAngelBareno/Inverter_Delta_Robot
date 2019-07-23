function q=Reverse_kinematic(Robot,x,y,z)
%>>>>> Reverse kinematic <<<<<
for i=1:3
theta(i) = (2*(i-1)*pi)/3; 
X(i,1)=(Robot.Rb-Robot.Rm)*cos(theta(i)); X(i,2)=(Robot.Rb-Robot.Rm)*sin(theta(i));X(i,3)=0;

q(i)=acos(((x-X(i,1))^2+(y-X(i,2))^2+(z-X(i,3))^2-Robot.L^2-Robot.L^2)/(-2*Robot.L*Robot.L));
end

comp1 = isreal(q(1));
comp2 = isreal(q(2));
comp3 = isreal(q(3));

if (comp1==1)&&(comp2==1)&&(comp3==1)
    q=[q(1) q(2) q(3)];
else 
    q=[NaN,NaN,NaN];
end
