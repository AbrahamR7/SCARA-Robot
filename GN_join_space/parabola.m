% main file of Group Name trajectory in join space


clear all; close all; clc;
L=[22.5;17.5;11.25;8.75];
S=[30,29, 29, 36, 36, 30;
   -15,1, 14, 1, 14,-15;
    0,10,10,10,10,0;
    0,0,0,0,0,0];
S1=[S(1,1);S(2,1);S(3,1);S(4,1)];
S2=[S(1,2);S(2,2);S(3,2);S(4,2)];
S3=[S(1,3);S(2,3);S(3,3);S(4,3)];
S4=[S(1,4);S(2,4);S(3,4);S(4,4)];
S5=[S(1,5);S(2,5);S(3,5);S(4,5)];
S6=[S(1,6);S(2,6);S(3,6);S(4,6)];
Q1=SCARAinv(S1,L ,1);
Q2=SCARAinv(S2,L ,1);
Q3=SCARAinv(S3,L ,1);
Q4=SCARAinv(S4,L ,1);
Q5=SCARAinv(S5,L ,1);
Q6=SCARAinv(S6,L ,1);
Q=[Q1, Q2, Q3,Q4, Q5, Q6];
%Qqq= deg2rad([0, 45, 135, 90; 0, 45, 90, 180]);
%motor characteristic
motor1.A = 1; motor1.D = 1; motor1.V = 1;
motor2.A = 1; motor2.D = 1; motor2.V = 1;
motor3.A = 1; motor3.D = 1; motor3.V = 1;
motor4.A = 1; motor4.D = 1; motor4.V = 1;
%put the motor characteristics in an array

motor=[motor1, motor2,motor3,motor4];
n_joints=length(motor);

%step 0 
% (computing the max of the min actuation times: 
% in the last practice you had to define a function able to compute the steps from 1 to 4 of the last practice:)
%%compute the minimum actuation time of the system and the joint distance
[T_min, dQ]=min_time (motor, Q);

%step1
% Using the anonymous function of the two formulas
t_in_=@(t_min1,dQ1, motor) t_min1 - sqrt((t_min1^2 - 2* abs(dQ1)/motor.A));
t_fin_=@(t_min_fi,dQfi, motor) t_min_fi - sqrt((t_min_fi^2 - 2* abs(dQfi)/motor.D));

t_in= zeros (n_joints, 1); t_fin= t_in;
for i= 1:n_joints
    t_in(i)=t_in_(T_min(1),dQ(i,1), motor(i));
    t_fin(i)=t_fin_(T_min(end),dQ(i,end), motor(i));
end

%step2 : find the internal parabolic transition
% computing the actuation time for the parabolic transition
t_min_par = zeros(n_joints, size(dQ, 2));
% t_min_par is [ min ]
t_min_par(:,1)=T_min(:,1)-.5* t_in;
t_min_par(:,end)=T_min(:,end)-.5* t_fin;
t_min_par(:,2)=T_min(:,2);
t_min_par(:,3)=T_min(:,3);
t_min_par(:,4:end-1)=T_min(:,4:end-1);

%computing the joint speed:
%computing the speed
Q_dot= dQ./t_min_par;

