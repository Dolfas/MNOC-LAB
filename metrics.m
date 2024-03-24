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