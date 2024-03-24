%Script to save variables and create plots. First save the new data and
%then plot the new figure. It automatically saves to a figures folder that
%needs to be created. Possible issues with matlab2015, datetime format and
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
else
    int_str = 'no';
end
Qr1 = Qr(1,1);
Qr3 = Qr(3,3);
Qe_value = Qe(1,1);
Re_value = Re(1,1);

figure;

%Alpha and beta plot
subplot(2,1,1); 
plot(pendulum.time,pendulum.signals(1).values(:,1), 'b-', 'LineWidth', 1); 
hold on
plot(pendulum.time,pendulum.signals(1).values(:,2), 'r-', 'LineWidth', 1);
title('Evolution of \alpha and \beta with time');
xlabel('Time (s)');
ylabel('Angle (rad)');
legend('\alpha (rad)','\beta (rad)')

%U plot
subplot(2,1,2); 
plot(pendulum.time, pendulum.signals(2).values, 'b-', 'LineWidth', 1); 
title('Evolution of control action with time');
xlabel('Time (s)');
ylabel('u (V)');

%Create personalized title and file name
sgtitle(['Plot for Qr1 = ', num2str(Qr1), ', Qr3 = ', num2str(Qr3), ...
    ', Rr = ', num2str(Rr),', Qe =', num2str(Qe_value), ...
    ', Re= ',num2str(Re_value),', ', int_str, ' integrator']);

filename = ['Rr',num2str(Rr),'_Qr1',num2str(Qr1),'_Qr3',num2str(Qr3), ...
    '_Qe',num2str(Qe_value),'_Re',num2str(Re_value),...
    '_int',num2str(integrator),'_time',datestring,'.png'];

saveas(gcf, fullfile('figures/',filename));