M = csvread("speed.csv");
M1= [M(:,1)];
M2= [M(:,2)];
figure;
plot(M1,M2)