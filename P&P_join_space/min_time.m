function[T_min, dQ] = min_time(motor, Q)
dq1_1 = Q(1,2)-Q(1,1);
dq2_1 = Q(2,2)-Q(2,1);
dq3_1 = Q(3,2)-Q(3,1);
dq4_1 = Q(4,2)-Q(4,1);

dq1_2 = Q(1,3)-Q(1,2);
dq2_2 = Q(2,3)-Q(2,2);
dq3_2 = Q(3,3)-Q(3,2);
dq4_2 = Q(4,3)-Q(4,2);

dq1_3 = Q(1,4)-Q(1,3);
dq2_3 = Q(2,4)-Q(2,3);
dq3_3 = Q(3,4)-Q(3,3);
dq4_3 = Q(4,4)-Q(4,3);

dq1_4 = Q(1,5)-Q(1,4);
dq2_4 = Q(2,5)-Q(2,4);
dq3_4 = Q(3,5)-Q(3,4);
dq4_4 = Q(4,5)-Q(4,4);

dq1_5 = Q(1,6)-Q(1,5);
dq2_5 = Q(2,6)-Q(2,5);
dq3_5 = Q(3,6)-Q(3,5);
dq4_5 = Q(4,6)-Q(4,5);

dq1_6 = Q(1,7)-Q(1,6);
dq2_6 = Q(2,7)-Q(2,6);
dq3_6 = Q(3,7)-Q(3,6);
dq4_6 = Q(4,7)-Q(4,6);

dq1_7 = Q(1,8)-Q(1,7);
dq2_7 = Q(2,8)-Q(2,7);
dq3_7 = Q(3,8)-Q(3,7);
dq4_7 = Q(4,8)-Q(4,7);

dq1_8 = Q(1,9)-Q(1,8);
dq2_8 = Q(2,9)-Q(2,8);
dq3_8 = Q(3,9)-Q(3,8);
dq4_8 = Q(4,9)-Q(4,8);


dQ = [dq1_1, dq1_2, dq1_3, dq1_4, dq1_5, dq1_6, dq1_7, dq1_8 ;
    dq2_1, dq2_2, dq2_3,dq2_4, dq2_5, dq2_6, dq2_7, dq2_8;
    dq3_1, dq3_2, dq3_3,dq3_4, dq3_5, dq3_6, dq3_7, dq3_8;
    dq4_1, dq4_2, dq4_3,dq4_4, dq4_5, dq4_6, dq4_7, dq4_8];

[T_lim, Q_lim] = limit_case(motor);
T_case1 = @(dS, motor) ( sqrt(motor.A / motor.D) + sqrt(motor.D / motor.A) ) * sqrt( 2 * dS / (motor.A + motor.D ) );
T_case2 = @(dS, motor) dS / motor.V + motor.V * (motor.A + motor.D) / (2* motor.A*motor.D);



if dq1_1 <= Q_lim(1)
    T_min_1(1)=T_case1(dq1_1,motor(1));
else
    T_min_1(1)=T_case2(dq1_1,motor(1));
end
if dq2_1 <= Q_lim(2)
    T_min_2(1)=T_case1(dq2_1,motor(2));
else
    T_min_2(1)=T_case2(dq2_1,motor(2));
end
if dq3_1 <= Q_lim(3)
    T_min_3(1)=T_case1(dq3_1,motor(3));
else
    T_min_3(1)=T_case2(dq3_1,motor(3));
end
if dq4_1 <= Q_lim(4)
    T_min_4(1)=T_case1(dq4_1,motor(4));
else
    T_min_4(1)=T_case2(dq4_1,motor(4));
end





if dq1_2 <= Q_lim(1)
    T_min_1(2)=T_case1(dq1_2,motor(1));
else
    T_min_1(2)=T_case2(dq1_2,motor(1));
end
if dq2_2 <= Q_lim(2)
    T_min_2(2)=T_case1(dq2_2,motor(2));
else
    T_min_2(2)=T_case2(dq2_2,motor(2));
end
if dq3_2 <= Q_lim(3)
    T_min_3(2)=T_case1(dq3_2,motor(3));
else
    T_min_3(2)=T_case2(dq3_2,motor(3));
end
if dq4_2 <= Q_lim(4)
    T_min_4(2)=T_case1(dq4_2,motor(4));
else
    T_min_4(2)=T_case2(dq4_2,motor(4));
end




if dq1_3 <= Q_lim(1)
    T_min_1(3)=T_case1(dq1_3,motor(1));
else
    T_min_1(3)=T_case2(dq1_3,motor(1));
end
if dq2_3 <= Q_lim(2)
    T_min_2(3)=T_case1(dq2_3,motor(2));
else
    T_min_2(3)=T_case2(dq2_3,motor(2));
end
if dq3_3 <= Q_lim(3)
    T_min_3(3)=T_case1(dq3_3,motor(3));
else
    T_min_3(3)=T_case2(dq3_3,motor(3));
