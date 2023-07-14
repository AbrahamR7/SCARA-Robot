clear all; close all; clc;
%--------------------------- Cutting lenght -----------------------------

L=[22.5;17.5;11.25;8.75];
M=diag([0.5, 0.5, 0.5, 0.0565, 7, 7, 7,  0.0965,  4.8,  4.8, 4.8, 0.0365,  4,  4,  4, 0.0244]);
Fse=zeros(16,1);
Fse(1)=1;
Fse(2)=1;    
Fse(3)=1; 
Fse(4)=1;
Fse(5)=1;    
Fse(6)=1; 
Fse(7)=1;
Fse(8)=1;    
Fse(9)=1; 
Fse(10)=1;
Fse(11)=1;    
Fse(12)=1; 
Fse(13)=1;
Fse(14)=1;    
Fse(15)=1; 
i = 1;
%par.v=1/3;
%par.w=2/3;

PlotAreaSCARA (L ,12); % draw the work area
hold on


for x = 0 : 1 : 360
    resz = MC_Z(x);
    resx = MC_X(x);
    resy = MC_Y(x);
    resr = MC_04(x);
    t(i)= x;
   
    p1(i)= resx.pos;
    v1(i)= resx.vel;
    a1(i)= resx.acc;
    p2(i)= resy.pos;
    v2(i)= resy.vel;
    a2(i)= resy.acc;
    p3(i)= resz.pos;
    v3(i)= resz.vel;
    a3(i)= resz.acc;
    p4(i)= resr.pos;
    v4(i)= resr.vel;
    a4(i)= resr.acc;


    
    SS=[resx.pos;resy.pos;resz.pos;resr.pos];
    Sp=[resx.vel;resy.vel;resz.vel;resr.vel];
    Spp=[resx.acc;resy.acc;resz.acc;resr.acc];
     
    Q=SCARAinv(SS,L,1)

     PlotScara (Q, L,'r',12)

    J=SCARAjac(Q,L);
    e = eig(J)
    Qp=inv(J)*Sp;
    ann=Qp(1:2);
    an=Qp(1:2).';
    chie=an*ann;

    Jp=SCARAjacP(Q,Qp,L);
    Qpp=inv(J)*(Spp-Jp*Qp);
    qp1(i)=Qp(1);
    qp2(i)=Qp(2);


    
    Sd=SCARAdir_din(Q,L);
    J=SCARAjacdin(Q,L);
    Jp=SCARAjacPdin(Q,Qp,L);
    Spp=Jp*Qp+J*Qpp;
    %inertial forces
    Fsi=-M*Spp;
    % forces in the operational space
    Fs=(Fse+Fsi);
    % forces in the joint space
    Fcq=-J.'*Fs;
    display(Fcq)


    
    Fs1(i)=Fs(1);
    Fs2(i)=Fs(2);

    c1(i)=Fcq(1); c2(i)=Fcq(2);
    c3(i)=Fcq(3); c4(i)=Fcq(4);

    i = i+1;
end
%-------------------------- timing diagram ----------------------------------------
figure;
subplot(3,1,1);plot(t,p1,'r','LineWidth',2);grid;ylabel('');title('Position      X');
subplot(3,1,2);plot(t,v1,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,1,3);plot(t,a1,'k','LineWidth',2);grid;ylabel(''); title('Acceleration');
figure;
subplot(3,1,1);plot(t,p2,'r','LineWidth',2);grid;ylabel('');title('Position      Y');
subplot(3,1,2);plot(t,v2,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,1,3);plot(t,a2,'k','LineWidth',2);grid;ylabel(''); title('Acceleration')
figure;
subplot(3,1,1);plot(t,p3,'r','LineWidth',2);grid;ylabel('');title('Position     Z');
subplot(3,1,2);plot(t,v3,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,1,3);plot(t,a3,'k','LineWidth',2);grid;ylabel(''); title('Acceleration');
figure;

subplot(3,1,1);plot(t,p4,'r','LineWidth',2);grid;ylabel('');title('Position     Psi');
subplot(3,1,2);plot(t,v4,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,1,3);plot(t,a4,'k','LineWidth',2);grid;ylabel(''); title('Acceleration');


figure;
plot(t,c1,'r','LineWidth',2);grid;ylabel('torque');title('Q1');
figure;
plot(t,c2,'b','LineWidth',2);grid;ylabel('torque'); title('Q2');
figure;
plot(t,c3,'k','LineWidth',2);grid;ylabel('torque'); title('Q3');
figure;
plot(t,c4,'k','LineWidth',2);grid;ylabel('torque'); title('Q4');
figure;
subplot(3,4,1);plot(t,p1,'r','LineWidth',2);grid;ylabel('');title('Position      X');
subplot(3,4,5);plot(t,v1,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,4,9);plot(t,a1,'k','LineWidth',2);grid;ylabel(''); title('Acceleration');

subplot(3,4,2);plot(t,p2,'r','LineWidth',2);grid;ylabel('');title('Position      Y');
subplot(3,4,6);plot(t,v2,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,4,10);plot(t,a2,'k','LineWidth',2);grid;ylabel(''); title('Acceleration')

subplot(3,4,3);plot(t,p3,'r','LineWidth',2);grid;ylabel('');title('Position     Z');
subplot(3,4,7);plot(t,v3,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,4,11);plot(t,a3,'k','LineWidth',2);grid;ylabel(''); title('Acceleration');


subplot(3,4,4);plot(t,p4,'r','LineWidth',2);grid;ylabel('');title('Position     Psi');
subplot(3,4,8);plot(t,v4,'b','LineWidth',2);grid;ylabel(''); title('Velocity');
subplot(3,4,12);plot(t,a4,'k','LineWidth',2);grid;ylabel(''); title('Acceleration');

figure;

subplot(3,1,1);plot(t,c1,'r','LineWidth',2);grid;ylabel('torque');title('Q1');
subplot(3,1,2);plot(t,c2,'b','LineWidth',2);grid;ylabel('torque'); title('Q2');
subplot(3,1,3);plot(t,c3,'k','LineWidth',2);grid;ylabel('torque'); title('Q3');