%comouting internal parabolic transition 
% computing the internal parabolic transition: tj
 for i= 1:n_joints
     tj(i,:)= abs(dQ(i,2:end)./t_min_par(i,2:end) - dQ(i,1:end-1)./t_min_par(i, 1:end-1))/motor(i).A;

 end

 %step3 time axis discretization for the whole trajetory:
 k=1;
 j=1;
 % first element is zero starting from zero time
 t_axis=zeros(4,1);
 %compute the DeltaTj
 tj_new=[t_in, tj, t_fin];
 Delta_tj_linear= t_min_par - .5*(tj_new(:, 2:end)+ tj_new(:, 1:end-1));
 % in this way I am considering the startingand the end where I have the
 %parabola: remember thatI am starting with parabola and alternating with
 %lines. In the end the trajectory end with parabola
 for i= 1:(size(Delta_tj_linear,2)+size(tj,2)+2)
     if mod(i-1,2)==0
         t_axis =[t_axis, t_axis(:,end)+tj_new(:,k)];
         k=k+1;
     else
         t_axis =[t_axis, t_axis(:,end)+Delta_tj_linear(:,j)];
         j=j+1;
     end

 end

 %step4 : lines: Determine the coefficients
 % time axis of the nodes of the prabolas : inner parabolas
 t_vertex=(t_axis(:,3:2:end-1)+ t_axis(:, 4:2:end))* 0.5;
 %coeficients of the lines
 ar = Q_dot;
 br = Q(:, 2:end) - Q_dot.*t_vertex;

 % step5 : Parabola
 % finding the dt different between the 2 time between two points close to
 %verteces
 dt_par=[t_in, tj, t_fin];
 %new speed/ac coeff keeping into account the nil speed before starting and
 %after ending
 arr = [zeros(4,1), ar, zeros(4,1)];
 ap = 0.5 * (arr(:, 2:end) - arr(:,1:end-1)) ./ dt_par;
 %t1_p: for the 3? parabola from the end are the first time axis on the line
 %side...the first one is the end point of the first parabola from left
 t1_p = [t_axis(:,2), t_axis(:, 3:2:end-1)];
 %coeficients bp
 bp = [Q_dot(:,1), Q_dot]- 2*ap.*t1_p;
 t1_p = t_axis(:, 1:2:end);
 x = ar.*t1_p(:, 2:end)+ br;
 %Adding the initial positions of the line: the first x coordinate is 
 %theta1
 y=zeros(4,1);
 y(1)=0.47366;
 y(2)=0.68169;
 x = [y,x];
 cp = x-ap.*t1_p.^2 - bp.*t1_p;

 %ploting :
 % defining the anonymous functions of lines and parabolas:
  %xi= ar.t+br
  %xp= ap.t^2 + bp.t+cp
  % line function

  I_function= @(ar, br, t) rad2deg(ar.*t + br);

  %parabola function
  p_function= @(ap, bp, cp, t) rad2deg(ap.*t.^2 + bp.*t +cp);
   
  %Time axis of the target joint positions : Q1,Q2,Q3,Q4
  % Drawing the target joints
  x_axis_joints= ones(4,1).*[T_min(1),sum(T_min(1:2)),sum(T_min(1:3)),sum(T_min(1:4)), sum(T_min)];
  x_axis_joints=[zeros(4,1),x_axis_joints];

  %Defining the time axis for pointing:



%Defining the time axis for pointing:
  %lines start from index 3 and they have step of 2
