%%
%Simulation of Qr1
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
Rr = 1;                 %Weight for the input

% Simulating the controller  
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 
T=2; %Time
weight = 1;
angles_values = zeros(454,2*4);
count = 1;
for i = 1:4
    Qr =diag([weight,0,1,0,0]);
    K = lqr(A, B, Qr, Rr);
    sim('simulationQ6',T);
    angles_values(:,count:count+1) = x(1:454,[1,3]);
    weight = weight *10;
    count = count +2;
end

figure;
subplot(2, 1, 1);
plot(t(1:454),rad2deg(angles_values(:, 1:2:end)), 'LineWidth', 1);
title('$\alpha$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
legend('Qr$_1$ = 1', 'Qr$_1$ = 10', 'Qr$_1$ = 100', 'Qr$_1$ = 1000', 'Interpreter','latex'); % Update legend as per your requirement

subplot(2, 1, 2);
plot(t(1:454),rad2deg(angles_values(:, 2:2:end)), 'LineWidth', 1);
title('$\beta$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
legend('Qr$_1$ = 1', 'Qr$_1$ = 10', 'Qr$_1$ = 100', 'Qr$_1$ = 1000', 'Interpreter','latex'); % Update legend as per your requirement
%%
%Simulation of Qr3
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
Rr = 1;                 %Weight for the input

% Simulating the controller  
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 
T=2; %Time
weight = 1;
angles_values = zeros(454,2*4);
count = 1;
for i = 1:4
    Qr =diag([1,0,weight,0,0]);
    K = lqr(A, B, Qr, Rr);
    sim('simulationQ6',T);
    angles_values(:,count:count+1) = x(1:454,[1,3]);
    weight = weight *10;
    count = count +2;
end

figure;
subplot(2, 1, 1);
plot(t(1:454),rad2deg(angles_values(:, 1:2:end)), 'LineWidth', 1);
title('$\alpha$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
ylim([0, 7]);
legend('Qr$_3$ = 1', 'Qr$_3$ = 10', 'Qr$_3$ = 100', 'Qr$_3$ = 1000', 'Interpreter','latex'); % Update legend as per your requirement

subplot(2, 1, 2);
plot(t(1:454),rad2deg(angles_values(:, 2:2:end)), 'LineWidth', 1);
title('$\beta$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
legend('Qr$_3$ = 1', 'Qr$_3$ = 10', 'Qr$_3$ = 100', 'Qr$_3$ = 1000', 'Interpreter','latex'); % Update legend as per your requirement

%%
%Simulation of Rr
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
Qr =diag([1,0,1,0,0]);

% Simulating the controller  
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 
T=2; %Time
weight = 0.001;
angles_values = zeros(453,2*4);
count = 1;
for i = 1:5
    Rr = weight;    
    K = lqr(A, B, Qr, Rr);
    sim('simulationQ6',T);
    angles_values(:,count:count+1) = x(1:453,[1,3]);
    weight = weight *10;
    count = count +2;
end

figure;
subplot(2, 1, 1);
plot(t(1:453),rad2deg(angles_values(:, 1:2:end)), 'LineWidth', 1);
title('$\alpha$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
ylim([-1 9]);
legend('Rr = 0.001', 'Rr = 0.01', 'Rr = 0.1', 'Rr = 1','Rr = 10', 'Interpreter','latex'); % Update legend as per your requirement

subplot(2, 1, 2);
plot(t(1:453),rad2deg(angles_values(:, 2:2:end)), 'LineWidth', 1);
title('$\beta$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
legend('Rr = 0.001', 'Rr = 0.01', 'Rr = 0.1', 'Rr = 1','Rr = 10', 'Interpreter','latex'); % Update legend as per your requirement
%%
%Simulation of Qe
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
Qr =diag([1,0,1,0,0]);
Rr = 1;
G=eye(size(A));
K = lqr(A, B, Qr, Rr);
Re=eye(5);
% Simulating the controller  
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 
T=2; %Time 
weight = 1;
angles_values = zeros(446,2*4);
count = 1;
for i = 1:4
    Qe=eye(size(A))*weight;
    L=lqe(A,G,C,Qe,Re);
    A_controler=A-B*K-L*C;
    B_controler=L;
    C_controler=-K;
    D_controler=zeros(1,5);
    sim('simulationQ8',T);
    angles_values(:,count:count+1) = y(1:446,[1,3]);
    weight = weight *10;
    count = count +2;
end

figure;
subplot(2, 1, 1);
plot(t(1:446),rad2deg(angles_values(:, 1:2:end)), 'LineWidth', 1);
title('$\alpha$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
ylim([-1 7]);
legend('Qe = 1', 'Qe = 10', 'Qe = 100', 'Qe = 1000', 'Interpreter','latex'); % Update legend as per your requirement

subplot(2, 1, 2);
plot(t(1:446),rad2deg(angles_values(:, 2:2:end)), 'LineWidth', 1);
title('$\beta$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
legend('Qe = 1', 'Qe = 10', 'Qe = 100', 'Qe = 1000', 'Interpreter','latex'); % Update legend as per your requirement
%%
%Simulation of Re
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
Qr =diag([10,0,1,0,0]);
Rr = 1;
G=eye(size(A));
K = lqr(A, B, Qr, Rr);
Qe=eye(size(A))*10;

% Simulating the controller  
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 
T=2; %Time
weights = [0.5 1 5 10];
angles_values = zeros(446,2*4);
count = 1;
for i = 1:4
    Re=eye(5)*weights(i);
    L=lqe(A,G,C,Qe,Re);
    A_controler=A-B*K-L*C;
    B_controler=L;
    C_controler=-K;
    D_controler=zeros(1,5);
    sim('simulationQ8',T);
    angles_values(:,count:count+1) = y(1:446,[1,3]);
    count = count +2;
end

figure;
subplot(2, 1, 1);
plot(t(1:446),rad2deg(angles_values(:, 1:2:end)), 'LineWidth', 1);
title('$\alpha$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
ylim([-1 7]);
legend('Re = 0.5', 'Re = 1', 'Re = 5', 'Re = 10', 'Interpreter','latex'); % Update legend as per your requirement

subplot(2, 1, 2);
plot(t(1:446),rad2deg(angles_values(:, 2:2:end)), 'LineWidth', 1);
title('$\beta$ values', 'Interpreter','latex');
xlabel('Time (s)', 'Interpreter','latex');
ylabel('Angle (deg)', 'Interpreter','latex');
legend('Re = 0.5', 'Re = 1', 'Re = 5', 'Re = 10', 'Interpreter','latex'); % Update legend as per your requirement