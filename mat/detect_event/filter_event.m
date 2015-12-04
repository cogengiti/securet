function [ B ] = filter_event( A, options )
%FILTER_EVENT Remove unwanted variation in the eye movement data
%   B = FILTER_EVENT(A, options) Remove unwanted variation in the eye
%   movement data A by using the Savitzky-Golay method set by options. The
%   result is composed of:
%      B(:, 1): smoothed data of A(:, 2)
%      B(:, 2): smoothed data of A(:, 3)
%      B(:, 3): first derivative of A(:, 2)
%      B(:, 4): first derivative of A(:, 3)
%      B(:, 5): second derivative of A(:, 2)
%      B(:, 6): second derivative of A(:, 3)
    
    [K, ~] = size(A);
    
    half_F = ((options.F + 1) / 2) - 1; % half window length
    [~, G] = sgolay(options.N, options.F); % Savitzky-Golay filter
    
    B = zeros(K, 6);
    B(:) = NaN;
    for k = (1 + half_F):(K - half_F)
        % Sliding window
        w = (k - half_F):(k + half_F);
        % Zeroth derivative (smoothing only)
        B(k, 1) = factorial(0) * dot(G(:, 1), A(w, 2));
        B(k, 2) = factorial(0) * dot(G(:, 1), A(w, 3));
        % First derivative
        B(k, 3) = factorial(1) * dot(G(:, 2), A(w, 2));
        B(k, 4) = factorial(1) * dot(G(:, 2), A(w, 3));
        % Second derivative
        B(k, 5) = factorial(2) * dot(G(:, 3), A(w, 2));
        B(k, 6) = factorial(2) * dot(G(:, 3), A(w, 3));        
    end
    
end