%parabolas index start from 1 and they have step of 2
%line deawing J1
tr_axis11 = linspace(t_axis(1, 2), t_axis(1,3), 100);
tr_axis12 = linspace(t_axis(1, 4), t_axis(1,5), 100);
tr_axis13 = linspace(t_axis(1, 6), t_axis(1,7), 100);
tr_axis14 = linspace(t_axis(1, 8), t_axis(1,9), 100);
tr_axis15 = linspace(t_axis(1, 10), t_axis(1,11), 100);
%line deawing J2
tr_axis21 = linspace(t_axis(2, 2), t_axis(2,3), 100);
tr_axis22 = linspace(t_axis(2, 4), t_axis(2,5), 100);
tr_axis23 = linspace(t_axis(2, 6), t_axis(2,7), 100);
tr_axis24 = linspace(t_axis(2, 8), t_axis(2,9), 100);
tr_axis25 = linspace(t_axis(2, 10), t_axis(2,11), 100);
%line deawing J3
tr_axis31 = linspace(t_axis(3, 2), t_axis(3,3), 100);
tr_axis32 = linspace(t_axis(3, 4), t_axis(3,5), 100);
tr_axis33 = linspace(t_axis(3, 6), t_axis(3,7), 100);
tr_axis34 = linspace(t_axis(3, 8), t_axis(3,9), 100);
tr_axis35 = linspace(t_axis(3,10), t_axis(3,11), 100);
%line deawing J4
tr_axis41 = linspace(t_axis(4, 2), t_axis(4,3), 100);
tr_axis42 = linspace(t_axis(4, 4), t_axis(4,5), 100);
tr_axis43 = linspace(t_axis(4, 6), t_axis(4,7), 100);
tr_axis44 = linspace(t_axis(4, 8), t_axis(4,9), 100);
tr_axis45 = linspace(t_axis(4,10), t_axis(4,11), 100);
% lines: J1
r11 = I_function(ar(1, 1),br(1, 1),tr_axis11);
r12 = I_function(ar(1, 2),br(1, 2),tr_axis12);
r13 = I_function(ar(1, 3),br(1, 3),tr_axis13);
r14 = I_function(ar(1, 4),br(1, 4),tr_axis14);
r15 = I_function(ar(1, 5),br(1, 5),tr_axis15);
% lines: J2
r21 = I_function(ar(2, 1),br(2, 1),tr_axis21);
r22 = I_function(ar(2, 2),br(2, 2),tr_axis22);
r23 = I_function(ar(2, 3),br(2, 3),tr_axis23);
r24 = I_function(ar(2, 4),br(2, 4),tr_axis24);
r25 = I_function(ar(2, 5),br(2, 5),tr_axis25);
% lines: J3
r31 = I_function(ar(3, 1),br(3, 1),tr_axis31);
r32 = I_function(ar(3, 2),br(3, 2),tr_axis32);
r33 = I_function(ar(3, 3),br(3, 3),tr_axis33);
r34 = I_function(ar(3, 4),br(3, 4),tr_axis34);
r35 = I_function(ar(3, 5),br(3, 5),tr_axis35);
% lines: J4
r41 = I_function(ar(4, 1),br(4, 1),tr_axis41);
r42 = I_function(ar(4, 2),br(4, 2),tr_axis42);
r43 = I_function(ar(4, 3),br(4, 3),tr_axis43);
r44 = I_function(ar(4, 4),br(4, 4),tr_axis44);
r45 = I_function(ar(4, 5),br(4, 5),tr_axis45);
% parabolic drawing J1
tp_axis11 = linspace(t_axis(1, 1), t_axis(1,2), 100); 
tp_axis12 = linspace(t_axis(1, 3), t_axis(1,4), 100); 
tp_axis13 = linspace(t_axis(1, 5), t_axis(1,6), 100); 
tp_axis14 = linspace(t_axis(1, 7), t_axis(1,8), 100); 
tp_axis15 = linspace(t_axis(1, 9), t_axis(1,10), 100); 
tp_axis16 = linspace(t_axis(1, end-1), t_axis(1,end),100);
% parabolic drawing J2
tp_axis21 = linspace(t_axis(2, 1), t_axis(2, 2), 100); 
tp_axis22 = linspace(t_axis(2, 3), t_axis(2, 4), 100); 
tp_axis23 = linspace(t_axis(2, 5), t_axis(2, 6), 100); 
tp_axis24 = linspace(t_axis(2, 7), t_axis(2, 8), 100); 
tp_axis25 = linspace(t_axis(2, 9), t_axis(2, 10), 100); 
tp_axis26 = linspace(t_axis(2, end-1), t_axis(2, end), 100);
% parabolic drawing J3
tp_axis31 = linspace(t_axis(3, 1), t_axis(3, 2), 100); 
tp_axis32 = linspace(t_axis(3, 3), t_axis(3, 4), 100); 
tp_axis33 = linspace(t_axis(3, 5), t_axis(3, 6), 100); 
tp_axis34 = linspace(t_axis(3, 7), t_axis(3, 8), 100); 
tp_axis35 = linspace(t_axis(3, 9), t_axis(3, 10), 100); 
tp_axis36 = linspace(t_axis(3, end-1), t_axis(3, end), 100);
% parabolic drawing J4
tp_axis41 = linspace(t_axis(4, 1), t_axis(4, 2), 100); 
tp_axis42 = linspace(t_axis(4, 3), t_axis(4, 4), 100); 
tp_axis43 = linspace(t_axis(4, 5), t_axis(4, 6), 100); 
tp_axis44 = linspace(t_axis(4, 7), t_axis(4, 8), 100); 
tp_axis45 = linspace(t_axis(4, 9), t_axis(4, 10), 100); 
tp_axis46 = linspace(t_axis(4, end-1), t_axis(4, end), 100);
%Defining the parabola with anonymous function defined before : % Parabolas J1
p11 = p_function(ap(1, 1), bp(1, 1), cp(1, 1),tp_axis11);
p12 = p_function(ap(1, 2), bp(1, 2), cp(1, 2),tp_axis12);
p13 = p_function(ap(1, 3), bp(1, 3), cp(1, 3),tp_axis13); 
p14 = p_function(ap(1, 4), bp(1, 4), cp(1, 4),tp_axis14);
p15 = p_function(ap(1, 5), bp(1, 5), cp(1, 5),tp_axis15); 
p16 = p_function(ap(1, 6), bp(1, 6), cp(1, 6),tp_axis16);
% Parabolas J2
p21 = p_function(ap(2, 1), bp(2, 1), cp(2, 1),tp_axis21); 
p22 = p_function(ap(2, 2), bp(2, 2), cp(2, 2),tp_axis22); 
p23 = p_function(ap(2, 3), bp(2, 3), cp(2, 3),tp_axis23); 
p24 = p_function(ap(2, 4), bp(2, 4), cp(2, 4),tp_axis24);
p25 = p_function(ap(2, 5), bp(2, 5), cp(2, 5),tp_axis25); 
p26 = p_function(ap(2, 6), bp(2, 6), cp(2, 6),tp_axis26);
% Parabolas J3
p31 = p_function(ap(3, 1), bp(3, 1), cp(3, 1),tp_axis31); 
p32 = p_function(ap(3, 2), bp(3, 2), cp(3, 2),tp_axis32); 
p33 = p_function(ap(3, 3), bp(3, 3), cp(3, 3),tp_axis33); 
p34 = p_function(ap(3, 4), bp(3, 4), cp(3, 4),tp_axis34);
p35 = p_function(ap(3, 5), bp(3, 5), cp(3, 5),tp_axis35); 
p36 = p_function(ap(3, 6), bp(3, 6), cp(3, 6),tp_axis36);

