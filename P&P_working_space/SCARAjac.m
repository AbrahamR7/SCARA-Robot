function J = SCARAjac(Q,L)
% Jacobian matrix: SCARA robot
l1=L(1);
l2=L(2);
J=zeros(4,2);
J(1,1)= -l1*sin(Q(1))-l2*sin(Q(1)+Q(2));
J(1,2)= - l2*sin(Q(1)+Q(2));
J(1,3)=0.0000001;
J(1,4)=0.0000001;
J(2,1)= l1*cos(Q(1))+l2*cos(Q(1)+Q(2));
J(2,2)= l2*cos(Q(1)+Q(2));
J(2,3)=0;
J(2,4)=0;
J(3,1)= 0;
J(3,2)= 0;
J(3,3)= -1;
J(3,4)= 0;
J(4,1)= 1;
J(4,2)= 1;
J(4,3)= 0;
J(4,4)= -1;
end