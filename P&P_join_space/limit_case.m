function [T_lim, Q_lim] = limit_case(motor)
T_lim= zeros(1,4);
Q_lim= zeros(1,4);
T_lim(1) = motor(1).V * (1/motor(1).A + 1/motor(1).D);
Q_lim(1) = 0.5 * motor(1).V^2 * (1/motor(1).A + 1/motor(1).D);

T_lim(2) = motor(2).V * (1/motor(2).A + 1/motor(2).D);
Q_lim(2) = 0.5 * motor(2).V^2 * (1/motor(2).A + 1/motor(2).D);

T_lim(3) = motor(3).V * (1/motor(3).A + 1/motor(3).D);
Q_lim(3) = 0.5 * motor(3).V^2 * (1/motor(3).A + 1/motor(3).D);

T_lim(4) = motor(4).V * (1/motor(4).A + 1/motor(4).D);
Q_lim(4) = 0.5 * motor(4).V^2 * (1/motor(4).A + 1/motor(4).D);
end