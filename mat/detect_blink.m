function [ B ] = detect_blink( A )
%DETECT_BLINK Summary of this function goes here
%   Detailed explanation goes here
    
    J = isnan(A(:, 2));
    J_1 = [J; J(end)];
    J_2 = [J(1); J];
    K = J_1 - J_2;
    
    I = [1; find(K)];
    
    L = [I; length(A(:, 2))];
    T = diff(L);
    
    S = mod(transpose(1:length(I)), 2);
    
    B = [I, T, S];
    
end