% Parabolas J4
p41 = p_function(ap(4, 1), bp(4, 1), cp(4, 1),tp_axis41); 
p42 = p_function(ap(4, 2), bp(4, 2), cp(4, 2),tp_axis42); 
p43 = p_function(ap(4, 3), bp(4, 3), cp(4, 3),tp_axis43); 
p44 = p_function(ap(4, 4), bp(4, 4), cp(4, 4),tp_axis44);
p45 = p_function(ap(4, 5), bp(4, 5), cp(4, 5),tp_axis45); 
p46 = p_function(ap(4, 6), bp(4, 6), cp(4, 6),tp_axis46);
Q = rad2deg(Q);
Q(3)=deg2rad(Q(3)); % conversion in degrees for plotting
%poiting J1:
figure;
grid on;
hold on;
% Plot of the points
plot(x_axis_joints(1, :), Q(1, :), '*');
% Plot horizental lines end points
plot([0, t_in(1)/2], [Q(1,1), Q(1,1)], 'r',[t_axis(1, end), x_axis_joints(1,end) - t_fin(1)/2], [Q(1, end), Q(1, end)], 'r')
% Plot breaked lines: thetal*, vertex inner parabolas, thetaend*
%plot ([t_axis(1, 2)/ 2, t1_p(1, 2:end-1) + tj(1,:)/2, t_axis(1, end) - t_fin(1)/2], Q(1,:), 'r')
plot([t_axis(1, 2) / 2,t_vertex(1,:)] ,Q(1,:), 'r','LineWidth',1)
% ploting lines
plot(tr_axis11, r11, 'b', tr_axis12, r12, 'b',tr_axis13, r13, 'b', tr_axis14, r14, 'b', tr_axis15, r15, 'b' ,'LineWidth',1)
% Plot parabolas
plot(tp_axis11, p11, 'b', tp_axis12, p12,'b' ,tp_axis13, p13,'b',tp_axis14, p14,'b',tp_axis15, p15,'b',tp_axis16, p16,'b','LineWidth',1) 
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$q_1$ [deg]' , 'interpreter', 'latex');
title('$Q_1$ Lines and parabolas','interpreter','latex')

