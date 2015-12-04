function [ B ] = compute_angular_velocity( A, options )
%COMPUTE_ANGULAR_VELOCITY Computes the total angular velocity and
%acceleration
%   B = COMPUTE_ANGULAR_VELOCITY(A, options)
    
    [K, ~] = size(A);
    phi = pixel2visual_degree(options.s_p, options.d_s);
    
    B = zeros(K, 3);
    B(:, 1) = options.f_s * phi * sqrt(A(:, 1).^2 + A(:, 2).^2);
    B(:, 2) = options.f_s * phi * sqrt(A(:, 3).^2 + A(:, 4).^2);
    B(:, 3) = options.f_s * phi * sqrt(A(:, 5).^2 + A(:, 6).^2);
    
end

