%% Task 1
load fp_lin_matrices_fit3.mat
eigA = eig(A);
fprintf('The eigenvalues of matrix A are: %d \n',eigA);

% Comment: One of the eigenvalues of A is 0 then this matrix is not
% invertible 

%% Task 2
CoMatrix = ctrb(A,B);
rankCo = rank(CoMatrix);

fprintf('The rank of the controllability matrix is: %d \n',rankCo);

% Comment: Since the rank of the controllability matrix is equal to the
% dimension of the state then the model is controllable 

%% Task 3

ObsMatrix = obsv(A,C);
rankObs = rank(ObsMatrix);
fprintf('The rank of the observability matrix is: %d \n',rankObs);


%% Task 4




%% Task 5



%% Task 6



%% Task 7

%% Task 8 



