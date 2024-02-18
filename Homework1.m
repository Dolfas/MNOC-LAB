%% Task 1
clc
load fp_lin_matrices_fit3.mat
eigA = eig(A);
fprintf('The eigenvalues of matrix A are: %d \n',eigA);

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

%Output x3 
sys2 =  tf(b(2,:),a);
hold on; 
bode(sys2, 'b--')
hold on;
legend('x1','x3')


%% Task 5
clc


%% Task 6
clc


%% Task 7
clc
%% Task 8 



