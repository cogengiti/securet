function [ O, v_off ] = detect_saccade_offset( S, V, v_p, v_on, mu_t, sigma_t, options )
%DETECT_SACCADE_OFFSET Summary of this function goes here
%   Detailed explanation goes here
    
    O = S;
    [K, ~] = size(S);
    disp(size(S));
    disp(size(mu_t));
    v_t = mu_t + 3 * sigma_t;
    v_off = zeros(K, 1);
    
    for k = 1:(K-1)
        if v_p < mu_t(k)
            O(k, :) = NaN;
        else
            v_off(k) = options.alpha * v_on + options.beta * v_t(k);
            l = O(k, 2);
            while l + 1 < O(k+1, 1)
                l = l + 1;
                if (v_off(k) < V(l)) || (V(l+1) - V(l) < 0)
                    O(k, 2) = l;
                else
                    O(k, 2) = l;
                    break;
                end
            end
        end
    end
    
end