% PLOTING J2
figure;
grid on;
hold on;
% Plot of the points
plot(x_axis_joints(2, :), Q(2, :),'*');
% Plot horizental lines end points
plot([0, t_in(2)/2], [Q(2,1), Q(2,1)], 'r',[t_axis(2, end), x_axis_joints(2,end) - t_fin(2)/2], [Q(2, end), Q(2, end)], 'r')
% Plot breaked lines: thetal*, vertex inner parabolas, thetaend*
%plot ([t_axis(1, 2)/ 2, t1_p(1, 2:end-1) + tj(1,:)/2, t_axis(1, end) - t_fin(1)/2], Q(1,:), 'r')
plot([t_axis(2, 2) / 2,t_vertex(2,:)] ,Q(2,:), 'r','LineWidth',1)
% ploting lines
plot(tr_axis21, r21, 'b', tr_axis22, r22, 'b',tr_axis23, r23, 'b',tr_axis24, r24, 'b',tr_axis25, r25, 'b' ,'LineWidth',1)
% Plot parabolas
plot(tp_axis21, p21, 'b', tp_axis22, p22,'b' ,tp_axis23, p23,'b',tp_axis24, p24,'b',tp_axis25, p25,'b',tp_axis26, p26,'b','LineWidth',1) 
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$q_2$ [deg]' , 'interpreter', 'latex');
title('$Q_2$ Lines and parabolas', 'interpreter','latex')

% PLOTING J3
figure;
grid on;
hold on;
% Plot of the points
plot(x_axis_joints(3, :), Q(3, :), '*');
% Plot horizental lines end points
plot([0, t_in(3)/2], [Q(3,1), Q(3,1)], 'r',[t_axis(3, end), x_axis_joints(3,end) - t_fin(3)/2], [Q(3, end), Q(3, end)], 'r')
% Plot breaked lines: thetal*, vertex inner parabolas, thetaend*
plot([t_axis(3, 2) / 2,t_vertex(3,:)] ,Q(3,:), 'r','LineWidth',1)
% ploting lines
plot(tr_axis31, r31, 'b', tr_axis32, r32, 'b',tr_axis33, r33, 'b', tr_axis34, r34, 'b', tr_axis35, r35, 'b' ,'LineWidth',1)
% Plot parabolas
plot(tp_axis31, p31, 'b', tp_axis32, p32,'b' ,tp_axis33, p33,'b',tp_axis34, p34,'b',tp_axis35, p35,'b',tp_axis36, p36,'b','LineWidth',1) 
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$q_3$ [deg]' , 'interpreter', 'latex');
title('$Q_3$ Lines and parabolas','interpreter','latex')

% PLOTING J4
figure;
grid on;
hold on;
% Plot of the points
plot(x_axis_joints(4, :), Q(4, :), '*');
% Plot horizental lines end points
plot([0, t_in(4)/2], [Q(4,1), Q(4,1)], 'r',[t_axis(4, end), x_axis_joints(4,end) - t_fin(4)/2], [Q(4, end), Q(4, end)], 'r')
% Plot breaked lines: thetal*, vertex inner parabolas, thetaend*
plot([t_axis(4, 2) / 2,t_vertex(4,:)] ,Q(4,:), 'r','LineWidth',1)
% ploting lines
plot(tr_axis41, r41, 'b', tr_axis42, r42, 'b',tr_axis43, r43, 'b', tr_axis44, r44, 'b', tr_axis45, r45, 'b','LineWidth',1 )
% Plot parabolas
plot(tp_axis41, p41, 'b', tp_axis42, p42,'b' ,tp_axis43, p43,'b',tp_axis44, p44,'b',tp_axis45, p45,'b',tp_axis46, p46,'b','LineWidth',1) 
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$q_4$ [deg]' , 'interpreter', 'latex');
title('$Q_4$ Lines and parabolas','interpreter','latex')

