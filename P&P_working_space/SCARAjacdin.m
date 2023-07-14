function J=SCARAjacdin(Q,L)
% jacobian matrix of the extended 2R
l1=L(1); l2=L(2);
g1=L(3); g2=L(4);
J=zeros(16,4);
J(1,1)=-l1*sin(Q(1))-l2*sin(Q(1)+Q(2));
J(1,2)=-l2*sin(Q(1)+Q(2));
J(1,3)=0;
J(1,4)=0;
J(2,1)=l1*cos(Q(1))+l2*cos(Q(1)+Q(2));
J(2,2)=l2*cos(Q(1)+Q(2));
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
J(5,1)=-l1*sin(Q(1))-l2*sin(Q(1)+Q(2));
J(5,2)=-l2*sin(Q(1)+Q(2));
J(5,3)=0;
J(5,4)=0;
J(6,1)=l1*cos(Q(1))+l2*cos(Q(1)+Q(2));
J(6,2)=l2*cos(Q(1)+Q(2));
J(6,3)=0;
J(6,4)=0;
J(7,1)= 0;
J(7,2)= 0;
J(7,3)= -1;
J(7,4)= 0;
J(8,1)= 1;
J(8,2)= 1;
J(8,3)= 0;
J(8,4)= -1;
J(9,1)=-l1*sin(Q(1))-g2*sin(Q(1)+Q(2));
J(9,2)=-g2*sin(Q(1)+Q(2));
J(9,3)= 0;
J(9,4)= 0;
J(10,1)=l1*cos(Q(1))+g2*cos(Q(1)+Q(2));
J(10,2)=g2*cos(Q(1)+Q(2));
J(10,3)= 0;
J(10,4)= 0;
J(11,1)= 0;
J(11,2)= 0;
J(11,3)= 0;
J(11,4)= 0;
J(12,1)= 1;
J(12,2)= 1;
J(12,3)= 0;
J(12,4)= 0;
J(13,1)=-g1*sin(Q(1)); 
J(13,2)=0;
J(13,3)= 0;
J(13,4)= 0;
J(14,1)=g1*cos(Q(1)); 
J(14,2)=0;
J(14,3)= 0;
J(14,4)= 0;
J(15,1)= 0;
J(15,2)= 0;
J(15,3)= 0;
J(15,4)= 0;
J(16,1)=1; 
J(16,2)=0;
J(16,3)=0;
J(16,4)=0;
end