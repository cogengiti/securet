function [ mu, sigma, I ] = detect_saccade( S, V )
%DETECT_SACCADE Summary of this function goes here
%   Detailed explanation goes here
    
    min_sac = 10; % msec
    tau_min = 40; % msec
    
    D = [];
    F = [];
    K = length(S);
    for k = 1:K
        if S(k) && (k == 1 || not(S(k-1)))
            D(end + 1) = k;
        end
        if S(k) && (k == K || not(S(k+1)))
            F(end + 1) = k;
        end
    end
    I = [D', F'];
    I = I(min_sac < I(:, 2) - I(:, 1), :); % minimum saccade duration 10 msec
    
    K = length(I);
    mu = zeros(K, 1);
    sigma = zeros(K, 1);
    for k = 1:K
        d = I(k, 1);
        if tau_min < d
            w = V(d-tau_min:d-1);
            w = w(not(isnan(w)));
            mu(k) = mean(w);
            sigma(k) = std(w);
        end
    end
    
end

