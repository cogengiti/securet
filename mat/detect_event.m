function [ answers ] = detect_event( A, options )
%DETECT_EVENT Detects saccades, glissades and fixations in gaze data.
%   answers = DETECT_EVENT(A, options)
%      options.f_s: sampling frequency (Hz)
%      options.s_p: pixel size (m)
%      options.d_s: screen distance (m)
%      options.N: order of polynomial fit (Savitzky-Golay parameter)
%      options.F: window length (must be odd, Savitzky-Golay parameter)
%      options.width:
%      options.height:
%      options.v_u: unphysiological speed (°/sec)
%      options.a_u: unphysiological acceleration (°/sec^2)
%      options.v_p: initial_peak_velocity (°/sec)
%      options.ths: threshold for the stopping criterion of the iterative
%         peak velocity detection algorithm
%   
%   See also FILTER_EVENT, COMPUTE_ANGULAR_VELOCITY.
    
    addpath(fullfile(pwd, 'detect_event'));
    
    % 1. Filtering and denoising (remove unwanted variation in the eye
    % movement data).
    B = filter_event(A, options);
    C = compute_angular_velocity(B, options);
    D = denoise_event(B, C, options);
    B(D, :) = NaN;
    C(D, :) = NaN;
    
    % 2. Peak saccade detection
    [E, v_p, mu, sigma] = velocity_threshold_estimation(B(:, 2), options);
    
    % 3. Saccade onset/offset detection
    [F, v_on] = detect_saccade_onset(E, B(:, 2), mu, sigma);
    [mu_t, sigma_t, I] = detect_saccade(F, B(:, 2));
    disp(mu_t);
    disp(sigma_t);
    disp(length(sigma_t));
    G = detect_saccade_offset(F, B(:, 2), v_on, options);
    
    % 4. Glissade detection
    
    % 5. Fixation detection
    
    
end

