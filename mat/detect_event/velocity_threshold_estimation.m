function [ I, v_p, mu, sigma ] = velocity_threshold_estimation( A, options )
%VELOCITY_THRESHOLD_ESTIMATION Summary of this function goes here
%   I, v_p, mu, sigma = VELOCITY_THRESHOLD_ESTIMATION(A, options)
%      options.v_p: initial peak velocity detection (°/sec)
    
    factor = 5;
    
    v_p = options.v_p;
    
    I = (A < v_p);
    mu = mean(A(I));
    sigma = std(A(I));
    v_p_new = mu + factor * sigma;
    while options.ths < abs(v_p_new - v_p)
        v_p = v_p_new;
        I = (A < v_p); 
        mu = mean(A(I));
        sigma = std(A(I));
        v_p_new = mu + factor * sigma;
    end
    v_p = v_p_new;
    I = (v_p < A);
    
end

