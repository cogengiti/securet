function [ B ] = clean_data( A )
%CLEAN_DATA Summary of this function goes here
%   Detailed explanation goes here
    
    J = isnan(A(:, 2));
    J_1 = [J; J(end)];
    J_2 = [J(1); J];
    K = J_1 - J_2;
    I = find(K);
    
    B = A(I, :);
    
end