%PLOTTING SPEED AND ACCELERATIONS:
%for parabolas the speed is the firt time derivative %xdot=2ap.t+bp=Qdot
%for the lines:
%xdot=ar=Qdot
% the Acceleration for parabolas:
%x=2ap
%for the lines the acceleration is null.
q_dot_parab_func = @(ap, bp, t) 2*ap*t + bp;
%Diagram for J1
figure;
subplot(2, 1, 1);
grid on;
hold on;
%speed
plot(tp_axis11, q_dot_parab_func(ap(1,1), bp(1,1), tp_axis11), 'b', tp_axis12, q_dot_parab_func(ap(1,2), bp(1,2), tp_axis12), 'b',tp_axis13, q_dot_parab_func(ap(1,3), bp(1,3), tp_axis13), 'b', tp_axis14, q_dot_parab_func(ap(1,4), bp(1,4), tp_axis14), 'b', tp_axis15, q_dot_parab_func(ap(1,5), bp(1,5), tp_axis15), 'b', tp_axis16, q_dot_parab_func(ap(1,6), bp(1,6), tp_axis16), 'b','LineWidth',1)
plot(tr_axis11, ar(1,1)*ones(1,length(tr_axis11)),'b',tr_axis12, ar(1,2)*ones(1,length(tr_axis12)),'b',tr_axis13, ar(1,3)*ones(1,length(tr_axis13)),'b',tr_axis14, ar(1,4)*ones(1,length(tr_axis14)),'b',tr_axis15, ar(1,5)*ones(1,length(tr_axis15)),'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\dot{q_1}$ [rad/s]' , 'interpreter', 'latex');
title('$Q_1$','interpreter','latex')
% Acceleration
subplot(2, 1, 2);
grid on;
hold on;
plot(tp_axis11, 2*ap(1,1)*ones(1, length(tp_axis11)), 'b',tp_axis12, 2*ap(1,2)*ones(1, length(tp_axis12)), 'b',tp_axis13, 2*ap(1,3)*ones(1, length(tp_axis13)), 'b',tp_axis14, 2*ap(1,4)*ones(1, length(tp_axis14)), 'b',tp_axis15, 2*ap(1,5)*ones(1, length(tp_axis15)), 'b',tp_axis16, 2*ap(1,6)*ones(1, length(tp_axis16)), 'b','LineWidth',1) 
plot(tr_axis11, zeros(1, length(tr_axis11)),'b',tr_axis12, zeros(1, length(tr_axis12)),'b',tr_axis13, zeros(1, length(tr_axis13)),'b',tr_axis14, zeros(1, length(tr_axis14)),'b',tr_axis15, zeros(1, length(tr_axis15)),'b','LineWidth',1) 
plot([tp_axis11(end), tr_axis11(1)], [2*ap(1,1), 0], 'b',[tr_axis11(end), tp_axis12(1)],[0,2*ap(1,2)],'b',[tp_axis12(end),tr_axis12(1)], [2*ap(1,2),0], 'b',[tr_axis12(end),tp_axis13(1)],[0, 2*ap(1,3)],'b',[tp_axis13(end), tr_axis13(1)], [2*ap(1,3),0],'b',[tr_axis13(end), tp_axis14(1)],[0, 2*ap(1,4)], 'b',[tp_axis14(end), tr_axis14(1)], [2*ap(1,4), 0], 'b',[tr_axis14(end), tp_axis15(1)],[0,2*ap(1,5)],'b',[tp_axis15(end), tr_axis15(1)], [2*ap(1,5), 0], 'b',[tr_axis15(end), tp_axis16(1)],[0,2*ap(1,6)],'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\ddot{q_1}$ [rad/s]' , 'interpreter', 'latex');

