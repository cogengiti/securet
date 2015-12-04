function [ C ] = denoise_event( A, B, options )
%DENOISE_EVENT Summary of this function goes here
%   Detailed explanation goes here
    
    % Filter blink.
    C = isnan(A(:, 1));
    
    % Filter position outside of the screen.
    C = C | ((A(:, 1) < 0) | (options.width < A(:, 1)));
    C = C | ((A(:, 2) < 0) | (options.height < A(:, 2)));
    
    % Filter position with unphysiological eye movements.
    C = C | (options.v_u < B(:, 2));
    C = C | (options.a_u < B(:, 3));
    
    % Filter noise on-offset.
    I = not(isnan(B(:, 2)));
    v_m = median(B(I, 2));
    K = length(C);
    % Filter noise offset.
    for k = 2:K
        if C(k-1) && not(C(k)) && v_m < B(k, 2)
            C(k) = not(C(k));
        end
    end
    
    % Filter noise onset.
    for k = (K-1):-1:1
        if C(k+1) && not(C(k)) && v_m < B(k, 2)
            C(k) = not(C(k));
        end
    end
    
end

