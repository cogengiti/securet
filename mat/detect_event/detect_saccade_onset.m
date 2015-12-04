function [ O, v_on ] = detect_saccade_onset( S, V, mu, sigma )
%DETECT_SACCADE_ONSET Summary of this function goes here
%   O = DETECT_SACCADE_ONSET(S, V, mu, simga)
    
    O = S;
    K = length(V);
    v_on = mu + 3 * sigma;
    
    for k = (K-1):-1:1
        if O(k+1) && not(O(k)) && ((v_on < V(k)) || (0 < V(k+1) - V(k)))
            O(k) = not(O(k));
        end
    end
    
end