%-------------------------------------------------------------
% %Diagram for J2
figure;
subplot(2, 1, 1);
grid on;
hold on;
%speed
plot(tp_axis21, q_dot_parab_func(ap(2,1), bp(2,1), tp_axis21), 'b', tp_axis22, q_dot_parab_func(ap(2,2), bp(2,2), tp_axis22), 'b',tp_axis23, q_dot_parab_func(ap(2,3), bp(2,3), tp_axis23), 'b', tp_axis24, q_dot_parab_func(ap(2,4), bp(2,4), tp_axis24), 'b', tp_axis25, q_dot_parab_func(ap(2,5), bp(2,5), tp_axis25), 'b', tp_axis26, q_dot_parab_func(ap(2,6), bp(2,6), tp_axis26), 'b','LineWidth',1)
plot(tr_axis21, ar(2,1)*ones(1,length(tr_axis21)),'b',tr_axis22, ar(2,2)*ones(1,length(tr_axis22)),'b',tr_axis23, ar(2,3)*ones(1,length(tr_axis23)),'b',tr_axis24, ar(2,4)*ones(1,length(tr_axis24)),'b',tr_axis25, ar(2,5)*ones(1,length(tr_axis25)),'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\dot{q_2}$ [rad/s]' , 'interpreter', 'latex');
title('$Q_2$','interpreter','latex')
% Acceleration
subplot(2, 1, 2);
grid on;
hold on;
plot(tp_axis21, 2*ap(2,1)*ones(1, length(tp_axis21)), 'b',tp_axis22, 2*ap(2,2)*ones(1, length(tp_axis22)), 'b',tp_axis23, 2*ap(2,3)*ones(1, length(tp_axis23)), 'b',tp_axis24, 2*ap(2,4)*ones(1, length(tp_axis24)), 'b',tp_axis25, 2*ap(2,5)*ones(1, length(tp_axis25)), 'b',tp_axis26, 2*ap(2,6)*ones(1, length(tp_axis26)), 'b','LineWidth',1) 
plot(tr_axis21, zeros(1, length(tr_axis21)),'b',tr_axis22, zeros(1, length(tr_axis22)),'b',tr_axis23, zeros(1, length(tr_axis23)),'b',tr_axis24, zeros(1, length(tr_axis24)),'b',tr_axis25, zeros(1, length(tr_axis25)),'b','LineWidth',1) 
plot([tp_axis21(end), tr_axis21(1)], [2*ap(2,1), 0], 'b',[tr_axis21(end), tp_axis22(1)],[0,2*ap(2,2)],'b',[tp_axis22(end),tr_axis22(1)], [2*ap(2,2),0], 'b',[tr_axis22(end),tp_axis23(1)],[0, 2*ap(2,3)],'b',[tp_axis23(end), tr_axis23(1)], [2*ap(2,3),0],'b',[tr_axis23(end), tp_axis24(1)],[0, 2*ap(2,4)], 'b',[tp_axis24(end), tr_axis24(1)], [2*ap(2,4), 0], 'b',[tr_axis24(end), tp_axis25(1)],[0,2*ap(2,5)],'b',[tp_axis25(end), tr_axis25(1)], [2*ap(2,5), 0], 'b',[tr_axis25(end), tp_axis26(1)],[0,2*ap(2,6)],'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\ddot{q_2}$ [rad/s]' , 'interpreter', 'latex');

