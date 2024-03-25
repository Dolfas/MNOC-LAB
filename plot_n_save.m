%Script to save variables and create plots. First save the new data and
%then plot the new figure. It automatically saves to a figures folder that
%needs to be created. Possible issues with matlab2015
%the use of sgtitle.

fp_plot save
%%
new_file = 'z_fp_data_240318__150024.mat';

% Extract only the numbers from the filename
numericChars = regexp(new_file, '\d+', 'match');
datestring = [numericChars{:}];

load(new_file); %Change name to most recent file

integrator = input('Input 1 if using integrator, 0 otherwise. \n');
if integrator == 1
    int_str = 'with';
    Rr = Rr_integral;
    Qr1 = Qr_integral(1,1);
    Qr3 = Qr_integral(3,3);
else
    int_str = 'no';
    Qr1 = Qr(1,1);
    Qr3 = Qr(3,3);
end
Qe_value = Qe(1,1);
Re_value = Re(1,1);


figure;

%Alpha and beta plot
subplot(2,1,1); 
plot(pendulum.time,rad2deg(pendulum.signals(1).values(:,1)), 'b-', 'LineWidth', 1); 
hold on
plot(pendulum.time,rad2deg(pendulum.signals(1).values(:,2)), 'r-', 'LineWidth', 1);
title('Evolution of $\alpha$ and $\beta$ with time','Interpreter', 'latex');
xlabel('Time (s)','Interpreter', 'latex');
ylabel('Angle (deg)','Interpreter', 'latex');
legend('\alpha (deg)','\beta (deg)')

%U plot
subplot(2,1,2); 
plot(pendulum.time, pendulum.signals(2).values, 'b-', 'LineWidth', 1); 
title('Evolution of control action with time','Interpreter', 'latex');
xlabel('Time (s)','Interpreter', 'latex');
ylabel('u (V)','Interpreter', 'latex');

%Create personalized title and file name
sgtitle(['Plot for Qr$_1$ = ', num2str(Qr1), ', Qr$_3$ = ', num2str(Qr3), ...
    ', Rr = ', num2str(Rr),', Qe =', num2str(Qe_value), ...
    ', Re= ',num2str(Re_value),', ', int_str, ' integrator'],'Interpreter', 'latex');

filename = ['Rr',num2str(Rr),'_Qr1_',num2str(Qr1),'_Qr3_',num2str(Qr3), ...
    '_Qe',num2str(Qe_value),'_Re',num2str(Re_value),...
    '_int',num2str(integrator),'_time',datestring,'.png'];

saveas(gcf, fullfile('figures/',filename));