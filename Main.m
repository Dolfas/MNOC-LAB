%% Task 1
clc
load fp_lin_matrices_fit3.mat
eigA = eig(A);
fprintf('The eigenvalues of matrix A are: \n');
disp(eigA)

% Comment: One of the eigenvalues of A is 0, then this matrix is not
% invertible 

%% Task 2
clc
CoMatrix = ctrb(A,B);
rankCo = rank(CoMatrix);

fprintf('The rank of the controllability matrix is: %d \n',rankCo);
fprintf('The dimension of the state is: %d \n',5);

% Comment: Since the rank of the controllability matrix is equal to the
% dimension of the state then the system is controllable 

%% Task 3
clc
C1 = [0,0,1,0,0];
ObsMatrix = obsv(A,C1);
rankObs1 = rank(ObsMatrix);
fprintf('The rank of the observability matrix when we only want x3 is: %d \n',rankObs1);

%Comment: Since the observability matrix has rank lower than that of the
%dimension of the state then the state realization is not observable 


C = [1,0,0,0,0;0,1,0,0,0];
ObsMatrix = obsv(A,C);
rankObs = rank(ObsMatrix);
fprintf('The rank of the observability matrix when we want x1 and x3 is: %d \n',rankObs);

%Comment: Since the observability matrix has rank equal to that of the
%dimension of the state then the state realization is observable 

%% Task 4
clc
[b,a] = ss2tf(A,B,C,D);

%Output x1
sys = tf(b(1,:),a);
bode(sys, 'r--')

% %Output x3 
sys5 =  tf(b(2,:),a);
hold on; 
bode(sys5, 'b--')
hold on;
legend('x1','x3')


% x1 has a pole in the origin (-90º and gain different from 0 in the
% beggining), additionally it is an instable system due to it having an unstable pole

% x3 has no pole in the origin and it is an unstable system due to it having an unstable pole

%% Task 5
clc

%State feedback vector of gains estimation
R = 1;
Q = eye(5);
[K,S,P] = lqr(A,B,Q,R);
fprintf(['The state feedback vector of gains 𝐾, is: ']);
disp(K)

%Closed loop poles
cPoles = eig(A-B*K);
fprintf('The closed loop poles for this design are: ');
disp(cPoles)

%% Task 6
clc
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
Qr =diag([10,0,1,0,0]);  %Weight Matrix for x 
Rr = 0.6;                 %Weight for the input
K = lqr(A, B, Qr, Rr);   %Calculate feedback gain

% Simulating the controller  
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 
T=2; %Time
sim('simulationQ6',T); 

% See poles and zeros
[A2, B2, C2, D2] = linmod('simulationQ6');
sp = pole(ss(A2,B2,C2,D2))
%sz = zero(ss(A2,B2,C2,D2))

gg=plot(t,x(:,3));
set(gg,'LineWidth',1.5)
gg=xlabel('Time (s)');
set(gg,'Fontsize',14);
gg=ylabel('\beta (rad)');
set(gg,'Fontsize',14);

%Comment: Thive,e real part of the poles is negat therefore the system is stable, whereas the imaginary part
%is non-zero which leads to an osclilating response
%% Task 7
clc

G=eye(size(A));
%Qe=eye(size(A))*1e3;
Qe= 100*B*(B');
Re=eye(5);
L=lqe(A,G,C,Qe,Re);



%% Task 8 
clc
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
Qr =diag([100,0,10,0,0]);   
Rr = 1;                  
K = lqr(A, B, Qr, Rr);  
G=eye(size(A));
Qe=eye(size(A))*1e3;
Re=eye(5);
L=lqe(A,G,C,Qe,Re);

% Simulating the controller  
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 

A_controler=A-B*K-L*C;
B_controler=L;
C_controler=-K;
D_controler=zeros(1,5);


% [A3, B3, C3, D3] = linmod('simulationQ8');
% sp2 = pole(ss(A3, B3, C3, D3))
% sz = zero(ss(A3, B3, C3, D3))

x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]'; 
T=2; %Time
sim('simulationQ8',T);


subplot(2,1,1);

gg=plot(t,y(:,3));
set(gg,'LineWidth',1.5)
gg=xlabel('Time (s)');
set(gg,'Fontsize',14);
gg=ylabel('\beta (rad)');
set(gg,'Fontsize',14)
title('Negligible value of Rr');

subplot(2,1,2);
gg=plot(t,y(:,1));
set(gg,'LineWidth',1.5)
gg=xlabel('Time (s)');
set(gg,'Fontsize',14);
gg=ylabel('\alpha (rad)');
set(gg,'Fontsize',14);





