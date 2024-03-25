%% Experiments
clc
clear
load('fp_lin_matrices_fit3.mat'); %Load Matrices A, B, C, D
C = eye(5);
x0=[0.1 0 0 0 0]'; 
D=[0 0 0 0 0]';
G=eye(size(A));
Qe=eye(size(A))*10;
Re=eye(5);
L=lqe(A,G,C,Qe,Re);
T=3; 

%storing variable
store_beta = zeros(670,4);
store_alpha = zeros(670,4);

for i=1:4

    %vector of controller gains
    Qr =diag([2*10.^(i),0,10.^(i-1),0,0]);   
    Rr = 0.01;    
    K = lqr(A, B, Qr, Rr); 

    %used controllers 
    A_controler=A-B*K-L*C;
    B_controler=L;
    C_controler=-K;
    D_controler=zeros(1,5);

    %Simulation
    sim('simulationQ8',T);

    %Storing the angles
    store_alpha(:,i) = y(1:670,1);
    store_beta(:,i) = y(1:670,3);

end
  
 
subplot(2,1,1);
hold on
ylabel('\bf \beta (rad)')
xlabel('\bf Time(s)')
title('Rr = 5')
for ii = 1:4
grid on 
xlim([0 400])
plot(store_beta(:,ii),'LineWidth',1.5)

end

%title('Negligible value of Rr');

subplot(2,1,2);
hold on
ylabel('\bf \alpha (rad)')
xlabel('\bf Time(s)')
for ii = 1:4
grid on 
xlim([0 400])
plot(store_alpha(:,ii),'LineWidth',1.5,'DisplayName','Qr(\alpha) =' + string(2*10.^(ii)) + '  Qr(\beta) = ' + string(10.^(ii-1)))
end



