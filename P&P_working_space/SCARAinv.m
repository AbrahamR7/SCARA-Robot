function Q= SCARAinv(S,L,sol )
% inverse kinematic: SCARA robot
Q= zeros(4,1);
x=S(1); y=S(2);z=S(3);Psi=S(4);
l1=L(1); l2=L(2);
beta=acos((x^2+ y^2-l1^2 -l2^2)/(2*l1*l2));
if (sol >0)
Q(2)= beta;
else
Q(2)= - beta;
end
Q(1)= atan2(y,x)- atan2(l2*sin(Q(2)) ,l1+l2*cos(Q(2)));
Q(3)= - z;
Q(4)= Q(1)+Q(2)-Psi;
end