%-------------------------------------------------------------
% %Diagram for J3
figure;
subplot(2, 1, 1);
grid on;
hold on;
%speed
plot(tp_axis31, q_dot_parab_func(ap(3,1), bp(3,1), tp_axis31), 'b', tp_axis32, q_dot_parab_func(ap(3,2), bp(3,2), tp_axis32), 'b',tp_axis33, q_dot_parab_func(ap(3,3), bp(3,3), tp_axis33), 'b', tp_axis34, q_dot_parab_func(ap(3,4), bp(3,4), tp_axis34), 'b', tp_axis35, q_dot_parab_func(ap(3,5), bp(3,5), tp_axis35), 'b', tp_axis36, q_dot_parab_func(ap(3,6), bp(3,6), tp_axis36), 'b','LineWidth',1)
plot(tr_axis31, ar(3,1)*ones(1,length(tr_axis31)),'b',tr_axis32, ar(3,2)*ones(1,length(tr_axis32)),'b',tr_axis33, ar(3,3)*ones(1,length(tr_axis33)),'b',tr_axis34, ar(3,4)*ones(1,length(tr_axis34)),'b',tr_axis35, ar(3,5)*ones(1,length(tr_axis35)),'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\dot{q_3}$ [rad/s]' , 'interpreter', 'latex');
title('$Q_3$','interpreter','latex')
% Acceleration
subplot(2, 1, 2);
grid on;
hold on;
plot(tp_axis31, 2*ap(3,1)*ones(1, length(tp_axis31)), 'b',tp_axis32, 2*ap(3,2)*ones(1, length(tp_axis32)), 'b',tp_axis33, 2*ap(3,3)*ones(1, length(tp_axis33)), 'b',tp_axis34, 2*ap(3,4)*ones(1, length(tp_axis34)), 'b',tp_axis35, 2*ap(3,5)*ones(1, length(tp_axis35)), 'b',tp_axis36, 2*ap(3,6)*ones(1, length(tp_axis36)), 'b','LineWidth',1) 
plot(tr_axis31, zeros(1, length(tr_axis31)),'b',tr_axis32, zeros(1, length(tr_axis32)),'b',tr_axis33, zeros(1, length(tr_axis33)),'b',tr_axis34, zeros(1, length(tr_axis34)),'b',tr_axis35, zeros(1, length(tr_axis35)),'b','LineWidth',1,'LineWidth',1,'LineWidth',1) 
plot([tp_axis31(end), tr_axis31(1)], [2*ap(3,1), 0], 'b',[tr_axis31(end), tp_axis32(1)],[0,2*ap(3,2)],'b',[tp_axis32(end),tr_axis32(1)], [2*ap(3,2),0], 'b',[tr_axis32(end),tp_axis33(1)],[0, 2*ap(3,3)],'b',[tp_axis33(end), tr_axis33(1)], [2*ap(3,3),0],'b',[tr_axis33(end), tp_axis34(1)],[0, 2*ap(3,4)], 'b',[tp_axis34(end), tr_axis34(1)], [2*ap(3,4), 0], 'b',[tr_axis34(end), tp_axis35(1)],[0,2*ap(3,5)],'b',[tp_axis35(end), tr_axis35(1)], [2*ap(3,5), 0], 'b',[tr_axis35(end), tp_axis36(1)],[0,2*ap(3,6)],'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\ddot{q_3}$ [rad/s]' , 'interpreter', 'latex');
%-------------------------------------------------------------
% %Diagram for J4
figure;
subplot(2, 1, 1);
grid on;
hold on;
%speed
plot(tp_axis41, q_dot_parab_func(ap(4,1), bp(4,1), tp_axis41), 'b', tp_axis42, q_dot_parab_func(ap(4,2), bp(4,2), tp_axis42), 'b',tp_axis43, q_dot_parab_func(ap(4,3), bp(4,3), tp_axis43), 'b', tp_axis44, q_dot_parab_func(ap(4,4), bp(4,4), tp_axis44), 'b', tp_axis45, q_dot_parab_func(ap(4,5), bp(4,5), tp_axis45), 'b', tp_axis46, q_dot_parab_func(ap(4,6), bp(4,6), tp_axis46), 'b','LineWidth',1)
plot(tr_axis41, ar(4,1)*ones(1,length(tr_axis41)),'b',tr_axis42, ar(4,2)*ones(1,length(tr_axis42)),'b',tr_axis43, ar(4,3)*ones(1,length(tr_axis43)),'b',tr_axis44, ar(4,4)*ones(1,length(tr_axis44)),'b',tr_axis45, ar(4,5)*ones(1,length(tr_axis45)),'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\dot{q_4}$ [rad/s]' , 'interpreter', 'latex');
title('$Q_4$','interpreter','latex')
% Acceleration
subplot(2, 1, 2);
grid on;
hold on;
plot(tp_axis41, 2*ap(4,1)*ones(1, length(tp_axis41)), 'b',tp_axis42, 2*ap(4,2)*ones(1, length(tp_axis42)), 'b',tp_axis43, 2*ap(4,3)*ones(1, length(tp_axis43)), 'b',tp_axis44, 2*ap(4,4)*ones(1, length(tp_axis44)), 'b',tp_axis45, 2*ap(4,5)*ones(1, length(tp_axis45)), 'b',tp_axis46, 2*ap(4,6)*ones(1, length(tp_axis46)), 'b','LineWidth',1) 
plot(tr_axis41, zeros(1, length(tr_axis41)),'b',tr_axis42, zeros(1, length(tr_axis42)),'b',tr_axis43, zeros(1, length(tr_axis43)),'b',tr_axis44, zeros(1, length(tr_axis44)),'b',tr_axis45, zeros(1, length(tr_axis45)),'b','LineWidth',1) 
plot([tp_axis41(end), tr_axis41(1)], [2*ap(4,1), 0], 'b',[tr_axis41(end), tp_axis42(1)],[0,2*ap(4,2)],'b',[tp_axis42(end),tr_axis42(1)], [2*ap(4,2),0], 'b',[tr_axis42(end),tp_axis43(1)],[0, 2*ap(4,3)],'b',[tp_axis43(end), tr_axis43(1)], [2*ap(4,3),0],'b',[tr_axis43(end), tp_axis44(1)],[0, 2*ap(4,4)], 'b',[tp_axis44(end), tr_axis44(1)], [2*ap(4,4), 0], 'b',[tr_axis44(end), tp_axis45(1)],[0,2*ap(4,5)],'b',[tp_axis45(end), tr_axis45(1)], [2*ap(4,5), 0], 'b',[tr_axis45(end), tp_axis46(1)],[0,2*ap(4,6)],'b','LineWidth',1)
xlabel('Time [s]', 'Interpreter','latex');
ylabel('$\ddot{q_4}$ [rad/s]' , 'interpreter', 'latex');

    