end
if dq4_3 <= Q_lim(4)
    T_min_4(3)=T_case1(dq4_3,motor(4));
else
    T_min_4(3)=T_case2(dq4_3,motor(4));
end



if dq1_4 <= Q_lim(1)
    T_min_1(4)=T_case1(dq1_4,motor(1));
else
    T_min_1(4)=T_case2(dq1_4,motor(1));
end
if dq2_4 <= Q_lim(2)
    T_min_2(4)=T_case1(dq2_4,motor(2));
else
    T_min_2(4)=T_case2(dq2_4,motor(2));
end
if dq3_4 <= Q_lim(3)
    T_min_3(4)=T_case1(dq3_4,motor(3));
else
    T_min_3(4)=T_case2(dq3_4,motor(3));
end
if dq4_4 <= Q_lim(4)
    T_min_4(4)=T_case1(dq4_4,motor(4));
else
    T_min_4(4)=T_case2(dq4_4,motor(4));
end




if dq1_5 <= Q_lim(1)
    T_min_1(5)=T_case1(dq1_5,motor(1));
else
    T_min_1(5)=T_case2(dq1_5,motor(1));
end
if dq2_5 <= Q_lim(2)
    T_min_2(5)=T_case1(dq2_5,motor(2));
else
    T_min_2(5)=T_case2(dq2_5,motor(2));
end
if dq3_5 <= Q_lim(3)
    T_min_3(5)=T_case1(dq3_5,motor(3));
else
    T_min_3(5)=T_case2(dq3_5,motor(3));
end
if dq4_5 <= Q_lim(4)
    T_min_4(5)=T_case1(dq4_5,motor(4));
else
    T_min_4(5)=T_case2(dq4_5,motor(4));
end



if dq1_6 <= Q_lim(1)
    T_min_1(6)=T_case1(dq1_6,motor(1));
else
    T_min_1(6)=T_case2(dq1_6,motor(1));
end
if dq2_6 <= Q_lim(2)
    T_min_2(6)=T_case1(dq2_6,motor(2));
else
    T_min_2(6)=T_case2(dq2_6,motor(2));
end
if dq3_6 <= Q_lim(3)
    T_min_3(6)=T_case1(dq3_6,motor(3));
else
    T_min_3(6)=T_case2(dq3_6,motor(3));
end
if dq4_6 <= Q_lim(4)
    T_min_4(6)=T_case1(dq4_6,motor(4));
else
    T_min_4(6)=T_case2(dq4_6,motor(4));
end



if dq1_7 <= Q_lim(1)
    T_min_1(7)=T_case1(dq1_7,motor(1));
else
    T_min_1(7)=T_case2(dq1_7,motor(1));
end
if dq2_7 <= Q_lim(2)
    T_min_2(7)=T_case1(dq2_7,motor(2));
else
    T_min_2(7)=T_case2(dq2_7,motor(2));
end
if dq3_7 <= Q_lim(3)
    T_min_3(7)=T_case1(dq3_7,motor(3));
else
    T_min_3(7)=T_case2(dq3_7,motor(3));
end
if dq4_7 <= Q_lim(4)
    T_min_4(7)=T_case1(dq4_7,motor(4));
else
    T_min_4(7)=T_case2(dq4_7,motor(4));
end


if dq1_8 <= Q_lim(1)
    T_min_1(8)=T_case1(dq1_8,motor(1));
else
    T_min_1(8)=T_case2(dq1_8,motor(1));
end
if dq2_8 <= Q_lim(2)
    T_min_2(8)=T_case1(dq2_8,motor(2));
else
    T_min_2(8)=T_case2(dq2_8,motor(2));
end
if dq3_8 <= Q_lim(3)
    T_min_3(8)=T_case1(dq3_8,motor(3));
else
    T_min_3(8)=T_case2(dq3_8,motor(3));
end
if dq4_8 <= Q_lim(4)
    T_min_4(8)=T_case1(dq4_8,motor(4));
else
    T_min_4(8)=T_case2(dq4_8,motor(4));
end


T_min(1)= abs(max([T_min_1(1),T_min_2(1),T_min_3(1),T_min_4(1)]));
T_min(2)= abs(max([T_min_1(2),T_min_2(2),T_min_3(2),T_min_4(2)]));
T_min(3)= abs(max([T_min_1(3),T_min_2(3),T_min_3(3),T_min_4(3)]));
T_min(4)= abs(max([T_min_1(4),T_min_2(4),T_min_3(4),T_min_4(4)]));
T_min(5)= abs(max([T_min_1(5),T_min_2(5),T_min_3(5),T_min_4(5)]));
T_min(6)= abs(max([T_min_1(6),T_min_2(6),T_min_3(6),T_min_4(6)]));
T_min(7)= abs(max([T_min_1(7),T_min_2(7),T_min_3(7),T_min_4(7)]));
T_min(8)= abs(max([T_min_1(8),T_min_2(8),T_min_3(8),T_min_4(8)]));
end