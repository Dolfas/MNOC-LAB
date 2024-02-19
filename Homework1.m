%% Task 1
clc
load fp_lin_matrices_fit3.mat
eigA = eig(A);
fprintf('The eigenvalues of matrix A are: \n');
disp(eigA)

% Comment: One of the eigenvalues of A is 0 then this matrix is not
% invertible 

%% Task 2
clc
CoMatrix = ctrb(A,B);
rankCo = rank(CoMatrix);

fprintf('The rank of the controllability matrix is: %d \n',rankCo);

% Comment: Since the rank of the controllability matrix is equal to the
% dimension of the state then the model is controllable 

%% Task 3
clc
C1 = [0,0,1,0,0];
ObsMatrix = obsv(A,C1);
rankObs1 = rank(ObsMatrix);
fprintf('The rank of the observability matrix when we only want x3 is: %d \n',rankObs1);
%Comment: Since the observability matrix has rank lower than that of the
%dimension of the state then the state realization is not observable 


C = [1,0,0,0,0;0,0,1,0,0];
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
% beggining), instable system due to an unstable pole

% x3 has no pole in the origin and it is an unstable system 

%% Task 5
clc
%State feedback vector of gains 
R = 1;
Q = eye(5);
[K,S,P] = lqr(A,B,Q,R);
fprintf('The state feedback vector of gains 𝐾, is: ');
disp(K)

%Closed loop poles
cPoles = eig(A-B*K);
fprintf('The closed loop poles for this desing are: ');
disp(cPoles)

%% Task 6
clc

load fp_lin_matrices_fit3.mat
Qr = diag([10,0,1,0,0]);
Rr = 1;
K = lqr(A,B,Qr,Rr);

x0 = [0.1 0 0 0 0]';
D = [0 0 0 0 0]';
T = 2;

sim('statefdbk', T);

gg=plot(t,x); 
set(gg,'LineWidth',1.5) 
gg=xlabel('Time (s9)'); 
set(gg,'Fontsize',14); 
gg=ylabel('\beta (rad)'); 
set(gg,'Fontsize',14); 

%% Task 7
clc
%% Task 8 
clc


