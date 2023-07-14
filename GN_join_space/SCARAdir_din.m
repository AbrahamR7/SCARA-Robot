function S= SCARAdir_din(Q,L)
%direct kinematics of the extended 2R
l1=L(1); l2=L(2);
g1=L(3); g2=L(4);
S=zeros(16,1);
S(1)=l1*cos(Q(1))+l2*cos(Q(1)+Q(2));
S(2)=l1*sin(Q(1))+l2*sin(Q(1)+Q(2));
S(3)=18-Q(3);
S(4)=Q(1)+Q(2)-Q(4);

S(5)=l1*cos(Q(1))+l2*cos(Q(1)+Q(2));
S(6)=l1*sin(Q(1))+l2*sin(Q(1)+Q(2));
S(7)=30-Q(3);
S(8)=Q(1)+Q(2)-Q(4);

S(9)=l1*cos(Q(1))+g2*cos(Q(1)+Q(2));
S(10)=l1*sin(Q(1))+g2*sin(Q(1)+Q(2));
S(11)=20;
S(12)=(Q(1)+Q(2));

S(13)=g1*cos(Q(1));
S(14)=g1*sin (Q(1));
S(15)=25;
S(16)=(Q(1));
end
