counter = 1;
metrics_struct = struct('mean_value', [], ...
                        'amp_alpha', [], 'amp_beta', [], ...
                        'mse_alpha', [], 'mse_beta', [], ...
                        'std_value', [], ...
                        'alpha_overshoot', [], 'beta_overshoot', [], ...
                        'ts_alpha', [], 'ts_beta', []);
for i=1:5
    y = angles_values(:,counter:counter+1);
    [mean_value,amp_alpha,amp_beta, mse_alpha, ...
    mse_beta,std_value, alpha_overshoot, beta_overshoot, ...
    ts_alpha, ts_beta] = metrics_real_life(y);
    counter = counter +2;
    metrics_struct(i) = struct('mean_value', mean_value, ...
    'amp_alpha', amp_alpha, 'amp_beta', amp_beta, ...
    'mse_alpha', mse_alpha, 'mse_beta', mse_beta, ...
    'std_value', std_value, ...
    'alpha_overshoot', alpha_overshoot, 'beta_overshoot', beta_overshoot, ...
    'ts_alpha', ts_alpha, 'ts_beta', ts_beta);

end

% integrator = input('Input 1 if using integrator, 0 otherwise. \n');
% if integrator == 1
%     int_str = 'with';
%     Rr = Rr_integral;
%     Qr1 = Qr_integral(1,1);
%     Qr3 = Qr_integral(3,3);
% else
%     int_str = 'no';
%     Qr1 = Qr(1,1);
%     Qr3 = Qr(3,3);
% end
% Qe_value = Qe(1,1);
% Re_value = Re(1,1);
% 
file_name = 'Qe_simulations';
save(fullfile('metrics', [file_name, '.mat']), 'metrics_struct');

function [mean_values,amp_alpha,amp_beta, mse_alpha, ...
    mse_beta,std_values, alpha_overshoot, beta_overshoot, ...
    ts_alpha, ts_beta] = metrics_simulation(y)

    mean_values = mean(y);
    std_values = std(y);

    amp_alpha = abs(max(y(:,1))-min(y(:,1)));
    amp_beta = abs(max(y(:,3))-min(y(:,3)));
    mse_alpha = immse(y(:,1),zeros(length(y),1));
    mse_beta = immse(y(:,3),zeros(length(y),1)); 
    
    S = stepinfo(y);
    alpha_overshoot = S(1).Overshoot;
    beta_overshoot = S(3).Overshoot;
    ts_alpha = S(1).SettlingTime;
    ts_beta = S(3).SettlingTime;
end

function [mean_value,amp_alpha,amp_beta, mse_alpha, ...
    mse_beta,std_value, alpha_overshoot, beta_overshoot, ...
    ts_alpha, ts_beta] = metrics_real_life(y)

    mean_value = mean(y);
    std_value = std(y);

    amp_alpha = abs(max(y(:,1))-min(y(:,1)));
    amp_beta = abs(max(y(:,2))-min(y(:,2)));
    mse_alpha = immse(y(:,1),zeros(length(y),1));
    mse_beta = immse(y(:,2),zeros(length(y),1));

    S = stepinfo(y);
    alpha_overshoot = S(1).Overshoot;
    beta_overshoot = S(2).Overshoot;
    ts_alpha = S(1).SettlingTime;
    ts_beta = S(2).SettlingTime;

end